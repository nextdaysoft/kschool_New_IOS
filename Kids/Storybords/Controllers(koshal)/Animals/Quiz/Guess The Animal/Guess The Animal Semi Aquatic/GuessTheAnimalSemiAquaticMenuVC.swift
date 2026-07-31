//
//  GuessTheAnimalSemiAquaticMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalSemiAquaticMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
   
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!

  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    
    let level1Birds: [BirdQuestions] = [
        BirdQuestions(name: "Mink", imageName: "mink"),
        BirdQuestions(name: "Capybara", imageName: "capybara"),
        BirdQuestions(name: "Platypus", imageName: "platypus_and_baby"),
        BirdQuestions(name: "Crocodile", imageName: "crocodile_semi"),
        BirdQuestions(name: "Water Deer", imageName: "water_deer"),
        BirdQuestions(name: "Beaver", imageName: "beaver"),
        BirdQuestions(name: "Water Vole", imageName: "water_vole"),
        BirdQuestions(name: "Water Buffalo", imageName: "water_buffalo"),
        BirdQuestions(name: "Muskrat", imageName: "muskrat"),
        BirdQuestions(name: "Sea Otter", imageName: "sea_otter")
    ]
    
    let level2Birds: [BirdQuestions] = [
        BirdQuestions(name: "Elephant Seal", imageName: "elephant_seal"),
        BirdQuestions(name: "Walrus", imageName: "walrus"),
        BirdQuestions(name: "Snapping Turtle", imageName: "snapping_turtle"),
        BirdQuestions(name: "Fishing Eagle", imageName: "fishing_eagle"),
        BirdQuestions(name: "Mudskipper", imageName: "mudskipper"),
        BirdQuestions(name: "Marine Iguana", imageName: "marine_iguana"),
        BirdQuestions(name: "Water Python", imageName: "water_python"),
        BirdQuestions(name: "Anaconda", imageName: "anaconda"),
        BirdQuestions(name: "Softshell Turtle", imageName: "softshell_turtle"),
        BirdQuestions(name: "Painted Turtle", imageName: "painted_turtle")
    ]
    
    let level3Birds: [BirdQuestions] = [
        BirdQuestions(name: "Hermit Crab", imageName: "hermit_crab"),
        BirdQuestions(name: "Hippopotamus", imageName: "hippo_and_baby"),
        BirdQuestions(name: "Polar Bear", imageName: "polar_bear_and_baby"),
        BirdQuestions(name: "Seal", imageName: "seal"),
        BirdQuestions(name: "Water Monitor", imageName: "water_monitor"),
        BirdQuestions(name: "Raccoon", imageName: "raccoon_and_baby"),
        BirdQuestions(name: "Bush Dog", imageName: "bush_dog_and_baby"),
        BirdQuestions(name: "Horseshoe Crab", imageName: "horseshoe_crab"),
        BirdQuestions(name: "Fishing Cat", imageName: "fishing_cat"),
        BirdQuestions(name: "Water Skink", imageName: "water_skink")
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
        
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor
        

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor
        

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()
        viewBG3.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "guessTheAnimalSemiAquaticLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalSemiAquaticLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalSemiAquaticLevel3Completed")
           
           
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "guessTheAnimalSemiAquaticLevel\(level)Completed"
        let percentageKey = "guessTheAnimalSemiAquaticLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalSemiAquaticShowVC") as! GuessTheAnimalSemiAquaticShowVC
        vc.birds = level1Birds
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalSemiAquaticShowVC") as! GuessTheAnimalSemiAquaticShowVC
        vc.birds = level2Birds
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalSemiAquaticShowVC") as! GuessTheAnimalSemiAquaticShowVC
        vc.birds = level3Birds
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...3 {
            defaults.removeObject(forKey: "guessTheAnimalSemiAquaticLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalSemiAquaticLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
