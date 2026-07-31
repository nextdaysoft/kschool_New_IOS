//
//  MatchTheImageWithLetterMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 20/01/26.
//

import UIKit

class MatchTheImageWithLetterMenuVC: BaseViewController {

    @IBOutlet weak var leveLabel1: UILabel!
    @IBOutlet weak var leveLabel2: UILabel!
    @IBOutlet weak var leveLabel3: UILabel!
    @IBOutlet weak var leveLabel4: UILabel!
    @IBOutlet weak var leveLabel5: UILabel!
    @IBOutlet weak var leveLabel6: UILabel!
    
    
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
    
    
    @IBOutlet weak var imageHeightConstraint1: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint2: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint3: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint4: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint5: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint6: NSLayoutConstraint!
 
    
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
        applyTheme()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "matchImageLetterLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "matchImageLetterLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "matchImageLetterLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "matchImageLetterLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "matchImageLetterLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "matchImageLetterLevel6Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: imageView1, label: leveLabel1)
        updateLevelUI(level: 2, imageView: imageView2, label: leveLabel2)
        updateLevelUI(level: 3, imageView: imageView3, label: leveLabel3)
        updateLevelUI(level: 4, imageView: imageView4, label: leveLabel4)
        updateLevelUI(level: 5, imageView: imageView5, label: leveLabel5)
        updateLevelUI(level: 6, imageView: imageView6, label: leveLabel6)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "matchImageLetterLevel\(level)Completed"
        let percentageKey = "matchImageLetterLevel\(level)Percentage"

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

            let bgViews = [
                viewBG1,
                viewBG2,
                viewBG3,
                viewBG4,
                viewBG5,
                viewBG6
            ]

            bgViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            let bgViews = [
                viewBG1,
                viewBG2,
                viewBG3,
                viewBG4,
                viewBG5,
                viewBG6
            ]

            bgViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }

        // Premium levels (3–6) की UI maintain रहेगी
        setupSubscriptionLock()
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

    func setupSubscriptionLock() {

        let subscribed =
        SubscriptionManager.shared.isSubscribed()

        let lockImage =
        UIImage(named: "lock")

        let levels:[(UIImageView,UIView,UILabel,Int)] = [

            (imageView3,viewBG3,leveLabel3,3),
            (imageView4,viewBG4,leveLabel4,4),
            (imageView5,viewBG5,leveLabel5,5),
            (imageView6,viewBG6,leveLabel6,6)
        ]

        for (image,bg,label,level) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey:
                "matchImageLetterLevel\(level)Completed"
            )

            if completed {

                // done highest priority
                image.image =
                UIImage(named:"done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey:
                    "matchImageLetterLevel\(level)Percentage"
                )

                label.text =
                "\(percentage)%"

                bg.backgroundColor =
                       UserDefaults.standard.bool(forKey: "WhiteTheme")
                       ? .white
                       : ColorManager.randomColor()

            } else {

                image.image =
                subscribed
                ? nil
                : lockImage

                label.text = ""

                bg.backgroundColor =
                       subscribed
                       ? (UserDefaults.standard.bool(forKey: "WhiteTheme")
                          ? .white
                          : ColorManager.randomColor())
                       : .systemGray4
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
            withIdentifier: "MatchImageWithLetterLevel1VC"
        ) as? MatchImageWithLetterLevel1VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchImageWithLetterLevel2VC"
        ) as? MatchImageWithLetterLevel2VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchImageWithLetterLevel3VC"
        ) as? MatchImageWithLetterLevel3VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchImageWithLetterLevel4VC"
        ) as? MatchImageWithLetterLevel4VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchImageWithLetterLevel5VC"
        ) as? MatchImageWithLetterLevel5VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchImageWithLetterLevel6VC"
        ) as? MatchImageWithLetterLevel6VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...6 {

            defaults.removeObject(
                forKey: "matchImageLetterLevel\(i)Completed"
            )

            defaults.removeObject(
                forKey: "matchImageLetterLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        updateLevelImages()

        // ✅ lock image restore
        setupSubscriptionLock()

        updateResetVisibility()
    }
   
}
