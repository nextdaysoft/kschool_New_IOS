//
//  GuessTheBabyAnimalOmnivoresMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheBabyAnimalOmnivoresMenuVC: BaseViewController {

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

        BabyAnimalQuestion(question: "Pig’s baby is called...?", options: ["Piglet","Cub","Kit","Pup"], correctAnswer: "Piglet", imageName: "pig_and_piglet"),
        BabyAnimalQuestion(question: "Hyena’s baby is called...?", options: ["Cub","Piglet","Kit","Pup"], correctAnswer: "Cub", imageName: "hyena_and_baby"),
        BabyAnimalQuestion(question: "Squirrel’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "squirrel_and_baby"),
        BabyAnimalQuestion(question: "Bat Eared Fox’s baby is called...?", options: ["Pup","Cub","Kit","Piglet"], correctAnswer: "Pup", imageName: "bat_eared_fox_and_baby"),
        BabyAnimalQuestion(question: "Lemur’s baby is called...?", options: ["Infant","Kit","Cub","Pup"], correctAnswer: "Infant", imageName: "lemur_and_baby"),
        BabyAnimalQuestion(question: "Opossum’s baby is called...?", options: ["Joey","Cub","Kit","Pup"], correctAnswer: "Joey", imageName: "opossum_and_baby"),
        BabyAnimalQuestion(question: "Hedgehog’s baby is called...?", options: ["Hoglet","Kit","Cub","Pup"], correctAnswer: "Hoglet", imageName: "hoglet_and_baby"),
        BabyAnimalQuestion(question: "Sloth’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "sloth_and_baby"),
        BabyAnimalQuestion(question: "Monkey’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "monkey_and_baby"),
        BabyAnimalQuestion(question: "Dog’s baby is called...?", options: ["Puppy","Cub","Kit","Piglet"], correctAnswer: "Puppy", imageName: "dog_and_puppy")

    ]
    
    var level2Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Black Bear’s baby is called...?", options: ["Cub","Kit","Pup","Infant"], correctAnswer: "Cub", imageName: "black_bear_and_baby"),
        BabyAnimalQuestion(question: "Brown Rat Kangaroo’s baby is called...?", options: ["Joey","Cub","Kit","Pup"], correctAnswer: "Joey", imageName: "brown_rat_kangaroo_and_baby"),
        BabyAnimalQuestion(question: "Badger’s baby is called...?", options: ["Cub","Kit","Pup","Infant"], correctAnswer: "Cub", imageName: "badger_and_baby"),
        BabyAnimalQuestion(question: "Chipmunk’s baby is called...?", options: ["Kit","Cub","Pup","Joey"], correctAnswer: "Kit", imageName: "chipmunk_and_baby"),
        BabyAnimalQuestion(question: "Baboon’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "baboon_and_baby"),
        BabyAnimalQuestion(question: "Bushbaby’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "bushbaby_and_baby"),
        BabyAnimalQuestion(question: "Bandicoot’s baby is called...?", options: ["Joey","Cub","Kit","Pup"], correctAnswer: "Joey", imageName: "bandicoot_and_baby"),
        BabyAnimalQuestion(question: "Brown Bear’s baby is called...?", options: ["Cub","Kit","Pup","Infant"], correctAnswer: "Cub", imageName: "brown_bear_and_baby"),
        BabyAnimalQuestion(question: "Chimpanzee’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "chimpanzee_and_baby"),
        BabyAnimalQuestion(question: "Capuchin Monkey’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "capuchin_monkey_and_baby")

    ]
    
    var level3Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Jackal’s baby is called...?", options: ["Pup","Cub","Kit","Infant"], correctAnswer: "Pup", imageName: "jackal_and_baby"),
        BabyAnimalQuestion(question: "Ground Squirrel’s baby is called...?", options: ["Pup","Kit","Cub","Infant"], correctAnswer: "Pup", imageName: "ground_squirrel_and_baby"),
        BabyAnimalQuestion(question: "Civet’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "civet_and_baby"),
        BabyAnimalQuestion(question: "Raccoon Dog’s baby is called...?", options: ["Pup","Cub","Kit","Infant"], correctAnswer: "Pup", imageName: "raccoon_dog_and_baby"),
        BabyAnimalQuestion(question: "Gorilla’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "gorilla_and_baby"),
        BabyAnimalQuestion(question: "Cuscus’s baby is called...?", options: ["Joey","Cub","Kit","Pup"], correctAnswer: "Joey", imageName: "cuscus_and_baby"),
        BabyAnimalQuestion(question: "Hamster’s baby is called...?", options: ["Pup","Kit","Cub","Infant"], correctAnswer: "Pup", imageName: "hamster_and_baby"),
        BabyAnimalQuestion(question: "Gerbil’s baby is called...?", options: ["Pup","Kit","Cub","Infant"], correctAnswer: "Pup", imageName: "gerbil_and_baby"),
        BabyAnimalQuestion(question: "Dormouse’s baby is called...?", options: ["Pup","Kit","Cub","Infant"], correctAnswer: "Pup", imageName: "dormouse_and_baby"),
        BabyAnimalQuestion(question: "Coati’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "coati_and_baby")

    ]
    
    var level4Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Marmoset’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "marmoset_and_baby"),
        BabyAnimalQuestion(question: "Palm Civet’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "african_palm_civet_and_baby"),
        BabyAnimalQuestion(question: "Olingo’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "olingo_and_baby"),
        BabyAnimalQuestion(question: "Ringtail’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "ringtail_and_baby"),
        BabyAnimalQuestion(question: "Mongoose’s baby is called...?", options: ["Pup","Kit","Cub","Infant"], correctAnswer: "Pup", imageName: "mongoose_and_baby"),
        BabyAnimalQuestion(question: "Red Panda’s baby is called...?", options: ["Cub","Kit","Pup","Infant"], correctAnswer: "Cub", imageName: "red_panda_and_baby"),
        BabyAnimalQuestion(question: "Skunk’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "skunk_and_baby"),
        BabyAnimalQuestion(question: "Rhesus Macaque’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "rhesus_macaque_and_baby"),
        BabyAnimalQuestion(question: "Kinkajou’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "kinkajou_and_baby"),
        BabyAnimalQuestion(question: "Orangutan’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "orangutan_and_baby")

    ]
    
    var level5Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Tamarin’s baby is called...?", options: ["Infant","Cub","Kit","Pup"], correctAnswer: "Infant", imageName: "tamarin_and_baby"),
        BabyAnimalQuestion(question: "Striped Skunk’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "striped_skunk_and_baby"),
        BabyAnimalQuestion(question: "Tree Shrew’s baby is called...?", options: ["Pup","Kit","Cub","Infant"], correctAnswer: "Pup", imageName: "tree_shrew_and_baby"),
        BabyAnimalQuestion(question: "Sun Bear’s baby is called...?", options: ["Cub","Kit","Pup","Infant"], correctAnswer: "Cub", imageName: "sun_bear_and_baby"),
        BabyAnimalQuestion(question: "Vole’s baby is called...?", options: ["Pup","Kit","Cub","Infant"], correctAnswer: "Pup", imageName: "vole_and_baby"),
        BabyAnimalQuestion(question: "Fox’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "red_fox_and_baby"),
        BabyAnimalQuestion(question: "Sugar Glider’s baby is called...?", options: ["Joey","Cub","Kit","Pup"], correctAnswer: "Joey", imageName: "sugar_glider_and_baby"),
        BabyAnimalQuestion(question: "Sloth Bear’s baby is called...?", options: ["Cub","Kit","Pup","Infant"], correctAnswer: "Cub", imageName: "sloth_bear_and_baby"),
        BabyAnimalQuestion(question: "Wild Boar’s baby is called...?", options: ["Piglet","Cub","Kit","Pup"], correctAnswer: "Piglet", imageName: "wild_boar_and_baby"),
        BabyAnimalQuestion(question: "Binturong’s baby is called...?", options: ["Kit","Cub","Pup","Infant"], correctAnswer: "Kit", imageName: "binturong_and_baby")

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
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalOmnivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalOmnivoresLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalOmnivoresLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalOmnivoresLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalOmnivoresLevel5Completed")
        
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

        let completedKey = "guessTheBabyAnimalOmnivoresLevel\(level)Completed"
        let percentageKey = "guessTheBabyAnimalOmnivoresLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalOmnivoresShowVC") as! GuessTheBabyAnimalOmnivoresShowVC
        vc.questions = level1Questions
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalOmnivoresShowVC") as! GuessTheBabyAnimalOmnivoresShowVC
        vc.questions = level2Questions
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalOmnivoresShowVC") as! GuessTheBabyAnimalOmnivoresShowVC
        vc.questions = level3Questions
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalOmnivoresShowVC") as! GuessTheBabyAnimalOmnivoresShowVC
        vc.questions = level4Questions
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalOmnivoresShowVC") as! GuessTheBabyAnimalOmnivoresShowVC
        vc.questions = level5Questions
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...5 {
            defaults.removeObject(forKey: "guessTheBabyAnimalOmnivoresLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheBabyAnimalOmnivoresLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
