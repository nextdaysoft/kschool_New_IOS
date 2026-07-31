//
//  ListenVegetablesMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 02/03/26.
//

import UIKit

class ListenVegetablesMenuVC: BaseViewController {

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
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Onion",
            imageName: "onion"
        ),
        
        LearnPlanetsItem(
            text: "Ladyfinger",
            imageName: "ladyfinger"
        ),
        
        LearnPlanetsItem(
            text: "Spinach",
            imageName: "spinach"
        ),
        
        LearnPlanetsItem(
            text: "Potato",
            imageName: "potato"
        ),
        
        LearnPlanetsItem(
            text: "Cauliflower",
            imageName: "cauliflower"
        ),
        
        LearnPlanetsItem(
            text: "Brinjal",
            imageName: "brinjal"
        ),
        
        LearnPlanetsItem(
            text: "Peas",
            imageName: "greenPeas"
        ),
        
        LearnPlanetsItem(
            text: "Tomato",
            imageName: "tomato"
        ),
        
        LearnPlanetsItem(
            text: "Cabbage",
            imageName: "cabbage"
        ),
        
        LearnPlanetsItem(
            text: "Carrot",
            imageName: "carrot"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Beetroot",
            imageName: "beetroot"
        ),
        
        LearnPlanetsItem(
            text: "Radish",
            imageName: "radish"
        ),
        
        LearnPlanetsItem(
            text: "bitter gourd",
            imageName: "pear"
        ),
        
        LearnPlanetsItem(
            text: "Cucumber",
            imageName: "cucumber"
        ),
        
        LearnPlanetsItem(
            text: "Green Beans",
            imageName: "green beans"
        ),
        
        LearnPlanetsItem(
            text: "Coriander",
            imageName: "coriander"
        ),
        
        LearnPlanetsItem(
            text: "Capsicum",
            imageName: "capsicum"
        ),
        
        LearnPlanetsItem(
            text: "Bottle Gourd",
            imageName: "bottleGourd"
        ),
        
        LearnPlanetsItem(
            text: "Pumpkin",
            imageName: "pumpkin"
        ),
        
        LearnPlanetsItem(
            text: "Sweet Corn",
            imageName: "sweet_corn"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Broccoli",
            imageName: "broccoli"
        ),
        
        LearnPlanetsItem(
            text: "Sweet Potato",
            imageName: "sweet potato"
        ),
        
        LearnPlanetsItem(
            text: "Wax Beans",
            imageName: "wax_beans"
        ),
        
        LearnPlanetsItem(
            text: "Mint Leaf",
            imageName: "mintLeaf"
        ),
        
        LearnPlanetsItem(
            text: "spring onion",
            imageName: "spring_onion"
        ),
        
        LearnPlanetsItem(
            text: "Taro Root",
            imageName: "taroRoot"
        ),
        
        LearnPlanetsItem(
            text: "Ginger",
            imageName: "ginger"
        ),
        
        LearnPlanetsItem(
            text: "Garlic",
            imageName: "garlic"
        ),
        
        LearnPlanetsItem(
            text: "Fenugreek",
            imageName: "fenugreek"
        ),
        
        LearnPlanetsItem(
            text: "Green Chili",
            imageName: "greenChili"
        )
    ]
    
    let planets4: [LearnPlanetsItem] = [

        LearnPlanetsItem(
            text: "Yardlong Beans",
            imageName: "yardlong_beans"
        ),

        LearnPlanetsItem(
            text: "Ridge Gourd",
            imageName: "ridge_gourd"
        ),

        LearnPlanetsItem(
            text: "French Beans",
            imageName: "french_beans"
        ),

        LearnPlanetsItem(
            text: "Turnip",
            imageName: "turnip"
        ),

        LearnPlanetsItem(
            text: "Lotus Root",
            imageName: "lotus_root"
        ),

        LearnPlanetsItem(
            text: "Runner Beans",
            imageName: "runner_beans"
        ),

        LearnPlanetsItem(
            text: "Ash Gourd",
            imageName: "ash_gourd"
        ),

        LearnPlanetsItem(
            text: "Yam",
            imageName: "yam"
        ),

        LearnPlanetsItem(
            text: "Snake Gourd",
            imageName: "snake_gourd"
        ),

        LearnPlanetsItem(
            text: "Kohlrabi",
            imageName: "kohlrabi"
        )
    ]
    
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Bamboo Shoots",
            imageName: "bamboo_shoots"
        ),
        
        LearnPlanetsItem(
            text: "Pointed Gourd",
            imageName: "pointed_gourd"
        ),
        
        LearnPlanetsItem(
            text: "Pigeon Peas",
            imageName: "pigeon_peas"
        ),
        
        LearnPlanetsItem(
            text: "Soyabean",
            imageName: "soyabean"
        ),
        
        LearnPlanetsItem(
            text: "Button Mushroom",
            imageName: "button_mushroom"
        ),
        
        LearnPlanetsItem(
            text: "Banana Flower",
            imageName: "banana_flower"
        ),
        
        LearnPlanetsItem(
            text: "Artichoke",
            imageName: "artichoke"
        ),
        
        LearnPlanetsItem(
            text: "Green Chickpeas",
            imageName: "green_chickpeas"
        ),
        
        LearnPlanetsItem(
            text: "Jicama",
            imageName: "jicama"
        ),
        
        LearnPlanetsItem(
            text: "Drumstick (Moringa Pods)",
            imageName: "drumstick"
        )
    ]
    
    
    let planets6: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Yellow Squash",
            imageName: "yellow_squash"
        ),
        
        LearnPlanetsItem(
            text: "Banana Stem",
            imageName: "banana_stem"
        ),
        
        LearnPlanetsItem(
            text: "Celeriac",
            imageName: "celeriac"
        ),
        
        LearnPlanetsItem(
            text: "Oyster Mushroom",
            imageName: "oyster_mushroom"
        ),
        
        LearnPlanetsItem(
            text: "Apple Gourd",
            imageName: "apple_gourd"
        ),
        
        LearnPlanetsItem(
            text: "Ivy Gourd",
            imageName: "ivy_gourd"
        ),
        
        LearnPlanetsItem(
            text: "Kale",
            imageName: "kale"
        ),
        
        LearnPlanetsItem(
            text: "Chayote",
            imageName: "chayote"
        ),
        
        LearnPlanetsItem(
            text: "Zucchini",
            imageName: "zucchini"
        ),
        
        LearnPlanetsItem(
            text: "Water Chestnut",
            imageName: "water_chestnut"
        )
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
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "listenVegetablesLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "listenVegetablesLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "listenVegetablesLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "listenVegetablesLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "listenVegetablesLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "listenVegetablesLevel6Completed")
           
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
        let completedKey = "listenVegetablesLevel\(level)Completed"
        
        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
        } else {
            imageView.image = nil  // Explicitly set to nil when not completed
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenVegetablesShowVC") as! ListenVegetablesShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenVegetablesShowVC") as! ListenVegetablesShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenVegetablesShowVC") as! ListenVegetablesShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenVegetablesShowVC") as! ListenVegetablesShowVC
        vc.planets = planets4
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenVegetablesShowVC") as! ListenVegetablesShowVC
        vc.planets = planets5
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenVegetablesShowVC") as! ListenVegetablesShowVC
        vc.planets = planets6
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        // Clear all level completion flags
        for i in 1...6 {
            defaults.set(false, forKey: "listenVegetablesLevel\(i)Completed")
            // Or use removeObject (both work)
            // defaults.removeObject(forKey: "listenVegetablesLevel\(i)Completed")
        }
        
        // Force UserDefaults to save immediately
        defaults.synchronize()
        
        // Add a small delay to ensure UserDefaults is updated
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            // Update all image views to remove the "done" images
            self?.image1.image = nil
            self?.image2.image = nil
            self?.image3.image = nil
            self?.image4.image = nil
            self?.image5.image = nil
            self?.image6.image = nil
            
            // Also call your existing methods for consistency
            self?.updateLevelImages()
            self?.updateResetVisibility()
        }
    }
    
}
