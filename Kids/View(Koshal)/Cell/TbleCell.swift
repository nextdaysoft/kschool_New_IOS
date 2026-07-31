//
//  TbleCell.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 16/12/25.
//

import UIKit

class TbleCell: UITableViewCell {
    @IBOutlet weak var lblleft: UILabel!
    @IBOutlet weak var lblright: UILabel!
    @IBOutlet weak var lblanswer: UILabel!
    @IBOutlet weak var correctAnswerlbl: UILabel!
//    @IBOutlet weak var rightview: UIView!
    @IBOutlet weak var answerview: UIView!
    
  
    
    
    var correctAnswer: Int = 0
    var onAnswerDropped: ((Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        answerview.backgroundColor = ColorManager.randomColor()
        answerview.layer.cornerRadius = 10
        lblanswer.isUserInteractionEnabled = true
        lblanswer.clipsToBounds = true
        let drop = UIDropInteraction(delegate: self)
        lblanswer.addInteraction(drop)
        correctAnswerlbl.isHidden = true
        correctAnswerlbl.font = .systemFont(ofSize: 21, weight: .medium)

    }
    // MARK: Function
    func configure(item: TableItem) {

        lblleft.text = "\(item.table)"
        lblright.text = "\(item.multiplier)"

        correctAnswer = item.answer

        lblanswer.text = ""

        // ✅ RESET UI
        lblanswer.textColor = .black

        correctAnswerlbl.text = ""
        correctAnswerlbl.isHidden = true

        // ✅ RANDOM COLOR
        answerview.backgroundColor = ColorManager.randomColor()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
