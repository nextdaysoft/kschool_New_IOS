//
//  GuessTheAnimalGroupNameBirdsMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalGroupNameBirdsMenuVC: BaseViewController {

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
            question: "Peacock's group is called...?",
            options: ["Muster", "Flock", "Parliament", "Bevy"],
            correctAnswer: "Muster",
            imageName: "peacock_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Ostrich's group is called...?",
            options: ["Flock", "Rafter", "Muster", "Bevy"],
            correctAnswer: "Flock",
            imageName: "ostrich_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Turkey's group is called...?",
            options: ["Rafter", "Flock", "Parliament", "Bevy"],
            correctAnswer: "Rafter",
            imageName: "turkey_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Owl's group is called...?",
            options: ["Parliament", "Flock", "Muster", "Bevy"],
            correctAnswer: "Parliament",
            imageName: "owl_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Swan's group is called...?",
            options: ["Bevy", "Flock", "Rafter", "Parliament"],
            correctAnswer: "Bevy",
            imageName: "swan_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Parrot's group is called...?",
            options: ["Flock", "Muster", "Rafter", "Bevy"],
            correctAnswer: "Flock",
            imageName: "parrot_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Sparrow's group is called...?",
            options: ["Flock", "Parliament", "Bevy", "Rafter"],
            correctAnswer: "Flock",
            imageName: "sparrow_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Pigeon's group is called...?",
            options: ["Flock", "Muster", "Rafter", "Bevy"],
            correctAnswer: "Flock",
            imageName: "pigeon_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Hen's group is called...?",
            options: ["Flock", "Rafter", "Bevy", "Parliament"],
            correctAnswer: "Flock",
            imageName: "hen_and_chick"
        ),

        BabyAnimalQuestion(
            question: "Duck's group is called...?",
            options: ["Flock", "Bevy", "Rafter", "Muster"],
            correctAnswer: "Flock",
            imageName: "duck_and_duckling"
        )
    ]
    
    var level2Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Eagle's group is called...?",
            options: ["Convocation", "Murder", "Flock", "Colony"],
            correctAnswer: "Convocation",
            imageName: "hawk_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Crow's group is called...?",
            options: ["Murder", "Flock", "Colony", "Gaggle"],
            correctAnswer: "Murder",
            imageName: "crow_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Hawk's group is called...?",
            options: ["Flock", "Cast", "Colony", "Gaggle"],
            correctAnswer: "Flock",
            imageName: "hawk_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Penguin's group is called...?",
            options: ["Colony", "Flock", "Gaggle", "Cast"],
            correctAnswer: "Colony",
            imageName: "penguin_baby"
        ),

        BabyAnimalQuestion(
            question: "Goose's group is called...?",
            options: ["Gaggle", "Colony", "Flock", "Cast"],
            correctAnswer: "Gaggle",
            imageName: "goose_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Seagull's group is called...?",
            options: ["Colony", "Flock", "Gaggle", "Cast"],
            correctAnswer: "Colony",
            imageName: "seagull_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Emu's group is called...?",
            options: ["Flock", "Colony", "Gaggle", "Cast"],
            correctAnswer: "Flock",
            imageName: "emu_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Dove's group is called...?",
            options: ["Flock", "Colony", "Cast", "Gaggle"],
            correctAnswer: "Flock",
            imageName: "dove_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Flamingo's group is called...?",
            options: ["Flamboyance", "Flock", "Colony", "Gaggle"],
            correctAnswer: "Flamboyance",
            imageName: "flamingo_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Falcon's group is called...?",
            options: ["Cast", "Flock", "Colony", "Gaggle"],
            correctAnswer: "Cast",
            imageName: "falcon_and_baby"
        )
    ]
    
    var level3Questions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(
            question: "Crane's group is called...?",
            options: ["Siege", "Flock", "Committee", "Cloud"],
            correctAnswer: "Siege",
            imageName: "crane_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Myna's group is called...?",
            options: ["Flock", "Siege", "Committee", "Cloud"],
            correctAnswer: "Flock",
            imageName: "myna_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Heron's group is called...?",
            options: ["Siege", "Flock", "Committee", "Cloud"],
            correctAnswer: "Siege",
            imageName: "heron_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Vulture's group is called...?",
            options: ["Committee", "Flock", "Siege", "Cloud"],
            correctAnswer: "Committee",
            imageName: "vulture_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Cuckoo's group is called...?",
            options: ["Brood", "Flock", "Cloud", "Round"],
            correctAnswer: "Brood",
            imageName: "cuckoo_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Albatross's group is called...?",
            options: ["Rookery", "Flock", "Cloud", "Round"],
            correctAnswer: "Rookery",
            imageName: "albatross_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Magpie's group is called...?",
            options: ["Tiding", "Flock", "Cloud", "Round"],
            correctAnswer: "Tiding",
            imageName: "magpie_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Blackbird's group is called...?",
            options: ["Cloud", "Flock", "Tiding", "Round"],
            correctAnswer: "Cloud",
            imageName: "blackbird_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Canary's group is called...?",
            options: ["Flock", "Cloud", "Tiding", "Round"],
            correctAnswer: "Flock",
            imageName: "canary_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Robin's group is called...?",
            options: ["Round", "Flock", "Cloud", "Siege"],
            correctAnswer: "Round",
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
            question: "Quail's baby is called...?",
            options: ["Chick", "Poult", "Eyas", "Owlet"],
            correctAnswer: "Chick",
            imageName: "quail_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Pelican's baby is called...?",
            options: ["Chick", "Duckling", "Eyas", "Poult"],
            correctAnswer: "Chick",
            imageName: "pelican_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Ptarmigan's baby is called...?",
            options: ["Chick", "Poult", "Eyas", "Owlet"],
            correctAnswer: "Chick",
            imageName: "ptarmigan_and_baby"
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
        ),

        BabyAnimalQuestion(
            question: "Starling's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Cygnet"],
            correctAnswer: "Chick",
            imageName: "starling_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Crow Pheasant's baby is called...?",
            options: ["Chick", "Poult", "Eyas", "Owlet"],
            correctAnswer: "Chick",
            imageName: "crow_pheasant_and_baby"
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
            question: "Wagtail's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Gosling"],
            correctAnswer: "Chick",
            imageName: "wagtail_and_baby"
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
            question: "Spoonbill's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Poult"],
            correctAnswer: "Chick",
            imageName: "spoonbill_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Condor's baby is called...?",
            options: ["Chick", "Eaglet", "Eyas", "Owlet"],
            correctAnswer: "Chick",
            imageName: "condor_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Sunbird's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Poult"],
            correctAnswer: "Chick",
            imageName: "sunbird_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Swift's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Gosling"],
            correctAnswer: "Chick",
            imageName: "swift_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Bulbul's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Poult"],
            correctAnswer: "Chick",
            imageName: "bulbul_and_baby"
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
            question: "Treepie's baby is called...?",
            options: ["Chick", "Eyas", "Owlet", "Poult"],
            correctAnswer: "Chick",
            imageName: "treepie_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Toucan's baby is called...?",
            options: ["Chick", "Owlet", "Eyas", "Cygnet"],
            correctAnswer: "Chick",
            imageName: "toucan_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Nightingale's baby is called...?",
            options: ["Chick", "Eyas", "Owlet", "Poult"],
            correctAnswer: "Chick",
            imageName: "nightingale_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Kestrel's baby is called...?",
            options: ["Eyas", "Chick", "Eaglet", "Owlet"],
            correctAnswer: "Eyas",
            imageName: "kestrel_and_baby"
        ),

        BabyAnimalQuestion(
            question: "Osprey's baby is called...?",
            options: ["Eyas", "Chick", "Eaglet", "Gosling"],
            correctAnswer: "Eyas",
            imageName: "osprey_and_baby"
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
            question: "Macaw's baby is called...?",
            options: ["Chick", "Eyas", "Peachick", "Poult"],
            correctAnswer: "Chick",
            imageName: "macaw_and_baby"
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
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameBirdsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameBirdsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameBirdsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameBirdsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameBirdsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalGroupNameBirdsLevel1Completed")
        
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

        let completedKey = "guessTheAnimalGroupNameBirdsLevel\(level)Completed"
        let percentageKey = "guessTheAnimalGroupNameBirdsLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameBirdsShowVC") as! GuessTheAnimalGroupNameBirdsShowVC
        vc.questions = level1Questions
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameBirdsShowVC") as! GuessTheAnimalGroupNameBirdsShowVC
        vc.questions = level2Questions
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameBirdsShowVC") as! GuessTheAnimalGroupNameBirdsShowVC
        vc.questions = level3Questions
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameBirdsShowVC") as! GuessTheAnimalGroupNameBirdsShowVC
        vc.questions = level4Questions
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameBirdsShowVC") as! GuessTheAnimalGroupNameBirdsShowVC
        vc.questions = level5Questions
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalGroupNameBirdsShowVC") as! GuessTheAnimalGroupNameBirdsShowVC
        vc.questions = level6Questions
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...6 {
            defaults.removeObject(forKey: "guessTheAnimalGroupNameBirdsLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalGroupNameBirdsLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
