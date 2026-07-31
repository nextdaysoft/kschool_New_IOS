//
//  ResultCell2.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 19/01/26.
//


import UIKit

class ResultCell3: UICollectionViewCell {

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

        func configure(result: CompareResult) {
            // Text
            lblText.text = "\(result.leftNumber) \(result.rightNumber) \(result.userAnswer)"
            // BORDER COLOR
            if result.isCorrect {
                containerView.layer.borderColor = UIColor.systemGreen.cgColor
            } else {
                containerView.layer.borderColor = UIColor.systemRed.cgColor
            }
        }
    func configureone(result: AddSubResult) {
        // Text
        if result.isSign == true {
            lblText.text = "\(result.leftNumber) + \(result.rightNumber) = \(result.userAnswer)"
        }else{
            lblText.text = "\(result.leftNumber) - \(result.rightNumber) = \(result.userAnswer)"
        }
        // BORDER COLOR
        if result.isCorrect {
            containerView.layer.borderColor = UIColor.systemGreen.cgColor
        } else {
            containerView.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    func configureoneOone(result: FractionResult) {
        // Show fraction text
                lblText.text = "\(result.numerator) / \(result.denominator)"
        // BORDER COLOR
        if result.isCorrect {
            containerView.layer.borderColor = UIColor.systemGreen.cgColor
        } else {
            containerView.layer.borderColor = UIColor.systemRed.cgColor
        }
        }
}
