//
//  BallGameBeadView.swift
//  KSchool
//
//  Created by Koshal Singh on 19/03/26.
//

import Foundation
import UIKit

class BallGameBeadView: UIView {
    
    weak var rod: UIView?
    var rods: [UIView] = []
    
    var spacingY: CGFloat = 30   // 🔥 same as size (no gap)
    var rodTop: CGFloat = 120
    var rodHeight: CGFloat = 260
    
    private let liftedY: CGFloat = 60
    
    private var startCenter: CGPoint = .zero
    
    weak var gameViewController: BallShortGameVC?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.delegate = self
        addGestureRecognizer(pan)
    }
    
    private func checkGameCompleted() {

        guard let superview = superview else { return }

        let allBeads = superview.subviews.compactMap {
            $0 as? BallGameBeadView
        }

        let grouped = Dictionary(grouping: allBeads) { bead in
            bead.rod
        }

        for (_, beads) in grouped {

            if beads.count != 3 {
                return
            }

            guard let firstColor = beads.first?.backgroundColor else {
                return
            }

            let sameColor = beads.allSatisfy {
                $0.backgroundColor?.isEqual(firstColor) == true
            }

            if !sameColor {
                return
            }
        }

        gameViewController?.showSuccess()
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {

        guard let superview = superview else { return }

        switch gesture.state {

        case .began:

            startCenter = center

            // Selected bead always on top
            superview.bringSubviewToFront(self)

            // Instantly move bead to lifted position
            center = CGPoint(
                x: center.x,
                y: liftedY
            )

        case .changed:

            let translation = gesture.translation(in: superview)

            center = CGPoint(
                x: startCenter.x + translation.x,
                y: liftedY
            )

        case .ended, .cancelled:

            snapToRodStack()

        default:
            break
        }
    }
    
    private func snapToRodStack() {

        guard let superview = superview else { return }

        var nearestRod: UIView?
        var minDistance: CGFloat = .greatestFiniteMagnitude

        for r in rods {

            let distance = abs(center.x - r.center.x)

            if distance < minDistance {
                minDistance = distance
                nearestRod = r
            }
        }

        guard let rod = nearestRod else { return }

        let beadsInRod = superview.subviews
            .compactMap { $0 as? BallGameBeadView }
            .filter { $0.rod == rod && $0 != self }

        let count = beadsInRod.count

        // 🔥 Max 4 beads allowed
        if count >= 4 {

            self.center = startCenter
            return
        }

        self.rod = rod

        let newY = (rodTop + rodHeight) - (bounds.height / 2) - CGFloat(count) * spacingY

        superview.bringSubviewToFront(self)

        self.center = CGPoint(
            x: rod.center.x,
            y: newY
        )

        checkGameCompleted()
        checkGameCompleted()
    }
    
    private func isTopBead() -> Bool {

        guard let superview = superview,
              let currentRod = rod else {
            return false
        }

        let beadsInRod = superview.subviews
            .compactMap { $0 as? BallGameBeadView }
            .filter { $0.rod == currentRod }

        guard let topBead = beadsInRod.min(by: { $0.center.y < $1.center.y }) else {
            return false
        }

        return topBead === self
    }
}
extension BallGameBeadView: UIGestureRecognizerDelegate {

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return isTopBead()
    }
}
