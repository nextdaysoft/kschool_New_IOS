//
//  NumberTraceView.swift
//  KSchool
//
//  Created by Koshal Singh on 24/04/26.
//

import Foundation
import UIKit

final class NumberTraceView: UIView {

    private let margin: CGFloat = 40
    private let maxTouchDist: CGFloat = 50
    private let startThreshold: CGFloat = 40

    private var strokes: [UIBezierPath] = []
    private var scaledStrokes: [UIBezierPath] = []
    private var flatStrokes: [[CGPoint]] = []

    private var strokeIndex = 0
    private var pointIndex = 0
    private var hasStarted = false

    private var onComplete: (() -> Void)?

    private let guideLayer = CAShapeLayer()
    private let grayLayer = CAShapeLayer()
    private let tracedLayer = CAShapeLayer()
    private let pointerLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    private func setupLayers() {
        guideLayer.strokeColor = UIColor.systemGray4.cgColor
        guideLayer.fillColor = UIColor.clear.cgColor
        guideLayer.lineWidth = 2
        guideLayer.lineDashPattern = [6, 6]
        guideLayer.lineCap = .round

        grayLayer.strokeColor = UIColor.lightGray.cgColor
        grayLayer.lineWidth = 6
        grayLayer.fillColor = UIColor.clear.cgColor
        grayLayer.lineCap = .round
        grayLayer.lineJoin = .round

        tracedLayer.strokeColor = ColorManager.randomColor().cgColor
        tracedLayer.lineWidth = 6
        tracedLayer.fillColor = UIColor.clear.cgColor
        tracedLayer.lineCap = .round
        tracedLayer.lineJoin = .round

        pointerLayer.fillColor = ColorManager.randomColor().cgColor

        [guideLayer, grayLayer, tracedLayer, pointerLayer].forEach {
            layer.addSublayer($0)
        }
    }

    func initTracing(
        strokes: [UIBezierPath],
        onComplete: @escaping () -> Void
    ) {
        self.strokes = strokes
        self.onComplete = onComplete

        scaledStrokes = scale(strokes)
        flatStrokes = scaledStrokes.map { $0.flattened() }

        strokeIndex = 0
        pointIndex = 0
        hasStarted = false

        drawGuides()
        drawGrayNumber()

        if let first = flatStrokes.first?.first {
            movePointer(to: first)
        }
    }

    func resetTrace() {
        strokeIndex = 0
        pointIndex = 0
        hasStarted = false

        tracedLayer.path = nil
        pointerLayer.path = nil

        if let first = flatStrokes.first?.first {
            drawGrayNumber()
            movePointer(to: first)
        }
    }

    override func touchesMoved(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {

        guard strokeIndex < flatStrokes.count,
              let touch = touches.first else { return }

        let location = touch.location(in: self)

        let points = flatStrokes[strokeIndex]

        let start = points.first!

        // START CHECK
        if !hasStarted {

            if distance(location, start) < startThreshold {

                hasStarted = true
                pointIndex = 0
            }

            return
        }

        // ✅ Same smoothness as DrawLetters
        let maxForwardStep = 18

        let searchRange =
            pointIndex..<min(
                pointIndex + maxForwardStep,
                points.count
            )

        var bestIndex = pointIndex
        var bestDistance = CGFloat.greatestFiniteMagnitude

        for i in searchRange {

            let d = distance(location, points[i])

            if d < bestDistance {

                bestDistance = d
                bestIndex = i
            }
        }

        let allowedDistance: CGFloat = 30

        guard bestDistance < allowedDistance else {
            return
        }

        let traceBoost = 2

        if bestIndex >= pointIndex {

            pointIndex =
                min(
                    bestIndex + traceBoost,
                    points.count - 1
                )

            updateTrace()

            movePointer(
                to: points[pointIndex]
            )
        }

        if pointIndex >= points.count - 1 {

            strokeIndex += 1

            pointIndex = 0

            hasStarted = false

            if strokeIndex < flatStrokes.count {

                movePointer(
                    to: flatStrokes[strokeIndex].first!
                )

            } else {

                onComplete?()
            }
        }
    }

    private func updateTrace() {
        let path = UIBezierPath()

        for i in 0..<strokeIndex {
            let pts = flatStrokes[i]
            path.move(to: pts.first!)
            pts.forEach { path.addLine(to: $0) }
        }

        let current = flatStrokes[strokeIndex]
        path.move(to: current.first!)

        for i in 0...pointIndex {
            path.addLine(to: current[i])
        }
        
        tracedLayer.path = path.cgPath
    }

    private func drawGrayNumber() {
        let path = UIBezierPath()

        flatStrokes.forEach {
            path.move(to: $0.first!)
            $0.forEach { path.addLine(to: $0) }
        }

        grayLayer.path = path.cgPath
    }

    private func movePointer(to point: CGPoint) {

        pointerLayer.path = UIBezierPath(
            ovalIn: CGRect(
                x: point.x - 15,
                y: point.y - 15,
                width: 30,
                height: 30
            )
        ).cgPath
    }
    private func drawGuides() {

        guard let b = scaledStrokes
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

    private func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        hypot(a.x - b.x, a.y - b.y)
    }
    
  
}
