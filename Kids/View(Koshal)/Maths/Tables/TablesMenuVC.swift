//
//  TablesMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 20/04/26.
//

import UIKit

class TablesMenuVC: BaseViewController {

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
    @IBOutlet weak var image16: UIImageView!
    @IBOutlet weak var image17: UIImageView!
    @IBOutlet weak var image18: UIImageView!
    @IBOutlet weak var image19: UIImageView!
    @IBOutlet weak var image20: UIImageView!
    
  
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
    @IBOutlet weak var label16: UILabel!
    @IBOutlet weak var label17: UILabel!
    @IBOutlet weak var label18: UILabel!
    @IBOutlet weak var label19: UILabel!
    @IBOutlet weak var label20: UILabel!
 
 
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
    @IBOutlet weak var view16: UIView!
    @IBOutlet weak var view17: UIView!
    @IBOutlet weak var view18: UIView!
    @IBOutlet weak var view19: UIView!
    @IBOutlet weak var view20: UIView!
    
  
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
    @IBOutlet weak var viewBG16: UIView!
    @IBOutlet weak var viewBG17: UIView!
    @IBOutlet weak var viewBG18: UIView!
    @IBOutlet weak var viewBG19: UIView!
    @IBOutlet weak var viewBG20: UIView!
  
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

        view16.layer.borderColor = UIColor.black.cgColor
        view16.layer.borderWidth = 1
        view16.layer.cornerRadius = 20
        view16.clipsToBounds = true

        view17.layer.borderColor = UIColor.black.cgColor
        view17.layer.borderWidth = 1
        view17.layer.cornerRadius = 20
        view17.clipsToBounds = true

        view18.layer.borderColor = UIColor.black.cgColor
        view18.layer.borderWidth = 1
        view18.layer.cornerRadius = 20
        view18.clipsToBounds = true

        view19.layer.borderColor = UIColor.black.cgColor
        view19.layer.borderWidth = 1
        view19.layer.cornerRadius = 20
        view19.clipsToBounds = true

        view20.layer.borderColor = UIColor.black.cgColor
        view20.layer.borderWidth = 1
        view20.layer.cornerRadius = 20
        view20.clipsToBounds = true

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
        viewBG16.layer.cornerRadius = 10
        viewBG17.layer.cornerRadius = 10
        viewBG18.layer.cornerRadius = 10
        viewBG19.layer.cornerRadius = 10
        viewBG20.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
        
        updateLevelImages()
        setupSubscriptionLock()
        updateResetVisibility()
    }
    
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        let lockImage = UIImage(named: "lock")

        let levelImages: [(Int, UIImageView?)] = [
            (4,image4),(5,image5),(6,image6),(7,image7),
            (8,image8),(9,image9),(10,image10),(11,image11),
            (12,image12),(13,image13),(14,image14),
            (15,image15),(16,image16),(17,image17),
            (18,image18),(19,image19),(20,image20)
        ]

        let levelData =
        UserDefaults.standard.dictionary(
            forKey: "tablesLevelData"
        ) as? [String:Int] ?? [:]

        for (level,imageView) in levelImages {

            let completed =
            levelData["\(level)"] != nil

            if completed {

                // done always priority
                imageView?.image =
                UIImage(named: "done")

            } else {

                imageView?.image =
                subscribed ? nil : lockImage
            }
        }


        let views = [
            viewBG4,viewBG5,viewBG6,viewBG7,
            viewBG8,viewBG9,viewBG10,viewBG11,
            viewBG12,viewBG13,viewBG14,
            viewBG15,viewBG16,viewBG17,
            viewBG18,viewBG19,viewBG20
        ]

        let whiteTheme = UserDefaults.standard.bool(forKey: "WhiteTheme")

        views.forEach {

            if subscribed {

                $0?.backgroundColor = whiteTheme
                    ? .white
                    : ColorManager.randomColor()

            } else {

                $0?.backgroundColor = .systemGray4
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
    
    func updateLevelUI(
        level: Int,
        imageView: UIImageView,
        label: UILabel
    ) {

        let levelData =
        UserDefaults.standard.dictionary(
            forKey: "tablesLevelData"
        ) as? [String:Int] ?? [:]

        if let percentage = levelData["\(level)"] {

            imageView.image = UIImage(named: "done")
            label.text = "\(percentage)%"

        } else {

            imageView.image = nil
            label.text = ""
        }
    }
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "tablesLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel6Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel7Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel8Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel9Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel10Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel11Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel12Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel13Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel14Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel15Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel16Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel17Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel18Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel19Completed") ||
            UserDefaults.standard.bool(forKey: "tablesLevel20Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelImages() {

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
        updateLevelUI(level: 16, imageView: image16, label: label16)
        updateLevelUI(level: 17, imageView: image17, label: label17)
        updateLevelUI(level: 18, imageView: image18, label: label18)
        updateLevelUI(level: 19, imageView: image19, label: label19)
        updateLevelUI(level: 20, imageView: image20, label: label20)
    }
    
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
    }

    func applyTheme() {

        let whiteTheme = UserDefaults.standard.bool(forKey: "WhiteTheme")

        let freeViews = [
            viewBG2,
            viewBG3
        ]

        if whiteTheme {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            freeViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            freeViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
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
        
        // Text right side + icon right
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    func openTable(number: Int) {

        if number >= 4 {
            guard checkSubscription() else { return }
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "TablesVC"
        ) as? TablesVC {

            vc.currentTable = number
            vc.table = "\(number) Table"

            navigationController?.pushViewController(
                vc,
                animated: true
            )
        }
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) { openTable(number: 2) }
    @IBAction func level3TapBtn(_ sender: UIButton) { openTable(number: 3) }
    @IBAction func level4TapBtn(_ sender: UIButton) { openTable(number: 4) }
    @IBAction func level5TapBtn(_ sender: UIButton) { openTable(number: 5) }
    @IBAction func level6TapBtn(_ sender: UIButton) { openTable(number: 6) }
    @IBAction func level7TapBtn(_ sender: UIButton) { openTable(number: 7) }
    @IBAction func level8TapBtn(_ sender: UIButton) { openTable(number: 8) }
    @IBAction func level9TapBtn(_ sender: UIButton) { openTable(number: 9) }
    @IBAction func level10TapBtn(_ sender: UIButton) { openTable(number: 10) }
    @IBAction func level11TapBtn(_ sender: UIButton) { openTable(number: 11) }
    @IBAction func level12TapBtn(_ sender: UIButton) { openTable(number: 12) }
    @IBAction func level13TapBtn(_ sender: UIButton) { openTable(number: 13) }
    @IBAction func level14TapBtn(_ sender: UIButton) { openTable(number: 14) }
    @IBAction func level15TapBtn(_ sender: UIButton) { openTable(number: 15) }
    @IBAction func level16TapBtn(_ sender: UIButton) { openTable(number: 16) }
    @IBAction func level17TapBtn(_ sender: UIButton) { openTable(number: 17) }
    @IBAction func level18TapBtn(_ sender: UIButton) { openTable(number: 18) }
    @IBAction func level19TapBtn(_ sender: UIButton) { openTable(number: 19) }
    @IBAction func level20TapBtn(_ sender: UIButton) { openTable(number: 20) }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 2...20 {
            defaults.removeObject(
                forKey: "tablesLevel\(i)Completed"
            )
        }

        defaults.removeObject(
            forKey: "tablesLevelData"
        )

        defaults.synchronize()

        // reset done/percentage
        updateLevelImages()

        // lock images restore
        setupSubscriptionLock()

        updateResetVisibility()
    }
    
}
