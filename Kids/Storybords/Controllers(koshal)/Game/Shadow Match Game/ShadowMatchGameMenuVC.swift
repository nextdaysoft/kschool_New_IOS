//
//  ShadowMatchGameMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 19/01/26.
//

import UIKit

class ShadowMatchGameMenuVC: BaseViewController {

    @IBOutlet weak var levelLabel1: UILabel!
    @IBOutlet weak var levelLabel2: UILabel!
    @IBOutlet weak var levelLabel3: UILabel!
    @IBOutlet weak var levelLabel4: UILabel!
    @IBOutlet weak var levelLabel5: UILabel!
    @IBOutlet weak var levelLabel6: UILabel!
     
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
   
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var receivedPercentage1: Int?
    var receivedPercentage2: Int?
    var receivedPercentage3: Int?
    var receivedPercentage4: Int?
    var receivedPercentage5: Int?
    var receivedPercentage6: Int?
     
    var receivedImage1: UIImage?
    var receivedImage2: UIImage?
    var receivedImage3: UIImage?
    var receivedImage4: UIImage?
    var receivedImage5: UIImage?
    var receivedImage6: UIImage?
  
    var didTapLockedLevel = false
    
     override func viewDidLoad() {
         super.viewDidLoad()
        
         setup()
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
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "shadowMatchLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "shadowMatchLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "shadowMatchLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "shadowMatchLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "shadowMatchLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "shadowMatchLevel6Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        // Free levels
        updateLevelUI(level: 1, imageView: imageView1, label: levelLabel1)
        updateLevelUI(level: 2, imageView: imageView2, label: levelLabel2)

        // Subscription levels
        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lockImage = UIImage(named: "lock")

        let levels: [(Int, UIImageView, UILabel)] = [
            (3, imageView3, levelLabel3),
            (4, imageView4, levelLabel4),
            (5, imageView5, levelLabel5),
            (6, imageView6, levelLabel6)
        ]

        for (level, imageView, label) in levels {

            let completed = UserDefaults.standard.bool(
                forKey: "shadowMatchLevel\(level)Completed"
            )

            let percentage = UserDefaults.standard.integer(
                forKey: "shadowMatchLevel\(level)Percentage"
            )

            if completed {

                imageView.image = UIImage(named: "done")
                label.text = "\(percentage)%"

            } else {

                imageView.image = subscribed ? nil : lockImage
                label.text = ""
            }
        }
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "shadowMatchLevel\(level)Completed"
        let percentageKey = "shadowMatchLevel\(level)Percentage"

        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: percentageKey)
            label.text = "\(percentage)%"
        } else {
            imageView.image = nil
            label.text = ""
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
    
    
    func setLabel(_ label: UILabel, value: Int?) {
        if let value = value {
            label.text = "\(value)%"
            label.isHidden = false
        } else {
            label.text = ""
            label.isHidden = true
        }
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
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lockImage = UIImage(named: "lock")

        let levels: [(Int, UIImageView, UIView)] = [
            (3, imageView3, viewBG3),
            (4, imageView4, viewBG4),
            (5, imageView5, viewBG5),
            (6, imageView6, viewBG6)
        ]

        for (level, imageView, bgView) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "shadowMatchLevel\(level)Completed"
            )

            if completed {

                imageView.image = UIImage(named: "done")
                bgView.backgroundColor =
                ColorManager.randomColor()

            } else {

                imageView.image =
                subscribed ? nil : lockImage

                bgView.backgroundColor =
                subscribed
                ? ColorManager.randomColor()
                : .systemGray4
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
    
     @IBAction func levelTapBtn1(_ sender: UIButton) {

         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         if let vc = storyboard.instantiateViewController(
             withIdentifier: "ShadowMatchGameLevel1VC"
         ) as? ShadowMatchGameLevel1VC {

             navigationController?.pushViewController(vc, animated: true)
         }
     }
     
     
     @IBAction func levelTapBtn2(_ sender: UIButton) {

         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         if let vc = storyboard.instantiateViewController(
             withIdentifier: "ShadowMatchGameLevel2VC"
         ) as? ShadowMatchGameLevel2VC {

             navigationController?.pushViewController(vc, animated: true)
         }
     }
     
     
    @IBAction func levelTapBtn3(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "ShadowMatchGameLevel3VC"
        ) as? ShadowMatchGameLevel3VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func levelTapBtn4(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "ShadowMatchGameLevel4VC"
        ) as? ShadowMatchGameLevel4VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func levelTapBtn5(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "ShadowMatchGameLevel5VC"
        ) as? ShadowMatchGameLevel5VC {

                navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func levelTapBtn6(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "ShadowMatchGameLevel6VC"
        ) as? ShadowMatchGameLevel6VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
     

    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...6 {
            defaults.removeObject(forKey: "shadowMatchLevel\(i)Completed")
            defaults.removeObject(forKey: "shadowMatchLevel\(i)Percentage")
        }

        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
 }
