//
//  ResultCell 2.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 17/01/26.
//


import UIKit

class ResultCell2: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblText: UILabel!

    override func awakeFromNib() {
            super.awakeFromNib()

            containerView.layer.cornerRadius = 14
            containerView.layer.borderWidth = 3
            containerView.backgroundColor = .white

            lblText.numberOfLines = 1
            lblText.textAlignment = .center
            lblText.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }

        func configure(result: AfterBeforeResult, isBefore: Bool) {

            // TEXT FORMAT
            if isBefore {
                // Before Number
                lblText.text = "\(result.baseNumber)  →\n\(result.userAnswer)"
            } else {
                // After Number
                lblText.text = "\(result.baseNumber)  →  \(result.userAnswer)"
            }

            // BORDER COLOR
            if result.isCorrect {
                containerView.layer.borderColor = UIColor.systemGreen.cgColor
            } else {
                containerView.layer.borderColor = UIColor.systemRed.cgColor
            }
        }
}
