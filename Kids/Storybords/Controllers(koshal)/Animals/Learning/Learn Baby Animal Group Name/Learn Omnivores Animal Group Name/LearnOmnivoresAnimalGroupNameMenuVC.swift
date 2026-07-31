//
//  LearnOmnivoresAnimalGroupNameMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 26/02/26.
//

import UIKit

class LearnOmnivoresAnimalGroupNameMenuVC: BaseViewController {

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
            text: "Pig’s group is called a sounder",
            imageName: "pig_and_piglet"
        ),
        
        LearnPlanetsItem(
            text: "Hyena’s group is called a cackle",
            imageName: "hyena_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Squirrel’s group is called a scurry",
            imageName: "squirrel_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Bat Eared Fox’s group is called a skulk",
            imageName: "bat_eared_fox_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Lemur’s group is called a troop",
            imageName: "lemur_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Opossum’s group is called a passel",
            imageName: "opossum_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Hedgehog’s group is called an array",
            imageName: "hoglet_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Sloth’s group is called a snuggle",
            imageName: "sloth_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Monkey’s group is called a troop",
            imageName: "monkey_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Dog’s group is called a pack",
            imageName: "dog_and_puppy"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Black Bear’s group is called a sleuth",
            imageName: "black_bear_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Brown Rat Kangaroo’s group is called a colony",
            imageName: "brown_rat_kangaroo_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Badger’s group is called a cete",
            imageName: "badger_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Chipmunk’s group is called a scurry",
            imageName: "chipmunk_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Baboon’s group is called a troop",
            imageName: "baboon_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Bushbaby’s group is called a troop",
            imageName: "bushbaby_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Bandicoot’s group is called a colony",
            imageName: "bandicoot_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Brown Bear’s group is called a sloth",
            imageName: "brown_bear_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Chimpanzee’s group is called a troop",
            imageName: "chimpanzee_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Capuchin Monkey’s group is called a troop",
            imageName: "capuchin_monkey_and_baby"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Jackal’s group is called a pack",
            imageName: "jackal_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Ground Squirrel’s group is called a colony",
            imageName: "ground_squirrel_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Civet’s group is called a pack",
            imageName: "civet_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Raccoon Dog’s group is called a pack",
            imageName: "raccoon_dog_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Gorilla’s group is called a troop",
            imageName: "gorilla_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Cuscus’s group is called a colony",
            imageName: "cuscus_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Hamster’s group is called a horde",
            imageName: "hamster_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Gerbil’s group is called a horde",
            imageName: "gerbil_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Dormouse’s group is called a colony",
            imageName: "dormouse_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Coati’s group is called a band",
            imageName: "coati_and_baby"
        )
    ]
    
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Marmoset’s group is called a troop",
            imageName: "marmoset_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Palm Civet’s group is called a pack",
            imageName: "african_palm_civet_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Olingo’s group is called a troop",
            imageName: "olingo_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Ringtail’s group is called a ring",
            imageName: "ringtail_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Mongoose’s group is called a mob",
            imageName: "mongoose_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Red Panda’s group is called a sleuth",
            imageName: "red_panda_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Skunk’s group is called a surfeit",
            imageName: "skunk_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Rhesus Macaque’s group is called a troop",
            imageName: "rhesus_macaque_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Kinkajou’s group is called a troop",
            imageName: "kinkajou_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Orangutan’s group is called a troop",
            imageName: "orangutan_and_baby"
        )
    ]
    
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Tamarin’s group is called a troop",
            imageName: "tamarin_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Striped Skunk’s group is called a surfeit",
            imageName: "striped_skunk_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Tree Shrew’s group is called a colony",
            imageName: "tree_shrew_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Sun Bear’s group is called a sleuth",
            imageName: "sun_bear_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Vole’s group is called a colony",
            imageName: "vole_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Fox’s group is called a skulk",
            imageName: "red_fox_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Sugar Glider’s group is called a colony",
            imageName: "sugar_glider_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Sloth Bear’s group is called a sleuth",
            imageName: "sloth_bear_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Wild Boar’s group is called a sounder",
            imageName: "wild_boar_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Binturong’s group is called a troop",
            imageName: "binturong_and_baby"
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
        
          
     
        if UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel1Completed") {
            image1.image = UIImage(named: "done")
        } else {
            image1.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel2Completed") {
            image2.image = UIImage(named: "done")
        } else {
            image2.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel3Completed") {
            image3.image = UIImage(named: "done")
        } else {
            image3.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel4Completed") {
            image4.image = UIImage(named: "done")
        } else {
            image4.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel5Completed") {
            image5.image = UIImage(named: "done")
        } else {
            image5.image = nil
        }
        
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel5Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        image1.image = UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel1Completed") ? UIImage(named: "done") : nil
        image2.image = UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel2Completed") ? UIImage(named: "done") : nil
        image3.image = UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel3Completed") ? UIImage(named: "done") : nil
        image4.image = UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel4Completed") ? UIImage(named: "done") : nil
        image5.image = UserDefaults.standard.bool(forKey: "learnOmnivoresGroupNameLevel5Completed") ? UIImage(named: "done") : nil
        
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnOmnivoresAnimalGroupNameShowVC") as! LearnOmnivoresAnimalGroupNameShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnOmnivoresAnimalGroupNameShowVC") as! LearnOmnivoresAnimalGroupNameShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnOmnivoresAnimalGroupNameShowVC") as! LearnOmnivoresAnimalGroupNameShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnOmnivoresAnimalGroupNameShowVC") as! LearnOmnivoresAnimalGroupNameShowVC
        vc.planets = planets4
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnOmnivoresAnimalGroupNameShowVC") as! LearnOmnivoresAnimalGroupNameShowVC
        vc.planets = planets5
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
 
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...5 {
            defaults.removeObject(forKey: "learnOmnivoresGroupNameLevel\(i)Completed")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
