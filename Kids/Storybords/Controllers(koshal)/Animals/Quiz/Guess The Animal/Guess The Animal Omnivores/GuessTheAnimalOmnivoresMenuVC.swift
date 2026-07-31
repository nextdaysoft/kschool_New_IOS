//
//  GuessTheAnimalOmnivoresMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalOmnivoresMenuVC: BaseViewController {

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
    
    
    let level1Birds: [BirdQuestions] = [
        BirdQuestions(name: "Pig", imageName: "pig_and_piglet"),
        BirdQuestions(name: "Hyena", imageName: "hyena_and_baby"),
        BirdQuestions(name: "Squirrel", imageName: "squirrel_and_baby"),
        BirdQuestions(name: "Bat Eared Fox", imageName: "bat_eared_fox_and_baby"),
        BirdQuestions(name: "Lemur", imageName: "lemur_and_baby"),
        BirdQuestions(name: "Opossum", imageName: "opossum_and_baby"),
        BirdQuestions(name: "Hedgehog", imageName: "hoglet_and_baby"),
        BirdQuestions(name: "Sloth", imageName: "sloth_and_baby"),
        BirdQuestions(name: "Monkey", imageName: "monkey_and_baby"),
        BirdQuestions(name: "Dog", imageName: "dog_and_puppy")
    ]
    
    let level2Birds: [BirdQuestions] = [
        BirdQuestions(name: "Black Bear", imageName: "black_bear_and_baby"),
        BirdQuestions(name: "Brown Rat Kangaroo", imageName: "brown_rat_kangaroo_and_baby"),
        BirdQuestions(name: "Badger", imageName: "badger_and_baby"),
        BirdQuestions(name: "Chipmunk", imageName: "chipmunk_and_baby"),
        BirdQuestions(name: "Baboon", imageName: "baboon_and_baby"),
        BirdQuestions(name: "Bushbaby", imageName: "bushbaby_and_baby"),
        BirdQuestions(name: "Bandicoot", imageName: "bandicoot_and_baby"),
        BirdQuestions(name: "Brown Bear", imageName: "brown_bear_and_baby"),
        BirdQuestions(name: "Chimpanzee", imageName: "chimpanzee_and_baby"),
        BirdQuestions(name: "Capuchin Monkey", imageName: "capuchin_monkey_and_baby")
    ]
    
    let level3Birds: [BirdQuestions] = [
        BirdQuestions(name: "Jackal", imageName: "jackal_and_baby"),
        BirdQuestions(name: "Ground Squirrel", imageName: "ground_squirrel_and_baby"),
        BirdQuestions(name: "Civet", imageName: "civet_and_baby"),
        BirdQuestions(name: "Raccoon Dog", imageName: "raccoon_dog_and_baby"),
        BirdQuestions(name: "Gorilla", imageName: "gorilla_and_baby"),
        BirdQuestions(name: "Cuscus", imageName: "cuscus_and_baby"),
        BirdQuestions(name: "Hamster", imageName: "hamster_and_baby"),
        BirdQuestions(name: "Gerbil", imageName: "gerbil_and_baby"),
        BirdQuestions(name: "Dormouse", imageName: "dormouse_and_baby"),
        BirdQuestions(name: "Coati", imageName: "coati_and_baby")
    ]
    
    let level4Birds: [BirdQuestions] = [
        BirdQuestions(name: "Marmoset", imageName: "marmoset_and_baby"),
        BirdQuestions(name: "Palm Civet", imageName: "african_palm_civet_and_baby"),
        BirdQuestions(name: "Olingo", imageName: "olingo_and_baby"),
        BirdQuestions(name: "Ringtail", imageName: "ringtail_and_baby"),
        BirdQuestions(name: "Mongoose", imageName: "mongoose_and_baby"),
        BirdQuestions(name: "Red Panda", imageName: "red_panda_and_baby"),
        BirdQuestions(name: "Skunk", imageName: "skunk_and_baby"),
        BirdQuestions(name: "Rhesus Macaque", imageName: "rhesus_macaque_and_baby"),
        BirdQuestions(name: "Kinkajou", imageName: "kinkajou_and_baby"),
        BirdQuestions(name: "Orangutan", imageName: "orangutan_and_baby")
    ]
    
    let level5Birds: [BirdQuestions] = [
        BirdQuestions(name: "Tamarin", imageName: "tamarin_and_baby"),
        BirdQuestions(name: "Striped Skunk", imageName: "striped_skunk_and_baby"),
        BirdQuestions(name: "Tree Shrew", imageName: "tree_shrew_and_baby"),
        BirdQuestions(name: "Sun Bear", imageName: "sun_bear_and_baby"),
        BirdQuestions(name: "Vole", imageName: "vole_and_baby"),
        BirdQuestions(name: "Fox", imageName: "red_fox_and_baby"),
        BirdQuestions(name: "Sugar Glider", imageName: "sugar_glider_and_baby"),
        BirdQuestions(name: "Sloth Bear", imageName: "sloth_bear_and_baby"),
        BirdQuestions(name: "Wild Boar", imageName: "wild_boar_and_baby"),
        BirdQuestions(name: "Binturong", imageName: "binturong_and_baby")
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
            UserDefaults.standard.bool(forKey: "guessTheAnimalOmnivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalOmnivoresLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalOmnivoresLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalOmnivoresLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalOmnivoresLevel5Completed")
           
        
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

        let completedKey = "guessTheAnimalOmnivoresLevel\(level)Completed"
        let percentageKey = "guessTheAnimalOmnivoresLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalOmnivoresShowVC") as! GuessTheAnimalOmnivoresShowVC
        vc.birds = level1Birds
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalOmnivoresShowVC") as! GuessTheAnimalOmnivoresShowVC
        vc.birds = level2Birds
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalOmnivoresShowVC") as! GuessTheAnimalOmnivoresShowVC
        vc.birds = level3Birds
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalOmnivoresShowVC") as! GuessTheAnimalOmnivoresShowVC
        vc.birds = level4Birds
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalOmnivoresShowVC") as! GuessTheAnimalOmnivoresShowVC
        vc.birds = level5Birds
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
        
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
     
        for i in 1...5 {
            defaults.removeObject(forKey: "guessTheAnimalOmnivoresLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalOmnivoresLevel\(i)Percentage")
        }
        
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
