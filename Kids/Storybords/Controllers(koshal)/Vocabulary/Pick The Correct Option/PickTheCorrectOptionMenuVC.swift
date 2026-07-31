//
//  PickTheCorrectOptionMenuVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 26/12/25.
//

import UIKit

class PickTheCorrectOptionMenuVC: BaseViewController {
    
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
    
    var level1Completed = false
    var level2Completed = false
    var level3Completed = false

    
    var receivedPercentage1: Int?
    var receivedPercentage2: Int?
    var receivedPercentage3: Int?
    
    var receivedImage1: UIImage?
    var receivedImage2: UIImage?
    var receivedImage3: UIImage?
    
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

        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
        applyTheme()
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
                "pickCorrectOptionLevel\(level)Completed"
            )

            if completed {

                // done highest priority
                image.image =
                UIImage(named:"done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey:
                    "pickCorrectOptionLevel\(level)Percentage"
                )

                label.text = "\(percentage)%"

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                    bg.backgroundColor = .white
                } else {
                    bg.backgroundColor = ColorManager.randomColor()
                }

            } else {

                image.image =
                subscribed ? nil : lockImage

                label.text = ""

                if subscribed {

                    if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                        bg.backgroundColor = .white
                    } else {
                        bg.backgroundColor = ColorManager.randomColor()
                    }

                } else {

                    bg.backgroundColor = .systemGray4
                }
            }
        }
    }
    
    func updateLevelUI(level: Int,
                       imageView: UIImageView,
                       label: UILabel) {

        // level 2 & 3 locked state
        if (level == 2 || level == 3),
           !SubscriptionManager.shared.isSubscribed() {

            return
        }

        let completedKey = "pickCorrectOptionLevel\(level)Completed"
        let percentageKey = "pickCorrectOptionLevel\(level)Percentage"

        if UserDefaults.standard.bool(forKey: completedKey) {

            imageView.image = UIImage(named: "done")

            let percentage =
            UserDefaults.standard.integer(
                forKey: percentageKey
            )

            label.text = "\(percentage)%"

        } else {

            imageView.image = nil
            label.text = ""
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
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "pickCorrectOptionLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectOptionLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectOptionLevel3Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
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

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectOptionLevel2Completed") {
                viewBG2.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectOptionLevel3Completed") {
                viewBG3.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectOptionLevel2Completed") {
                viewBG2.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectOptionLevel3Completed") {
                viewBG3.backgroundColor = ColorManager.randomColor()
            }
        }
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectOptionLevel1VC"
        ) as? PickTheCorrectOptionLevel1VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

      guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectOptionLevel2VC"
        ) as? PickTheCorrectOptionLevel2VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

       guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectOptionLevel3VC"
        ) as? PickTheCorrectOptionLevel3VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        for i in 1...3 {
            defaults.removeObject(forKey: "pickCorrectOptionLevel\(i)Completed")
        }
        
        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
  
}
