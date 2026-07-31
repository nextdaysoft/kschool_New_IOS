//
//  GuessTheBabyAnimalHerbivoresMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheBabyAnimalHerbivoresMenuVC: BaseViewController {

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

        BabyAnimalQuestion(question: "Elephant’s baby is called...?", options: ["Calf","Kid","Foal","Fawn"], correctAnswer: "Calf", imageName: "elephant_and_calf"),
        BabyAnimalQuestion(question: "Goat’s baby is called...?", options: ["Kid","Calf","Lamb","Foal"], correctAnswer: "Kid", imageName: "goat_and_kid"),
        BabyAnimalQuestion(question: "Cow’s baby is called...?", options: ["Calf","Kid","Foal","Fawn"], correctAnswer: "Calf", imageName: "cow_and_calf"),
        BabyAnimalQuestion(question: "Kangaroo’s baby is called...?", options: ["Joey","Cub","Kid","Calf"], correctAnswer: "Joey", imageName: "kangaroo_and_joey"),
        BabyAnimalQuestion(question: "Giraffe’s baby is called...?", options: ["Calf","Kid","Fawn","Foal"], correctAnswer: "Calf", imageName: "giraffe_and_baby"),
        BabyAnimalQuestion(question: "Deer’s baby is called...?", options: ["Fawn","Calf","Kid","Foal"], correctAnswer: "Fawn", imageName: "deer_and_fawn"),
        BabyAnimalQuestion(question: "Rhinoceros’s baby is called...?", options: ["Calf","Kid","Foal","Cub"], correctAnswer: "Calf", imageName: "rhino_and_baby"),
        BabyAnimalQuestion(question: "Donkey’s baby is called...?", options: ["Foal","Calf","Kid","Lamb"], correctAnswer: "Foal", imageName: "donkey_and_foal"),
        BabyAnimalQuestion(question: "Sheep’s baby is called...?", options: ["Lamb","Kid","Calf","Foal"], correctAnswer: "Lamb", imageName: "sheep_and_lamb"),
        BabyAnimalQuestion(question: "Horse’s baby is called...?", options: ["Foal","Calf","Kid","Lamb"], correctAnswer: "Foal", imageName: "horse_and_foal")

    ]
    
    var level2Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Koala’s baby is called...?", options: ["Joey","Cub","Kid","Calf"], correctAnswer: "Joey", imageName: "koala_and_baby"),
        BabyAnimalQuestion(question: "Buffalo’s baby is called...?", options: ["Calf","Kid","Lamb","Foal"], correctAnswer: "Calf", imageName: "buffalo_and_baby"),
        BabyAnimalQuestion(question: "Bharal’s baby is called...?", options: ["Lamb","Kid","Calf","Foal"], correctAnswer: "Lamb", imageName: "bharal_and_baby"),
        BabyAnimalQuestion(question: "Panda’s baby is called...?", options: ["Cub","Joey","Kid","Calf"], correctAnswer: "Cub", imageName: "panda_and_baby"),
        BabyAnimalQuestion(question: "Bison’s baby is called...?", options: ["Calf","Kid","Foal","Fawn"], correctAnswer: "Calf", imageName: "bison_and_baby"),
        BabyAnimalQuestion(question: "Yak’s baby is called...?", options: ["Calf","Kid","Foal","Lamb"], correctAnswer: "Calf", imageName: "yak_and_baby"),
        BabyAnimalQuestion(question: "Camel’s baby is called...?", options: ["Calf","Kid","Foal","Fawn"], correctAnswer: "Calf", imageName: "camel_and_baby"),
        BabyAnimalQuestion(question: "Rabbit’s baby is called...?", options: ["Kit","Cub","Kid","Fawn"], correctAnswer: "Kit", imageName: "rabbit_and_baby"),
        BabyAnimalQuestion(question: "Llama’s baby is called...?", options: ["Cria","Calf","Kid","Foal"], correctAnswer: "Cria", imageName: "llama_and_baby"),
        BabyAnimalQuestion(question: "Zebra’s baby is called...?", options: ["Foal","Calf","Kid","Lamb"], correctAnswer: "Foal", imageName: "zebra_and_baby")

    ]
    
    var level3Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Wildebeest’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "wildebeest_and_baby"),
        BabyAnimalQuestion(question: "Okapi’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "okapi_and_baby"),
        BabyAnimalQuestion(question: "Tapir’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "tapir_and_baby"),
        BabyAnimalQuestion(question: "Mule’s baby is called...?", options: ["Foal","Calf","Kid","Fawn"], correctAnswer: "Foal", imageName: "mule_and_baby"),
        BabyAnimalQuestion(question: "Antelope’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "antelope_and_baby"),
        BabyAnimalQuestion(question: "Moose’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "moose_and_baby"),
        BabyAnimalQuestion(question: "Ibex’s baby is called...?", options: ["Kid","Calf","Foal","Fawn"], correctAnswer: "Kid", imageName: "ibex_and_baby"),
        BabyAnimalQuestion(question: "Chamois’s baby is called...?", options: ["Kid","Calf","Foal","Fawn"], correctAnswer: "Kid", imageName: "chamois_and_baby"),
        BabyAnimalQuestion(question: "Reindeer’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "reindeer_and_baby"),
        BabyAnimalQuestion(question: "Gazelle’s baby is called...?", options: ["Fawn","Calf","Kid","Foal"], correctAnswer: "Fawn", imageName: "gazelle_and_baby")

    ]
    
    var level4Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Vicuña’s baby is called...?", options: ["Cria","Calf","Kid","Fawn"], correctAnswer: "Cria", imageName: "vicuna_and_baby"),
        BabyAnimalQuestion(question: "Nyala’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "nyala_and_baby"),
        BabyAnimalQuestion(question: "Addax’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "addax_and_baby"),
        BabyAnimalQuestion(question: "Pronghorn’s baby is called...?", options: ["Fawn","Calf","Kid","Foal"], correctAnswer: "Fawn", imageName: "pronghorn_and_baby"),
        BabyAnimalQuestion(question: "Alpaca’s baby is called...?", options: ["Cria","Kid","Calf","Fawn"], correctAnswer: "Cria", imageName: "alpaca_and_baby"),
        BabyAnimalQuestion(question: "Oryx’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "oryx_and_baby"),
        BabyAnimalQuestion(question: "Saiga’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "saiga_and_baby"),
        BabyAnimalQuestion(question: "Eland’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "eland_and_baby"),
        BabyAnimalQuestion(question: "Bongo’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "bongo_and_baby")

    ]
    
    var level5Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Tahr’s baby is called...?", options: ["Kid","Calf","Fawn","Foal"], correctAnswer: "Kid", imageName: "tahr_and_baby"),
        BabyAnimalQuestion(question: "Blackbuck’s baby is called...?", options: ["Fawn","Kid","Calf","Foal"], correctAnswer: "Fawn", imageName: "blackbuck_and_baby"),
        BabyAnimalQuestion(question: "Serow’s baby is called...?", options: ["Kid","Calf","Fawn","Foal"], correctAnswer: "Kid", imageName: "serow_and_baby"),
        BabyAnimalQuestion(question: "Nilgai’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "nilgai_and_baby"),
        BabyAnimalQuestion(question: "Markhor’s baby is called...?", options: ["Kid","Calf","Fawn","Foal"], correctAnswer: "Kid", imageName: "markhor_and_baby"),
        BabyAnimalQuestion(question: "Barasingha’s baby is called...?", options: ["Fawn","Calf","Kid","Foal"], correctAnswer: "Fawn", imageName: "barasingha_and_baby"),
        BabyAnimalQuestion(question: "Goral’s baby is called...?", options: ["Kid","Calf","Fawn","Foal"], correctAnswer: "Kid", imageName: "goral_and_baby"),
        BabyAnimalQuestion(question: "Muntjac’s baby is called...?", options: ["Fawn","Calf","Kid","Foal"], correctAnswer: "Fawn", imageName: "muntjac_and_baby"),
        BabyAnimalQuestion(question: "Sambar’s baby is called...?", options: ["Fawn","Calf","Kid","Foal"], correctAnswer: "Fawn", imageName: "sambar_and_baby"),
        BabyAnimalQuestion(question: "Kouprey’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "kouprey_and_baby")

    ]
    
    var level6Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Reedbuck’s baby is called...?", options: ["Fawn","Calf","Kid","Lamb"], correctAnswer: "Fawn", imageName: "reedbuck_and_baby"),
        BabyAnimalQuestion(question: "Argali’s baby is called...?", options: ["Lamb","Kid","Calf","Foal"], correctAnswer: "Lamb", imageName: "argali_and_baby"),
        BabyAnimalQuestion(question: "Mountain Goat’s baby is called...?", options: ["Kid","Lamb","Calf","Fawn"], correctAnswer: "Kid", imageName: "mountain_goat_and_baby"),
        BabyAnimalQuestion(question: "Springbok’s baby is called...?", options: ["Lamb","Kid","Calf","Fawn"], correctAnswer: "Lamb", imageName: "springbok_and_baby"),
        BabyAnimalQuestion(question: "Waterbuck’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "waterbuck_and_baby"),
        BabyAnimalQuestion(question: "Gaur’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "gaur_and_baby"),
        BabyAnimalQuestion(question: "Takin’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "takin_and_baby"),
        BabyAnimalQuestion(question: "Hartebeest’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "hartebeest_and_baby"),
        BabyAnimalQuestion(question: "Banteng’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "banteng_and_baby"),
        BabyAnimalQuestion(question: "Roan Antelope’s baby is called...?", options: ["Calf","Fawn","Kid","Foal"], correctAnswer: "Calf", imageName: "roan_antelope_and_baby")

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
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalHerbivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalHerbivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalHerbivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalHerbivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalHerbivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalHerbivoresLevel1Completed")
        
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

        let completedKey = "guessTheBabyAnimalHerbivoresLevel\(level)Completed"
        let percentageKey = "guessTheBabyAnimalHerbivoresLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalHerbivoresShowVC") as! GuessTheBabyAnimalHerbivoresShowVC
        vc.questions = level1Questions
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalHerbivoresShowVC") as! GuessTheBabyAnimalHerbivoresShowVC
        vc.questions = level2Questions
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalHerbivoresShowVC") as! GuessTheBabyAnimalHerbivoresShowVC
        vc.questions = level3Questions
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalHerbivoresShowVC") as! GuessTheBabyAnimalHerbivoresShowVC
        vc.questions = level4Questions
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalHerbivoresShowVC") as! GuessTheBabyAnimalHerbivoresShowVC
        vc.questions = level5Questions
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalHerbivoresShowVC") as! GuessTheBabyAnimalHerbivoresShowVC
        vc.questions = level6Questions
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...6 {
            defaults.removeObject(forKey: "guessTheBabyAnimalHerbivoresLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheBabyAnimalHerbivoresLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
