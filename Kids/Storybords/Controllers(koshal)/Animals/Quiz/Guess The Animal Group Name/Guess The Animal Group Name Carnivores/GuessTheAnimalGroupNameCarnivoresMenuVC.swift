//
//  GuessTheAnimalGroupNameCarnivoresMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalGroupNameCarnivoresMenuVC: BaseViewController {

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
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
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
    
    
    var level1Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Jaguar's group is called...?",
            options: ["Prowl", "Pack", "Pride", "Leap"],
            correctAnswer: "Prowl",
            imageName: "jaguar_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Mountain Lion's group is called...?",
            options: ["Pride", "Pack", "Coalition", "Leap"],
            correctAnswer: "Pride",
            imageName: "mountain_lion_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Cheetah's group is called...?",
            options: ["Coalition", "Pack", "Pride", "Claw"],
            correctAnswer: "Coalition",
            imageName: "cheetah_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Wolf's group is called...?",
            options: ["Pack", "Pride", "Coalition", "Leap"],
            correctAnswer: "Pack",
            imageName: "wolf_and_pup"
        ),

        BabyAnimalQuestion(
            question: "Panther's group is called...?",
            options: ["Claw", "Pack", "Pride", "Leap"],
            correctAnswer: "Claw",
            imageName: "panther_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Lion's group is called...?",
            options: ["Pride", "Pack", "Coalition", "Leap"],
            correctAnswer: "Pride",
            imageName: "lion_and_cub"
        ),

        BabyAnimalQuestion(
            question: "Eurasian Lynx's group is called...?",
            options: ["Chain", "Pack", "Pride", "Leap"],
            correctAnswer: "Chain",
            imageName: "eurasian_lynx_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Tiger's group is called...?",
            options: ["Ambush", "Pack", "Pride", "Coalition"],
            correctAnswer: "Ambush",
            imageName: "tiger_and_cub"
        ),

        BabyAnimalQuestion(
            question: "Leopard's group is called...?",
            options: ["Leap", "Pack", "Pride", "Coalition"],
            correctAnswer: "Leap",
            imageName: "leopard_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Snow Leopard's group is called...?",
            options: ["Leap", "Pack", "Pride", "Coalition"],
            correctAnswer: "Leap",
            imageName: "snow_leopard_and_baby"
        )
    ]
    
    
    var level2Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Marbled Cat's group is called...?",
            options: ["Clowder", "Pack", "Chain", "Colony"],
            correctAnswer: "Clowder",
            imageName: "marbled_cat"
        ),

        BabyAnimalQuestion(
            question: "African Golden Cat's group is called...?",
            options: ["Clowder", "Pack", "Chain", "Colony"],
            correctAnswer: "Clowder",
            imageName: "african_golden_cat"
        ),

        BabyAnimalQuestion(
            question: "Coyote's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "coyote_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Gray Wolf's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "gray_wolf_and_baby"
        ),

        BabyAnimalQuestion(
            question: "American Mink's group is called...?",
            options: ["Colony", "Pack", "Clowder", "Chain"],
            correctAnswer: "Colony",
            imageName: "american_mink_and_baby"
        ),

        BabyAnimalQuestion(
            question: "African Wild Dog's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "african_wild_dog"
        ),

        BabyAnimalQuestion(
            question: "Wolverine's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "wolverine_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Lynx's group is called...?",
            options: ["Chain", "Pack", "Clowder", "Colony"],
            correctAnswer: "Chain",
            imageName: "lynx_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Jackal's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "jackal_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Dingo's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "dingo_and_baby"
        )
    ]
    
    var level3Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Pampas Cat's group is called...?",
            options: ["Clowder", "Pack", "Chain", "Colony"],
            correctAnswer: "Clowder",
            imageName: "pampas_cat"
        ),

        BabyAnimalQuestion(
            question: "Least Weasel's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "least_weasel_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Himalayan Wolf's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "himalayan_wolf"
        ),

        BabyAnimalQuestion(
            question: "Red Wolf's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "red_wolf"
        ),

        BabyAnimalQuestion(
            question: "Ermine's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "ermine_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Fossa's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "fossa_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Iberian Lynx's group is called...?",
            options: ["Chain", "Pack", "Clowder", "Colony"],
            correctAnswer: "Chain",
            imageName: "iberian_lynx_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Tasmanian Devil's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Colony"],
            correctAnswer: "Pack",
            imageName: "tasmanian_devil_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Asiatic Golden Cat's group is called...?",
            options: ["Clowder", "Pack", "Chain", "Colony"],
            correctAnswer: "Clowder",
            imageName: "asiatic_golden_cat_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Andean Mountain Cat's group is called...?",
            options: ["Clowder", "Pack", "Chain", "Colony"],
            correctAnswer: "Clowder",
            imageName: "andean_mountain_cat_and_baby"
        )
    ]
    
    
    var level4Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Ethiopian Wolf's group is called...?",
            options: ["Pack", "Clowder", "Skulk", "Chain"],
            correctAnswer: "Pack",
            imageName: "ethiopian_wolf_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Kodkod's group is called...?",
            options: ["Clowder", "Pack", "Skulk", "Chain"],
            correctAnswer: "Clowder",
            imageName: "kodkod_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Sand Cat's group is called...?",
            options: ["Clowder", "Pack", "Skulk", "Chain"],
            correctAnswer: "Clowder",
            imageName: "sand_cat_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Indian Desert Fox's group is called...?",
            options: ["Skulk", "Pack", "Clowder", "Chain"],
            correctAnswer: "Skulk",
            imageName: "indian_desert_fox_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Margay's group is called...?",
            options: ["Clowder", "Pack", "Skulk", "Chain"],
            correctAnswer: "Clowder",
            imageName: "margay_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Fisher's group is called...?",
            options: ["Pack", "Clowder", "Skulk", "Chain"],
            correctAnswer: "Pack",
            imageName: "fisher_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Black-footed Cat's group is called...?",
            options: ["Clowder", "Pack", "Skulk", "Chain"],
            correctAnswer: "Clowder",
            imageName: "black_footed_cat_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Steppe Polecat's group is called...?",
            options: ["Pack", "Clowder", "Skulk", "Chain"],
            correctAnswer: "Pack",
            imageName: "steppe_polecat_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Pallas's Cat's group is called...?",
            options: ["Clowder", "Pack", "Skulk", "Chain"],
            correctAnswer: "Clowder",
            imageName: "pallas_cat_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Himalayan Red Fox's group is called...?",
            options: ["Skulk", "Pack", "Clowder", "Chain"],
            correctAnswer: "Skulk",
            imageName: "himalayan_red_fox_and_baby"
        )
    ]
    
    
    var level5Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Caracal's group is called...?",
            options: ["Clowder", "Pack", "Chain", "Cackle"],
            correctAnswer: "Clowder",
            imageName: "caracal_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Striped Polecat's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Cackle"],
            correctAnswer: "Pack",
            imageName: "striped_pole_cat_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Serval's group is called...?",
            options: ["Clowder", "Pack", "Chain", "Cackle"],
            correctAnswer: "Clowder",
            imageName: "serval_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Canadian Lynx's group is called...?",
            options: ["Chain", "Pack", "Clowder", "Cackle"],
            correctAnswer: "Chain",
            imageName: "canadian_lynx_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Tibetan Wolf's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Cackle"],
            correctAnswer: "Pack",
            imageName: "tibetan_wolf_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Bay Cat's group is called...?",
            options: ["Clowder", "Pack", "Chain", "Cackle"],
            correctAnswer: "Clowder",
            imageName: "bay_cat_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Zorilla's group is called...?",
            options: ["Pack", "Clowder", "Chain", "Cackle"],
            correctAnswer: "Pack",
            imageName: "zorilla_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Brown Hyena's group is called...?",
            options: ["Cackle", "Pack", "Clowder", "Chain"],
            correctAnswer: "Cackle",
            imageName: "brown_hyena_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Clouded Leopard's group is called...?",
            options: ["Leap", "Pack", "Clowder", "Chain"],
            correctAnswer: "Leap",
            imageName: "clouded_leopard_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Arctic Fox's group is called...?",
            options: ["Skulk", "Pack", "Clowder", "Chain"],
            correctAnswer: "Skulk",
            imageName: "arctic_fox_and_baby"
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
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameCarnivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameCarnivoresLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameCarnivoresLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameCarnivoresLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameCarnivoresLevel5Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
        updateLevelUI(level: 5, imageView: image5, label: label5)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "guessTheAnimalGroupNameCarnivoresLevel\(level)Completed"
        let percentageKey = "guessTheAnimalGroupNameCarnivoresLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameCarnivoresShowVC") as! GuessTheAnimalGroupNameCarnivoresShowVC
        vc.questions = level1Questions
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameCarnivoresShowVC") as! GuessTheAnimalGroupNameCarnivoresShowVC
        vc.questions = level2Questions
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameCarnivoresShowVC") as! GuessTheAnimalGroupNameCarnivoresShowVC
        vc.questions = level3Questions
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameCarnivoresShowVC") as! GuessTheAnimalGroupNameCarnivoresShowVC
        vc.questions = level4Questions
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameCarnivoresShowVC") as! GuessTheAnimalGroupNameCarnivoresShowVC
        vc.questions = level5Questions
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...5 {
            defaults.removeObject(forKey: "guessTheAnimalGroupNameCarnivoresLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalGroupNameCarnivoresLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
