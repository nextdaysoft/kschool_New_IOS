//
//  AnswerCell.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 16/12/25.
//

import UIKit

class AnswerCell: UICollectionViewCell {

    // MARK: Outlet
    @IBOutlet weak var lbl: UILabel!

    // 👇 drag callback
    var panHandler: ((UIPanGestureRecognizer, AnswerCell) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = .clear

        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 16, weight: .regular)

        lbl.backgroundColor = ColorManager.randomColor()

        lbl.layer.cornerRadius = 10
        lbl.clipsToBounds = true

        // 👇 IMPORTANT
        lbl.isUserInteractionEnabled = true

        // 👇 Direct touch drag
        let pan = UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePan(_:))
        )

        lbl.addGestureRecognizer(pan)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // ⭐ keep label full cell size
        lbl.frame = contentView.bounds
    }

    // existing animation
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.transform = self.isHighlighted
                ? CGAffineTransform(scaleX: 1.1, y: 1.1)
                : .identity
            }
        }
    }

    @objc func handlePan(
        _ gesture: UIPanGestureRecognizer
    ) {
        panHandler?(gesture, self)
    }

    func configure(value: Int) {

        lbl.text = "\(value)"

        lbl.textAlignment = .center
        lbl.textColor = .black

        lbl.backgroundColor = ColorManager.randomColor()

        lbl.layer.cornerRadius = 8
        lbl.clipsToBounds = true
    }
}
