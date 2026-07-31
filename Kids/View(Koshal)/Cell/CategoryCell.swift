//
//  CategoryCell.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 18/12/25.
//
import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {
            contentView.backgroundColor = .white
        } else {
            contentView.backgroundColor = ColorManager.randomColor()
        }
    }
    
    func configure(title: String, image: UIImage?) {

        titleLabel.text = title
        iconImageView.image = image

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            contentView.backgroundColor = .white

        } else {

            contentView.backgroundColor = ColorManager.randomColor()
        }
    }
}
