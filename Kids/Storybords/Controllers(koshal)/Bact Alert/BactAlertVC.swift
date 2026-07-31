////
////  BactAlertVC.swift
////  Kids
////
////  Created by Koshal Singh on 29/01/26.
////
//
//import UIKit
//
//class BactAlertVC: UIViewController {
//
//    @IBOutlet weak var bgView: UIView!
//    @IBOutlet weak var noBtn: UIButton!
//    @IBOutlet weak var yesBtn: UIButton!
//
//    var onYes: (() -> Void)?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
//
//        // 🔥 Rounded top corners only
//        bgView.layer.cornerRadius = 20
//        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        bgView.clipsToBounds = true
//
//        noBtn.layer.cornerRadius = 10
//        noBtn.backgroundColor = ColorManager.randomColor()
//        noBtn.layer.borderColor = UIColor.black.cgColor
//        
//        
//        yesBtn.layer.cornerRadius = 10
//        yesBtn.backgroundColor = ColorManager.randomColor()
//        yesBtn.layer.borderColor = UIColor.black.cgColor
//      
//        
//        addBackgroundTap()
//        addPanGesture()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        animateIn()
//    }
//
//    // MARK: - Animations
//
//    private func animateIn() {
//        bgView.transform = CGAffineTransform(translationX: 0, y: bgView.frame.height)
//
//        UIView.animate(withDuration: 0.3,
//                       delay: 0,
//                       usingSpringWithDamping: 0.9,
//                       initialSpringVelocity: 0.5) {
//            self.bgView.transform = .identity
//        }
//    }
//
//    private func animateOut(completion: (() -> Void)? = nil) {
//        UIView.animate(withDuration: 0.25, animations: {
//            self.bgView.transform = CGAffineTransform(
//                translationX: 0,
//                y: self.bgView.frame.height
//            )
//            self.view.alpha = 0
//        }) { _ in
//            self.dismiss(animated: false)
//            completion?()
//        }
//    }
//
//    // MARK: - Background tap
//
//    private func addBackgroundTap() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(bgTapped))
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc private func bgTapped() {
//        animateOut()
//    }
//
//    // MARK: - Drag gesture
//
//    private func addPanGesture() {
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//        bgView.addGestureRecognizer(pan)
//    }
//
//    @objc private func handlePan(_ pan: UIPanGestureRecognizer) {
//        let translation = pan.translation(in: view)
//
//        if translation.y > 0 {
//            bgView.transform = CGAffineTransform(translationX: 0, y: translation.y)
//        }
//
//        if pan.state == .ended {
//            if translation.y > 120 {
//                animateOut()
//            } else {
//                UIView.animate(withDuration: 0.2) {
//                    self.bgView.transform = .identity
//                }
//            }
//        }
//    }
//
//    // MARK: - Actions
//
//    @IBAction func noTapBtn(_ sender: UIButton) {
//        animateOut()
//    }
//
//    @IBAction func yesTapBtn(_ sender: UIButton) {
//        animateOut {
//            self.onYes?()
//        }
//    }
//}
