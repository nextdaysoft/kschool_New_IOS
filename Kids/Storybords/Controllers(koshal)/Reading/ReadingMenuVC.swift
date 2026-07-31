//
//  ReadingMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 06/02/26.
//

import UIKit

class ReadingMenuVC: BaseViewController {

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
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "readingLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel8Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel9Completed") ||
        UserDefaults.standard.bool(forKey: "readingLevel10Completed")
        
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
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "readingLevel\(level)Completed"
        let percentageKey = "readingLevel\(level)Percentage"

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
            viewBG2.backgroundColor = .white

            // Locked levels का color setupSubscriptionLock() संभालेगा
            setupSubscriptionLock()

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()

            setupSubscriptionLock()
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

        let levels: [(Int, UIImageView?, UIView?)] = [
            (3,image3,viewBG3),
            (4,image4,viewBG4),
            (5,image5,viewBG5),
            (6,image6,viewBG6),
            (7,image7,viewBG7),
            (8,image8,viewBG8),
            (9,image9,viewBG9),
            (10,image10,viewBG10)
        ]

        let lockImage = UIImage(named: "lock")

        for (level,image,bgView) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "readingLevel\(level)Completed"
            )

            if completed {

                // ✅ done image highest priority
                image?.image = UIImage(named: "done")

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                    bgView?.backgroundColor = .white
                } else {
                    bgView?.backgroundColor = ColorManager.randomColor()
                }
            } else {

                image?.image =
                subscribed ? nil : lockImage

                if subscribed {
                    if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                        bgView?.backgroundColor = .white
                    } else {
                        bgView?.backgroundColor = ColorManager.randomColor()
                    }
                } else {
                    bgView?.backgroundColor = .systemGray4
                }
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
            withIdentifier: "AppleVC"
        ) as! AppleVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "DogVC"
        ) as? DogVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "CatVC"
        ) as? CatVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "BallVC"
        ) as? BallVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "SunVC"
        ) as? SunVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FishVC"
        ) as? FishVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level7TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "BirdVC"
        ) as? BirdVC {

                navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level8TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "CarVC"
        ) as? CarVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "TreeVC"
        ) as? TreeVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level10TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "BananaVC"
        ) as? BananaVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
  
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...10 {

            defaults.removeObject(
                forKey: "readingLevel\(i)Completed"
            )

            defaults.removeObject(
                forKey: "readingLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        updateLevelImages()

        // ✅ lock wapas lag jayega
        setupSubscriptionLock()

        updateResetVisibility()
    }
    
}
