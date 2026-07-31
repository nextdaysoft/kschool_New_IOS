//
//  LetterTraceSmallCursiveVC.swift
//  New
//
//  Created by Koshal Singh on 29/05/26.
//

import UIKit

final class LetterTraceSmallCursiveVC: UIView {

    private let margin: CGFloat = 40
    private let maxTouchDist: CGFloat = 70
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

    private var isLoopLetterStyle = false
    
    private var currentLetter: Character = "a"
    
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
        guideLayer.lineDashPattern = [6, 6] // small dash gap
        guideLayer.lineCap = .round         // important for dotted look

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
        letter: Character,
        isLoopLetter: Bool,
        onComplete: @escaping () -> Void
    ) {

        currentLetter = letter

        self.strokes = strokes
        self.onComplete = onComplete

        self.isLoopLetterStyle = isLoopLetter

        scaledStrokes = scale(strokes)
        flatStrokes = scaledStrokes.map { $0.flattened() }

        strokeIndex = 0
        pointIndex = 0
        hasStarted = false

        drawGuides()
        drawGrayLetter()

        movePointer(to: flatStrokes.first!.first!)
    }

    override func touchesMoved(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {

        guard strokeIndex < flatStrokes.count,
              let touch = touches.first else { return }

        let location = touch.location(in: self)

        let points = flatStrokes[strokeIndex]

        guard let start = points.first else { return }

        if !hasStarted {

            if distance(location, start) < startThreshold {

                hasStarted = true
                pointIndex = 0
            }

            return
        }

        // MARK: - Forward searching

        let maxForwardStep: Int

        if currentLetter == "x" {
            maxForwardStep = 80
        } else {
            maxForwardStep = isLoopLetterStyle ? 20 : 12
        }

        let searchEnd = min(pointIndex + maxForwardStep, points.count - 1)

        var bestIndex = pointIndex
        var bestDistance = CGFloat.greatestFiniteMagnitude

        for i in pointIndex...searchEnd {

            let d = distance(points[i], location)

            if d < bestDistance {

                bestDistance = d
                bestIndex = i
            }
        }

        // MARK: - Allowed distance

        let allowedDistance: CGFloat

        if currentLetter == "x" {
            allowedDistance = 85
        } else {
            allowedDistance = isLoopLetterStyle ? 42 : 34
        }

        if currentLetter == "x" {

            if bestDistance > allowedDistance + 20 {
                return
            }

        } else {

            guard bestDistance <= allowedDistance else {
                return
            }
        }

        // MARK: - Trace boost

        let traceBoost: Int

        if currentLetter == "x" {
            traceBoost = 12
        } else {
            traceBoost = isLoopLetterStyle ? 3 : 2
        }

        let targetIndex = min(
            bestIndex + traceBoost,
            points.count - 1
        )

        if currentLetter == "x" {

            pointIndex = min(
                targetIndex + 6,
                points.count - 1
            )

        } else {

            while pointIndex < targetIndex {
                pointIndex += 1
            }
        }

        updateTrace()

        movePointer(
            to: points[pointIndex]
        )

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

            guard pts.count > 1 else { continue }

            path.move(to: pts[0])

            for j in 1..<pts.count {

                let prev = pts[j - 1]
                let current = pts[j]

                let mid = CGPoint(
                    x: (prev.x + current.x) * 0.5,
                    y: (prev.y + current.y) * 0.5
                )

                path.addQuadCurve(
                    to: mid,
                    controlPoint: prev
                )
            }

            path.addLine(to: pts.last!)
        }

        let currentStroke = flatStrokes[strokeIndex]

        guard currentStroke.count > 1 else {
            tracedLayer.path = path.cgPath
            return
        }

        let endIndex = min(pointIndex, currentStroke.count - 1)

        path.move(to: currentStroke[0])

        if endIndex > 0 {

            for j in 1...endIndex {

                let prev = currentStroke[j - 1]
                let current = currentStroke[j]

                let mid = CGPoint(
                    x: (prev.x + current.x) * 0.5,
                    y: (prev.y + current.y) * 0.5
                )

                path.addQuadCurve(
                    to: mid,
                    controlPoint: prev
                )
            }

            path.addLine(to: currentStroke[endIndex])
        }

        tracedLayer.path = path.cgPath
    }
    
    func resetTrace() {
        strokeIndex = 0
        pointIndex = 0
        hasStarted = false

        tracedLayer.path = nil
        pointerLayer.path = nil

        if !flatStrokes.isEmpty {
            drawGrayLetter()
            movePointer(to: flatStrokes.first!.first!)
        }
    }

    private func drawGrayLetter() {
        let p = UIBezierPath()
        flatStrokes.forEach {
            p.move(to: $0.first!)
            $0.forEach { p.addLine(to: $0) }
        }
        grayLayer.path = p.cgPath
    }

    private func movePointer(to point: CGPoint) {
        pointerLayer.path = UIBezierPath(
            ovalIn: CGRect(x: point.x - 15, y: point.y - 15, width: 30, height: 30)
        ).cgPath
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
        } else if currentLetter == "q" {

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

    private func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        hypot(a.x - b.x, a.y - b.y)
    }
}
