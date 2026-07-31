//
//  ExternalBodyPartsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 10/04/26.
//

import UIKit

class ExternalBodyPartsMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    
    var isLearningExpanded = false
    var isQuizExpanded = false
    
    var didTapLockedLevel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setup()
        setupForRestBtn()
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()

        viewBG4.layer.cornerRadius = 10
        viewBG4.backgroundColor = ColorManager.randomColor()
    
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
        
        if UserDefaults.standard.bool(forKey: "externalBodyPartsLevel1Completed") {
            image1.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "externalBodyPartsLevel1Percentage")
            label1.text = "\(percentage)%"
        } else {
            image1.image = nil
            label1.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "externalBodyPartsLevel2Completed") {
            image2.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "externalBodyPartsLevel2Percentage")
            label2.text = "\(percentage)%"
        } else {
            image2.image = nil
            label2.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "externalBodyPartsLevel3Completed") {
            image3.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "externalBodyPartsLevel3Percentage")
            label3.text = "\(percentage)%"
        } else {
            image3.image = nil
            label3.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "externalBodyPartsLevel4Completed") {
            image4.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "externalBodyPartsLevel4Percentage")
            label4.text = "\(percentage)%"
        } else {
            image4.image = nil
            label4.text = ""
        }
        
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "externalBodyPartsLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "externalBodyPartsLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "externalBodyPartsLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "externalBodyPartsLevel4Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
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
        
        // Text right side + icon right
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
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
        let lock = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?, UILabel?)] = [

            (2,image2,viewBG2,label2),
            (3,image3,viewBG3,label3),
            (4,image4,viewBG4,label4)
        ]

        for (level,image,bg,label) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "externalBodyPartsLevel\(level)Completed"
            )

            if completed {

                image?.image = UIImage(named:"done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey: "externalBodyPartsLevel\(level)Percentage"
                )

                label?.text = "\(percentage)%"

                bg?.backgroundColor =
                    ColorManager.randomColor()

            } else {

                image?.image =
                subscribed ? nil : lock

                label?.text = ""

                bg?.backgroundColor =
                subscribed
                ? ColorManager.randomColor()
                : .systemGray4
            }
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfHumanBodyVC"
        ) as! PartsOfHumanBodyVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfFaceVC"
        ) as! PartsOfFaceVC

        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfHandVC"
        ) as! PartsOfHandVC

        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfLegVC"
        ) as! PartsOfLegVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        for i in 1...4 {

            UserDefaults.standard.set(
                false,
                forKey: "externalBodyPartsLevel\(i)Completed"
            )

            UserDefaults.standard.removeObject(
                forKey: "externalBodyPartsLevel\(i)Percentage"
            )
        }

        image1.image = nil
        label1.text = ""

        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
}
