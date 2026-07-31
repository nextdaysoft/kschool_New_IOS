//
//  ListenHealthyFoodHabitsLevelsMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 30/01/26.
//

import UIKit
import LanguageManager_iOS

class ListenHealthyFoodHabitsLevelsMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
   
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
   
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
 
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    let planets1: [LearnPlanetsItem] = [

        LearnPlanetsItem(text: "Listen and Learn".localiz(), imageName: "listenlearn"),

        LearnPlanetsItem(text: "Be thankful for your food".localiz(), imageName: "ThankYou"),
        LearnPlanetsItem(text: "Never skip your breakfast".localiz(), imageName: "breakfast"),
        LearnPlanetsItem(text: "Keep your plate clean".localiz(), imageName: "WashingDishes"),
        LearnPlanetsItem(text: "Drink plenty of water".localiz(), imageName: "drink-water"),
        LearnPlanetsItem(text: "Avoid too much junk food".localiz(), imageName: "NoJunkFood"),
        LearnPlanetsItem(text: "Eat fresh fruits every day".localiz(), imageName: "EatingApple"),
        LearnPlanetsItem(text: "Share your food with friends".localiz(), imageName: "SharingFood"),
        LearnPlanetsItem(text: "Chew food properly".localiz(), imageName: "EatingApple"),
        LearnPlanetsItem(text: "Brush your teeth after eating".localiz(), imageName: "BrushingTeeth"),
        LearnPlanetsItem(text: "Wash hands before and after eating".localiz(), imageName: "washyourhands")
    ]

    let planets2: [LearnPlanetsItem] = [

        LearnPlanetsItem(text: "Listen and Learn".localiz(), imageName: "listenlearn"),

        LearnPlanetsItem(text: "Say no to cold drinks".localiz(), imageName: "NoJunkFood"),
        LearnPlanetsItem(text: "Always cover your food".localiz(), imageName: "room-service"),
        LearnPlanetsItem(text: "Eat small meals often".localiz(), imageName: "EatingApple"),
        LearnPlanetsItem(text: "Drink milk to grow strong".localiz(), imageName: "milk"),
        LearnPlanetsItem(text: "Eat with family happily".localiz(), imageName: "dinner-table"),
        LearnPlanetsItem(text: "Eat slowly and calmly".localiz(), imageName: "eatingNew"),
        LearnPlanetsItem(text: "Eat green vegetables daily".localiz(), imageName: "freshVegetable"),
        LearnPlanetsItem(text: "Use a napkin or handkerchief".localiz(), imageName: "sick-person"),
        LearnPlanetsItem(text: "Sleep early to stay healthy".localiz(), imageName: "bedtime"),
        LearnPlanetsItem(text: "Play and exercise every day".localiz(), imageName: "exerciseNew")
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
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        for i in 1...2 {
            print("Level \(i) Completed:",
                  UserDefaults.standard.bool(forKey: "listenHealthyFoodHabitsLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
        applyTheme()
    }
    
    
    func applyTheme() {

        let bgViews = [
            viewBG1,
            viewBG2
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            bgViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            bgViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }
    }
    
    func updateResetVisibility() {

        let levelData = UserDefaults.standard.dictionary(forKey: "listenHealthyFoodHabitsData") as? [String: Int]

        let isAnyCompleted = !(levelData?.isEmpty ?? true)

        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView) {

        let levelData = UserDefaults.standard.dictionary(forKey: "listenHealthyFoodHabitsData") as? [String: Int] ?? [:]

        if levelData["\(level)"] != nil {
            imageView.image = UIImage(named: "done")
        } else {
            imageView.image = nil
        }
    }
    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)
       
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenHealthyFoodHabitsLevel1VC") as! ListenHealthyFoodHabitsLevel1VC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenHealthyFoodHabitsLevel1VC") as! ListenHealthyFoodHabitsLevel1VC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        // 🔥 remove whole level data dictionary
        defaults.removeObject(forKey: "listenHealthyFoodHabitsData")
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
