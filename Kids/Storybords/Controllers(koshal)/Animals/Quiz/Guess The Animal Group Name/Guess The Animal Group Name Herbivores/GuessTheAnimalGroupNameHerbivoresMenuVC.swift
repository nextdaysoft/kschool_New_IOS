//
//  GuessTheAnimalGroupNameHerbivoresMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalGroupNameHerbivoresMenuVC: BaseViewController {

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
    
    
    var level1Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Elephant's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "elephant_and_calf"),

        BabyAnimalQuestion(question: "Goat's group is called...?", options: ["Herd","Pack","Flock","Pride"], correctAnswer: "Herd", imageName: "goat_and_kid"),

        BabyAnimalQuestion(question: "Cow's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "cow_and_calf"),

        BabyAnimalQuestion(question: "Kangaroo's group is called...?", options: ["Mob","Herd","Pack","Pride"], correctAnswer: "Mob", imageName: "kangaroo_and_joey"),

        BabyAnimalQuestion(question: "Giraffe's group is called...?", options: ["Tower","Herd","Pack","Troop"], correctAnswer: "Tower", imageName: "giraffe_and_baby"),

        BabyAnimalQuestion(question: "Deer's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "deer_and_fawn"),

        BabyAnimalQuestion(question: "Rhinoceros's group is called...?", options: ["Crash","Herd","Pack","Pride"], correctAnswer: "Crash", imageName: "rhino_and_baby"),

        BabyAnimalQuestion(question: "Donkey's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "donkey_and_foal"),

        BabyAnimalQuestion(question: "Sheep's group is called...?", options: ["Flock","Herd","Pack","Pride"], correctAnswer: "Flock", imageName: "sheep_and_lamb"),

        BabyAnimalQuestion(question: "Horse's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "horse_and_foal")
    ]
    
    var level2Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Koala's group is called...?", options: ["Colony","Herd","Pack","Mob"], correctAnswer: "Colony", imageName: "koala_and_baby"),

        BabyAnimalQuestion(question: "Buffalo's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "buffalo_and_baby"),

        BabyAnimalQuestion(question: "Bharal's group is called...?", options: ["Herd","Flock","Pack","Pride"], correctAnswer: "Herd", imageName: "bharal_and_baby"),

        BabyAnimalQuestion(question: "Panda's group is called...?", options: ["Embarrassment","Herd","Pack","Pride"], correctAnswer: "Embarrassment", imageName: "panda_and_baby"),

        BabyAnimalQuestion(question: "Bison's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "bison_and_baby"),

        BabyAnimalQuestion(question: "Yak's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "yak_and_baby"),

        BabyAnimalQuestion(question: "Camel's group is called...?", options: ["Caravan","Herd","Pack","Pride"], correctAnswer: "Caravan", imageName: "camel_and_baby"),

        BabyAnimalQuestion(question: "Rabbit's group is called...?", options: ["Colony","Pack","Herd","Pride"], correctAnswer: "Colony", imageName: "rabbit_and_baby"),

        BabyAnimalQuestion(question: "Llama's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "llama_and_baby"),

        BabyAnimalQuestion(question: "Zebra's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "zebra_and_baby")
    ]
   
    var level3Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Wildebeest's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "wildebeest_and_baby"),

        BabyAnimalQuestion(question: "Okapi's group is called...?", options: ["Herd","Tower","Pack","Pride"], correctAnswer: "Herd", imageName: "okapi_and_baby"),

        BabyAnimalQuestion(question: "Tapir's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "tapir_and_baby"),

        BabyAnimalQuestion(question: "Mule's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "mule_and_baby"),

        BabyAnimalQuestion(question: "Antelope's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "antelope_and_baby"),

        BabyAnimalQuestion(question: "Moose's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "moose_and_baby"),

        BabyAnimalQuestion(question: "Ibex's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "ibex_and_baby"),

        BabyAnimalQuestion(question: "Chamois's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "chamois_and_baby"),

        BabyAnimalQuestion(question: "Reindeer's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "reindeer_and_baby"),

        BabyAnimalQuestion(question: "Gazelle's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "gazelle_and_baby")
    ]
    
    var level4Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Vicuña's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "vicuna_and_baby"),

        BabyAnimalQuestion(question: "Nyala's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "nyala_and_baby"),

        BabyAnimalQuestion(question: "Addax's group is called...?", options: ["Herd","Pack","Pride","Troop"], correctAnswer: "Herd", imageName: "addax_and_baby"),

        BabyAnimalQuestion(question: "Pronghorn's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "pronghorn_and_baby"),

        BabyAnimalQuestion(question: "Alpaca's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "alpaca_and_baby"),

        BabyAnimalQuestion(question: "Oryx's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "oryx_and_baby"),

        BabyAnimalQuestion(question: "Saiga's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "saiga_and_baby"),

        BabyAnimalQuestion(question: "Eland's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "eland_and_baby"),

        BabyAnimalQuestion(question: "Bongo's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "bongo_and_baby"),

        BabyAnimalQuestion(question: "Kouprey's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "kouprey_and_baby")
    ]
    
    
    var level5Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Tahr's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "tahr_and_baby"),

        BabyAnimalQuestion(question: "Blackbuck's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "blackbuck_and_baby"),

        BabyAnimalQuestion(question: "Serow's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "serow_and_baby"),

        BabyAnimalQuestion(question: "Nilgai's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "nilgai_and_baby"),

        BabyAnimalQuestion(question: "Markhor's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "markhor_and_baby"),

        BabyAnimalQuestion(question: "Barasingha's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "barasingha_and_baby"),

        BabyAnimalQuestion(question: "Goral's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "goral_and_baby"),

        BabyAnimalQuestion(question: "Muntjac's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "muntjac_and_baby"),

        BabyAnimalQuestion(question: "Sambar's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "sambar_and_baby"),

        BabyAnimalQuestion(question: "Kouprey's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "kouprey_and_baby")
    ]
    
    
    var level6Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Reedbuck's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "reedbuck_and_baby"),

        BabyAnimalQuestion(question: "Argali's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "argali_and_baby"),

        BabyAnimalQuestion(question: "Mountain Goat's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "mountain_goat_and_baby"),

        BabyAnimalQuestion(question: "Springbok's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "springbok_and_baby"),

        BabyAnimalQuestion(question: "Waterbuck's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "waterbuck_and_baby"),

        BabyAnimalQuestion(question: "Gaur's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "gaur_and_baby"),

        BabyAnimalQuestion(question: "Takin's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "takin_and_baby"),

        BabyAnimalQuestion(question: "Hartebeest's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "hartebeest_and_baby"),

        BabyAnimalQuestion(question: "Banteng's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "banteng_and_baby"),

        BabyAnimalQuestion(question: "Roan Antelope's group is called...?", options: ["Herd","Pack","Troop","Pride"], correctAnswer: "Herd", imageName: "roan_antelope_and_baby")
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
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameHerbivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameHerbivoresLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameHerbivoresLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameHerbivoresLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameHerbivoresLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameHerbivoresLevel6Completed")
        
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

        let completedKey = "guessTheAnimalGroupNameHerbivoresLevel\(level)Completed"
        let percentageKey = "guessTheAnimalGroupNameHerbivoresLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameHerbivoresShowVC") as! GuessTheAnimalGroupNameHerbivoresShowVC
        vc.questions = level1Questions
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameHerbivoresShowVC") as! GuessTheAnimalGroupNameHerbivoresShowVC
        vc.questions = level2Questions
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameHerbivoresShowVC") as! GuessTheAnimalGroupNameHerbivoresShowVC
        vc.questions = level3Questions
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameHerbivoresShowVC") as! GuessTheAnimalGroupNameHerbivoresShowVC
        vc.questions = level4Questions
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameHerbivoresShowVC") as! GuessTheAnimalGroupNameHerbivoresShowVC
        vc.questions = level5Questions
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameHerbivoresShowVC") as! GuessTheAnimalGroupNameHerbivoresShowVC
        vc.questions = level6Questions
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...6 {
            defaults.removeObject(forKey: "guessTheAnimalGroupNameHerbivoresLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalGroupNameHerbivoresLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
