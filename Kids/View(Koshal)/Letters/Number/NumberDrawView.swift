//
//  NumberDrawView.swift
//  KSchool
//
//  Created by Koshal Singh on 24/04/26.
//

import Foundation

import UIKit

final class NumberDrawView: UIView {

    private let margin: CGFloat = 40
    private let step: CGFloat = 4.5
    private let frameDelay: TimeInterval = 0.030

    private var strokes: [UIBezierPath] = []
    private var transformed: [UIBezierPath] = []
    private var index = 0
    private var layers: [CAShapeLayer] = []

    private let guideLayer = CAShapeLayer()
    private var currentColor: UIColor = .systemBlue

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .clear

        guideLayer.strokeColor = UIColor.systemGray4.cgColor
        guideLayer.fillColor = UIColor.clear.cgColor
        guideLayer.lineWidth = 2
        guideLayer.lineDashPattern = [6, 6]
        guideLayer.lineCap = .round

        layer.addSublayer(guideLayer)
    }

    func setNumber(_ paths: [UIBezierPath]) {
        layers.forEach { $0.removeFromSuperlayer() }
        layers.removeAll()

        strokes = paths
        transformed = scale(paths)
        index = 0

        currentColor = ColorManager.randomColor()

        drawGuides()
        animateNext()
    }

    func redraw() {
        resetDraw()
        drawGuides()
        animateNext()
    }

    func resetDraw() {
        layers.forEach { $0.removeFromSuperlayer() }
        layers.removeAll()
        index = 0
    }

    private func animateNext() {
        guard index < transformed.count else { return }

        let path = transformed[index]

        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor = currentColor.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 6
        shape.lineCap = .round
        shape.strokeEnd = 0

        layer.addSublayer(shape)
        layers.append(shape)

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = Double(path.length / step) * frameDelay
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false

        shape.add(animation, forKey: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + animation.duration) {
            self.index += 1
            self.animateNext()
        }
    }

    private func drawGuides() {

        guard let b = transformed
            .map({ $0.bounds })
            .reduce(nil as CGRect?, { current, rect in
                current?.union(rect) ?? rect
            })
        else { return }

        let top = b.minY
        let middle = (top + b.maxY) / 2
        let bottom = b.maxY

        let gap = (bottom - top) / 2

        // only bottom extra line
        let lowerExtra = bottom + gap

        let p = UIBezierPath()

        [
            top,
            middle,
            bottom,
            lowerExtra
        ].forEach {

            p.move(
                to: CGPoint(
                    x: 0,
                    y: $0
                )
            )

            p.addLine(
                to: CGPoint(
                    x: bounds.width,
                    y: $0
                )
            )
        }

        guideLayer.path = p.cgPath
    }

    private func scale(_ paths: [UIBezierPath]) -> [UIBezierPath] {

        guard let first = paths.first else { return [] }

        let combinedBounds = paths
            .map { $0.bounds }
            .reduce(first.bounds) { $0.union($1) }

        let availableWidth = bounds.width - margin * 2

        // increase digit height
        let handwritingHeight: CGFloat = bounds.height * 0.60

        let scale = min(
            availableWidth / combinedBounds.width,
            handwritingHeight / combinedBounds.height
        )

        let offsetX =
            (bounds.width - combinedBounds.width * scale) / 2
            - combinedBounds.minX * scale

        let guideCenterY = bounds.height * 0.50

        let offsetY =
            guideCenterY -
            (combinedBounds.midY * scale)

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
    
}
