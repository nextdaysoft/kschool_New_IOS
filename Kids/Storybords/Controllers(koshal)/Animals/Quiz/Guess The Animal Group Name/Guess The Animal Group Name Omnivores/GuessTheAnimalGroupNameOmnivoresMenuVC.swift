//
//  GuessTheAnimalGroupNameOmnivoresMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalGroupNameOmnivoresMenuVC: BaseViewController {

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

        BabyAnimalQuestion(question: "Pig's group is called...?", options: ["Drift","Herd","Pack","Sounder"], correctAnswer: "Sounder", imageName: "pig_and_piglet"),

        BabyAnimalQuestion(question: "Hyena's group is called...?", options: ["Clan","Pack","Pride","Sounder"], correctAnswer: "Clan", imageName: "hyena_and_baby"),

        BabyAnimalQuestion(question: "Squirrel's group is called...?", options: ["Dray","Pack","Clan","Colony"], correctAnswer: "Dray", imageName: "squirrel_and_baby"),

        BabyAnimalQuestion(question: "Bat Eared Fox's group is called...?", options: ["Skulk","Pack","Clan","Drift"], correctAnswer: "Skulk", imageName: "bat_eared_fox_and_baby"),

        BabyAnimalQuestion(question: "Lemur's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "lemur_and_baby"),

        BabyAnimalQuestion(question: "Opossum's group is called...?", options: ["Passel","Pack","Troop","Clan"], correctAnswer: "Passel", imageName: "opossum_and_baby"),

        BabyAnimalQuestion(question: "Hedgehog's group is called...?", options: ["Array","Pack","Colony","Clan"], correctAnswer: "Array", imageName: "hoglet_and_baby"),

        BabyAnimalQuestion(question: "Sloth's group is called...?", options: ["Bed","Pack","Troop","Clan"], correctAnswer: "Bed", imageName: "sloth_and_baby"),

        BabyAnimalQuestion(question: "Monkey's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "monkey_and_baby"),

        BabyAnimalQuestion(question: "Dog's group is called...?", options: ["Pack","Clan","Troop","Sounder"], correctAnswer: "Pack", imageName: "dog_and_puppy")
    ]
    
    var level2Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Black Bear's group is called...?", options: ["Sleuth","Pack","Clan","Troop"], correctAnswer: "Sleuth", imageName: "black_bear_and_baby"),

        BabyAnimalQuestion(question: "Brown Rat Kangaroo's group is called...?", options: ["Mob","Pack","Troop","Clan"], correctAnswer: "Mob", imageName: "brown_rat_kangaroo_and_baby"),

        BabyAnimalQuestion(question: "Badger's group is called...?", options: ["Cete","Pack","Troop","Clan"], correctAnswer: "Cete", imageName: "badger_and_baby"),

        BabyAnimalQuestion(question: "Chipmunk's group is called...?", options: ["Scurry","Pack","Troop","Clan"], correctAnswer: "Scurry", imageName: "chipmunk_and_baby"),

        BabyAnimalQuestion(question: "Baboon's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "baboon_and_baby"),

        BabyAnimalQuestion(question: "Bushbaby's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "bushbaby_and_baby"),

        BabyAnimalQuestion(question: "Bandicoot's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "bandicoot_and_baby"),

        BabyAnimalQuestion(question: "Brown Bear's group is called...?", options: ["Sleuth","Pack","Clan","Troop"], correctAnswer: "Sleuth", imageName: "brown_bear_and_baby"),

        BabyAnimalQuestion(question: "Chimpanzee's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "chimpanzee_and_baby"),

        BabyAnimalQuestion(question: "Capuchin Monkey's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "capuchin_monkey_and_baby")
    ]
    
    var level3Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Jackal's group is called...?", options: ["Pack","Clan","Troop","Colony"], correctAnswer: "Pack", imageName: "jackal_and_baby"),

        BabyAnimalQuestion(question: "Ground Squirrel's group is called...?", options: ["Colony","Pack","Clan","Troop"], correctAnswer: "Colony", imageName: "ground_squirrel_and_baby"),

        BabyAnimalQuestion(question: "Civet's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "civet_and_baby"),

        BabyAnimalQuestion(question: "Raccoon Dog's group is called...?", options: ["Pack","Clan","Troop","Colony"], correctAnswer: "Pack", imageName: "raccoon_dog_and_baby"),

        BabyAnimalQuestion(question: "Gorilla's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "gorilla_and_baby"),

        BabyAnimalQuestion(question: "Cuscus's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "cuscus_and_baby"),

        BabyAnimalQuestion(question: "Hamster's group is called...?", options: ["Horde","Pack","Clan","Troop"], correctAnswer: "Horde", imageName: "hamster_and_baby"),

        BabyAnimalQuestion(question: "Gerbil's group is called...?", options: ["Horde","Pack","Troop","Clan"], correctAnswer: "Horde", imageName: "gerbil_and_baby"),

        BabyAnimalQuestion(question: "Dormouse's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "dormouse_and_baby"),

        BabyAnimalQuestion(question: "Coati's group is called...?", options: ["Band","Pack","Troop","Clan"], correctAnswer: "Band", imageName: "coati_and_baby")
    ]
    
    var level4Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Marmoset's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "marmoset_and_baby"),

        BabyAnimalQuestion(question: "Palm Civet's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "african_palm_civet_and_baby"),

        BabyAnimalQuestion(question: "Olingo's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "olingo_and_baby"),

        BabyAnimalQuestion(question: "Ringtail's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "ringtail_and_baby"),

        BabyAnimalQuestion(question: "Mongoose's group is called...?", options: ["Mob","Pack","Troop","Clan"], correctAnswer: "Mob", imageName: "mongoose_and_baby"),

        BabyAnimalQuestion(question: "Red Panda's group is called...?", options: ["Clowder","Pack","Troop","Clan"], correctAnswer: "Clowder", imageName: "red_panda_and_baby"),

        BabyAnimalQuestion(question: "Skunk's group is called...?", options: ["Surfeit","Pack","Troop","Clan"], correctAnswer: "Surfeit", imageName: "skunk_and_baby"),

        BabyAnimalQuestion(question: "Rhesus Macaque's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "rhesus_macaque_and_baby"),

        BabyAnimalQuestion(question: "Kinkajou's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "kinkajou_and_baby"),

        BabyAnimalQuestion(question: "Orangutan's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "orangutan_and_baby")
    ]
    
    var level5Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Tamarin's group is called...?", options: ["Troop","Pack","Clan","Colony"], correctAnswer: "Troop", imageName: "tamarin_and_baby"),

        BabyAnimalQuestion(question: "Striped Skunk's group is called...?", options: ["Surfeit","Pack","Troop","Clan"], correctAnswer: "Surfeit", imageName: "striped_skunk_and_baby"),

        BabyAnimalQuestion(question: "Tree Shrew's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "tree_shrew_and_baby"),

        BabyAnimalQuestion(question: "Sun Bear's group is called...?", options: ["Sleuth","Pack","Clan","Troop"], correctAnswer: "Sleuth", imageName: "sun_bear_and_baby"),

        BabyAnimalQuestion(question: "Vole's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "vole_and_baby"),

        BabyAnimalQuestion(question: "Fox's group is called...?", options: ["Skulk","Pack","Clan","Troop"], correctAnswer: "Skulk", imageName: "red_fox_and_baby"),

        BabyAnimalQuestion(question: "Sugar Glider's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "sugar_glider_and_baby"),

        BabyAnimalQuestion(question: "Sloth Bear's group is called...?", options: ["Sleuth","Pack","Clan","Troop"], correctAnswer: "Sleuth", imageName: "sloth_bear_and_baby"),

        BabyAnimalQuestion(question: "Wild Boar's group is called...?", options: ["Sounder","Pack","Troop","Clan"], correctAnswer: "Sounder", imageName: "wild_boar_and_baby"),

        BabyAnimalQuestion(question: "Binturong's group is called...?", options: ["Colony","Pack","Troop","Clan"], correctAnswer: "Colony", imageName: "binturong_and_baby")
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
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameOmnivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameOmnivoresLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameOmnivoresLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameOmnivoresLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameOmnivoresLevel5Completed")
        
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

        let completedKey = "guessTheAnimalGroupNameOmnivoresLevel\(level)Completed"
        let percentageKey = "guessTheAnimalGroupNameOmnivoresLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameOmnivoresShowVC") as! GuessTheAnimalGroupNameOmnivoresShowVC
        vc.questions = level1Questions
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameOmnivoresShowVC") as! GuessTheAnimalGroupNameOmnivoresShowVC
        vc.questions = level2Questions
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameOmnivoresShowVC") as! GuessTheAnimalGroupNameOmnivoresShowVC
        vc.questions = level3Questions
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameOmnivoresShowVC") as! GuessTheAnimalGroupNameOmnivoresShowVC
        vc.questions = level4Questions
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameOmnivoresShowVC") as! GuessTheAnimalGroupNameOmnivoresShowVC
        vc.questions = level5Questions
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...5 {
            defaults.removeObject(forKey: "guessTheAnimalGroupNameOmnivoresLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalGroupNameOmnivoresLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
