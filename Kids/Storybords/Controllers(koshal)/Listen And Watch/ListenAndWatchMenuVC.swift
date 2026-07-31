//
//  ListenAndWatchMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 24/04/26.
//

import UIKit

class ListenAndWatchMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupForRestBtn()
        applyTheme()

        viewBG1.layer.cornerRadius = 10
        viewBG1.layer.borderColor = UIColor.black.cgColor

        viewBG2.layer.cornerRadius = 10
        viewBG2.layer.borderColor = UIColor.black.cgColor

        viewBG3.layer.cornerRadius = 10
        viewBG3.layer.borderColor = UIColor.black.cgColor

        viewBG4.layer.cornerRadius = 10
        viewBG4.layer.borderColor = UIColor.black.cgColor

        viewBG5.layer.cornerRadius = 10
        viewBG5.layer.borderColor = UIColor.black.cgColor
        
        //viewBG4.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()

        // Level 1
        let level1Completed = UserDefaults.standard.bool(
            forKey: "listenAndWatchLevel1Completed"
        )

        image1.isHidden = !level1Completed

        if level1Completed {
            image1.image = UIImage(named: "done")
        }

        // Level 2
        let level2Completed = UserDefaults.standard.bool(
            forKey: "listenAndWatchLevel2Completed"
        )

        image2.isHidden = false

        if level2Completed {
            image2.image = UIImage(named: "done")
        }

        // Level 3
        let level3Completed = UserDefaults.standard.bool(
            forKey: "listenAndWatchLevel3Completed"
        )

        image3.isHidden = false

        if level3Completed {
            image3.image = UIImage(named: "done")
        }

        // Level 4
        let level4Completed = UserDefaults.standard.bool(
            forKey: "listenAndWatchLevel4Completed"
        )

        image4.isHidden = false

        if level4Completed {
            image4.image = UIImage(named: "done")
        }

        // Level 5
        let level5Completed = UserDefaults.standard.bool(
            forKey: "listenAndWatchLevel5Completed"
        )

        image5.isHidden = false

        if level5Completed {
            image5.image = UIImage(named: "done")
        }

        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "listenAndWatchLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "listenAndWatchLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "listenAndWatchLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "listenAndWatchLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "listenAndWatchLevel5Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
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

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
            viewBG4.backgroundColor = ColorManager.randomColor()
            viewBG5.backgroundColor = ColorManager.randomColor()
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
    
    func checkSubscription() -> Bool {

        if SubscriptionManager.shared.isSubscribed() {
            return true
        }

        goToSubscription()
        return false
    }

    func goToSubscription() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "SubscriptionVC"
        ) as! SubscriptionVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lock = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?)] = [
            (2, image2, viewBG2),
            (3, image3, viewBG3),
            (4, image4, viewBG4),
            (5, image5, viewBG5)
        ]

        for (level, image, bg) in levels {

            let completed = UserDefaults.standard.bool(
                forKey: "listenAndWatchLevel\(level)Completed"
            )

            if completed {

                image?.image = UIImage(named: "done")

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                    bg?.backgroundColor = .white
                } else {
                    bg?.backgroundColor = ColorManager.randomColor()
                }

            } else {

                if subscribed {
                    image?.image = nil

                    if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                        bg?.backgroundColor = .white
                    } else {
                        bg?.backgroundColor = ColorManager.randomColor()
                    }

                } else {

                    image?.image = UIImage(named: "lock")
                    bg?.backgroundColor = .systemGray4
                }
            }
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(
            withIdentifier: "ListenAndWatchShowVC"
        ) as! ListenAndWatchShowVC
        vc.letterStyle = .normal
        vc.screenTitle = "Capital Letters"
        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }
        
        let sb = UIStoryboard(name: "Main", bundle: nil)

        let vc = sb.instantiateViewController(
            withIdentifier: "ListenAndWatchShowVC"
        ) as! ListenAndWatchShowVC

        vc.isSmallLetters = true
        vc.screenTitle = "Small Letters"

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(
            withIdentifier: "ListenAndWatchShowVC"
        ) as! ListenAndWatchShowVC
        vc.letterStyle = .cursive
        vc.screenTitle = "Cursive Capital Letters"
        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
  
    @IBAction func level4TapBtn(_ sender: UIButton) {

      guard checkSubscription() else { return }
        
        let sb = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = sb.instantiateViewController(
            withIdentifier: "ListenAndWatchShowVC"
        ) as! ListenAndWatchShowVC

        vc.isSmallCursiveLetters = true
        vc.screenTitle = "Small Cursive Letters"

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }
        
        let sb = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = sb.instantiateViewController(
            withIdentifier: "ListenAndWatchShowVC"
        ) as! ListenAndWatchShowVC

        vc.isNumbers = true
        vc.screenTitle = "Numbers"

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let keys = [
            "listenAndWatchLevel1Completed",
            "listenAndWatchLevel2Completed",
            "listenAndWatchLevel3Completed",
            "listenAndWatchLevel4Completed",
            "listenAndWatchLevel5Completed"
        ]

        keys.forEach {
            UserDefaults.standard.removeObject(forKey: $0)
        }

        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
        image5.image = nil

        image1.isHidden = true
        image2.isHidden = true
        image3.isHidden = true
        image4.isHidden = true
        image5.isHidden = true

        updateResetVisibility()
    }
    
    
}
