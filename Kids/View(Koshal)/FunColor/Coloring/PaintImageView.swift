import UIKit
import AVFoundation

final class PaintImageView: UIImageView {

    // MARK: - Public
    var fillColor: UIColor = .red
   // var tolerance: Int = 220
    var tolerance: Int = 40

    var onColoringCompleted: (() -> Void)?
    
    private var initialWhitePixels: Int = 0
    
    private var currentScale: CGFloat = 1.0
    private var currentTranslation: CGPoint = .zero
    
    // MARK: - Private
    private var pixels: [UInt32] = []
    private var imageSize = CGSize.zero
    private var stack: [CGPoint] = []

    private var isCompleted = false
    
    override func awakeFromNib() {
        super.awakeFromNib()

        isUserInteractionEnabled = true
        contentMode = .scaleAspectFit

        let pinch = UIPinchGestureRecognizer(
            target: self,
            action: #selector(handlePinch(_:))
        )
        addGestureRecognizer(pinch)

        let pan = UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePan(_:))
        )
        addGestureRecognizer(pan)
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {

        guard currentScale > 1 else { return }

        let translation = gesture.translation(in: self.superview)

        currentTranslation.x += translation.x
        currentTranslation.y += translation.y

        // Maximum movement
        let maxX = (bounds.width * currentScale - bounds.width) / 2
        let maxY = (bounds.height * currentScale - bounds.height) / 2

        // Clamp
        currentTranslation.x = min(max(currentTranslation.x, -maxX), maxX)
        currentTranslation.y = min(max(currentTranslation.y, -maxY), maxY)

        transform = CGAffineTransform(
            translationX: currentTranslation.x,
            y: currentTranslation.y
        ).scaledBy(x: currentScale, y: currentScale)

        gesture.setTranslation(.zero, in: self.superview)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let p = touches.first?.location(in: self) else { return }
        floodFill(at: p)
    }

    @objc private func handlePinch(_ gesture: UIPinchGestureRecognizer) {

        switch gesture.state {

        case .began, .changed:

            var scale = currentScale * gesture.scale
            scale = max(1.0, min(scale, 6.0))

            transform = CGAffineTransform(
                translationX: currentTranslation.x,
                y: currentTranslation.y
            ).scaledBy(x: scale, y: scale)

        case .ended, .cancelled:

            currentScale *= gesture.scale
            currentScale = max(1.0, min(currentScale, 6.0))

            if currentScale <= 1.01 {

                currentScale = 1
                currentTranslation = .zero

                UIView.animate(withDuration: 0.2) {
                    self.transform = .identity
                }
                return
            }

            transform = CGAffineTransform(
                translationX: currentTranslation.x,
                y: currentTranslation.y
            ).scaledBy(x: currentScale, y: currentScale)

        default:
            break
        }
    }
    
    
    func resetColoring() {
        isCompleted = false
    }
    
    private func isColoringCompleted() -> Bool {

        guard let cgImage = self.image?.cgImage else { return false }

        let w = cgImage.width
        let h = cgImage.height

        var pixels = [UInt32](repeating: 0, count: w * h)

        guard let ctx = CGContext(
            data: &pixels,
            width: w,
            height: h,
            bitsPerComponent: 8,
            bytesPerRow: w * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ) else { return false }

        ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: w, height: h))

        var currentWhite = 0

        for pixel in pixels {
            let r = Int(pixel & 0xff)
            let g = Int((pixel >> 8) & 0xff)
            let b = Int((pixel >> 16) & 0xff)

            if r > 245 && g > 245 && b > 245 {
                currentWhite += 1
            }
        }

        // ✅ compare with initial
        let filledRatio = 1.0 - (Double(currentWhite) / Double(initialWhitePixels))

        return filledRatio > 0.95 // 95% filled
    }
    
    func calculateInitialWhitePixels() {
        guard let cgImage = self.image?.cgImage else { return }

        let w = cgImage.width
        let h = cgImage.height

        var pixels = [UInt32](repeating: 0, count: w * h)

        guard let ctx = CGContext(
            data: &pixels,
            width: w,
            height: h,
            bitsPerComponent: 8,
            bytesPerRow: w * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ) else { return }

        ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: w, height: h))

        var count = 0

        for pixel in pixels {
            let r = Int(pixel & 0xff)
            let g = Int((pixel >> 8) & 0xff)
            let b = Int((pixel >> 16) & 0xff)

            if r > 245 && g > 245 && b > 245 {
                count += 1
            }
        }

        initialWhitePixels = count
    }
    
    // MARK: - Flood Fill
    private func floodFill(at point: CGPoint) {

        guard let cgImage = image?.cgImage else { return }

        let w = cgImage.width
        let h = cgImage.height
        imageSize = CGSize(width: w, height: h)

        let imageRect = AVMakeRect(aspectRatio: imageSize, insideRect: bounds)
        guard imageRect.contains(point) else { return }

        let scaleX = CGFloat(w) / imageRect.width
        let scaleY = CGFloat(h) / imageRect.height

        let px = Int((point.x - imageRect.minX) * scaleX)
        let py = Int((point.y - imageRect.minY) * scaleY)
        let startIndex = py * w + px
        guard startIndex >= 0 && startIndex < w * h else { return }

        pixels = [UInt32](repeating: 0, count: w * h)

        guard let ctx = CGContext(
            data: &pixels,
            width: w,
            height: h,
            bitsPerComponent: 8,
            bytesPerRow: w * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ) else { return }

        ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: w, height: h))

        let targetColor = pixels[startIndex]
        let newColor = fillColor.rgbaValue

        // ❌ Never fill border
        if isBorder(targetColor) { return }

        // ❌ Never re-fill same color
        if colorsMatch(targetColor, newColor) { return }

        // 🚫 CRITICAL: cancel if region touches image edge
        if regionTouchesBorder(startX: px, startY: py, targetColor: targetColor) {
            return
        }

        // ✅ REAL FILL
        stack.removeAll()
        stack.append(CGPoint(x: px, y: py))

        while let seed = stack.popLast() {
            let (l, r) = fillScanline(seed, targetColor, newColor)
            scanLine(y: Int(seed.y) + 1, l: l, r: r, targetColor: targetColor)
            scanLine(y: Int(seed.y) - 1, l: l, r: r, targetColor: targetColor)
        }

        if let newCG = ctx.makeImage() {
            image = UIImage(cgImage: newCG)
        }

        if !isCompleted && isColoringCompleted() {
            isCompleted = true
            DispatchQueue.main.async {
                self.onColoringCompleted?()
            }
        }
    }

    // MARK: - EDGE DETECTION (KEY FIX)
    private func regionTouchesBorder(startX: Int,
                                     startY: Int,
                                     targetColor: UInt32) -> Bool {

        let w = Int(imageSize.width)
        let h = Int(imageSize.height)

        var visited = Set<Int>()
        var queue: [(Int, Int)] = [(startX, startY)]

        while let (x, y) = queue.popLast() {

            let idx = y * w + x
            if visited.contains(idx) { continue }
            visited.insert(idx)

            // 🚫 touches image border → background
            if x == 0 || y == 0 || x == w - 1 || y == h - 1 {
                return true
            }

            for (dx, dy) in [(-1,0),(1,0),(0,-1),(0,1)] {
                let nx = x + dx
                let ny = y + dy
                let nidx = ny * w + nx

                if nx >= 0 && ny >= 0 && nx < w && ny < h {
                    if colorsMatch(pixels[nidx], targetColor) &&
                       !isBorder(pixels[nidx]) {
                        queue.append((nx, ny))
                    }
                }
            }
        }
        return false
    }

    // MARK: - Scanline Fill
    private func fillScanline(_ seed: CGPoint,
                              _ target: UInt32,
                              _ fill: UInt32) -> (Int, Int) {

        let w = Int(imageSize.width)
        let y = Int(seed.y)
        let row = y * w

        var left = Int(seed.x)
        var right = left

        var i = row + left
        while i >= row && colorsMatch(pixels[i], target) && !isBorder(pixels[i]) {
            pixels[i] = fill
            left -= 1
            i -= 1
        }

        i = row + right + 1
        while i < row + w && colorsMatch(pixels[i], target) && !isBorder(pixels[i]) {
            pixels[i] = fill
            right += 1
            i += 1
        }

        return (left + 1, right)
    }

    private func scanLine(y: Int,
                          l: Int,
                          r: Int,
                          targetColor: UInt32) {

        guard y >= 0 && y < Int(imageSize.height) else { return }

        let w = Int(imageSize.width)
        let row = y * w
        var x = l

        while x <= r {
            var idx = row + x
            var found = false

            while x <= r && colorsMatch(pixels[idx], targetColor) && !isBorder(pixels[idx]) {
                found = true
                x += 1
                idx = row + x
            }

            if found {
                stack.append(CGPoint(x: x - 1, y: y))
            }
            x += 1
        }
    }

    // MARK: - Color Helpers
    private func isBorder(_ color: UInt32) -> Bool {
        let r = Int(color & 0xff)
        let g = Int((color >> 8) & 0xff)
        let b = Int((color >> 16) & 0xff)
        return r < 40 && g < 40 && b < 40
    }

    private func colorsMatch(_ a: UInt32, _ b: UInt32) -> Bool {
        abs(Int(a & 0xff) - Int(b & 0xff)) <= tolerance &&
        abs(Int((a >> 8) & 0xff) - Int((b >> 8) & 0xff)) <= tolerance &&
        abs(Int((a >> 16) & 0xff) - Int((b >> 16) & 0xff)) <= tolerance
    }
}

extension UIColor {
    var rgbaValue: UInt32 {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return UInt32(r * 255)
            | UInt32(g * 255) << 8
            | UInt32(b * 255) << 16
            | UInt32(a * 255) << 24
    }
}
