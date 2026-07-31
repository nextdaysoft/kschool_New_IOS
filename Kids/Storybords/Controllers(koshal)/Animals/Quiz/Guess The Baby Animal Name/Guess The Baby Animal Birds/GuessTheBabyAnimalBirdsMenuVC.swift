//
//  GuessTheBabyAnimalBirdsMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheBabyAnimalBirdsMenuVC: BaseViewController {

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

        BabyAnimalQuestion(
            question: "Peacock's baby is called...?",
            options: ["Peachick", "Chick", "Poult", "Cygnet"],
            correctAnswer: "Peachick",
            imageName: "peacock_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Ostrich's baby is called...?",
            options: ["Chick", "Owlet", "Peachick", "Poult"],
            correctAnswer: "Chick",
            imageName: "ostrich_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Turkey's baby is called...?",
            options: ["Poult", "Duckling", "Chick", "Cygnet"],
            correctAnswer: "Poult",
            imageName: "turkey_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Owl's baby is called...?",
            options: ["Owlet", "Chick", "Peachick", "Poult"],
            correctAnswer: "Owlet",
            imageName: "owl_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Swan's baby is called...?",
            options: ["Cygnet", "Chick", "Duckling", "Owlet"],
            correctAnswer: "Cygnet",
            imageName: "swan_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Parrot's baby is called...?",
            options: ["Chick", "Peachick", "Poult", "Duckling"],
            correctAnswer: "Chick",
            imageName: "parrot_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Sparrow's baby is called...?",
            options: ["Chick", "Owlet", "Cygnet", "Poult"],
            correctAnswer: "Chick",
            imageName: "sparrow_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Pigeon's baby is called...?",
            options: ["Chick", "Peachick", "Duckling", "Owlet"],
            correctAnswer: "Chick",
            imageName: "pigeon_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Hen's baby is called...?",
            options: ["Chick", "Poult", "Owlet", "Cygnet"],
            correctAnswer: "Chick",
            imageName: "hen_and_chick"
        ),

        BabyAnimalQuestion(
            question: "Duck's baby is called...?",
            options: ["Duckling", "Chick", "Owlet", "Poult"],
            correctAnswer: "Duckling",
            imageName: "duck_and_duckling"
        )
    ]
    
    var level2Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Eagle's baby is called...?",
            options: ["Eaglet", "Chick", "Eyas", "Gosling"],
            correctAnswer: "Eaglet",
            imageName: "eagle_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Crow's baby is called...?",
            options: ["Chick", "Eaglet", "Eyas", "Duckling"],
            correctAnswer: "Chick",
            imageName: "crow_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Hawk's baby is called...?",
            options: ["Eyas", "Chick", "Eaglet", "Gosling"],
            correctAnswer: "Eyas",
            imageName: "hawk_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Penguin's baby is called...?",
            options: ["Chick", "Eyas", "Owlet", "Poult"],
            correctAnswer: "Chick",
            imageName: "penguin_baby"
        ),

        BabyAnimalQuestion(
            question: "Goose's baby is called...?",
            options: ["Gosling", "Chick", "Duckling", "Eyas"],
            correctAnswer: "Gosling",
            imageName: "goose_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Falcon's baby is called...?",
            options: ["Eyas", "Chick", "Eaglet", "Gosling"],
            correctAnswer: "Eyas",
            imageName: "falcon_and_baby"
        )
    ]
    
    var level3Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Crane's baby is called...?",
            options: ["Chick", "Eyas", "Owlet", "Poult"],
            correctAnswer: "Chick",
            imageName: "crane_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Myna's baby is called...?",
            options: ["Chick", "Gosling", "Eaglet", "Owlet"],
            correctAnswer: "Chick",
            imageName: "myna_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Heron's baby is called...?",
            options: ["Chick", "Eyas", "Cygnet", "Poult"],
            correctAnswer: "Chick",
            imageName: "heron_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Vulture's baby is called...?",
            options: ["Chick", "Eaglet", "Eyas", "Owlet"],
            correctAnswer: "Chick",
            imageName: "vulture_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Albatross's baby is called...?",
            options: ["Chick", "Duckling", "Poult", "Eyas"],
            correctAnswer: "Chick",
            imageName: "albatross_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Robin's baby is called...?",
            options: ["Chick", "Owlet", "Cygnet", "Eyas"],
            correctAnswer: "Chick",
            imageName: "robin_and_baby"
        )
    ]
    
    var level4Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Buzzard's baby is called...?",
            options: ["Eyas", "Chick", "Owlet", "Gosling"],
            correctAnswer: "Eyas",
            imageName: "buzzard_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Kingfisher's baby is called...?",
            options: ["Chick", "Eaglet", "Eyas", "Poult"],
            correctAnswer: "Chick",
            imageName: "kingfisher_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Hornbill's baby is called...?",
            options: ["Chick", "Owlet", "Cygnet", "Gosling"],
            correctAnswer: "Chick",
            imageName: "hornbill_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Pelican's baby is called...?",
            options: ["Chick", "Duckling", "Eyas", "Poult"],
            correctAnswer: "Chick",
            imageName: "pelican_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Stork's baby is called...?",
            options: ["Chick", "Eaglet", "Eyas", "Owlet"],
            correctAnswer: "Chick",
            imageName: "stork_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Woodpecker's baby is called...?",
            options: ["Chick", "Poult", "Eyas", "Gosling"],
            correctAnswer: "Chick",
            imageName: "woodpecker_and_baby"
        )
    ]
    
    
    var level5Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Lark's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Poult"],
            correctAnswer: "Chick",
            imageName: "lark_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Ibis's baby is called...?",
            options: ["Chick", "Gosling", "Eaglet", "Owlet"],
            correctAnswer: "Chick",
            imageName: "ibis_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Cormorant's baby is called...?",
            options: ["Chick", "Eyas", "Poult", "Duckling"],
            correctAnswer: "Chick",
            imageName: "cormorant_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Condor's baby is called...?",
            options: ["Chick", "Eaglet", "Eyas", "Owlet"],
            correctAnswer: "Chick",
            imageName: "condor_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Finch's baby is called...?",
            options: ["Chick", "Owlet", "Cygnet", "Poult"],
            correctAnswer: "Chick",
            imageName: "finch_and_baby"
        )
    ]
    
    var level6Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Kestrel's baby is called...?",
            options: ["Eyas", "Chick", "Eaglet", "Owlet"],
            correctAnswer: "Eyas",
            imageName: "kestrel_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Treepie's baby is called...?",
            options: ["Chick", "Eyas", "Owlet", "Poult"],
            correctAnswer: "Chick",
            imageName: "treepie_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Osprey's baby is called...?",
            options: ["Eyas", "Chick", "Eaglet", "Gosling"],
            correctAnswer: "Eyas",
            imageName: "osprey_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Macaw's baby is called...?",
            options: ["Chick", "Eyas", "Peachick", "Poult"],
            correctAnswer: "Chick",
            imageName: "macaw_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Toucan's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Cygnet"],
            correctAnswer: "Chick",
            imageName: "toucan_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Oriole's baby is called...?",
            options: ["Chick", "Eyas", "Duckling", "Owlet"],
            correctAnswer: "Chick",
            imageName: "oriole_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Babbler's baby is called...?",
            options: ["Chick", "Eaglet", "Eyas", "Poult"],
            correctAnswer: "Chick",
            imageName: "babbler_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Shrike's baby is called...?",
            options: ["Chick", "Eyas", "Owlet", "Gosling"],
            correctAnswer: "Chick",
            imageName: "shrike_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Lyrebird's baby is called...?",
            options: ["Chick", "Eyas", "Cygnet", "Owlet"],
            correctAnswer: "Chick",
            imageName: "lyrebird_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Nightingale's baby is called...?",
            options: ["Chick", "Eyas", "Owlet", "Poult"],
            correctAnswer: "Chick",
            imageName: "nightingale_and_baby"
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
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheBabyAnimalLevel6Completed")
        
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

        let completedKey = "guessTheBabyAnimalLevel\(level)Completed"
        let percentageKey = "guessTheBabyAnimalLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalBirdsShowVC") as! GuessTheBabyAnimalBirdsShowVC
        vc.questions = level1Questions
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalBirdsShowVC") as! GuessTheBabyAnimalBirdsShowVC
        vc.questions = level2Questions
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalBirdsShowVC") as! GuessTheBabyAnimalBirdsShowVC
        vc.questions = level3Questions
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalBirdsShowVC") as! GuessTheBabyAnimalBirdsShowVC
        vc.questions = level4Questions
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalBirdsShowVC") as! GuessTheBabyAnimalBirdsShowVC
        vc.questions = level5Questions
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheBabyAnimalBirdsShowVC") as! GuessTheBabyAnimalBirdsShowVC
        vc.questions = level6Questions
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...6 {
            defaults.removeObject(forKey: "guessTheBabyAnimalLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheBabyAnimalLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
