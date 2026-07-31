//
//  GuessTheAnimalSoundLevelMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalSoundLevelMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
   
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!

    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!

  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    // MARK: - Level 1 (Birds)

    let level1Birds: [BirdQuestions] = [
        BirdQuestions(name: "Turkey", imageName: "turkey_and_baby"),
        BirdQuestions(name: "Rooster", imageName: "rooster"),
        BirdQuestions(name: "Eagle", imageName: "eagle_and_baby"),
        BirdQuestions(name: "Parrot", imageName: "parrot_and_baby"),
        BirdQuestions(name: "Peacock", imageName: "peacock_and_baby"),
        BirdQuestions(name: "Owl", imageName: "owl_and_baby"),
        BirdQuestions(name: "Sparrow", imageName: "sparrow_and_baby"),
        BirdQuestions(name: "Goose", imageName: "goose_and_baby"),
        BirdQuestions(name: "Crow", imageName: "crow_and_baby"),
        BirdQuestions(name: "Pigeon", imageName: "pigeon_and_baby")
    ]

    // MARK: - Level 2 (Domestic Animals)

    let level2Birds: [BirdQuestions] = [
        BirdQuestions(name: "Cat", imageName: "pampas_cat"),
        BirdQuestions(name: "Cow", imageName: "cow_and_calf"),
        BirdQuestions(name: "Dog", imageName: "dog_and_puppy"),
        BirdQuestions(name: "Donkey", imageName: "donkey_and_foal"),
        BirdQuestions(name: "Duck", imageName: "duck_and_duckling"),
        BirdQuestions(name: "Goat", imageName: "goat_and_kid"),
        BirdQuestions(name: "Hen", imageName: "hen_and_chick"),
        BirdQuestions(name: "Horse", imageName: "horse_and_foal"),
        BirdQuestions(name: "Pig", imageName: "pig_and_piglet"),
        BirdQuestions(name: "Sheep", imageName: "sheep_and_lamb")
    ]

    // MARK: - Level 3 (Wild Animals)

    let level3Birds: [BirdQuestions] = [
        BirdQuestions(name: "Bear", imageName: "brown_bear_and_baby"),
        BirdQuestions(name: "Deer", imageName: "deer_and_fawn"),
        BirdQuestions(name: "Elephant", imageName: "elephant_and_calf"),
        BirdQuestions(name: "Fox", imageName: "red_fox_and_baby"),
        BirdQuestions(name: "Giraffe", imageName: "giraffe_and_baby"),
        BirdQuestions(name: "Lion", imageName: "lion_and_cub"),
        BirdQuestions(name: "Monkey", imageName: "monkey_and_baby"),
        BirdQuestions(name: "Panda", imageName: "panda_and_baby"),
        BirdQuestions(name: "Tiger", imageName: "tiger_and_cub"),
        BirdQuestions(name: "Zebra", imageName: "zebra_and_baby")
    ]

    // MARK: - Level 4 (Mixed Animals)

    let level4Birds: [BirdQuestions] = [
        BirdQuestions(name: "Camel", imageName: "camel_and_baby"),
        BirdQuestions(name: "Chimpanzee", imageName: "chimpanzee_and_baby"),
        BirdQuestions(name: "Frog", imageName: "ic_frog"),
        BirdQuestions(name: "Hippo", imageName: "hippo_and_baby"),
        BirdQuestions(name: "Kangaroo", imageName: "kangaroo_and_joey"),
        BirdQuestions(name: "Rabbit", imageName: "rabbit_and_baby"),
        BirdQuestions(name: "Rhino", imageName: "rhino_and_baby"),
        BirdQuestions(name: "Snake", imageName: "ic_snake"),
        BirdQuestions(name: "Vulture", imageName: "vulture_and_baby"),
        BirdQuestions(name: "Wolf", imageName: "wolf_and_pup")
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "guessTheAnimalSoundLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalSoundLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalSoundLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalSoundLevel4Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "guessTheAnimalSoundLevel\(level)Completed"
        let percentageKey = "guessTheAnimalSoundLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalSoundShowVC") as! GuessTheAnimalSoundShowVC
        vc.birds = level1Birds
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalSoundShowVC") as! GuessTheAnimalSoundShowVC
        vc.birds = level2Birds
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalSoundShowVC") as! GuessTheAnimalSoundShowVC
        vc.birds = level3Birds
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalSoundShowVC") as! GuessTheAnimalSoundShowVC
        vc.birds = level4Birds
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard

        for i in 1...4 {
            defaults.removeObject(forKey: "guessTheAnimalSoundLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalSoundLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
