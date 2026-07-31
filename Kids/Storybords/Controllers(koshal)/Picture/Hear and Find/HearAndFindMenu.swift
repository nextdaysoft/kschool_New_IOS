//
//  HearAndFindMenu.swift
//  KSchool
//
//  Created by Koshal Singh on 11/03/26.
//

import UIKit
import LanguageManager_iOS

class HearAndFindMenu: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var didTapLockedLevel = false
    
    // MARK: - Level 1 (Birds)

    let level1Birds: [BirdQuestions] = [
        BirdQuestions(name: "Solar Panel".localiz(), imageName: "solar_panel"),
        BirdQuestions(name: "Electric Meter".localiz(), imageName: "electric_meter"),
        BirdQuestions(name: "Inverter".localiz(), imageName: "invertor"),
        BirdQuestions(name: "Table Lamp".localiz(), imageName: "table_lamp"),
        BirdQuestions(name: "Socket".localiz(), imageName: "socket"),
        BirdQuestions(name: "Extension Board".localiz(), imageName: "extension"),
        BirdQuestions(name: "Cut Out".localiz(), imageName: "cut_out"),
        BirdQuestions(name: "MCB".localiz(), imageName: "mcb"),
        BirdQuestions(name: "Iron".localiz(), imageName: "iron"),
        BirdQuestions(name: "Plug".localiz(), imageName: "plug")
    ]

    let level2Birds: [BirdQuestions] = [
        BirdQuestions(name: "Scanner".localiz(), imageName: "scanner"),
        BirdQuestions(name: "Wi-Fi Router".localiz(), imageName: "router"),
        BirdQuestions(name: "Keyboard".localiz(), imageName: "keyboard"),
        BirdQuestions(name: "Monitor".localiz(), imageName: "monitor"),
        BirdQuestions(name: "Laptop".localiz(), imageName: "laptop"),
        BirdQuestions(name: "Mouse".localiz(), imageName: "mousee"),
        BirdQuestions(name: "Projector".localiz(), imageName: "projector"),
        BirdQuestions(name: "Microphone".localiz(), imageName: "microphone"),
        BirdQuestions(name: "Printer".localiz(), imageName: "printer"),
        BirdQuestions(name: "CPU".localiz(), imageName: "cpu")
    ]

    let level3Birds: [BirdQuestions] = [
        BirdQuestions(name: "Axe".localiz(), imageName: "axe"),
        BirdQuestions(name: "Saw".localiz(), imageName: "saw"),
        BirdQuestions(name: "Bolt".localiz(), imageName: "bolt"),
        BirdQuestions(name: "Measuring Tape".localiz(), imageName: "measuring_tape"),
        BirdQuestions(name: "Trowel".localiz(), imageName: "trowel"),
        BirdQuestions(name: "Nut".localiz(), imageName: "nut"),
        BirdQuestions(name: "Screwdriver".localiz(), imageName: "screwdriver"),
        BirdQuestions(name: "Plier".localiz(), imageName: "plier"),
        BirdQuestions(name: "Hammer".localiz(), imageName: "hammer"),
        BirdQuestions(name: "Spanner".localiz(), imageName: "spanner")
    ]

    let level4Birds: [BirdQuestions] = [
        BirdQuestions(name: "Golf Stick".localiz(), imageName: "golf_stick"),
        BirdQuestions(name: "Badminton Racket".localiz(), imageName: "badminton_racket"),
        BirdQuestions(name: "Shuttlecock".localiz(), imageName: "shuttlecock"),
        BirdQuestions(name: "Hockey Stick".localiz(), imageName: "hockey_stick"),
        BirdQuestions(name: "Table Tennis Bat".localiz(), imageName: "table_tennis_bat"),
        BirdQuestions(name: "Cricket Bat".localiz(), imageName: "cricket_bat"),
        BirdQuestions(name: "Rugby Ball".localiz(), imageName: "rugby_ball"),
        BirdQuestions(name: "Tennis Ball".localiz(), imageName: "tennis_ball"),
        BirdQuestions(name: "Tennis Racket".localiz(), imageName: "tennis_racket"),
        BirdQuestions(name: "Baseball Bat".localiz(), imageName: "baseball_bat")
    ]

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
        
    
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
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
            UserDefaults.standard.bool(forKey: "hearAndFindLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "hearAndFindLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "hearAndFindLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "hearAndFindLevel4Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "hearAndFindLevel\(level)Completed"
        let percentageKey = "hearAndFindLevel\(level)Percentage"

        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: percentageKey)
            label.text = "\(percentage)%"
        } else {
            imageView.image = nil
            label.text = ""
        }
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
                viewBG4
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
                viewBG4
            ]

            bgViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }

        // Premium levels (2–4) की lock/unlock/completed UI maintain रहेगी
        setupSubscriptionLock()
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

        let subscribed =
        SubscriptionManager.shared.isSubscribed()

        let lockImage =
        UIImage(named: "lock")

        let levels:[(UIImageView,UIView,UILabel,Int)] = [

            (image2,viewBG2,label2,2),
            (image3,viewBG3,label3,3),
            (image4,viewBG4,label4,4)
        ]

        for (image,bg,label,level) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey:
                "hearAndFindLevel\(level)Completed"
            )

            if completed {

                // done highest priority
                image.image =
                UIImage(named:"done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey:
                    "hearAndFindLevel\(level)Percentage"
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "HearAndFindShowVC") as! HearAndFindShowVC
        vc.birds = level1Birds
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "HearAndFindShowVC"
        ) as! HearAndFindShowVC

        vc.birds = level2Birds
        vc.levelNumber = 2

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "HearAndFindShowVC"
        ) as! HearAndFindShowVC

        vc.birds = level3Birds
        vc.levelNumber = 3

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "HearAndFindShowVC"
        ) as! HearAndFindShowVC

        vc.birds = level4Birds
        vc.levelNumber = 4

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...4 {

            defaults.removeObject(
                forKey: "hearAndFindLevel\(i)Completed"
            )

            defaults.removeObject(
                forKey: "hearAndFindLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        updateLevelImages()

        // ✅ lock image restore
        setupSubscriptionLock()

        updateResetVisibility()
    }
}
