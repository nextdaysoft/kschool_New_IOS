////
////  GridView.swift
////  Kids
////
////  Created by NextDay Sotware Solution on 23/01/26.
////
//
//import UIKit
//
//class GridView: UIView, UIGestureRecognizerDelegate {
//
//    // MARK: - Properties
//    var gridSize: Int = 0 {
//        didSet {
//            setupDots()
//            setNeedsDisplay()
//        }
//    }
//    var isInteractive: Bool = false {
//        didSet {
//            isUserInteractionEnabled = isInteractive
//        }
//    }
//    var onFirstDraw: (() -> Void)?
//
//    private var dotPoints: [Dot: CGPoint] = [:]
//    private var startDot: Dot? // ensure optional and var
//    private var currentPath: UIBezierPath?
//    private var drawnPaths: [UIBezierPath] = []
//    var drawnLines: Set<Line> = Set() // Exposed for comparison
//
//    // MARK: - Initialization
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupGesture()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupGesture()
//    }
//
//    private func setupGesture() {
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//        panGesture.delegate = self
//        addGestureRecognizer(panGesture)
//    }
//
//    // MARK: - Drawing
//    override func draw(_ rect: CGRect) {
//        // Draw dots
//        UIColor.gray.setFill()
//        for point in dotPoints.values {
//            let dotRect = CGRect(x: point.x - 5, y: point.y - 5, width: 10, height: 10)
//            UIBezierPath(ovalIn: dotRect).fill()
//        }
//        
//        // Draw confirmed lines
//        UIColor.blue.setStroke()
//        for path in drawnPaths {
//            path.lineWidth = 3.0
//            path.stroke()
//        }
//
//        // Draw current active line
//        if let currentPath = currentPath {
//            UIColor.blue.setStroke()
//            currentPath.lineWidth = 3.0
//            currentPath.stroke()
//        }
//    }
//
//    // MARK: - Setup
//    private func setupDots() {
//        dotPoints.removeAll()
//        let padding: CGFloat = 20.0
//        let availableWidth = bounds.width - (2 * padding)
//        let spacing = availableWidth / CGFloat(gridSize - 1)
//
//        for row in 0..<gridSize {
//            for col in 0..<gridSize {
//                let x = padding + CGFloat(col) * spacing
//                let y = padding + CGFloat(row) * spacing
//                let dot = Dot(row: row, col: col)
//                dotPoints[dot] = CGPoint(x: x, y: y)
//            }
//        }
//    }
//
//    func reset() {
//        drawnPaths.removeAll()
//        drawnLines.removeAll()
//        currentPath = nil
//        setNeedsDisplay()
//    }
//
//    func loadPattern(_ pattern: Pattern) {
//        reset()
//        gridSize = pattern.gridSize // This will call setupDots
//        
//        // Convert the logical Lines to visual UIBezierPaths for display
//        for line in pattern.lines {
//            if let fromPoint = dotPoints[line.from], let toPoint = dotPoints[line.to] {
//                let path = UIBezierPath()
//                path.move(to: fromPoint)
//                path.addLine(to: toPoint)
//                drawnPaths.append(path)
//            }
//        }
//        setNeedsDisplay()
//    }
//    
//    // MARK: - Gesture Handling
//    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
//        guard isInteractive, !drawnLines.isEmpty || onFirstDraw != nil else { return }
//
//        let location = gesture.location(in: self)
//        
//        switch gesture.state {
//        case .began:
//            self.startDot = dot(at: location)
//            if self.startDot != nil {
//                onFirstDraw?()
//                onFirstDraw = nil // Only call once
//            }
//        case .changed:
//            guard let currentStartDot = self.startDot, let startPoint = dotPoints[currentStartDot] else { return }
//            
//            let endDot = dot(at: location)
//            currentPath = UIBezierPath()
//            currentPath?.move(to: startPoint)
//            
//            if let endDot = endDot, endDot != currentStartDot, isAdjacent(dot1: currentStartDot, dot2: endDot) {
//                // Snap line to nearest valid dot if close enough
//                if let endPoint = dotPoints[endDot] {
//                    currentPath?.addLine(to: endPoint)
//                }
//            } else {
//                 // Draw line to current finger position
//                currentPath?.addLine(to: location)
//            }
//            setNeedsDisplay()
//
//        case .ended:
//            guard let currentStartDot = self.startDot else { return }
//            
//            if let endDot = dot(at: location), endDot != currentStartDot, isAdjacent(dot1: currentStartDot, dot2: endDot) {
//                let line = Line(from: currentStartDot, to: endDot).normalized()
//                if !drawnLines.contains(line) {
//                    // Add the valid line permanently
//                    drawnLines.insert(line)
//                    if let startPoint = dotPoints[currentStartDot], let endPoint = dotPoints[endDot] {
//                       addLinePath(from: startPoint, to: endPoint)
//                    }
//                }
//            }
//            currentPath = nil // Remove the active line
//            self.startDot = nil
//            setNeedsDisplay()
//            
//        default:
//            currentPath = nil
//            self.startDot = nil
//        }
//    }
//    
//    private func addLinePath(from startPoint: CGPoint, to endPoint: CGPoint) {
//         let path = UIBezierPath()
//         path.move(to: startPoint)
//         path.addLine(to: endPoint)
//         drawnPaths.append(path)
//     }
//
//    private func dot(at location: CGPoint) -> Dot? {
//        for (dot, point) in dotPoints {
//            // Check if touch is within 20 points of a dot center
//            if abs(location.x - point.x) <= 20 && abs(location.y - point.y) <= 20 {
//                return dot
//            }
//        }
//        return nil
//    }
//    
//    private func isAdjacent(dot1: Dot, dot2: Dot) -> Bool {
//        let rowDiff = abs(dot1.row - dot2.row)
//        let colDiff = abs(dot1.col - dot2.col)
//        // Allow horizontal, vertical, and diagonal connections to immediate neighbors
//        return (rowDiff <= 1 && colDiff <= 1) && (rowDiff != 0 || colDiff != 0)
//    }
//}
//
import UIKit

class GridView: UIView, UIGestureRecognizerDelegate {

    // MARK: - Public
    var gridSize: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var lineColor: UIColor = .systemBlue
    
    var expectedLineCount: Int = 0

    var isInteractive: Bool = false {
        didSet { isUserInteractionEnabled = isInteractive }
    }

    var onFirstDraw: (() -> Void)?

    // MARK: - Private
    private var dotPoints: [Dot: CGPoint] = [:]
    private var startDot: Dot?
    private var currentPath: UIBezierPath?
    private var drawnPaths: [UIBezierPath] = []

    // Exposed for comparison
    private(set) var drawnLines = Set<Line>()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }

    private func setupGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.delegate = self
        addGestureRecognizer(pan)
    }

    // MARK: - Drawing
    override func draw(_ rect: CGRect) {
        drawDots()
        drawSavedLines()
        drawActiveLine()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupDots()
        setNeedsDisplay()
    }

   
    
    private func drawDots() {

        for (dot, point) in dotPoints {

            // ✅ default gray
            var color = UIColor.systemGray

            // ✅ agar kisi line me ye dot use hua hai
            let isConnected = drawnLines.contains {
                $0.from == dot || $0.to == dot
            }

            // ✅ same color as line
            if isConnected {
                color = lineColor
            }

            color.setFill()

            // ✅ OLD SMALL SIZE
            UIBezierPath(
                ovalIn: CGRect(
                    x: point.x - 3.5,
                    y: point.y - 3.5,
                    width: 7,
                    height: 7
                )
            ).fill()
        }
    }

    private func drawSavedLines() {
        lineColor.setStroke()

        for path in drawnPaths {
            path.lineWidth = 3
            path.lineCapStyle = .round
            path.stroke()
        }
    }

    private func drawActiveLine() {
        guard let path = currentPath else { return }

        lineColor.setStroke()

        path.lineWidth = 3
        path.lineCapStyle = .round
        path.stroke()
    }

    // MARK: - Setup
    private func setupDots() {
        dotPoints.removeAll()

        let scale: CGFloat = 0.8   // 🔥 yaha control hai (0.7, 0.8, 0.9 try karo)

        let usableWidth = bounds.width * scale
        let usableHeight = bounds.height * scale
        let usable = min(usableWidth, usableHeight)

        let spacing = usable / CGFloat(gridSize - 1)

        // center
        let startX = (bounds.width - usable) / 2
        let startY = (bounds.height - usable) / 2

        for r in 0..<gridSize {
            for c in 0..<gridSize {
                let p = CGPoint(
                    x: startX + CGFloat(c) * spacing,
                    y: startY + CGFloat(r) * spacing
                )
                dotPoints[Dot(row: r, col: c)] = p
            }
        }
    }
    
    func reset() {

        // ✅ ALWAYS CLEAR
        drawnPaths.removeAll()
        drawnLines.removeAll()

        currentPath = nil
        startDot = nil

        setNeedsDisplay()
    }

    func loadPattern(_ pattern: Pattern) {
        reset()

        gridSize = pattern.gridSize
        expectedLineCount = pattern.lines.count
        isInteractive = false

        // ✅ ensure dots ready
        layoutIfNeeded()
        setupDots()
        
        for line in pattern.lines {
            if let p1 = dotPoints[line.from],
               let p2 = dotPoints[line.to] {

                let path = UIBezierPath()
                path.move(to: p1)
                path.addLine(to: p2)

                drawnPaths.append(path)

                // ✅ ADD THIS
                drawnLines.insert(line.normalized())
            }
        }

        setNeedsDisplay()
    }
    

    // MARK: - Gesture
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard isInteractive else { return }

        let location = gesture.location(in: self)

        switch gesture.state {

        case .began:
            startDot = nearestDot(to: location)

            // ❌ agar dot nahi mila → start hi mat karo
            guard startDot != nil else { return }

            onFirstDraw?()
            onFirstDraw = nil

        case .changed:

            guard let startDot = startDot,
                  let startPoint = dotPoints[startDot] else { return }

            // Preview line (always follow finger)
            currentPath = UIBezierPath()
            currentPath?.move(to: startPoint)
            currentPath?.addLine(to: location)

            if let endDot = nearestDot(to: location),
               endDot != startDot,
               isAdjacent(dot1: startDot, dot2: endDot),
               let endPoint = dotPoints[endDot] {

                let line = Line(from: startDot, to: endDot).normalized()

                if !drawnLines.contains(line) {

                    drawnLines.insert(line)

                    let path = UIBezierPath()
                    path.move(to: startPoint)
                    path.addLine(to: endPoint)

                    drawnPaths.append(path)

                    self.startDot = endDot

                    // Continue smoothly
                    currentPath = UIBezierPath()
                    currentPath?.move(to: endPoint)
                    currentPath?.addLine(to: location)
                }
            }

            setNeedsDisplay()

        case .ended:
            guard let startDot,
                  let endDot = nearestDot(to: location),
                  startDot != endDot,
                  isAdjacent(dot1: startDot, dot2: endDot),
                  let p1 = dotPoints[startDot],
                  let p2 = dotPoints[endDot] else {

                cleanup()
                return
            }

            let line = Line(from: startDot, to: endDot).normalized()

            if !drawnLines.contains(line) {
                drawnLines.insert(line)

                let path = UIBezierPath()
                path.move(to: p1)
                path.addLine(to: p2)
                drawnPaths.append(path)
            }

            cleanup()

        default:
            cleanup()
        }
    }
    
    private func isAdjacent(dot1: Dot, dot2: Dot) -> Bool {
        let rowDiff = abs(dot1.row - dot2.row)
        let colDiff = abs(dot1.col - dot2.col)

        return (rowDiff <= 1 && colDiff <= 1) && (rowDiff != 0 || colDiff != 0)
    }
    
    private func cleanup() {
        currentPath = nil
        startDot = nil
        setNeedsDisplay()
    }

    // MARK: - Helpers
    private func nearestDot(to point: CGPoint) -> Dot? {

        // ✅ balanced touch area
        let threshold: CGFloat = 22

        let nearest = dotPoints.min {
            $0.value.distance(to: point) < $1.value.distance(to: point)
        }

        if let nearest = nearest,
           nearest.value.distance(to: point) <= threshold {

            return nearest.key
        }

        return nil
    }
}

// MARK: - Geometry
extension CGPoint {
    func distance(to p: CGPoint) -> CGFloat {
        hypot(x - p.x, y - p.y)
    }
}
