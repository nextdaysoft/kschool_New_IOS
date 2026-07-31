//
//  PickTheCorrectSpellingMenuVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 26/12/25.
//

import UIKit

class PickTheCorrectSpellingMenuVC: BaseViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    @IBOutlet weak var viewBG9: UIView!
    @IBOutlet weak var viewBG10: UIView!
  
    
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

        view4.layer.borderColor = UIColor.black.cgColor
        view4.layer.borderWidth = 1
        view4.layer.cornerRadius = 20
        view4.clipsToBounds = true

        view5.layer.borderColor = UIColor.black.cgColor
        view5.layer.borderWidth = 1
        view5.layer.cornerRadius = 20
        view5.clipsToBounds = true

        view6.layer.borderColor = UIColor.black.cgColor
        view6.layer.borderWidth = 1
        view6.layer.cornerRadius = 20
        view6.clipsToBounds = true

        view7.layer.borderColor = UIColor.black.cgColor
        view7.layer.borderWidth = 1
        view7.layer.cornerRadius = 20
        view7.clipsToBounds = true

        view8.layer.borderColor = UIColor.black.cgColor
        view8.layer.borderWidth = 1
        view8.layer.cornerRadius = 20
        view8.clipsToBounds = true

        view9.layer.borderColor = UIColor.black.cgColor
        view9.layer.borderWidth = 1
        view9.layer.cornerRadius = 20
        view9.clipsToBounds = true

        view10.layer.borderColor = UIColor.black.cgColor
        view10.layer.borderWidth = 1
        view10.layer.cornerRadius = 20
        view10.clipsToBounds = true
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10
        viewBG7.layer.cornerRadius = 10
        viewBG8.layer.cornerRadius = 10
        viewBG9.layer.cornerRadius = 10
        viewBG10.layer.cornerRadius = 10
        
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

            (image3, viewBG3, label3, 3),
            (image4, viewBG4, label4, 4),
            (image5, viewBG5, label5, 5),
            (image6, viewBG6, label6, 6),
            (image7, viewBG7, label7, 7),
            (image8, viewBG8, label8, 8),
            (image9, viewBG9, label9, 9),
            (image10, viewBG10, label10, 10)
        ]

        for (image,bg,label,level) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey:
                "pickCorrectSpellingLevel\(level)Completed"
            )

            if completed {

                // done > lock
                image.image =
                UIImage(named:"done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey:
                    "pickCorrectSpellingLevel\(level)Percentage"
                )

                label.text =
                "\(percentage)%"

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                    bg.backgroundColor = .white
                } else {
                    bg.backgroundColor = ColorManager.randomColor()
                }

            } else {

                image.image =
                subscribed
                ? nil
                : lockImage

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
    
    
    func updateLevelUI(level: Int,
                       imageView: UIImageView,
                       label: UILabel) {

        if level >= 3 &&
            !SubscriptionManager.shared.isSubscribed() {
            return
        }

        let completedKey = "pickCorrectSpellingLevel\(level)Completed"
        let percentageKey = "pickCorrectSpellingLevel\(level)Percentage"

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
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel8Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel9Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel10Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
        updateLevelUI(level: 5, imageView: image5, label: label5)
        updateLevelUI(level: 6, imageView: image6, label: label6)
        updateLevelUI(level: 7, imageView: image7, label: label7)
        updateLevelUI(level: 8, imageView: image8, label: label8)
        updateLevelUI(level: 9, imageView: image9, label: label9)
        updateLevelUI(level: 10, imageView: image10, label: label10)
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
            viewBG2.backgroundColor = .white

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel3Completed") {
                viewBG3.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel4Completed") {
                viewBG4.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel5Completed") {
                viewBG5.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel6Completed") {
                viewBG6.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel7Completed") {
                viewBG7.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel8Completed") {
                viewBG8.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel9Completed") {
                viewBG9.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel10Completed") {
                viewBG10.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel3Completed") {
                viewBG3.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel4Completed") {
                viewBG4.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel5Completed") {
                viewBG5.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel6Completed") {
                viewBG6.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel7Completed") {
                viewBG7.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel8Completed") {
                viewBG8.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel9Completed") {
                viewBG9.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel10Completed") {
                viewBG10.backgroundColor = ColorManager.randomColor()
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
            withIdentifier: "PickTheCorrectSpellingLevel1VC"
        ) as? PickTheCorrectSpellingLevel1VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel2VC"
        ) as? PickTheCorrectSpellingLevel2VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel3VC"
        ) as? PickTheCorrectSpellingLevel3VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel4VC"
        ) as? PickTheCorrectSpellingLevel4VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel5VC"
        ) as? PickTheCorrectSpellingLevel5VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel6VC"
        ) as? PickTheCorrectSpellingLevel6VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel7VC"
        ) as? PickTheCorrectSpellingLevel7VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel8VC"
        ) as? PickTheCorrectSpellingLevel8VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel9VC"
        ) as? PickTheCorrectSpellingLevel9VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level10TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingLevel10VC"
        ) as? PickTheCorrectSpellingLevel10VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        for i in 1...10 {
            defaults.removeObject(forKey: "pickCorrectSpellingLevel\(i)Completed")
        }
        
        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
