//
//  GridItemView.swift
//  KSchool
//
//  Created by Koshal Singh on 21/03/26.
//

import Foundation
import UIKit

class GridItemView: UIView {

    let label = UILabel()
    let imageView = UIImageView()
    let monkeyOverlay = UIImageView()
    var value: String = ""   // hidden word / letter
    var isBanana: Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .white
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.black.cgColor

        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        monkeyOverlay.translatesAutoresizingMaskIntoConstraints = false

        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)

        imageView.contentMode = .scaleAspectFit
        monkeyOverlay.contentMode = .scaleAspectFit
        monkeyOverlay.isHidden = true

        addSubview(label)
        addSubview(imageView)
        addSubview(monkeyOverlay)

        NSLayoutConstraint.activate([
            // label
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),

            // banana / monkey base image
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),

            // ✅ monkey overlay FULL SIZE (same as banana)
            monkeyOverlay.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            monkeyOverlay.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            monkeyOverlay.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            monkeyOverlay.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }

    func configure(with text: String, monkey: String, banana: String) {
        value = text

        if text == "🍌" {
            isBanana = true   // ✅ ADD THIS

            imageView.image = UIImage(named: banana)
            imageView.isHidden = false
            monkeyOverlay.isHidden = true

            value = "A"
            label.text = "A"
            label.alpha = 1
        }
        else if text == "🐵" {
            isBanana = false

            imageView.image = UIImage(named: monkey)
            imageView.isHidden = false
            monkeyOverlay.isHidden = true

            value = "E"
            label.text = "E"
            label.alpha = 1
        }
        else {
            isBanana = false

            label.text = text
            label.alpha = 1
            imageView.isHidden = true
            monkeyOverlay.isHidden = true
        }
    }
}
