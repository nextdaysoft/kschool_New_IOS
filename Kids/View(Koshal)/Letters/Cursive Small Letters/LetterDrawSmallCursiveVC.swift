//
//  LetterDrawSmallCursiveVC.swift
//  New
//
//  Created by Koshal Singh on 29/05/26.
//

import UIKit

final class LetterDrawSmallCursiveVC: UIView {
    
    private let margin: CGFloat = 40
    private let step: CGFloat = 3.5
    private let frameDelay: TimeInterval = 0.025

    private var strokes: [UIBezierPath] = []
    private var transformed: [UIBezierPath] = []
    private var index = 0
    private var layers: [CAShapeLayer] = []

    private let guideLayer = CAShapeLayer()


    private var currentColor: UIColor = .systemBlue
    
    
    private var currentLetter: Character = "a"
    
    var onAnimationCompleted: (() -> Void)?
    
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
    
    func setLetter(_ paths: [UIBezierPath], letter: Character) {

        currentLetter = letter

        layers.forEach { $0.removeFromSuperlayer() }
        layers.removeAll()

        strokes = paths
        transformed = scale(paths)
        index = 0

        currentColor = ColorManager.randomColor()

        drawGuides()
        animateNext()
    }

    private func animateNext() {

        guard index < transformed.count else { return }

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
        anim.timingFunction = CAMediaTimingFunction(name: .linear)
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false

        layer.add(anim, forKey: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + anim.duration) {

            self.index += 1

            if self.index >= self.transformed.count {

                self.onAnimationCompleted?()

            } else {

                self.animateNext()
            }
        }
    }
    

    private func drawGuides() {

        let top: CGFloat = bounds.height * 0.12
        let xHeight: CGFloat = bounds.height * 0.38
        let baseline: CGFloat = bounds.height * 0.68
        let bottom: CGFloat = bounds.height * 0.94

        let p = UIBezierPath()

        [top, xHeight, baseline, bottom].forEach { y in
            p.move(to: CGPoint(x: 0, y: y))
            p.addLine(to: CGPoint(x: bounds.width, y: y))
        }

        guideLayer.path = p.cgPath
    }

    private func scale(_ paths: [UIBezierPath]) -> [UIBezierPath] {

        guard let first = paths.first else { return [] }

        let combinedBounds = paths
            .map { $0.bounds }
            .reduce(first.bounds) { $0.union($1) }

        let boundsForScale = combinedBounds

        let availableWidth = bounds.width - margin * 2

        let centerLetters: [Character] = [
            "a","c","e","m","n","o",
            "r","s","u","v","w","x"
        ]

        let isCenterLetter = centerLetters.contains(currentLetter)

        let topLine: CGFloat = bounds.height * 0.12
        let xHeight: CGFloat = bounds.height * 0.38
        let baseline: CGFloat = bounds.height * 0.68
        let bottomGuide: CGFloat = bounds.height * 0.94

        var handwritingHeight: CGFloat
        var offsetY: CGFloat

        if isCenterLetter {

            handwritingHeight = bounds.height * 0.28

            let centerY = (xHeight + baseline) / 2

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            offsetY =
                centerY -
                boundsForScale.midY * scale

            return paths.map {

                let p = $0.copy() as! UIBezierPath

                var t = CGAffineTransform.identity
                t = t.scaledBy(x: scale, y: scale)
                t = t.translatedBy(
                    x: offsetX / scale,
                    y: offsetY / scale
                )

                p.apply(t)
                return p
            }

        } else if currentLetter == "i" {
            
            handwritingHeight = bounds.height * 0.28

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            let centerY = (xHeight + baseline) / 2

            offsetY =
                centerY -
                boundsForScale.midY * scale

            return paths.enumerated().map { index, path in

                let p = path.copy() as! UIBezierPath

                var t = CGAffineTransform.identity
                t = t.scaledBy(x: scale, y: scale)
                t = t.translatedBy(
                    x: offsetX / scale,
                    y: offsetY / scale
                )

                p.apply(t)

                // Stroke 0 = dot
                if index == 0 {
                    p.apply(CGAffineTransform(translationX: 0, y: -40))
                }

                return p
            }
        } else if currentLetter == "z" {
            
            handwritingHeight = bounds.height * 0.46

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            // Bottom 3 lines me place karega
            offsetY =
                bottomGuide -
                boundsForScale.maxY * scale

            return paths.map {

                let p = $0.copy() as! UIBezierPath

                var t = CGAffineTransform.identity
                t = t.scaledBy(x: scale, y: scale)
                t = t.translatedBy(
                    x: offsetX / scale,
                    y: offsetY / scale
                )

                p.apply(t)
                return p
            }
        }  else if currentLetter == "q" {

            handwritingHeight = bounds.height * 0.46

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            // 👇 Bottom guide ko touch karega
            offsetY =
                bottomGuide -
                boundsForScale.maxY * scale

            return paths.map {

                let p = $0.copy() as! UIBezierPath

                var t = CGAffineTransform.identity
                t = t.scaledBy(x: scale, y: scale)
                t = t.translatedBy(
                    x: offsetX / scale,
                    y: offsetY / scale
                )

                p.apply(t)
                return p
            }

        } else if ["g","j","p","y"].contains(currentLetter) {

            handwritingHeight = bounds.height * 0.46

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            // 👇 Bottom guide ko touch karega
            offsetY =
                bottomGuide -
                boundsForScale.maxY * scale

            return paths.map {

                let p = $0.copy() as! UIBezierPath

                var t = CGAffineTransform.identity
                t = t.scaledBy(x: scale, y: scale)
                t = t.translatedBy(
                    x: offsetX / scale,
                    y: offsetY / scale
                )

                p.apply(t)
                return p
            }

        } else {

            handwritingHeight = bounds.height * 0.56

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            offsetY =
                topLine -
                boundsForScale.minY * scale

            return paths.map {

                let p = $0.copy() as! UIBezierPath

                var t = CGAffineTransform.identity
                t = t.scaledBy(x: scale, y: scale)
                t = t.translatedBy(
                    x: offsetX / scale,
                    y: offsetY / scale
                )

                p.apply(t)
                return p
            }
        }
    }
    
    func resetDraw() {
        layers.forEach { $0.removeFromSuperlayer() }
        layers.removeAll()
        index = 0
    }

}
extension UIBezierPath {
    var length: CGFloat {
        var length: CGFloat = 0.0
        var lastPoint: CGPoint = .zero
        var didStart = false
        self.cgPath.applyWithBlock { elementPointer in
            let element = elementPointer.pointee
            let points = element.points
            switch element.type {
            case .moveToPoint:
                lastPoint = points[0]
                didStart = true
            case .addLineToPoint:
                guard didStart else { return }
                let to = points[0]
                length += hypot(to.x - lastPoint.x, to.y - lastPoint.y)
                lastPoint = to
            case .addQuadCurveToPoint:
                guard didStart else { return }
                // Approximate using line segments
                let from = lastPoint
                let ctrl = points[0]
                let to = points[1]
                let steps: Int = 20
                var prev = from
                for i in 1...steps {
                    let t = CGFloat(i) / CGFloat(steps)
                    let oneMinusT = 1 - t
                    let oneMinusTSquared = oneMinusT * oneMinusT
                    let tSquared = t * t
                    let x = oneMinusTSquared * from.x + 2 * oneMinusT * t * ctrl.x + tSquared * to.x
                    let y = oneMinusTSquared * from.y + 2 * oneMinusT * t * ctrl.y + tSquared * to.y
                    let p = CGPoint(x: x, y: y)
                    length += hypot(p.x - prev.x, p.y - prev.y)
                    prev = p
                }
                lastPoint = to
            case .addCurveToPoint:
                guard didStart else { return }
                // Approximate using line segments
                let from = lastPoint
                let ctrl1 = points[0]
                let ctrl2 = points[1]
                let to = points[2]
                let steps: Int = 20
                var prev = from
                for i in 1...steps {
                    let t = CGFloat(i) / CGFloat(steps)
                    let oneMinusT = 1 - t
                    let oneMinusTSquared = oneMinusT * oneMinusT
                    let oneMinusTCubed = oneMinusTSquared * oneMinusT
                    let tSquared = t * t
                    let tCubed = tSquared * t
                    let x = oneMinusTCubed * from.x + 3 * oneMinusTSquared * t * ctrl1.x + 3 * oneMinusT * tSquared * ctrl2.x + tCubed * to.x
                    let y = oneMinusTCubed * from.y + 3 * oneMinusTSquared * t * ctrl1.y + 3 * oneMinusT * tSquared * ctrl2.y + tCubed * to.y
                    let p = CGPoint(x: x, y: y)
                    length += hypot(p.x - prev.x, p.y - prev.y)
                    prev = p
                }
                lastPoint = to
            case .closeSubpath:
                break
            @unknown default:
                break
            }
        }
        return length
    }
}

