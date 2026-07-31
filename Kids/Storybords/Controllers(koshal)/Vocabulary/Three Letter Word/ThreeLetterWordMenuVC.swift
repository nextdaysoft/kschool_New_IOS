//
//  ThreeLetterWordMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 03/02/26.
//

import UIKit

class ThreeLetterWordMenuVC: BaseViewController {

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

        let levels:[(UIImageView,UIView,UILabel,Int)] = [

            (image2,viewBG2,label2,2),
            (image3,viewBG3,label3,3)
        ]

        for (image,bg,label,level) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey:
                "threeLetterWordLevel\(level)Completed"
            )

            if completed {

                // done > lock
                image.image =
                UIImage(named:"done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey:
                    "threeLetterWordLevel\(level)Percentage"
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
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            viewBG1.backgroundColor = .white

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "threeLetterWordLevel2Completed") {
                viewBG2.backgroundColor = .white
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "threeLetterWordLevel3Completed") {
                viewBG3.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "threeLetterWordLevel2Completed") {
                viewBG2.backgroundColor = ColorManager.randomColor()
            }

            if SubscriptionManager.shared.isSubscribed() ||
                UserDefaults.standard.bool(forKey: "threeLetterWordLevel3Completed") {
                viewBG3.backgroundColor = ColorManager.randomColor()
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

        if (level == 2 || level == 3),
           !SubscriptionManager.shared.isSubscribed() {
            return
        }

        let completedKey = "threeLetterWordLevel\(level)Completed"
        let percentageKey = "threeLetterWordLevel\(level)Percentage"

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
        UserDefaults.standard.bool(forKey: "threeLetterWordLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "threeLetterWordLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "threeLetterWordLevel3Completed")
        
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

    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "ThreeLetterWordLevel1VC"
        ) as? ThreeLetterWordLevel1VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

     //   guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "ThreeLetterWordLevel2VC"
        ) as? ThreeLetterWordLevel2VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

      //  guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "ThreeLetterWordLevel3VC"
        ) as? ThreeLetterWordLevel3VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        for i in 1...3 {
            defaults.removeObject(forKey: "threeLetterWordLevel\(i)Completed")
        }
        
        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
  
}

