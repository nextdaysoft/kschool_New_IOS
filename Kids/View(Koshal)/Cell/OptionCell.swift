//
//  OptionCell.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 20/12/25.
//
import UIKit

class OptionCell: UICollectionViewCell {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 12
    }

    func configure(number: Int) {
        lblNumber.text = "\(number)"
    }
    func configureLetter(text: String){
        lblNumber.text = text
    }

    func showCorrect() {
           bgView.backgroundColor = .systemGreen
       }

       func showWrong() {
           bgView.backgroundColor = .systemRed
       }
}
