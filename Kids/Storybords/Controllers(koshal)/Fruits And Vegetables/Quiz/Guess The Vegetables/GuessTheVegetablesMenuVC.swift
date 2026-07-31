//
//  GuessTheVegetablesMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 02/03/26.
//

import UIKit

class GuessTheVegetablesMenuVC: BaseViewController {

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
    
    let level1fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Onion", imageName: "onion"),
        FruitsQuestions(name: "Ladyfinger", imageName: "ladyfinger"),
        FruitsQuestions(name: "Spinach", imageName: "spinach"),
        FruitsQuestions(name: "Potato", imageName: "potato"),
        FruitsQuestions(name: "Cauliflower", imageName: "cauliflower"),
        FruitsQuestions(name: "Brinjal", imageName: "brinjal"),
        FruitsQuestions(name: "Peas", imageName: "greenPeas"),
        FruitsQuestions(name: "Tomato", imageName: "tomato"),
        FruitsQuestions(name: "Cabbage", imageName: "cabbage"),
        FruitsQuestions(name: "Carrot", imageName: "carrot")
    ]
    
    let level2fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Beetroot", imageName: "beetroot"),
        FruitsQuestions(name: "Radish", imageName: "radish"),
        FruitsQuestions(name: "bitter gourd", imageName: "bitter gourd"),
        FruitsQuestions(name: "Cucumber", imageName: "cucumber"),
        FruitsQuestions(name: "Green Beans", imageName: "green beans"),
        FruitsQuestions(name: "Coriander", imageName: "coriander"),
        FruitsQuestions(name: "Capsicum", imageName: "capsicum"),
        FruitsQuestions(name: "Bottle Gourd", imageName: "bottleGourd"),
        FruitsQuestions(name: "Pumpkin", imageName: "pumpkin"),
        FruitsQuestions(name: "Sweet Corn", imageName: "sweet_corn")
    ]
    
    let level3fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Broccoli", imageName: "broccoli"),
        FruitsQuestions(name: "Sweet Potato", imageName: "sweet potato"),
        FruitsQuestions(name: "Wax Beans", imageName: "wax_beans"),
        FruitsQuestions(name: "Mint Leaf", imageName: "mintLeaf"),
        FruitsQuestions(name: "spring onion", imageName: "spring_onion"),
        FruitsQuestions(name: "Taro Root", imageName: "taroRoot"),
        FruitsQuestions(name: "Ginger", imageName: "ginger"),
        FruitsQuestions(name: "Garlic", imageName: "garlic"),
        FruitsQuestions(name: "Fenugreek", imageName: "fenugreek"),
        FruitsQuestions(name: "Green Chili", imageName: "greenChili")
    ]
    
    let level4fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Yardlong Beans", imageName: "yardlong_beans"),
        FruitsQuestions(name: "Ridge Gourd", imageName: "ridge_gourd"),
        FruitsQuestions(name: "French Beans", imageName: "french_beans"),
        FruitsQuestions(name: "Turnip", imageName: "turnip"),
        FruitsQuestions(name: "Lotus Root", imageName: "lotus_root"),
        FruitsQuestions(name: "Runner Beans", imageName: "runner_beans"),
        FruitsQuestions(name: "Ash Gourd", imageName: "ash_gourd"),
        FruitsQuestions(name: "Yam", imageName: "yam"),
        FruitsQuestions(name: "Snake Gourd", imageName: "snake_gourd"),
        FruitsQuestions(name: "Kohlrabi", imageName: "kohlrabi")
    ]
    
    let level5fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Bamboo Shoots", imageName: "bamboo_shoots"),
        FruitsQuestions(name: "Pointed Gourd", imageName: "pointed_gourd"),
        FruitsQuestions(name: "Pigeon Peas", imageName: "pigeon_peas"),
        FruitsQuestions(name: "Soyabean", imageName: "soyabean"),
        FruitsQuestions(name: "Button Mushroom", imageName: "button_mushroom"),
        FruitsQuestions(name: "Banana Flower", imageName: "banana_flower"),
        FruitsQuestions(name: "Artichoke", imageName: "artichoke"),
        FruitsQuestions(name: "Green Chickpeas", imageName: "green_chickpeas"),
        FruitsQuestions(name: "Jicama", imageName: "jicama"),
        FruitsQuestions(name: "Drumstick (Moringa Pods)", imageName: "drumstick")
    ]
    
    let level6fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Yellow Squash", imageName: "yellow_squash"),
        FruitsQuestions(name: "Banana Stem", imageName: "banana_stem"),
        FruitsQuestions(name: "Celeriac", imageName: "celeriac"),
        FruitsQuestions(name: "Oyster Mushroom", imageName: "oyster_mushroom"),
        FruitsQuestions(name: "Apple Gourd", imageName: "apple_gourd"),
        FruitsQuestions(name: "Ivy Gourd", imageName: "ivy_gourd"),
        FruitsQuestions(name: "Kale", imageName: "kale"),
        FruitsQuestions(name: "Chayote", imageName: "chayote"),
        FruitsQuestions(name: "Zucchini", imageName: "zucchini"),
        FruitsQuestions(name: "Water Chestnut", imageName: "water_chestnut")
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
        
        
        for i in 1...6 {
            print("Level \(i) Completed:",
                  UserDefaults.standard.bool(forKey: "guessTheVegetablesLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheVegetablesData") as? [String: Int]

        let isAnyCompleted = !(levelData?.isEmpty ?? true)

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
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheVegetablesData") as? [String: Int] ?? [:]

        if let percentage = levelData["\(level)"] {
            imageView.image = UIImage(named: "done")
            label.text = "\(percentage)%"
        } else {
            imageView.image = nil
            label.text = ""
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheVegetablesShowVC") as! GuessTheVegetablesShowVC
        vc.fruits = level1fruits
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheVegetablesShowVC") as! GuessTheVegetablesShowVC
        vc.fruits = level2fruits
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheVegetablesShowVC") as! GuessTheVegetablesShowVC
        vc.fruits = level3fruits
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheVegetablesShowVC") as! GuessTheVegetablesShowVC
        vc.fruits = level4fruits
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheVegetablesShowVC") as! GuessTheVegetablesShowVC
        vc.fruits = level5fruits
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheVegetablesShowVC") as! GuessTheVegetablesShowVC
        vc.fruits = level6fruits
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "guessTheVegetablesData")
        updateLevelImages()
        updateResetVisibility()
    }
    
}
