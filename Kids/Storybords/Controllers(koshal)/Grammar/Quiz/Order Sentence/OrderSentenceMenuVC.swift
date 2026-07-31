//
//  OrderSentenceMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//

import UIKit

class OrderSentenceMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
 
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
   
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
   
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var didTapLockedLevel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        applyTheme()
        setupForRestBtn()
        
        view1.layer.borderColor = UIColor.black.cgColor
        view1.layer.borderWidth = 1
        view1.layer.cornerRadius = 20
        view1.clipsToBounds = true

        view2.layer.borderColor = UIColor.black.cgColor
        view2.layer.borderWidth = 1
        view2.layer.cornerRadius = 20
        view2.clipsToBounds = true

        view3.layer.borderColor = UIColor.black.cgColor
        view3.layer.borderWidth = 1
        view3.layer.cornerRadius = 20
        view3.clipsToBounds = true

        
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
        
        if UserDefaults.standard.bool(forKey: "orderSentenceLevel1Completed") {
            image1.image = UIImage(named: "done")
            image1.isHidden = false
        } else {
            image1.isHidden = true
        }

        if UserDefaults.standard.object(forKey: "orderSentenceLevel1Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "orderSentenceLevel1Percentage")
            label1.text = "\(percent)%"
            label1.isHidden = false
        } else {
            label1.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "orderSentenceLevel2Completed") {
            image2.image = UIImage(named: "done")
            image2.isHidden = false
        } else {
            image2.isHidden = true
        }

        if UserDefaults.standard.object(forKey: "orderSentenceLevel2Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "orderSentenceLevel2Percentage")
            label2.text = "\(percent)%"
            label2.isHidden = false
        } else {
            label2.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "orderSentenceLevel3Completed") {
            image3.image = UIImage(named: "done")
            image3.isHidden = false
        } else {
            image3.isHidden = true
        }

        if UserDefaults.standard.object(forKey: "orderSentenceLevel3Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "orderSentenceLevel3Percentage")
            label3.text = "\(percent)%"
            label3.isHidden = false
        } else {
            label3.isHidden = true
        }
        
        updateResetVisibility()
        setupSubscriptionLock()
    }
 
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
    }
    
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            viewBG1.backgroundColor = .white
            viewBG2.backgroundColor = .white
            viewBG3.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
        }
    }
    
    
    func setupForRestBtn() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        
        
        let img = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: config)
        
        restBtn.setImage(img, for: .normal)
        
        restBtn.tintColor = UIColor(
            red: 0.17,
            green: 0.21,
            blue: 0.33,
            alpha: 1
        )
        
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }

    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "orderSentenceLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "orderSentenceLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "orderSentenceLevel3Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
    }
    
    func setupSubscriptionLock() {

        let subscribed =
        SubscriptionManager.shared.isSubscribed()

        let lockImage =
        UIImage(named: "lock")

        let levels: [(UIImageView, UIView, UILabel, Int)] = [

            (image2, viewBG2, label2, 2),
            (image3, viewBG3, label3, 3)
        ]

        for (image,bg,label,level) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey:
                "orderSentenceLevel\(level)Completed"
            )

            if completed {

                // done image highest priority
                image.image =
                UIImage(named:"done")

                image.isHidden = false

                let percent =
                UserDefaults.standard.integer(
                    forKey:
                    "orderSentenceLevel\(level)Percentage"
                )

                label.text = "\(percent)%"
                label.isHidden = false

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {

                    bg.backgroundColor = completed
                        ? .white
                        : .systemGray4

                } else {

                    bg.backgroundColor = completed
                        ? ColorManager.randomColor()
                        : (subscribed ? ColorManager.randomColor() : .systemGray4)
                }

            } else {

                image.image =
                subscribed ? nil : lockImage

                image.isHidden =
                subscribed

                label.text = ""
                label.isHidden = true

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {

                    bg.backgroundColor = completed
                        ? .white
                        : .systemGray4

                } else {

                    bg.backgroundColor = completed
                        ? ColorManager.randomColor()
                        : (subscribed ? ColorManager.randomColor() : .systemGray4)
                }
            }
        }
    }
    
    
    func checkSubscription() -> Bool {

        if SubscriptionManager.shared.isSubscribed() {
            return true
        }

        goToSubscription()
        return false
    }

    func goToSubscription() {

        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier: "SubscriptionVC"
        ) as! SubscriptionVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "OrderSentenceLevel1VC"
        ) as! OrderSentenceLevel1VC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "OrderSentenceLevel2VC"
        ) as? OrderSentenceLevel2VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "OrderSentenceLevel3VC"
        ) as? OrderSentenceLevel3VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
   
  
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...3 {

            defaults.set(
                false,
                forKey: "orderSentenceLevel\(i)Completed"
            )

            defaults.removeObject(
                forKey: "orderSentenceLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        // clear UI
        for image in [image1, image2, image3] {
            image?.image = nil
            image?.isHidden = true
        }

        for label in [label1, label2, label3] {
            label?.text = ""
            label?.isHidden = true
        }

        // 🔥 lock restore
        setupSubscriptionLock()

        updateResetVisibility()
    }
    
}
