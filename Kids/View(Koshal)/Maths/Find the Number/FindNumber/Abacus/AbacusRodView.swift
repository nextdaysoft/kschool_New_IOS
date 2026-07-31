//
//  AbacusRodView.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 16/01/26.
//


import UIKit

class AbacusRodView: UIView {

    private(set) var activeBeads: Int = 0
    private var beads: [UIView] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupRod()
    }

    private func setupRod() {
        backgroundColor = .clear

        // Rod line
        let line = UIView(frame: CGRect(x: bounds.midX - 2, y: 0, width: 4, height: bounds.height))
        line.backgroundColor = .darkGray
        addSubview(line)

        // Beads (0–9)
        for i in 0..<10 {
            let bead = UIView(frame: CGRect(x: bounds.midX - 15,
                                             y: CGFloat(i) * 40,
                                             width: 30,
                                             height: 30))
            bead.layer.cornerRadius = 15
            bead.backgroundColor = ColorManager.randomColor()
            bead.tag = i + 1
            addSubview(bead)
            beads.append(bead)

            let tap = UITapGestureRecognizer(target: self, action: #selector(beadTapped(_:)))
            bead.addGestureRecognizer(tap)
            bead.isUserInteractionEnabled = true
        }
    }

    @objc private func beadTapped(_ sender: UITapGestureRecognizer) {
        guard let bead = sender.view else { return }
        activeBeads = bead.tag
        updateBeads()
    }

    private func updateBeads() {
        for bead in beads {
            bead.alpha = bead.tag <= activeBeads ? 1.0 : 0.3
        }
    }
}
