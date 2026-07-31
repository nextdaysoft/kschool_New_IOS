//
//  FractionCircleView.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 19/01/26.
//


import UIKit

class FractionCircleView: UIView {

    private var sliceLayers: [CAShapeLayer] = []
    private(set) var selectedSlices: Set<Int> = []
    var onSelectionChanged: ((Int) -> Void)?
    var isSelectionEnabled: Bool = true

    var fillColor: UIColor = ColorManager.randomColor()
    var strokeColor: UIColor = .black

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
    
    // MARK: Configure Circle
    func configure(denominator: Int) {

        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        sliceLayers.removeAll()
        selectedSlices.removeAll()

        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - 6
        let anglePerSlice = (2 * CGFloat.pi) / CGFloat(denominator)

        for i in 0..<denominator {

            let startAngle = anglePerSlice * CGFloat(i) - .pi / 2
            let endAngle = startAngle + anglePerSlice

            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(
                withCenter: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true
            )
            path.close()

            let slice = CAShapeLayer()
            slice.path = path.cgPath
            slice.fillColor = UIColor.clear.cgColor
            slice.strokeColor = strokeColor.cgColor
            slice.lineWidth = 10   // 🔥 thick lines
            slice.lineCap = .round
            slice.lineJoin = .round
            slice.name = "\(i)"

            layer.addSublayer(slice)
            sliceLayers.append(slice)
        }

        // ✅ 👉 YAHAN ADD KARO (for-loop ke baad)
        let outerPath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: true
        )

        let outerLayer = CAShapeLayer()
        outerLayer.path = outerPath.cgPath
        outerLayer.fillColor = UIColor.clear.cgColor
        outerLayer.strokeColor = strokeColor.cgColor
        outerLayer.lineWidth = 10   // same thickness

        layer.addSublayer(outerLayer)
    }

    // MARK: Toggle Slice
    private func toggleSlice(at index: Int) {

        let slice = sliceLayers[index]

        if selectedSlices.contains(index) {
            selectedSlices.remove(index)
            slice.fillColor = UIColor.clear.cgColor
        } else {
            selectedSlices.insert(index)
            
            // 🔥 हर click पे नया random color
            slice.fillColor = ColorManager.randomColor().cgColor
        }

        onSelectionChanged?(selectedSlices.count)
    }

    // MARK: Touch Detection
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        // 🔒 Disable interaction after submit
        guard isSelectionEnabled else { return }

        guard let point = touches.first?.location(in: self) else { return }

        for (index, slice) in sliceLayers.enumerated() {
            if let path = slice.path, path.contains(point) {
                toggleSlice(at: index)
                break
            }
        }
    }


    // MARK: Reset
    func reset() {
        selectedSlices.removeAll()
        sliceLayers.forEach {
            $0.fillColor = UIColor.clear.cgColor
        }
        // 🔥 notify reset
        isSelectionEnabled = true
        onSelectionChanged?(0)
    }
}

struct FractionQuestion {
    let numerator: Int
    let denominator: Int
}
