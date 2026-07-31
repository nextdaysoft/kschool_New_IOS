//
//  KeypadCell.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 17/01/26.
//


import UIKit

class KeypadCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        bgView.layer.cornerRadius = 6
        bgView.clipsToBounds = true

        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        titleLabel.textAlignment = .center
    }

    func configure(item: KeypadItem) {
        titleLabel.text = item.title
        bgView.backgroundColor = item.color
        titleLabel.textColor = item.title == "X" ? .white : .black
    }
    
    func setResultColor(isCorrect: Bool) {
        if isCorrect {
            bgView.backgroundColor = .systemGreen
        } else {
            bgView.backgroundColor = .systemRed
        }
    }
}
