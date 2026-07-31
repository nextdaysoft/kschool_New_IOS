//
//  AbacusView.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 16/01/26.
//
import UIKit

class AbacusView: UIView {

    var rodCount = 2 {
        didSet {
            setNeedsLayout()   // 👈 auto redraw when changed
        }
    }

    private let beadsPerRod = 9
    private let beadSize: CGFloat = 28

    private var rods: [UIView] = []
    private var baseLineY: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupAbacus()
    }

    private func setupAbacus() {

        // 🔥 Clean old views
        subviews.forEach { $0.removeFromSuperview() }
        rods.removeAll()

        let spacingX = bounds.width / CGFloat(rodCount + 1)
        baseLineY = bounds.height - beadSize

        // 🔹 Base Line
        let baseLine = UIView(frame: CGRect(
            x: 40,
            y: baseLineY,
            width: bounds.width - 80,
            height: 4
        ))
        baseLine.backgroundColor = .darkGray
        baseLine.layer.cornerRadius = 2
        addSubview(baseLine)

        // 🔹 Rods loop
        for i in 0..<rodCount {

            let x = spacingX * CGFloat(i + 1)

            let rodTop: CGFloat = 20
            let rodHeight = baseLineY - rodTop

            let rod = UIView(frame: CGRect(
                x: x - 3,
                y: rodTop,
                width: 6,
                height: rodHeight
            ))
            rod.backgroundColor = .darkGray
            rod.layer.cornerRadius = 3
            addSubview(rod)
            rods.append(rod)

            // 🔥 Beads
            for j in 0..<beadsPerRod {

                let centerY = baseLineY - CGFloat(j) * beadSize - beadSize / 2

                let bead = BeadView(frame: CGRect(
                    x: x - beadSize / 2,
                    y: centerY - beadSize / 2,
                    width: beadSize,
                    height: beadSize
                ))

                bead.isHidden = true   // 👈 start hidden

                bead.rod = rod
                bead.baseLineY = baseLineY

                addSubview(bead)
            }
        }
    }
}
class BeadView: UIView {

    weak var rod: UIView?
    var baseLineY: CGFloat = 0

    private var startCenter: CGPoint = .zero
    private var originalCenter: CGPoint = .zero

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if originalCenter == .zero {
            originalCenter = center
        }
    }

    func resetPosition() {
        center = originalCenter
    }

    private func setup() {
        backgroundColor = ColorManager.randomColor()
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        addGestureRecognizer(pan)
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {

        guard let rod = rod else { return }

        switch gesture.state {

        case .began:
            startCenter = center

        case .changed:
            let translation = gesture.translation(in: superview)
            var newY = startCenter.y + translation.y

            let topLimit = rod.frame.minY + bounds.height / 2
            let bottomLimit = baseLineY - bounds.height

            newY = max(topLimit, min(bottomLimit, newY))
            center = CGPoint(x: startCenter.x, y: newY)

        default:
            break
        }
    }
}
