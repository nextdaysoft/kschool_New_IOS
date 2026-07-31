//
//  LearnCarnivoresAnimalGroupNameMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 26/02/26.
//

import UIKit

class LearnCarnivoresAnimalGroupNameMenuVC: BaseViewController {

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
            text: "Jaguar’s group is called a prowl",
            imageName: "jaguar_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Mountain Lion’s group is called a pride",
            imageName: "mountain_lion_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Cheetah’s group is called a coalition",
            imageName: "cheetah_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Wolf’s group is called a pack",
            imageName: "wolf_and_pup"
        ),
        
        LearnPlanetsItem(
            text: "Panther’s group is called a claw",
            imageName: "panther_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Lion’s group is called a pride",
            imageName: "lion_and_cub"
        ),
        
        LearnPlanetsItem(
            text: "Eurasian Lynx’s group is called a chain",
            imageName: "eurasian_lynx_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Tiger’s group is called an ambush",
            imageName: "tiger_and_cub"
        ),
        
        LearnPlanetsItem(
            text: "Leopard’s group is called a leap",
            imageName: "leopard_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Snow Leopard’s group is called a leap",
            imageName: "snow_leopard_and_baby"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Marbled Cat’s group is called a clowder",
            imageName: "marbled_cat"
        ),
        
        LearnPlanetsItem(
            text: "African Golden Cat’s group is called a clowder",
            imageName: "african_golden_cat"
        ),
        
        LearnPlanetsItem(
            text: "Coyote’s group is called a pack",
            imageName: "coyote_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Gray Wolf’s group is called a pack",
            imageName: "gray_wolf_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "American Mink’s group is called a colony",
            imageName: "american_mink_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "African Wild Dog’s group is called a pack",
            imageName: "african_wild_dog"
        ),
        
        LearnPlanetsItem(
            text: "Wolverine’s group is called a pack",
            imageName: "wolverine_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Lynx’s group is called a chain",
            imageName: "lynx_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Jackal’s group is called a pack",
            imageName: "jackal_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Dingo’s group is called a pack",
            imageName: "dingo_and_baby"
        )
    ]
    
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Pampas Cat’s group is called a clowder",
            imageName: "pampas_cat"
        ),
        
        LearnPlanetsItem(
            text: "Least Weasel’s group is called a pack",
            imageName: "least_weasel_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Himalayan Wolf’s group is called a pack",
            imageName: "himalayan_wolf"
        ),
        
        LearnPlanetsItem(
            text: "Red Wolf’s group is called a pack",
            imageName: "red_wolf"
        ),
        
        LearnPlanetsItem(
            text: "Ermine’s group is called a pack",
            imageName: "ermine_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Fossa’s group is called a pack",
            imageName: "fossa_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Iberian Lynx’s group is called a chain",
            imageName: "iberian_lynx_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Tasmanian Devil’s group is called a pack",
            imageName: "tasmanian_devil_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Asiatic Golden Cat’s group is called a clowder",
            imageName: "asiatic_golden_cat_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Andean Mountain Cat’s group is called a clowder",
            imageName: "andean_mountain_cat_and_baby"
        )
    ]
    
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Ethiopian Wolf’s group is called a pack",
            imageName: "ethiopian_wolf_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Kodkod’s group is called a clowder",
            imageName: "kodkod_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Sand Cat’s group is called a clowder",
            imageName: "sand_cat_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Indian Desert Fox’s group is called a skulk",
            imageName: "indian_desert_fox_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Margay’s group is called a clowder",
            imageName: "margay_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Fisher’s group is called a pack",
            imageName: "fisher_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Black-footed Cat’s group is called a clowder",
            imageName: "black_footed_cat_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Steppe Polecat’s group is called a pack",
            imageName: "steppe_polecat_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Pallas's Cat’s group is called a clowder",
            imageName: "pallas_cat_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Himalayan Red Fox’s group is called a skulk",
            imageName: "himalayan_red_fox_and_baby"
        )
    ]
    
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Caracal’s group is called a clowder",
            imageName: "caracal_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Striped Polecat’s group is called a pack",
            imageName: "striped_pole_cat_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Serval’s group is called a clowder",
            imageName: "serval_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Canadian Lynx’s group is called a chain",
            imageName: "canadian_lynx_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Tibetan Wolf’s group is called a pack",
            imageName: "tibetan_wolf_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Bay Cat’s group is called a clowder",
            imageName: "bay_cat_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Zorilla’s group is called a pack",
            imageName: "zorilla_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Brown Hyena’s group is called a cackle",
            imageName: "brown_hyena_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Clouded Leopard’s group is called a leap",
            imageName: "clouded_leopard_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Arctic Fox’s group is called a skulk",
            imageName: "arctic_fox_and_baby"
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
        
          
     
        if UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel1Completed") {
            image1.image = UIImage(named: "done")
        } else {
            image1.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel2Completed") {
            image2.image = UIImage(named: "done")
        } else {
            image2.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel3Completed") {
            image3.image = UIImage(named: "done")
        } else {
            image3.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel4Completed") {
            image4.image = UIImage(named: "done")
        } else {
            image4.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel5Completed") {
            image5.image = UIImage(named: "done")
        } else {
            image5.image = nil
        }
        
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel5Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        image1.image = UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel1Completed") ? UIImage(named: "done") : nil
        image2.image = UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel2Completed") ? UIImage(named: "done") : nil
        image3.image = UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel3Completed") ? UIImage(named: "done") : nil
        image4.image = UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel4Completed") ? UIImage(named: "done") : nil
        image5.image = UserDefaults.standard.bool(forKey: "learnCarnivoresGroupNameLevel5Completed") ? UIImage(named: "done") : nil
        
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnCarnivoresAnimalGroupNameShowVC") as! LearnCarnivoresAnimalGroupNameShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnCarnivoresAnimalGroupNameShowVC") as! LearnCarnivoresAnimalGroupNameShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnCarnivoresAnimalGroupNameShowVC") as! LearnCarnivoresAnimalGroupNameShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnCarnivoresAnimalGroupNameShowVC") as! LearnCarnivoresAnimalGroupNameShowVC
        vc.planets = planets4
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnCarnivoresAnimalGroupNameShowVC") as! LearnCarnivoresAnimalGroupNameShowVC
        vc.planets = planets5
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
 
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...5 {
            defaults.removeObject(forKey: "learnCarnivoresGroupNameLevel\(i)Completed")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
