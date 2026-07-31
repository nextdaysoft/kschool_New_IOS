//
//  AgeSelectionView.swift
//  New
//
//  Created by Koshal Singh on 21/04/26.
//

import Foundation
import UIKit

class AgeSelectionView: UIView {

    var onSelect: ((String) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {

        self.backgroundColor = .clear   // ❌ no grey overlay

        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 15

        container.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(container)

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        let btn1 = createOption(title: "1 - 6 yrs")
        let btn2 = createOption(title: "7 - 12 yrs")

        let stack = UIStackView(arrangedSubviews: [btn1, btn2])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
        ])
    }

    private func createOption(title: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        
        btn.backgroundColor = .white   // ✅ no grey
        btn.layer.cornerRadius = 10
        
        btn.contentHorizontalAlignment = .left   // ✅ left align
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)

        btn.heightAnchor.constraint(equalToConstant: 45).isActive = true

        btn.addTarget(self, action: #selector(selectAge(_:)), for: .touchUpInside)
        return btn
    }

    @objc func selectAge(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        onSelect?(text)
        self.removeFromSuperview()
    }
}
