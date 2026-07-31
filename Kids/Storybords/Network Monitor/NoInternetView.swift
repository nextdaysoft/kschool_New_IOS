//
//  NoInternetView.swift
//  KSchool
//
//  Created by Koshal Singh on 06/07/26.
//

import Foundation
import UIKit

class NoInternetView: UIView {

    var retryHandler: (() -> Void)?

    private let containerView = UIView()

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "error")
        return image
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No Internet Connection"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please check your Wi-Fi or Mobile Data and try again."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try Again", for: .normal)
        button.setTitleColor(.white, for: .normal)

        // Random Color
        button.backgroundColor = ColorManager.randomColor()

        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true

        button.addTarget(self, action: #selector(retryPressed), for: .touchUpInside)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {

        backgroundColor = UIColor.black.withAlphaComponent(0.45)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 28
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        addSubview(containerView)

        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(retryButton)

        NSLayoutConstraint.activate([

            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 420),

            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            imageView.heightAnchor.constraint(equalToConstant: 180),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),

            retryButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            retryButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            retryButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            retryButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }

    @objc
    private func retryPressed() {
        retryHandler?()
    }
}
