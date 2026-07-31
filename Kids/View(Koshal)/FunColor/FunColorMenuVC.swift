//
//  FunColorMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 13/05/26.
//

import UIKit
import LanguageManager_iOS

class FunColorMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        applyTheme()
        
        if UserDefaults.standard.bool(forKey: "funColorLevel5Completed") {

            image5.image = UIImage(named: "done")

            let percentage = UserDefaults.standard.integer(
                forKey: "funColorLevel5Percentage"
            )

            label5.text = "\(percentage)%"

        } else {

            image5.image = nil
            label5.text = ""
        }
        
        
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "funColorLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "funColorLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "funColorLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "funColorLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "funColorLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "funColorLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "funColorLevel7Completed")
        
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
        
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        let lockImage = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?)] = [
            (2, image2, viewBG2),
            (4, image4, viewBG4),
            (5, image5, viewBG5),
            (6, image7, viewBG7)
        ]

        for (level,image,bgView) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "funColorLevel\(level)Completed"
            )

            let shouldLock = !subscribed

            if completed {

                // highest priority
                image?.image = UIImage(named: "done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey: "funColorLevel\(level)Percentage"
                )

                switch level {
                case 2: label2.text = "\(percentage)%"
                case 4: label4.text = "\(percentage)%"
                case 5: label5.text = "\(percentage)%"
                case 6: label7.text = "\(percentage)%"
                default: break
                }

            } else {

                image?.image =
                shouldLock ? lockImage : nil
            }

            if shouldLock {

                bgView?.backgroundColor = .systemGray4

            } else {

                bgView?.backgroundColor = UserDefaults.standard.bool(forKey: "WhiteTheme")
                    ? .white
                    : ColorManager.randomColor()
            }
        }
    }

    func applyTheme() {

        let bgViews = [
            viewBG1,
            viewBG2,
            viewBG3,
            viewBG4,
            viewBG5,
            viewBG6,
            viewBG7
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            bgViews.forEach {
                if $0?.backgroundColor != .systemGray4 {
                    $0?.backgroundColor = .white
                }
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            bgViews.forEach {
                if $0?.backgroundColor != .systemGray4 {
                    $0?.backgroundColor = ColorManager.randomColor()
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

        let vc = storyboard?.instantiateViewController(
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

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ContentScreen"
        ) as! ContentScreen

        vc.Htitle = "Coloring".localiz()

        // ✅ Coloring item bhejna
        let item = Variable.Shared.FunColor.first {
            ($0.category as? FunColorCategory) == .coloring
        }

        vc.subItem = item

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchshapeMenuVC"
        ) as? MatchshapeMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PatternRepeatMenuVC"
        ) as? PatternRepeatMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Drawing"
        ) as? Drawing {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "WhatComeNextJD"
        ) as? WhatComeNextJD {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
      //  guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "OrderShapeMenuVC"
        ) as? OrderShapeMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level7TapBtn(_ sender: UIButton) {
          guard checkSubscription() else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MazeMenuVC"
        ) as? MazeMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        UserDefaults.standard.set(false, forKey: "funColorLevel5Completed")
        UserDefaults.standard.removeObject(forKey: "funColorLevel5Percentage")
        image5.image = nil
        label5.text = ""

        updateResetVisibility()
    }
    
    
}
