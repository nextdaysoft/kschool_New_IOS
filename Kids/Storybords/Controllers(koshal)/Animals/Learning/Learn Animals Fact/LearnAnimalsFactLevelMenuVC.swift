//
//  LearnAnimalsFactLevelMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 26/02/26.
//

import UIKit

class LearnAnimalsFactLevelMenuVC: BaseViewController {

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
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Penguin is the best swimming bird",
            imageName: "penguin_baby"
        ),
        
        LearnPlanetsItem(
            text: "Peregrine falcon is the fastest bird",
            imageName: "falcon_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Ostrich is the largest bird",
            imageName: "ostrich_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Snake has no legs",
            imageName: "ic_snake"
        ),
        
        LearnPlanetsItem(
            text: "Elephant is the largest land animal",
            imageName: "elephant_and_calf"
        ),
        
        LearnPlanetsItem(
            text: "Giraffe is the tallest animal",
            imageName: "giraffe_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Blue whale is the largest animal in the world",
            imageName: "blue_whale"
        ),
        
        LearnPlanetsItem(
            text: "Tortoise is the slowest animal",
            imageName: "softshell_turtle"
        ),
        
        LearnPlanetsItem(
            text: "Cheetah is the fastest land animal",
            imageName: "cheetah_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Lion is the king of the jungle",
            imageName: "lion_and_cub"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Camel is called the ship of the desert",
            imageName: "camel_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Octopus has three hearts",
            imageName: "octopus"
        ),
        
        LearnPlanetsItem(
            text: "Dolphin sleeps with one eye open",
            imageName: "dolphin_fish"
        ),
        
        LearnPlanetsItem(
            text: "Turtle can live for more than 100 years",
            imageName: "softshell_turtle"
        ),
        
        LearnPlanetsItem(
            text: "Octopus can change its color",
            imageName: "octopus"
        ),
        
        LearnPlanetsItem(
            text: "Giraffe has the same number of neck bones as humans",
            imageName: "giraffe_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Owls can rotate their heads up to 270 degrees",
            imageName: "owl_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Kangaroo cannot walk backward",
            imageName: "kangaroo_and_joey"
        ),
        
        LearnPlanetsItem(
            text: "Elephant can remember things for a very long time",
            imageName: "elephant_and_calf"
        ),
        
        LearnPlanetsItem(
            text: "Snake smells using its tongue",
            imageName: "ic_snake"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Crocodile cannot stick out its tongue",
            imageName: "crocodile_semi"
        ),
        
        LearnPlanetsItem(
            text: "Parrot can copy human sounds",
            imageName: "parrot_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Penguin cannot fly",
            imageName: "penguin_baby"
        ),
        
        LearnPlanetsItem(
            text: "Horse can sleep while standing",
            imageName: "horse_and_foal"
        ),
        
        LearnPlanetsItem(
            text: "Owl can see well at night",
            imageName: "owl_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Goat can climb steep places",
            imageName: "goat_and_kid"
        ),
        
        LearnPlanetsItem(
            text: "Elephant cannot jump",
            imageName: "elephant_and_calf"
        ),
        
        LearnPlanetsItem(
            text: "Kangaroo carries its baby in a pouch",
            imageName: "kangaroo_and_joey"
        ),
        
        LearnPlanetsItem(
            text: "Camel can live many days without water",
            imageName: "camel_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Frog drinks water through its skin",
            imageName: "ic_frog"
        )
    ]
   
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Owl feathers make no sound while flying",
            imageName: "owl_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Horse runs soon after birth",
            imageName: "horse_and_foal"
        ),
        
        LearnPlanetsItem(
            text: "Zebra stripes are different for each zebra",
            imageName: "zebra_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Flamingo color comes from its food",
            imageName: "flamingo_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Starfish has no brain",
            imageName: "starfish"
        ),
        
        LearnPlanetsItem(
            text: "Eagle can see very far",
            imageName: "eagle_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Duck has waterproof feathers",
            imageName: "duck_and_duckling"
        ),
        
        LearnPlanetsItem(
            text: "Starfish can regrow lost arms",
            imageName: "starfish"
        ),
        
        LearnPlanetsItem(
            text: "Octopus has soft body with no bones",
            imageName: "octopus"
        ),
        
        LearnPlanetsItem(
            text: "Rabbit teeth never stop growing",
            imageName: "rabbit_and_baby"
        )
    ]
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Jellyfish have no brain or heart",
            imageName: "jellyfish"
        ),
        
        LearnPlanetsItem(
            text: "Whale sings songs to communicate",
            imageName: "blue_whale"
        ),
        
        LearnPlanetsItem(
            text: "Dolphin can recognize itself in a mirror",
            imageName: "dolphin_fish"
        ),
        
        LearnPlanetsItem(
            text: "Koi fish can recognize their owners",
            imageName: "koi"
        ),
        
        LearnPlanetsItem(
            text: "Crocodile can hold its breath underwater for hours",
            imageName: "crocodile_semi"
        ),
        
        LearnPlanetsItem(
            text: "Camel can drink 40 gallons of water at once",
            imageName: "camel_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Duck has waterproof feathers",
            imageName: "duck_and_duckling"
        ),
        
        LearnPlanetsItem(
            text: "Flamingo bends its knees backward",
            imageName: "flamingo_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Elephant uses its ears to stay cool",
            imageName: "elephant_and_calf"
        ),
        
        LearnPlanetsItem(
            text: "Owls can rotate their eyes but not move them",
            imageName: "owl_and_baby"
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
        
          
     
        if UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel1Completed") {
            image1.image = UIImage(named: "done")
        } else {
            image1.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel2Completed") {
            image2.image = UIImage(named: "done")
        } else {
            image2.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel3Completed") {
            image3.image = UIImage(named: "done")
        } else {
            image3.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel4Completed") {
            image4.image = UIImage(named: "done")
        } else {
            image4.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel5Completed") {
            image5.image = UIImage(named: "done")
        } else {
            image5.image = nil
        }
        
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel5Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        image1.image = UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel1Completed") ? UIImage(named: "done") : nil
        image2.image = UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel2Completed") ? UIImage(named: "done") : nil
        image3.image = UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel3Completed") ? UIImage(named: "done") : nil
        image4.image = UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel4Completed") ? UIImage(named: "done") : nil
        image5.image = UserDefaults.standard.bool(forKey: "learnAnimalsFactLevel5Completed") ? UIImage(named: "done") : nil
        
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnAnimalsFactShowVC") as! LearnAnimalsFactShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnAnimalsFactShowVC") as! LearnAnimalsFactShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnAnimalsFactShowVC") as! LearnAnimalsFactShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnAnimalsFactShowVC") as! LearnAnimalsFactShowVC
        vc.planets = planets4
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnAnimalsFactShowVC") as! LearnAnimalsFactShowVC
        vc.planets = planets5
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
 
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...5 {
            defaults.removeObject(forKey: "learnAnimalsFactLevel\(i)Completed")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
