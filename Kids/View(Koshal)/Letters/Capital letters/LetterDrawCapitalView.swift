//
//  LetterDrawCapitalView.swift
//  tracing
//
//  Created by NextDay Sotware Solution on 27/01/26.
//


import UIKit

final class LetterDrawCapitalView: UIView {
    
    private let margin: CGFloat = 40
    private let step: CGFloat = 5
    private let frameDelay: TimeInterval = 0.03

    private var strokes: [UIBezierPath] = []
    private var transformed: [UIBezierPath] = []
    private var index = 0
    private var layers: [CAShapeLayer] = []

    private let guideLayer = CAShapeLayer()


    private var currentColor: UIColor = .systemBlue
    
    var onAnimationCompleted:(() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func redraw() {
        resetDraw()
        drawGuides()
        animateNext()
    }

    private func setup() {
        backgroundColor = .clear

        guideLayer.strokeColor = UIColor.systemGray4.cgColor
        guideLayer.fillColor = UIColor.clear.cgColor
        guideLayer.lineWidth = 2
        guideLayer.lineDashPattern = [6, 6]
        guideLayer.lineCap = .round   // very important

        layer.addSublayer(guideLayer)
    }
    func setLetter(_ paths: [UIBezierPath]) {
        layers.forEach { $0.removeFromSuperlayer() }
        layers.removeAll()

        strokes = paths
        transformed = scale(paths)
        index = 0

        currentColor = ColorManager.randomColor() // ✅ only once

        drawGuides()
        animateNext()
    }
    
    func setNumber(_ paths: [UIBezierPath]) {

        layers.forEach {
            $0.removeFromSuperlayer()
        }

        layers.removeAll()

        strokes = paths
        transformed = scale(paths)
        index = 0

        currentColor = ColorManager.randomColor()

        drawGuides()

        animateNext()
    }
    
    private func animateNext() {
        guard index < transformed.count else {
                onAnimationCompleted?()
                return
            }

        let path = transformed[index]
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = currentColor.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 6
        layer.lineCap = .round
        layer.strokeEnd = 0

        self.layer.addSublayer(layer)
        layers.append(layer)

        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.fromValue = 0
        anim.toValue = 1
        anim.duration = Double(path.length / step) * frameDelay
        anim.timingFunction = .init(name: .linear)
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false

        layer.add(anim, forKey: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + anim.duration) {
            self.index += 1
            self.animateNext()
        }
    }

    private func drawGuides() {
        guard let b = transformed.map({ $0.bounds }).reduce(nil, { $0?.union($1) ?? $1 }) else { return }
        let y1 = b.minY
        let y2 = (b.minY + b.maxY) / 2
        let y3 = b.maxY

        let p = UIBezierPath()
        [y1, y2, y3].forEach {
            p.move(to: CGPoint(x: 0, y: $0))
            p.addLine(to: CGPoint(x: bounds.width, y: $0))
        }
        guideLayer.path = p.cgPath
    }

    private func scale(_ paths: [UIBezierPath]) -> [UIBezierPath] {

        guard let first = paths.first else { return [] }

        // ALL PATH BOUNDS
        let combinedBounds = paths
            .map { $0.bounds }
            .reduce(first.bounds) { $0.union($1) }

        let availableWidth = bounds.width - margin * 2
        let availableHeight = bounds.height - margin * 2

        // KEEP SAME SCALE RATIO
        let scale = min(
            availableWidth / combinedBounds.width,
            availableHeight / combinedBounds.height
        )

        // CENTER LETTER
        let offsetX =
            (bounds.width - combinedBounds.width * scale) / 2
            - combinedBounds.minX * scale

        let offsetY =
            (bounds.height - combinedBounds.height * scale) / 2
            - combinedBounds.minY * scale

        return paths.map {

            let p = $0.copy() as! UIBezierPath

            var transform = CGAffineTransform.identity

            transform = transform
                .scaledBy(x: scale, y: scale)

            transform = transform
                .translatedBy(
                    x: offsetX / scale,
                    y: offsetY / scale
                )

            p.apply(transform)

            return p
        }
    }
    
    func resetDraw() {
        layers.forEach { $0.removeFromSuperlayer() }
        layers.removeAll()
        index = 0
    }
    
}
//extension UIBezierPath {
//    var length: CGFloat {
//        var length: CGFloat = 0.0
//        var lastPoint: CGPoint = .zero
//        var didStart = false
//        self.cgPath.applyWithBlock { elementPointer in
//            let element = elementPointer.pointee
//            let points = element.points
//            switch element.type {
//            case .moveToPoint:
//                lastPoint = points[0]
//                didStart = true
//            case .addLineToPoint:
//                guard didStart else { return }
//                let to = points[0]
//                length += hypot(to.x - lastPoint.x, to.y - lastPoint.y)
//                lastPoint = to
//            case .addQuadCurveToPoint:
//                guard didStart else { return }
//                // Approximate using line segments
//                let from = lastPoint
//                let ctrl = points[0]
//                let to = points[1]
//                let steps: Int = 20
//                var prev = from
//                for i in 1...steps {
//                    let t = CGFloat(i) / CGFloat(steps)
//                    let oneMinusT = 1 - t
//                    let oneMinusTSquared = oneMinusT * oneMinusT
//                    let tSquared = t * t
//                    let x = oneMinusTSquared * from.x + 2 * oneMinusT * t * ctrl.x + tSquared * to.x
//                    let y = oneMinusTSquared * from.y + 2 * oneMinusT * t * ctrl.y + tSquared * to.y
//                    let p = CGPoint(x: x, y: y)
//                    length += hypot(p.x - prev.x, p.y - prev.y)
//                    prev = p
//                }
//                lastPoint = to
//            case .addCurveToPoint:
//                guard didStart else { return }
//                // Approximate using line segments
//                let from = lastPoint
//                let ctrl1 = points[0]
//                let ctrl2 = points[1]
//                let to = points[2]
//                let steps: Int = 20
//                var prev = from
//                for i in 1...steps {
//                    let t = CGFloat(i) / CGFloat(steps)
//                    let oneMinusT = 1 - t
//                    let oneMinusTSquared = oneMinusT * oneMinusT
//                    let oneMinusTCubed = oneMinusTSquared * oneMinusT
//                    let tSquared = t * t
//                    let tCubed = tSquared * t
//                    let x = oneMinusTCubed * from.x + 3 * oneMinusTSquared * t * ctrl1.x + 3 * oneMinusT * tSquared * ctrl2.x + tCubed * to.x
//                    let y = oneMinusTCubed * from.y + 3 * oneMinusTSquared * t * ctrl1.y + 3 * oneMinusT * tSquared * ctrl2.y + tCubed * to.y
//                    let p = CGPoint(x: x, y: y)
//                    length += hypot(p.x - prev.x, p.y - prev.y)
//                    prev = p
//                }
//                lastPoint = to
//            case .closeSubpath:
//                break
//            @unknown default:
//                break
//            }
//        }
//        return length
//    }
//}
//
