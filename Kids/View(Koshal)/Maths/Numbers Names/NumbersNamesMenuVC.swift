//
//  NumbersNamesMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 21/03/26.
//

import UIKit
import LanguageManager_iOS

class NumbersNamesMenuVC: BaseViewController {

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
    
    let level1Data = [
        NumbersNames(first: "1", last: "One".localiz()),
        NumbersNames(first: "2", last: "Two".localiz()),
        NumbersNames(first: "3", last: "Three".localiz()),
        NumbersNames(first: "4", last: "Four".localiz()),
        NumbersNames(first: "5", last: "Five".localiz())
    ]

    let level1Map = [
        "1": "One".localiz(),
        "2": "Two".localiz(),
        "3": "Three".localiz(),
        "4": "Four".localiz(),
        "5": "Five".localiz()
    ]

    let level2Data = [
        NumbersNames(first: "6", last: "Six".localiz()),
        NumbersNames(first: "7", last: "Seven".localiz()),
        NumbersNames(first: "8", last: "Eight".localiz()),
        NumbersNames(first: "9", last: "Nine".localiz()),
        NumbersNames(first: "10", last: "Ten".localiz())
    ]

    let level2Map = [
        "6": "Six".localiz(),
        "7": "Seven".localiz(),
        "8": "Eight".localiz(),
        "9": "Nine".localiz(),
        "10": "Ten".localiz()
    ]

    let level3Data = [
        NumbersNames(first: "11", last: "Eleven".localiz()),
        NumbersNames(first: "12", last: "Twelve".localiz()),
        NumbersNames(first: "13", last: "Thirteen".localiz()),
        NumbersNames(first: "14", last: "Fourteen".localiz()),
        NumbersNames(first: "15", last: "Fifteen".localiz())
    ]

    let level3Map = [
        "11": "Eleven".localiz(),
        "12": "Twelve".localiz(),
        "13": "Thirteen".localiz(),
        "14": "Fourteen".localiz(),
        "15": "Fifteen".localiz()
    ]

    let level4Data = [
        NumbersNames(first: "16", last: "Sixteen".localiz()),
        NumbersNames(first: "17", last: "Seventeen".localiz()),
        NumbersNames(first: "18", last: "Eighteen".localiz()),
        NumbersNames(first: "19", last: "Nineteen".localiz()),
        NumbersNames(first: "20", last: "Twenty".localiz())
    ]

    let level4Map = [
        "16": "Sixteen".localiz(),
        "17": "Seventeen".localiz(),
        "18": "Eighteen".localiz(),
        "19": "Nineteen".localiz(),
        "20": "Twenty".localiz()
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
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

        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        let lockImage = UIImage(named: "lock")

        let levelImages: [(Int, UIImageView?)] = [
            (3, image3),
            (4, image4)
        ]

        for (level, imageView) in levelImages {

            let completed =
            UserDefaults.standard.bool(
                forKey: "numbersNamesLevel\(level)Completed"
            )

            if completed {

                // done highest priority
                imageView?.image =
                UIImage(named: "done")

            } else {

                // not completed
                imageView?.image =
                subscribed ? nil : lockImage
            }
        }

        if subscribed {

            viewBG3.backgroundColor =
            ColorManager.randomColor()

            viewBG4.backgroundColor =
            ColorManager.randomColor()

        } else {

            viewBG3.backgroundColor = .systemGray4
            viewBG4.backgroundColor = .systemGray4
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
    
    func updateLevelUI(level: Int,
                       imageView: UIImageView,
                       label: UILabel) {

        if level >= 3 &&
            !SubscriptionManager.shared.isSubscribed() {
            return
        }

        let completedKey = "numbersNamesLevel\(level)Completed"
        let percentageKey = "numbersNamesLevel\(level)Percentage"

        if UserDefaults.standard.bool(forKey: completedKey) {

            imageView.image = UIImage(named: "done")

            let percentage =
            UserDefaults.standard.integer(
                forKey: percentageKey
            )

            label.text = "\(percentage)%"

        } else {

            imageView.image = nil
            label.text = ""
        }
    }
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "numbersNamesLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "numbersNamesLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "numbersNamesLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "numbersNamesLevel4Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
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
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "NumbersNamesShowVC") as! NumbersNamesShowVC

        vc.passedWordPairs = level1Data
        vc.passedCorrectMap = level1Map
        vc.levelText = "# Level 1"
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "NumbersNamesShowVC") as! NumbersNamesShowVC

        vc.passedWordPairs = level2Data
        vc.passedCorrectMap = level2Map
        vc.levelText = "# Level 2"
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "NumbersNamesShowVC"
        ) as! NumbersNamesShowVC

        vc.passedWordPairs = level3Data
        vc.passedCorrectMap = level3Map
        vc.levelText = "# Level 3"
        vc.levelNumber = 3

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "NumbersNamesShowVC"
        ) as! NumbersNamesShowVC

        vc.passedWordPairs = level4Data
        vc.passedCorrectMap = level4Map
        vc.levelText = "# Level 4"
        vc.levelNumber = 4

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        for i in 1...4 {
            defaults.removeObject(forKey: "numbersNamesLevel\(i)Completed")
        }
        
        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
  
}
