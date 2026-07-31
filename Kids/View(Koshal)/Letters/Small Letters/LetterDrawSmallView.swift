//
//  LetterDrawSmallView.swift
//  KSchool
//
//  Created by Koshal Singh on 02/05/26.
//

import UIKit

final class LetterDrawSmallView: UIView {
    
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
        anim.timingFunction = .init(name: .linear)
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

        var boundsForScale = combinedBounds

        // i & j ke liye sirf body ko scale karo (dot ignore)
        if currentLetter == "i" || currentLetter == "j" {
            boundsForScale = paths[1].bounds
        }

        let availableWidth = bounds.width - margin * 2

        let letterHeight = boundsForScale.height

        let isCenterLetter =
            letterHeight < 0.45 ||
            (strokes.count == 2 && boundsForScale.width < 0.08)

        var handwritingHeight: CGFloat

        let topLine: CGFloat = bounds.height * 0.12
        let xHeight: CGFloat = bounds.height * 0.38
        let baseline: CGFloat = bounds.height * 0.68

        let offsetY: CGFloat

        if isCenterLetter {

            // a,c,e,i,m,n,o,r,s,u,v,w,x,z
            handwritingHeight = bounds.height * 0.28

            let centerY = (xHeight + baseline) / 2

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            offsetY = centerY - boundsForScale.midY * scale

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

        } else if currentLetter == "q" {
            
            handwritingHeight = bounds.height * 0.46

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            let offsetY =
                bounds.height * 0.69 - boundsForScale.midY * scale

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

        } else if boundsForScale.maxY > 0.82 {

            // g,j,p,y
            handwritingHeight = bounds.height * 0.46

            let centerY = bounds.height * 0.60

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            let offsetY = centerY - boundsForScale.midY * scale

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

            // b,d,f,h,k,l,t
            handwritingHeight = bounds.height * 0.56

            let scale = min(
                availableWidth / boundsForScale.width,
                handwritingHeight / boundsForScale.height
            )

            let offsetX =
                (bounds.width - boundsForScale.width * scale) / 2
                - boundsForScale.minX * scale

            // Top guide line ko touch karega
            offsetY = topLine - boundsForScale.minY * scale

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
