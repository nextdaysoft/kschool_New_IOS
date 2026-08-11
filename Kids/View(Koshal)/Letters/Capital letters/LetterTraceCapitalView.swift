//
//  LetterTraceCapitalView.swift
//  tracing
//
//  Created by NextDay Sotware Solution on 27/01/26.
//

import UIKit

final class LetterTraceCapitalView: UIView {

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

    private var isLoopLetterStyle = false
    
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
        isLoopLetter: Bool,
        onComplete: @escaping () -> Void
    ) {
        self.strokes = strokes
        self.onComplete = onComplete

        // ✅ ADD THIS
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

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

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

        // ✅ FASTER SPEED FOR CURSIVE/NORMAL
        let maxForwardStep = isLoopLetterStyle ? 50 : 30

        let searchRange =
            pointIndex..<min(pointIndex + maxForwardStep, points.count)

        var bestIndex = pointIndex
        var bestDistance = CGFloat.greatestFiniteMagnitude

        for i in searchRange {

            let d = distance(location, points[i])

            if d < bestDistance {

                bestDistance = d
                bestIndex = i
            }
        }

        // Distance allowed
        let allowedDistance: CGFloat =
            isLoopLetterStyle ? 45 : 30

        guard bestDistance < allowedDistance else {
            return
        }

        // ✅ Faster movement along the letter
        let traceBoost = isLoopLetterStyle ? 4 : 2

        if bestIndex >= pointIndex {

            pointIndex =
                min(bestIndex + traceBoost, points.count - 1)

            updateTrace()

            movePointer(to: points[pointIndex])
        }

        // COMPLETE STROKE
        if pointIndex >= points.count - 1 {

            strokeIndex += 1

            pointIndex = 0

            hasStarted = false

            if strokeIndex < flatStrokes.count {

                movePointer(to: flatStrokes[strokeIndex].first!)

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
        guard let b = scaledStrokes.map({ $0.bounds }).reduce(nil, { $0?.union($1) ?? $1 }) else { return }
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

    private func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        hypot(a.x - b.x, a.y - b.y)
    }
}

extension UIBezierPath {
    // Returns the CGPoint at distance 't' along the path
    func point(at t: CGFloat) -> CGPoint {
        var total: CGFloat = 0.0
        var lastPoint: CGPoint = .zero
        var didStart = false
        var result: CGPoint = .zero
        var found = false
        self.cgPath.applyWithBlock { elementPointer in
            guard !found else { return }
            let element = elementPointer.pointee
            let points = element.points
            switch element.type {
            case .moveToPoint:
                lastPoint = points[0]
                didStart = true
            case .addLineToPoint:
                guard didStart else { return }
                let to = points[0]
                let segment = hypot(to.x - lastPoint.x, to.y - lastPoint.y)
                if total + segment >= t {
                    let remaining = t - total
                    let ratio = remaining / segment
                    result = CGPoint(
                        x: lastPoint.x + (to.x - lastPoint.x) * ratio,
                        y: lastPoint.y + (to.y - lastPoint.y) * ratio
                    )
                    found = true
                }
                total += segment
                lastPoint = to
            case .addQuadCurveToPoint, .addCurveToPoint:
                // Not implemented for curves. Approximate as the end point for simplicity
                // Advanced: Add curve math for accuracy
                let count = element.type == .addQuadCurveToPoint ? 2 : 3
                let to = points[count - 1]
                if total >= t && !found {
                    result = to
                    found = true
                }
                lastPoint = to
            case .closeSubpath:
                break
            @unknown default:
                break
            }
        }
        return result
    }

    // Returns a new UIBezierPath trimmed to a specific length along the path
    func trimmed(to t: CGFloat) -> UIBezierPath {
        let trimmed = UIBezierPath()
        var total: CGFloat = 0.0
        var lastPoint: CGPoint = .zero
        var didStart = false
        var done = false
        self.cgPath.applyWithBlock { elementPointer in
            guard !done else { return }
            let element = elementPointer.pointee
            let points = element.points
            switch element.type {
            case .moveToPoint:
                lastPoint = points[0]
                trimmed.move(to: lastPoint)
                didStart = true
            case .addLineToPoint:
                guard didStart else { return }
                let to = points[0]
                let segment = hypot(to.x - lastPoint.x, to.y - lastPoint.y)
                if total + segment > t {
                    let remaining = t - total
                    let ratio = remaining / segment
                    let end = CGPoint(
                        x: lastPoint.x + (to.x - lastPoint.x) * ratio,
                        y: lastPoint.y + (to.y - lastPoint.y) * ratio
                    )
                    trimmed.addLine(to: end)
                    done = true
                } else {
                    trimmed.addLine(to: to)
                }
                total += segment
                lastPoint = to
            case .addQuadCurveToPoint, .addCurveToPoint:
                // Not implemented for curves; for now, just add the endpoint if within limit
                let count = element.type == .addQuadCurveToPoint ? 2 : 3
                let to = points[count - 1]
                if total < t {
                    trimmed.addLine(to: to)
                    lastPoint = to
                } else {
                    done = true
                }
            case .closeSubpath:
                trimmed.close()
            @unknown default:
                break
            }
        }
        return trimmed
    }
    func flattened(step: Int = 80) -> [CGPoint] {
        var points: [CGPoint] = []
        var last: CGPoint = .zero

        cgPath.applyWithBlock { elementPtr in
            let e = elementPtr.pointee
            let p = e.points

            switch e.type {

            case .moveToPoint:
                last = p[0]
                points.append(last)

            case .addLineToPoint:
                let end = p[0]
                for i in 1...step {
                    let t = CGFloat(i) / CGFloat(step)
                    let x = last.x + (end.x - last.x) * t
                    let y = last.y + (end.y - last.y) * t
                    points.append(CGPoint(x: x, y: y))
                }
                last = end

            case .addQuadCurveToPoint:
                let c = p[0]
                let end = p[1]
                for i in 1...step {
                    let t = CGFloat(i) / CGFloat(step)
                    let mt = 1 - t
                    let x = mt*mt*last.x + 2*mt*t*c.x + t*t*end.x
                    let y = mt*mt*last.y + 2*mt*t*c.y + t*t*end.y
                    points.append(CGPoint(x: x, y: y))
                }
                last = end

            case .addCurveToPoint:
                let c1 = p[0]
                let c2 = p[1]
                let end = p[2]
                for i in 1...step {
                    let t = CGFloat(i) / CGFloat(step)
                    let mt = 1 - t
                    let x =
                        mt*mt*mt*last.x +
                        3*mt*mt*t*c1.x +
                        3*mt*t*t*c2.x +
                        t*t*t*end.x
                    let y =
                        mt*mt*mt*last.y +
                        3*mt*mt*t*c1.y +
                        3*mt*t*t*c2.y +
                        t*t*t*end.y
                    points.append(CGPoint(x: x, y: y))
                }
                last = end

            default:
                break
            }
        }

        return points
    }
}


