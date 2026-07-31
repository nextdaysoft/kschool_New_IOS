//
//  LetterCell.swift
//  KSchool
//
//  Created by Koshal Singh on 15/05/26.
//

import UIKit

class LetterCell: UICollectionViewCell {

    let container = UIView()
    let label = UILabel()

    override init(frame: CGRect) {

        super.init(frame: frame)

        container.layer.cornerRadius = 10
        container.layer.borderWidth = 0.3
        container.layer.borderColor = UIColor.systemPurple.cgColor

        contentView.addSubview(container)

        container.frame = contentView.bounds

        label.font = .systemFont(
            ofSize: 25,
            weight: .regular
        )
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        
        label.textAlignment = .center

        container.addSubview(label)

        label.frame = container.bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        container.frame = contentView.bounds
        label.frame = container.bounds
    }
}
