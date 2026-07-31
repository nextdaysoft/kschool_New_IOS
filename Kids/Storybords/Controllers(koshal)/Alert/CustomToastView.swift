//
//  CustomToastView.swift
//  KSchool
//
//  Created by Koshal Singh on 17/03/26.
//

import UIKit

class CustomToastView: UIView {

    private let containerView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()

    init(message: String, image: UIImage?) {
        super.init(frame: .zero)
        setupUI(message: message, image: image)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupUI(message: String, image: UIImage?) {

        // 🔥 container
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = ColorManager.randomColor()
        containerView.clipsToBounds = true
        addSubview(containerView)

        // 🔥 image
        iconImageView.image = image
        iconImageView.contentMode = .scaleAspectFit
        containerView.addSubview(iconImageView)

        // 🔥 label
        titleLabel.text = message
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        containerView.addSubview(titleLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let padding: CGFloat = 12
        
        // 🔥 IMAGE SIZE BADA (24 → 32 ya 36)
        let imageSize: CGFloat = 40

        // label size
        let labelSize = titleLabel.sizeThatFits(
            CGSize(width: CGFloat.greatestFiniteMagnitude, height: 30)
        )

        let totalWidth = padding + imageSize + 8 + labelSize.width + padding
        let height: CGFloat = 55   // 👈 thoda height bhi badha diya

        containerView.frame = CGRect(
            x: (self.frame.width - totalWidth) / 2,
            y: 0,
            width: totalWidth,
            height: height
        )

        iconImageView.frame = CGRect(
            x: padding,
            y: (height - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )

        titleLabel.frame = CGRect(
            x: iconImageView.frame.maxX + 8,
            y: 0,
            width: labelSize.width,
            height: height
        )
    }
}


extension UIViewController {

    func showCustomToast(message: String, image: UIImage?) {

        // remove old toast
        self.view.subviews
            .filter { $0 is CustomToastView }
            .forEach { $0.removeFromSuperview() }

        let toast = CustomToastView(message: message, image: image)

        let height: CGFloat = 50
        let bottomSafeArea = view.safeAreaInsets.bottom

        // ✅ FINAL POSITION (BOTTOM CENTER)
        let yPosition = view.frame.height - bottomSafeArea - 120

        toast.frame = CGRect(
            x: 0,
            y: yPosition,
            width: self.view.frame.width,
            height: height
        )

        self.view.addSubview(toast)

        // animation
        toast.alpha = 0
        toast.transform = CGAffineTransform(translationX: 0, y: 20)

        UIView.animate(withDuration: 0.3) {
            toast.alpha = 1
            toast.transform = .identity
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if toast.superview != nil {
                UIView.animate(withDuration: 0.3, animations: {
                    toast.alpha = 0
                    toast.transform = CGAffineTransform(translationX: 0, y: 20)
                }) { _ in
                    toast.removeFromSuperview()
                }
            }
        }
    }
}
