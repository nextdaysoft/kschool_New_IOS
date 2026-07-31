//
//  PatternRepeatMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 13/04/26.
//

import UIKit

class PatternRepeatMenuVC: BaseViewController {
    
    @IBOutlet weak var leveLabel1: UILabel!
    @IBOutlet weak var leveLabel2: UILabel!
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
  
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
   
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
 
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    @IBOutlet weak var imageHeightConstraint1: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var receivedPercentage1: Int?
    var receivedPercentage2: Int?
 
    var receivedImage1: UIImage?
    var receivedImage2: UIImage?
    
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
        
      
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "patternRepeatLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "patternRepeatLevel2Completed")
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: imageView1, label: leveLabel1)
        updateLevelUI(level: 2, imageView: imageView2, label: leveLabel2)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "patternRepeatLevel\(level)Completed"
        let percentageKey = "patternRepeatLevel\(level)Percentage"

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

            viewBG1.backgroundColor = .white

            if SubscriptionManager.shared.isSubscribed() {
                viewBG2.backgroundColor = .white
            } else {
                viewBG2.backgroundColor = .systemGray4
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()

            if SubscriptionManager.shared.isSubscribed() {
                viewBG2.backgroundColor = ColorManager.randomColor()
            } else {
                viewBG2.backgroundColor = .systemGray4
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

    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        let completed =
        UserDefaults.standard.bool(
            forKey: "patternRepeatLevel2Completed"
        )

        if completed {

            imageView2.image = UIImage(named: "done")

            let percentage =
            UserDefaults.standard.integer(
                forKey: "patternRepeatLevel2Percentage"
            )

            leveLabel2.text = "\(percentage)%"

            viewBG2.backgroundColor =
            UserDefaults.standard.bool(forKey: "WhiteTheme")
            ? .white
            : ColorManager.randomColor()

            return
        }

        if subscribed {

            imageView2.image = nil

            viewBG2.backgroundColor =
            UserDefaults.standard.bool(forKey: "WhiteTheme")
            ? .white
            : ColorManager.randomColor()

        } else {

            imageView2.image = UIImage(named: "lock")
            viewBG2.backgroundColor = .systemGray4
        }
    }
    

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PatternRepeat"
        ) as? PatternRepeat {

            vc.selectedLevel = 1   // ✅ VERY IMPORTANT
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PatternRepeat"
        ) as? PatternRepeat {

            vc.selectedLevel = 2
            navigationController?.pushViewController(
                vc,
                animated: true
            )
        }
    }
 
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...2 {
            defaults.removeObject(
                forKey: "patternRepeatLevel\(i)Completed"
            )

            defaults.removeObject(
                forKey: "patternRepeatLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        // done icon remove
        updateLevelImages()

        // lock image restore
        setupSubscriptionLock()

        updateResetVisibility()
    }
   
}
