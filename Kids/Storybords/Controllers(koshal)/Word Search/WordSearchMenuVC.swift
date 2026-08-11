//
//  WordSearchMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 19/01/26.
//

import UIKit

class WordSearchMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    @IBOutlet weak var viewBG9: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var level1Completed = false
    var level2Completed = false
    var level3Completed = false
    var level4Completed = false
    var level5Completed = false
    var level6Completed = false
    var level7Completed = false
    var level8Completed = false
    var level9Completed = false
    
    var didTapLockedLevel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        applyTheme()
        setupForRestBtn()
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10
        viewBG7.layer.cornerRadius = 10
        viewBG8.layer.cornerRadius = 10
        viewBG9.layer.cornerRadius = 10
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
        UserDefaults.standard.bool(forKey: "wordSearchLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "wordSearchLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "wordSearchLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "wordSearchLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "wordSearchLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "wordSearchLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "wordSearchLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "wordSearchLevel8Completed") ||
        UserDefaults.standard.bool(forKey: "wordSearchLevel9Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    func updateLevelImages() {

        // Free levels
        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)

        // Subscription wale levels ko alag handle karo
        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lockImage = UIImage(named: "lock")

        let levels: [(UIImageView, Int)] = [
            (image3, 3),
            (image4, 4),
            (image5, 5),
            (image6, 6),
            (image7, 7),
            (image8, 8),
            (image9, 9)
        ]

        for (imageView, level) in levels {

            let completed = UserDefaults.standard.bool(
                forKey: "wordSearchLevel\(level)Completed"
            )

            if completed {
                imageView.image = UIImage(named: "done")
            } else {
                imageView.image = subscribed ? nil : lockImage
            }
        }
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView) {

        let completedKey = "wordSearchLevel\(level)Completed"

        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
        } else {
            imageView.image = nil
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
                viewBG6,
                viewBG7,
                viewBG8,
                viewBG9
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
                viewBG6,
                viewBG7,
                viewBG8,
                viewBG9
            ]

            bgViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }

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
        UIImage(named:"lock")

        let levels:[(UIImageView,UIView,Int)] = [

            (image3,viewBG3,3),
            (image4,viewBG4,4),
            (image5,viewBG5,5),
            (image6,viewBG6,6),
            (image7,viewBG7,7),
            (image8,viewBG8,8),
            (image9,viewBG9,9)
        ]

        for (image,bg,level) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey:
                "wordSearchLevel\(level)Completed"
            )

            if completed {

                image.image = UIImage(named: "done")

                bg.backgroundColor =
                    UserDefaults.standard.bool(forKey: "WhiteTheme")
                    ? .white
                    : ColorManager.randomColor()

            } else {

                image.image = subscribed ? nil : lockImage

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
            withIdentifier: "FunDaysOfTheWeekVC"
        ) as? FunDaysOfTheWeekVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FunAnimalsAroundTheWorldVC"
        ) as? FunAnimalsAroundTheWorldVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FunMonthsOfTheYearVC"
        ) as? FunMonthsOfTheYearVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FunPlanetsOfOurSolarSystemVC"
        ) as? FunPlanetsOfOurSolarSystemVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

          guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "CommunityHelpersVC"
        ) as? CommunityHelpersVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {

          guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FunColorsVC"
        ) as? FunColorsVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {

          guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FunVehiclesVC"
        ) as? FunVehiclesVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {

          guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FunKitchenVC"
        ) as? FunKitchenVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FunVegetablesVC"
        ) as? FunVegetablesVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...9 {
            defaults.removeObject(forKey: "wordSearchLevel\(i)Completed")
        }

        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
}
