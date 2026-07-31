//
//  ResultCell.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 20/12/25.
//
import UIKit

class ResultCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.systemGreen.cgColor
    }

    func configure(numbers: [Int], answer: Int) {
        lblText.text = "\(numbers.map(String.init).joined(separator: ", ")) → \(answer)"
    }
    func LetterConfigure(letter: String) {
        lblText.text = letter
    }
}
