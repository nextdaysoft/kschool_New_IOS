//
//  LetterTraceSmallView.swift
//  KSchool
//
//  Created by Koshal Singh on 02/05/26.
//

import UIKit

final class LetterTraceSmallView: UIView {

    private let margin: CGFloat = 40
    private let maxTouchDist: CGFloat = 70
    private let startThreshold: CGFloat = 50

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

        self.currentLetter = letter
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

        let start = points.first!

        if !hasStarted {

            if distance(location, start) < startThreshold {

                hasStarted = true
                pointIndex = 0
            }

            return
        }

        // ✅ Smooth tracing
        let maxForwardStep =
            isLoopLetterStyle ? 18 : 12

        let searchRange =
            pointIndex..<min(
                pointIndex + maxForwardStep,
                points.count
            )

        var bestIndex = pointIndex
        var bestDistance = CGFloat.greatestFiniteMagnitude

        for i in searchRange {

            let d = distance(points[i], location)

            if d < bestDistance {

                bestDistance = d
                bestIndex = i
            }
        }

        // ✅ Finger ko thodi freedom
        let allowedDistance: CGFloat =
            isLoopLetterStyle ? 42 : 34

        guard bestDistance < allowedDistance else {
            return
        }

        // ✅ Smooth forward movement
        let traceBoost =
            isLoopLetterStyle ? 3 : 2

        if bestIndex >= pointIndex {

            pointIndex = min(
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

        var boundsForScale = combinedBounds

        // i & j ke dot ko scaling me ignore karo
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
    
    private func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        hypot(a.x - b.x, a.y - b.y)
    }
}

