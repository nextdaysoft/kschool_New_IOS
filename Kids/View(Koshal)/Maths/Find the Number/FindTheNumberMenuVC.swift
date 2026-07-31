//
//  FindTheNumberMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 23/03/26.
//

import UIKit

class FindTheNumberMenuVC: BaseViewController {

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
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    @IBOutlet weak var image13: UIImageView!
    @IBOutlet weak var image14: UIImageView!
    @IBOutlet weak var image15: UIImageView!
    
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
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    
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
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: UIView!
    @IBOutlet weak var view13: UIView!
    @IBOutlet weak var view14: UIView!
    @IBOutlet weak var view15: UIView!
    
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
    @IBOutlet weak var viewBG11: UIView!
    @IBOutlet weak var viewBG12: UIView!
    @IBOutlet weak var viewBG13: UIView!
    @IBOutlet weak var viewBG14: UIView!
    @IBOutlet weak var viewBG15: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
 
    @IBOutlet weak var numLbl1: UILabel!
    @IBOutlet weak var numLbl2: UILabel!
    @IBOutlet weak var numLbl3: UILabel!
    @IBOutlet weak var numLbl4: UILabel!
    @IBOutlet weak var numLbl5: UILabel!
    @IBOutlet weak var numLbl6: UILabel!
    @IBOutlet weak var numLbl7: UILabel!
    @IBOutlet weak var numLbl8: UILabel!
    @IBOutlet weak var numLbl9: UILabel!
    @IBOutlet weak var numLbl10: UILabel!

    @IBOutlet weak var numLbl11: UILabel!
    @IBOutlet weak var numLbl12: UILabel!
    @IBOutlet weak var numLbl13: UILabel!
    @IBOutlet weak var numLbl14: UILabel!
    @IBOutlet weak var numLbl15: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    
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
        
        view11.layer.borderColor = UIColor.black.cgColor
        view11.layer.borderWidth = 1
        view11.layer.cornerRadius = 20
        view11.clipsToBounds = true
        
        view12.layer.borderColor = UIColor.black.cgColor
        view12.layer.borderWidth = 1
        view12.layer.cornerRadius = 20
        view12.clipsToBounds = true
        
        view13.layer.borderColor = UIColor.black.cgColor
        view13.layer.borderWidth = 1
        view13.layer.cornerRadius = 20
        view13.clipsToBounds = true
        
        view14.layer.borderColor = UIColor.black.cgColor
        view14.layer.borderWidth = 1
        view14.layer.cornerRadius = 20
        view14.clipsToBounds = true
        
        view15.layer.borderColor = UIColor.black.cgColor
        view15.layer.borderWidth = 1
        view15.layer.cornerRadius = 20
        view15.clipsToBounds = true
        
        
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
        viewBG11.layer.cornerRadius = 10
        viewBG12.layer.cornerRadius = 10
        viewBG13.layer.cornerRadius = 10
        viewBG14.layer.cornerRadius = 10
        viewBG15.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
        
        setupAgeWiseUI()
        updateScrollHeight()
        updateLevelImages()
        setupSubscriptionLock()
        updateResetVisibility()
        
    }
    
    func applyTheme() {

        let whiteTheme = UserDefaults.standard.bool(forKey: "WhiteTheme")

        let normalViews = [
            viewBG1,
            viewBG2,
            viewBG3
        ]

        if whiteTheme {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            normalViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            normalViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
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

        let subscribed =
        SubscriptionManager.shared.isSubscribed()

        let selectedAge =
        UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""

        let lock = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?)] = [
            (4,image4,viewBG4),
            (5,image5,viewBG5),
            (6,image6,viewBG6),
            (7,image7,viewBG7),
            (8,image8,viewBG8),
            (9,image9,viewBG9),
            (10,image10,viewBG10),
            (11,image11,viewBG11),
            (12,image12,viewBG12),
            (13,image13,viewBG13),
            (14,image14,viewBG14),
            (15,image15,viewBG15)
        ]

        for (level,image,bgView) in levels {

            var shouldLock = false

            if !subscribed {

                if selectedAge == "1 - 6 yrs" &&
                    (level == 4 || level == 5) {

                    shouldLock = true
                }

                if selectedAge == "7 - 12 yrs" &&
                    (6...15).contains(level) {

                    shouldLock = true
                }
            }

            let completed =
            UserDefaults.standard.bool(
                forKey: "findTheNumberLevel\(level)Completed"
            )

            if completed {
                image?.image = UIImage(named:"done")
            } else {
                image?.image = shouldLock ? lock : nil
            }

            let whiteTheme = UserDefaults.standard.bool(forKey: "WhiteTheme")

            if shouldLock {

                bgView?.backgroundColor = .systemGray4

            } else {

                bgView?.backgroundColor = whiteTheme
                    ? .white
                    : ColorManager.randomColor()
            }
        }
    }
    
    
    func updateLevelUI(
        level: Int,
        imageView: UIImageView,
        label: UILabel
    ) {

        let selectedAge =
        UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""

        // 1-6 yrs only level 1-5
        if selectedAge == "1 - 6 yrs" {

            if !(1...5).contains(level) {

                imageView.image = nil
                label.text = ""
                return
            }
        }

        // 7-12 yrs only level 5-15
        if selectedAge == "7 - 12 yrs" {

            if !(5...15).contains(level) {

                imageView.image = nil
                label.text = ""
                return
            }
        }

        let completedKey =
        "findTheNumberLevel\(level)Completed"

        let percentageKey =
        "findTheNumberLevel\(level)Percentage"

        if UserDefaults.standard.bool(forKey: completedKey) {

            imageView.image = UIImage(named:"done")

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
    
    
    func updateScrollHeight() {

        let allViews = [
            viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,
            viewBG6, viewBG7, viewBG8, viewBG9, viewBG10,
            viewBG11, viewBG12, viewBG13, viewBG14, viewBG15
        ]

        let visibleCount = allViews.filter {
            $0?.isHidden == false
        }.count

        let oneViewHeight: CGFloat = 70
        let spacing: CGFloat = 15
        let extraPadding: CGFloat = 100

        let totalHeight =
        (CGFloat(visibleCount) * oneViewHeight) +
        (CGFloat(max(visibleCount - 1, 0)) * spacing) +
        extraPadding

        scrollViewHeightConstraint.constant = totalHeight

        // animation hata do
        self.view.layoutIfNeeded()
    }
    
    func setupAgeWiseUI() {
        
        let selectedAge = UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""
        
        let allViews = [
            viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,
            viewBG6, viewBG7, viewBG8, viewBG9, viewBG10,
            viewBG11, viewBG12, viewBG13, viewBG14, viewBG15
        ]
        
        allViews.forEach {
            $0?.isHidden = true
        }
        
        let allLabels = [
            numLbl1,numLbl2,numLbl3,numLbl4,numLbl5,
            numLbl6,numLbl7,numLbl8,numLbl9,numLbl10,
            numLbl11,numLbl12,numLbl13,numLbl14,numLbl15
        ]
        
        // sab labels clear
        allLabels.forEach {
            $0?.text = ""
        }
        
        if selectedAge == "1 - 6 yrs" {
            
            let visibleViews = [
                viewBG1,
                viewBG2,
                viewBG3,
                viewBG4,
                viewBG5
            ]
            
            visibleViews.forEach {
                $0?.isHidden = false
            }
            
            // numLbl1 -> numLbl5 me 1..5
            let labels = [
                numLbl1,
                numLbl2,
                numLbl3,
                numLbl4,
                numLbl5
            ]
            
            for (index,label) in labels.enumerated() {
                label?.text = "\(index + 1)"
            }
            
        } else if selectedAge == "7 - 12 yrs" {
            
            let visibleViews = [
                viewBG5,
                viewBG6,
                viewBG7,
                viewBG8,
                viewBG9,
                viewBG10,
                viewBG11,
                viewBG12,
                viewBG13,
                viewBG14,
                viewBG15
            ]
            
            visibleViews.forEach {
                $0?.isHidden = false
            }
            
            
            let labels = [
                numLbl5,
                numLbl6,
                numLbl7,
                numLbl8,
                numLbl9,
                numLbl10,
                numLbl11,
                numLbl12,
                numLbl13,
                numLbl14,
                numLbl15
            ]
            
            for (index, label) in labels.enumerated() {
                label?.text = "\(index + 1)"
            }
        }
    }
    
    func updateResetVisibility() {

        let selectedAge =
        UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""

        var levelsToCheck:[Int] = []

        if selectedAge == "1 - 6 yrs" {

            levelsToCheck = [1,2,3,4,5]

        } else if selectedAge == "7 - 12 yrs" {

            levelsToCheck = [5,6,7,8,9,10,11,12,13,14,15]
        }

        let isAnyCompleted = levelsToCheck.contains {

            UserDefaults.standard.bool(
                forKey: "findTheNumberLevel\($0)Completed"
            )
        }

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
        updateLevelUI(level: 11, imageView: image11, label: label11)
        updateLevelUI(level: 12, imageView: image12, label: label12)
        updateLevelUI(level: 13, imageView: image13, label: label13)
        updateLevelUI(level: 14, imageView: image14, label: label14)
        updateLevelUI(level: 15, imageView: image15, label: label15)
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

    func openLevel(display:Int) {

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "FindNumberVC"
        ) as! FindNumberVC

        vc.levelNumber = 3

        let age = UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""

        if age == "7 - 12 yrs" {

            vc.displayLevel = display      // UI pe 1..11
            vc.actualLevel = display + 4   // save hoga 5..15

        } else {

            vc.displayLevel = display + 5
            vc.actualLevel = display + 5
        }

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
            withIdentifier: "FindNumberVC"
        ) as! FindNumberVC

        vc.levelNumber = 1
        vc.displayLevel = 1
        vc.actualLevel = 1     // ADD

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "FindNumberVC"
        ) as! FindNumberVC

        vc.levelNumber = 2
        vc.displayLevel = 2
        vc.actualLevel = 2     // ADD

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "FindNumberVC"
        ) as! FindNumberVC

        vc.levelNumber = 2
        vc.displayLevel = 3
        vc.actualLevel = 3     // ADD

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        let age = UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""

        if age == "1 - 6 yrs" {
            guard checkSubscription() else { return }
        }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "FindNumberVC"
        ) as! FindNumberVC

        vc.levelNumber = 2
        vc.displayLevel = 4
        vc.actualLevel = 4     // ADD

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        let age = UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""

        // 7–12 yrs -> viewBG5 pe Level 1 open hoga
        if age == "7 - 12 yrs" {

            openLevel(display: 1)
            return
        }

        // 1–6 yrs subscription
        if age == "1 - 6 yrs" {
            guard checkSubscription() else { return }
        }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "FindNumberVC"
        ) as! FindNumberVC

        vc.levelNumber = 2
        vc.displayLevel = 5

        // 👇 ye add karna hai
        vc.actualLevel = 5

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 2)
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 3)
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 4)
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 5)
    }

    @IBAction func level10TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 6)
    }

    @IBAction func level11TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 7)
    }

    @IBAction func level12TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 8)
    }

    @IBAction func level13TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 9)
    }

    @IBAction func level14TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 10)
    }

    @IBAction func level15TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        openLevel(display: 11)
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...15 {
            defaults.removeObject(
                forKey: "findTheNumberLevel\(i)Completed"
            )

            defaults.removeObject(
                forKey: "findTheNumberLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        // done images remove
        let images = [
            image1,image2,image3,image4,image5,
            image6,image7,image8,image9,image10,
            image11,image12,image13,image14,image15
        ]

        let labels = [
            label1,label2,label3,label4,label5,
            label6,label7,label8,label9,label10,
            label11,label12,label13,label14,label15
        ]

        images.forEach { $0?.image = nil }
        labels.forEach { $0?.text = "" }

        // lock wapas lagao
        setupSubscriptionLock()

        updateResetVisibility()
    }
    
    
}
