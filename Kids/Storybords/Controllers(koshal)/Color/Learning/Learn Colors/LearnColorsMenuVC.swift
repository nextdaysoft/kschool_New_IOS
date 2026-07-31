//
//  LearnColorsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 31/03/26.
//
struct LearnColorItem {
    let name: String
    let color: UIColor
}

import UIKit

class LearnColorsMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    let colors1: [LearnColorItem] = [
        LearnColorItem(name: "Purple", color: .systemPurple),
        LearnColorItem(name: "Brown", color: .brown),
        LearnColorItem(name: "Cyan", color: .cyan),
        LearnColorItem(name: "Dark Grey", color: .darkGray),
        LearnColorItem(name: "Red", color: .red),
        LearnColorItem(name: "Orange", color: .orange),
        LearnColorItem(name: "Green", color: .green),
        LearnColorItem(name: "Yellow", color: .yellow),
        LearnColorItem(name: "Pink", color: .systemPink),
        LearnColorItem(name: "Blue", color: .blue)
    ]
    
    let colors2: [LearnColorItem] = [
        LearnColorItem(name: "Gold", color: UIColor(red: 212/255, green: 175/255, blue: 55/255, alpha: 1)),
        LearnColorItem(name: "Chocolate", color: UIColor(red: 123/255, green: 63/255, blue: 0/255, alpha: 1)),
        LearnColorItem(name: "Silver", color: .lightGray),
        LearnColorItem(name: "Indigo", color: UIColor(red: 75/255, green: 0/255, blue: 130/255, alpha: 1)),
        LearnColorItem(name: "Maroon", color: UIColor(red: 128/255, green: 0/255, blue: 0/255, alpha: 1)),
        LearnColorItem(name: "Sky Blue", color: UIColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1)),
        LearnColorItem(name: "Olive", color: UIColor(red: 128/255, green: 128/255, blue: 0/255, alpha: 1)),
        LearnColorItem(name: "Grey", color: .gray),
        LearnColorItem(name: "Magenta", color: .magenta),
        LearnColorItem(name: "Turquoise", color: UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1))
    ]
    
    let colors3: [LearnColorItem] = [
        LearnColorItem(name: "Crimson", color: UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)),
        LearnColorItem(name: "Teal", color: UIColor(red: 0/255, green: 128/255, blue: 128/255, alpha: 1)),
        LearnColorItem(name: "Violet", color: UIColor(red: 238/255, green: 130/255, blue: 238/255, alpha: 1)),
        LearnColorItem(name: "Steel Blue", color: UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)),
        LearnColorItem(name: "Coral", color: UIColor(red: 255/255, green: 127/255, blue: 80/255, alpha: 1)),
        LearnColorItem(name: "Lime", color: UIColor(red: 50/255, green: 205/255, blue: 50/255, alpha: 1)),
        LearnColorItem(name: "Forest", color: UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1)),
        LearnColorItem(name: "Beige", color: UIColor(red: 245/255, green: 245/255, blue: 220/255, alpha: 1)),
        LearnColorItem(name: "Tan", color: UIColor(red: 210/255, green: 180/255, blue: 140/255, alpha: 1)),
        LearnColorItem(name: "Brick", color: UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1))
    ]
    
    let colors4: [LearnColorItem] = [
        LearnColorItem(name: "Mustard", color: UIColor(red: 255/255, green: 219/255, blue: 88/255, alpha: 1)),
        LearnColorItem(name: "Sand", color: UIColor(red: 194/255, green: 178/255, blue: 128/255, alpha: 1)),
        LearnColorItem(name: "Mint", color: UIColor(red: 152/255, green: 255/255, blue: 152/255, alpha: 1)),
        LearnColorItem(name: "Lavender", color: UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)),
        LearnColorItem(name: "Rose", color: UIColor(red: 255/255, green: 102/255, blue: 204/255, alpha: 1)),
        LearnColorItem(name: "Ruby", color: UIColor(red: 224/255, green: 17/255, blue: 95/255, alpha: 1)),
        LearnColorItem(name: "Aqua", color: UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1)),
        LearnColorItem(name: "Plum", color: UIColor(red: 142/255, green: 69/255, blue: 133/255, alpha: 1)),
        LearnColorItem(name: "Slate", color: UIColor(red: 112/255, green: 128/255, blue: 144/255, alpha: 1)),
        LearnColorItem(name: "Peach", color: UIColor(red: 255/255, green: 218/255, blue: 185/255, alpha: 1))
    ]
    
    let colors5: [LearnColorItem] = [
        LearnColorItem(name: "Charcoal", color: UIColor(red: 54/255, green: 69/255, blue: 79/255, alpha: 1)),
        LearnColorItem(name: "Blush", color: UIColor(red: 222/255, green: 93/255, blue: 131/255, alpha: 1)),
        LearnColorItem(name: "Copper", color: UIColor(red: 184/255, green: 115/255, blue: 51/255, alpha: 1)),
        LearnColorItem(name: "Lemon", color: UIColor(red: 255/255, green: 247/255, blue: 0/255, alpha: 1)),
        LearnColorItem(name: "Ivory", color: UIColor(red: 238/255, green: 232/255, blue: 200/255, alpha: 1)),
        LearnColorItem(name: "Denim", color: UIColor(red: 21/255, green: 96/255, blue: 189/255, alpha: 1)),
        LearnColorItem(name: "Amber", color: UIColor(red: 255/255, green: 191/255, blue: 0/255, alpha: 1)),
        LearnColorItem(name: "Emerald", color: UIColor(red: 80/255, green: 200/255, blue: 120/255, alpha: 1)),
        LearnColorItem(name: "Cream", color: UIColor(red: 255/255, green: 253/255, blue: 208/255, alpha: 1)),
        LearnColorItem(name: "Periwinkle", color: UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 1))
    ]
    
    let colors6: [LearnColorItem] = [
        LearnColorItem(name: "Rust", color: UIColor(red: 183/255, green: 65/255, blue: 14/255, alpha: 1)),
        LearnColorItem(name: "Ice Blue", color: UIColor(red: 207/255, green: 226/255, blue: 243/255, alpha: 1)),
        LearnColorItem(name: "Smoke", color: UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)),
        LearnColorItem(name: "Moss", color: UIColor(red: 138/255, green: 154/255, blue: 91/255, alpha: 1)),
        LearnColorItem(name: "Eggplant", color: UIColor(red: 97/255, green: 64/255, blue: 81/255, alpha: 1)),
        LearnColorItem(name: "Honey", color: UIColor(red: 240/255, green: 196/255, blue: 25/255, alpha: 1)),
        LearnColorItem(name: "Midnight Blue", color: UIColor(red: 25/255, green: 25/255, blue: 112/255, alpha: 1)),
        LearnColorItem(name: "Deep Teal", color: UIColor(red: 0/255, green: 105/255, blue: 92/255, alpha: 1)),
        LearnColorItem(name: "Sea Green", color: UIColor(red: 46/255, green: 139/255, blue: 87/255, alpha: 1)),
        LearnColorItem(name: "Smoky Pink", color: UIColor(red: 204/255, green: 153/255, blue: 153/255, alpha: 1))
    ]
    
    var didTapLockedLevel = false
    
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

        view5.layer.borderColor = UIColor.black.cgColor
        view5.layer.borderWidth = 1
        view5.layer.cornerRadius = 20
        view5.clipsToBounds = true
        
        view6.layer.borderColor = UIColor.black.cgColor
        view6.layer.borderWidth = 1
        view6.layer.cornerRadius = 20
        view6.clipsToBounds = true
        
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor
       

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor
     

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()
        viewBG3.layer.borderColor = UIColor.black.cgColor
     

        viewBG4.layer.cornerRadius = 10
        viewBG4.backgroundColor = ColorManager.randomColor()
        viewBG4.layer.borderColor = UIColor.black.cgColor

        viewBG5.layer.cornerRadius = 10
        viewBG5.backgroundColor = ColorManager.randomColor()
        viewBG5.layer.borderColor = UIColor.black.cgColor
    
        viewBG6.layer.cornerRadius = 10
        viewBG6.backgroundColor = ColorManager.randomColor()
        viewBG6.layer.borderColor = UIColor.black.cgColor
   
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSubscriptionLock()
        updateLevelImages()
        updateResetVisibility()
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        if subscribed {

            viewBG3.backgroundColor = ColorManager.randomColor()
            viewBG4.backgroundColor = ColorManager.randomColor()
            viewBG5.backgroundColor = ColorManager.randomColor()
            viewBG6.backgroundColor = ColorManager.randomColor()

        } else {

            viewBG3.backgroundColor = .systemGray4
            viewBG4.backgroundColor = .systemGray4
            viewBG5.backgroundColor = .systemGray4
            viewBG6.backgroundColor = .systemGray4
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
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "learnColorsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "learnColorsLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "learnColorsLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "learnColorsLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "learnColorsLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "learnColorsLevel6Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)
        updateLevelUI(level: 3, imageView: image3)
        updateLevelUI(level: 4, imageView: image4)
        updateLevelUI(level: 5, imageView: image5)
        updateLevelUI(level: 6, imageView: image6)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView) {

        let completed = UserDefaults.standard.bool(
            forKey: "learnColorsLevel\(level)Completed"
        )

        // ✅ Completed level -> Done
        if completed {
            imageView.image = UIImage(named: "done")
            return
        }

        // ✅ Level 1 & 2
        if level <= 2 {
            imageView.image = nil
            return
        }

        // ✅ Level 3-6
        if SubscriptionManager.shared.isSubscribed() {
            imageView.image = nil
        } else {
            imageView.image = UIImage(named: "lock")
        }
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
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnColorsShowVC") as! LearnColorsShowVC
        vc.colors = colors1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnColorsShowVC") as! LearnColorsShowVC
        vc.colors = colors2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "LearnColorsShowVC"
        ) as! LearnColorsShowVC

        vc.colors = colors3
        vc.levelNumber = 3

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "LearnColorsShowVC"
        ) as! LearnColorsShowVC

        vc.colors = colors4
        vc.levelNumber = 4

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "LearnColorsShowVC"
        ) as! LearnColorsShowVC

        vc.colors = colors5
        vc.levelNumber = 5

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "LearnColorsShowVC"
        ) as! LearnColorsShowVC

        vc.colors = colors6
        vc.levelNumber = 6

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...6 {
            defaults.removeObject(
                forKey: "learnColorsLevel\(i)Completed"
            )
        }

        defaults.synchronize()

        setupSubscriptionLock()
        updateLevelImages()
        updateResetVisibility()
    }
    
}
