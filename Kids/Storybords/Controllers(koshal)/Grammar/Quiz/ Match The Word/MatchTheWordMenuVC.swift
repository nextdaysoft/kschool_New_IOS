//
//  MatchTheWordMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 04/02/26.
//

import UIKit

class MatchTheWordMenuVC: BaseViewController {

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

        applyTheme()
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel1Completed") {
            image1.image = UIImage(named: "done")
            image1.isHidden = false
        } else {
            image1.isHidden = true
        }

        if UserDefaults.standard.object(forKey: "matchTheWordLevel1Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel1Percentage")
            label1.text = "\(percent)%"
            label1.isHidden = false
        } else {
            label1.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel2Completed") {
            image2.image = UIImage(named: "done")
            image2.isHidden = false
        } else {
            image2.isHidden = true
        }

        if UserDefaults.standard.object(forKey: "matchTheWordLevel2Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel2Percentage")
            label2.text = "\(percent)%"
            label2.isHidden = false
        } else {
            label2.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel3Completed") {
            image3.image = UIImage(named: "done")
            image3.isHidden = false
        } else {
            image3.isHidden = true
        }

        if UserDefaults.standard.object(forKey: "matchTheWordLevel3Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel3Percentage")
            label3.text = "\(percent)%"
            label3.isHidden = false
        } else {
            label3.isHidden = true
        }
        
        if UserDefaults.standard.object(forKey: "matchTheWordLevel4Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel4Percentage")
            label4.text = "\(percent)%"
            label4.isHidden = false
        } else {
            label4.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel4Completed") {
            image4.image = UIImage(named: "done")
            image4.isHidden = false
        } else {
            image4.isHidden = true
        }
        
        if UserDefaults.standard.object(forKey: "matchTheWordLevel5Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel5Percentage")
            label5.text = "\(percent)%"
            label5.isHidden = false
        } else {
            label5.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel5Completed") {
            image5.image = UIImage(named: "done")
            image5.isHidden = false
        } else {
            image5.isHidden = true
        }
        
        if UserDefaults.standard.object(forKey: "matchTheWordLevel6Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel6Percentage")
            label6.text = "\(percent)%"
            label6.isHidden = false
        } else {
            label6.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel6Completed") {
            image6.image = UIImage(named: "done")
            image6.isHidden = false
        } else {
            image6.isHidden = true
        }
        
        if UserDefaults.standard.object(forKey: "matchTheWordLevel7Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel7Percentage")
            label7.text = "\(percent)%"
            label7.isHidden = false
        } else {
            label7.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel7Completed") {
            image7.image = UIImage(named: "done")
            image7.isHidden = false
        } else {
            image7.isHidden = true
        }
        
        if UserDefaults.standard.object(forKey: "matchTheWordLevel8Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel8Percentage")
            label8.text = "\(percent)%"
            label8.isHidden = false
        } else {
            label8.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel8Completed") {
            image8.image = UIImage(named: "done")
            image8.isHidden = false
        } else {
            image8.isHidden = true
        }
        
        if UserDefaults.standard.object(forKey: "matchTheWordLevel9Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel9Percentage")
            label9.text = "\(percent)%"
            label9.isHidden = false
        } else {
            label9.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel9Completed") {
            image9.image = UIImage(named: "done")
            image9.isHidden = false
        } else {
            image9.isHidden = true
        }
        
        if UserDefaults.standard.object(forKey: "matchTheWordLevel10Percentage") != nil {
            let percent = UserDefaults.standard.integer(forKey: "matchTheWordLevel10Percentage")
            label10.text = "\(percent)%"
            label10.isHidden = false
        } else {
            label10.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "matchTheWordLevel10Completed") {
            image10.image = UIImage(named: "done")
            image10.isHidden = false
        } else {
            image10.isHidden = true
        }
        
        updateResetVisibility()
        setupSubscriptionLock()
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
            viewBG3.backgroundColor = .white
            viewBG4.backgroundColor = .white
            viewBG5.backgroundColor = .white
            viewBG6.backgroundColor = .white
            viewBG7.backgroundColor = .white
            viewBG8.backgroundColor = .white
            viewBG9.backgroundColor = .white
            viewBG10.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
            viewBG4.backgroundColor = ColorManager.randomColor()
            viewBG5.backgroundColor = ColorManager.randomColor()
            viewBG6.backgroundColor = ColorManager.randomColor()
            viewBG7.backgroundColor = ColorManager.randomColor()
            viewBG8.backgroundColor = ColorManager.randomColor()
            viewBG9.backgroundColor = ColorManager.randomColor()
            viewBG10.backgroundColor = ColorManager.randomColor()
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
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "matchTheWordLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel8Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel9Completed") ||
        UserDefaults.standard.bool(forKey: "matchTheWordLevel10Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
    }
    
    func setupSubscriptionLock() {

        let subscribed =
        SubscriptionManager.shared.isSubscribed()

        let lockImage =
        UIImage(named:"lock")

        let levels: [(UIImageView, UIView, UILabel, Int)] = [

            (image4, viewBG4, label4, 4),
            (image5, viewBG5, label5, 5),
            (image6, viewBG6, label6, 6),
            (image7, viewBG7, label7, 7),
            (image8, viewBG8, label8, 8),
            (image9, viewBG9, label9, 9),
            (image10,viewBG10,label10,10)
        ]

        for (image,bg,label,level) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "matchTheWordLevel\(level)Completed"
            )

            if completed {

                // done image priority
                image.image =
                UIImage(named:"done")

                image.isHidden = false

                let percent =
                UserDefaults.standard.integer(
                    forKey:
                    "matchTheWordLevel\(level)Percentage"
                )

                label.text = "\(percent)%"
                label.isHidden = false

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {

                    bg.backgroundColor = completed
                        ? .white
                        : .systemGray4

                } else {

                    bg.backgroundColor = completed
                        ? ColorManager.randomColor()
                        : (subscribed ? ColorManager.randomColor() : .systemGray4)
                }

            } else {

                image.image =
                subscribed ? nil : lockImage

                image.isHidden =
                subscribed

                label.text = ""
                label.isHidden = true

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {

                    bg.backgroundColor = completed
                        ? .white
                        : .systemGray4

                } else {

                    bg.backgroundColor = completed
                        ? ColorManager.randomColor()
                        : (subscribed ? ColorManager.randomColor() : .systemGray4)
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
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel1VC"
        ) as! MatchTheWordLevel1VC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel2VC"
        ) as? MatchTheWordLevel2VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel3VC"
        ) as? MatchTheWordLevel3VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel4VC"
        ) as? MatchTheWordLevel4VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel5VC"
        ) as? MatchTheWordLevel5VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel6VC"
        ) as? MatchTheWordLevel6VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level7TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel7VC"
        ) as? MatchTheWordLevel7VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level8TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel8VC"
        ) as? MatchTheWordLevel8VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel9VC"
        ) as? MatchTheWordLevel9VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }


    @IBAction func level10TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordLevel10VC"
        ) as? MatchTheWordLevel10VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...10 {

            // clear done state
            defaults.set(
                false,
                forKey: "matchTheWordLevel\(i)Completed"
            )

            // clear percentage
            defaults.removeObject(
                forKey: "matchTheWordLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        // clear all UI
        for image in [
            image1,image2,image3,image4,image5,
            image6,image7,image8,image9,image10
        ] {
            image?.image = nil
            image?.isHidden = true
        }

        for label in [
            label1,label2,label3,label4,label5,
            label6,label7,label8,label9,label10
        ] {
            label?.text = ""
            label?.isHidden = true
        }

        // 🔥 restore locks
        setupSubscriptionLock()

        updateResetVisibility()
    }
  
}
