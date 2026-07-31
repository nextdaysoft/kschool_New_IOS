//
//  SubscriptionVC.swift
//  New
//
//  Created by Koshal Singh on 21/04/26.
//

import UIKit
import StoreKit

class SubscriptionVC: BaseViewController {
 
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restorePurchaseTapBtn: UIButton!
    
    @IBOutlet weak var monthlyBtn: UIButton!
    @IBOutlet weak var quarterlyBtn: UIButton!
    @IBOutlet weak var yearlyBtn: UIButton!
    
    @IBOutlet weak var termsBtn: UIButton!
    @IBOutlet weak var privacyBtn: UIButton!
    @IBOutlet weak var subscriptionInfoBtn: UIButton!
    
    
    var isPurchasing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        monthlyBtn.isEnabled = false
        quarterlyBtn.isEnabled = false
        yearlyBtn.isEnabled = false
        restorePurchaseTapBtn.isEnabled = false

        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()
        viewBG3.layer.borderColor = UIColor.black.cgColor

        viewBG4.layer.cornerRadius = 10
        viewBG4.backgroundColor = ColorManager.randomColor()
        viewBG4.layer.borderColor = UIColor.black.cgColor

        viewBG5.layer.cornerRadius = 10
        viewBG5.backgroundColor = ColorManager.randomColor()
        viewBG5.layer.borderColor = UIColor.black.cgColor
        
        viewBG6.layer.cornerRadius = 10
        viewBG6.backgroundColor = ColorManager.randomColor()
        viewBG6.layer.borderColor = UIColor.black.cgColor
        
        viewBG7.layer.cornerRadius = 10
        viewBG7.backgroundColor = ColorManager.randomColor()
        viewBG7.layer.borderColor = UIColor.black.cgColor
        
        SubscriptionManager.shared.fetchProducts {

            DispatchQueue.main.async {

                print("Products Loaded")

                for product in SubscriptionManager.shared.products {

                    print(product.id)
                    print(product.displayName)
                    print(product.displayPrice)
                }

                self.monthlyBtn.isEnabled = true
                self.quarterlyBtn.isEnabled = true
                self.yearlyBtn.isEnabled = true
                self.restorePurchaseTapBtn.isEnabled = true
            }
        }
        
//        let infoLabel = UILabel()
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
//        infoLabel.numberOfLines = 0
//        infoLabel.textAlignment = .center
//        infoLabel.font = UIFont.systemFont(ofSize: 13)
//
//        infoLabel.text = """
//        Premium Membership Benefits
//
//        • Access all educational courses
//        • Premium learning content
//        • Unlimited practice tests and quizzes
//        • Ad-free learning experience
//
//        Subscription automatically renews unless cancelled at least 24 hours before the end of the current period.
//        """
//
//        view.addSubview(infoLabel)
//
//        NSLayoutConstraint.activate([
//            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            infoLabel.bottomAnchor.constraint(equalTo: termsBtn.topAnchor, constant: -15)
//        ])
    }
 

    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        guard !SubscriptionManager.shared.products.isEmpty else {

            let alert = UIAlertController(
                title: "Please Wait",
                message: "Subscription products are loading.",
                preferredStyle: .alert
            )

            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default
                )
            )

            present(alert, animated: true)
            return
        }

        guard !isPurchasing else { return }

        isPurchasing = true
        sender.isEnabled = false

        guard let product = SubscriptionManager.shared.products.first(
            where: { $0.id == "com.kschool.monthly" }
        ) else {

            isPurchasing = false
            sender.isEnabled = true

            let alert = UIAlertController(
                title: "Error",
                message: "Monthly subscription not found.",
                preferredStyle: .alert
            )

            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default
                )
            )

            present(alert, animated: true)
            return
        }

        SubscriptionManager.shared.purchase(product: product) { success in

            DispatchQueue.main.async {

                self.isPurchasing = false
                sender.isEnabled = true

                if success {

                    UserDefaults.standard.set(
                        true,
                        forKey: "showSubscriptionToast"
                    )

                    let storyboard = UIStoryboard(
                        name: "Main",
                        bundle: nil
                    )

                    let homeVC = storyboard.instantiateViewController(
                        withIdentifier: "HomeScreen"
                    ) as! HomeScreen

                    self.navigationController?.setViewControllers(
                        [homeVC],
                        animated: true
                    )

                } else {

                    let alert = UIAlertController(
                        title: "Purchase Failed",
                        message: "Please try again.",
                        preferredStyle: .alert
                    )

                    alert.addAction(
                        UIAlertAction(
                            title: "OK",
                            style: .default
                        )
                    )

                    self.present(alert, animated: true)
                }
            }
        }
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard !SubscriptionManager.shared.products.isEmpty else {

            let alert = UIAlertController(
                title: "Please Wait",
                message: "Subscription products are loading.",
                preferredStyle: .alert
            )

            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)

            return
        }

        guard !isPurchasing else { return }

        isPurchasing = true
        sender.isEnabled = false

        if let product = SubscriptionManager.shared.products.first(
            where: {$0.id == "com.kschool.quarterly"}) {

            SubscriptionManager.shared.purchase(product: product) { success in

                self.isPurchasing = false
                sender.isEnabled = true

                if success {

                    UserDefaults.standard.set(
                        true,
                        forKey: "showSubscriptionToast"
                    )

                    let storyboard = UIStoryboard(
                        name: "Main",
                        bundle: nil
                    )

                    let homeVC = storyboard.instantiateViewController(
                        withIdentifier: "HomeScreen"
                    ) as! HomeScreen

                    self.navigationController?.setViewControllers(
                        [homeVC],
                        animated: true
                    )
                }
            }
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard !SubscriptionManager.shared.products.isEmpty else {

            let alert = UIAlertController(
                title: "Please Wait",
                message: "Subscription products are loading.",
                preferredStyle: .alert
            )

            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)

            return
        }

        guard !isPurchasing else { return }

        isPurchasing = true
        sender.isEnabled = false

        if let product = SubscriptionManager.shared.products.first(
            where: {$0.id == "com.kschool.yearly"}) {

            SubscriptionManager.shared.purchase(product: product) { success in

                self.isPurchasing = false
                sender.isEnabled = true

                if success {

                    UserDefaults.standard.set(
                        true,
                        forKey: "showSubscriptionToast"
                    )

                    let storyboard = UIStoryboard(
                        name: "Main",
                        bundle: nil
                    )

                    let homeVC = storyboard.instantiateViewController(
                        withIdentifier: "HomeScreen"
                    ) as! HomeScreen

                    self.navigationController?.setViewControllers(
                        [homeVC],
                        animated: true
                    )
                }
            }
        }
    }

    
    @IBAction func restorePurchaseBtn(_ sender: UIButton) {
        
        Task {
            do {
                try await AppStore.sync()

                let alert = UIAlertController(

                    title: "Success",
                    message: "Purchases Restored",
                    preferredStyle: .alert
                )

                alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: .default
                    )
                )
                self.present(alert, animated: true)
            } catch {
                print(error)
            }

        }
    }
    
    @IBAction func termsBtnAction(_ sender: UIButton) {
        if let url = URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/") {
            UIApplication.shared.open(url)
        }
    }

    @IBAction func privacyBtnAction(_ sender: UIButton) {
        if let url = URL(string: "https://sites.google.com/view/kschool-privacy-policy/home") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func subscriptionInfoAction(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Subscription Details",
            message: """
            Premium Features:

            • Unlock all learning games
            • Access premium kids activities
            • Ad-free experience
            • Access to future premium content updates

            Auto-renewable subscription.
            Subscription automatically renews unless cancelled at least 24 hours before the end of the current period.
            """,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

}


