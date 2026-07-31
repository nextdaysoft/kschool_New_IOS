//
//  OrderShapeMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 03/06/26.
//

import UIKit

class OrderShapeMenuVC: BaseViewController {

    @IBOutlet weak var leveLabel1: UILabel!
    @IBOutlet weak var leveLabel2: UILabel!
    @IBOutlet weak var leveLabel3: UILabel!
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
  
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
   
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
 
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    @IBOutlet weak var imageHeightConstraint1: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint2: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint3: NSLayoutConstraint!
 
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var receivedPercentage1: Int?
    var receivedPercentage2: Int?
    var receivedPercentage3: Int?
 
    
    var receivedImage1: UIImage?
    var receivedImage2: UIImage?
    var receivedImage3: UIImage?
   
    var levelNumber: Int = 1   // 👈 ADD THIS
    
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

        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        let lockImage = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?)] = [
            (2, imageView2, viewBG2),
            (3, imageView3, viewBG3)
        ]

        for (level, image, bgView) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "orderShapeLevel\(level)Completed"
            )

            if completed {

                image?.image = UIImage(named: "done")

            } else {

                image?.image = subscribed ? nil : lockImage
            }

            if subscribed {

                bgView?.backgroundColor =
                UserDefaults.standard.bool(forKey: "WhiteTheme")
                ? .white
                : ColorManager.randomColor()

            } else {

                bgView?.backgroundColor = .systemGray4
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

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "SubscriptionVC"
        ) as! SubscriptionVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "orderShapeLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "orderShapeLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "orderShapeLevel3Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: imageView1)
        updateLevelUI(level: 2, imageView: imageView2)
        updateLevelUI(level: 3, imageView: imageView3)

        setupSubscriptionLock()
    }

    func updateLevelUI(level: Int, imageView: UIImageView) {

        let completedKey = "orderShapeLevel\(level)Completed"

        let isCompleted = UserDefaults.standard.bool(forKey: completedKey)

        print("Checking \(completedKey) = \(isCompleted)")

        imageView.image = isCompleted ? UIImage(named: "done") : nil
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

            if SubscriptionManager.shared.isSubscribed() {
                viewBG1.backgroundColor = .white
                viewBG2.backgroundColor = .white
                viewBG3.backgroundColor = .white
            } else {
                viewBG1.backgroundColor = .white
                viewBG2.backgroundColor = .systemGray4
                viewBG3.backgroundColor = .systemGray4
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            if SubscriptionManager.shared.isSubscribed() {
                viewBG1.backgroundColor = ColorManager.randomColor()
                viewBG2.backgroundColor = ColorManager.randomColor()
                viewBG3.backgroundColor = ColorManager.randomColor()
            } else {
                viewBG1.backgroundColor = ColorManager.randomColor()
                viewBG2.backgroundColor = .systemGray4
                viewBG3.backgroundColor = .systemGray4
            }
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "OrderShape") as! OrderShape
        vc.selectedLevel = 1   // 👈 IMPORTANT
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "OrderShape"
        ) as! OrderShape

        vc.selectedLevel = 2

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "OrderShape"
        ) as! OrderShape

        vc.selectedLevel = 3

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    
    @IBAction func restTapBtn(_ sender: UIButton) {

        for i in 1...3 {
            UserDefaults.standard.removeObject(
                forKey: "orderShapeLevel\(i)Completed"
            )
        }

        updateLevelImages()
        updateResetVisibility()

        // 👇 Add this
        setupSubscriptionLock()
    }
   
}
