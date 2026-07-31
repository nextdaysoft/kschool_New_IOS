//
//  LearnBirdsAnimalGroupNameMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 26/02/26.
//

import UIKit

class LearnBirdsAnimalGroupNameMenuVC: BaseViewController {

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
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Peacock’s group is called a muster/party",
            imageName: "peacock_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Ostrich’s group is called a flock",
            imageName: "ostrich_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Turkey’s group is called a rafter",
            imageName: "turkey_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Owl’s group is called a parliament",
            imageName: "owl_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Swan’s group is called a bevy",
            imageName: "swan_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Parrot’s group is called a flock",
            imageName: "parrot_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Sparrow’s group is called a flock",
            imageName: "sparrow_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Pigeon’s group is called a flock",
            imageName: "pigeon_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Hen’s group is called a flock",
            imageName: "hen_and_chick"
        ),
        
        LearnPlanetsItem(
            text: "Duck’s group is called a flock",
            imageName: "duck_and_duckling"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Eagle’s group is called a convocation",
            imageName: "hawk_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Crow’s group is called a murder",
            imageName: "crow_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Hawk’s group is called a flock",
            imageName: "hawk_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Penguin’s group is called a colony",
            imageName: "penguin_baby"
        ),
        
        LearnPlanetsItem(
            text: "Goose’s group is called a gaggle",
            imageName: "goose_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Seagull’s group is called a colony",
            imageName: "seagull_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Emu’s group is called a flock",
            imageName: "emu_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Dove’s group is called a flock",
            imageName: "dove_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Flamingo’s group is called a flamboyance",
            imageName: "flamingo_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Falcon’s group is called a cast",
            imageName: "falcon_and_baby"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Crane’s group is called a siege",
            imageName: "crane_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Myna’s group is called a flock",
            imageName: "myna_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Heron’s group is called a siege",
            imageName: "heron_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Vulture’s group is called a committee",
            imageName: "vulture_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Cuckoo’s group is called a brood",
            imageName: "cuckoo_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Albatross’s group is called a rookery",
            imageName: "albatross_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Magpie’s group is called a tiding",
            imageName: "magpie_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Blackbird’s group is called a cloud",
            imageName: "blackbird_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Canary’s group is called a flock",
            imageName: "canary_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Robin’s group is called a round",
            imageName: "robin_and_baby"
        )
    ]
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Starling’s group is called a murmuration",
            imageName: "starling_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Buzzard’s group is called a wake",
            imageName: "buzzard_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Crow Pheasant’s group is called a flock",
            imageName: "crow_pheasant_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Kingfisher’s group is called a concentration",
            imageName: "kingfisher_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Hornbill’s group is called a casque",
            imageName: "hornbill_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Quail’s group is called a covey",
            imageName: "quail_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Pelican’s group is called a pod",
            imageName: "pelican_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Ptarmigan’s group is called a covey",
            imageName: "ptarmigan_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Stork’s group is called a mustering",
            imageName: "stork_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Woodpecker’s group is called a descent",
            imageName: "woodpecker_and_baby"
        )
    ]
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Lark’s group is called an exaltation",
            imageName: "lark_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Wagtail’s group is called a flock",
            imageName: "wagtail_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Ibis’s group is called a congregation",
            imageName: "ibis_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Cormorant’s group is called a gulp",
            imageName: "cormorant_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Spoonbill’s group is called a bowl",
            imageName: "spoonbill_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Condor’s group is called a wake",
            imageName: "condor_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Sunbird’s group is called a flock",
            imageName: "sunbird_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Swift’s group is called a scream",
            imageName: "swift_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Bulbul’s group is called a flock",
            imageName: "bulbul_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Finch’s group is called a charm",
            imageName: "finch_and_baby"
        )
    ]
    
    let planets6: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Treepie’s group is called a flock",
            imageName: "treepie_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Toucan’s group is called a flock",
            imageName: "toucan_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Nightingale’s group is called a watch",
            imageName: "nightingale_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Kestrel’s group is called a wake",
            imageName: "kestrel_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Osprey’s group is called a duet",
            imageName: "osprey_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Oriole’s group is called a pitch",
            imageName: "oriole_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Babbler’s group is called a congress",
            imageName: "babbler_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Macaw’s group is called a squawk",
            imageName: "macaw_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Shrike’s group is called a watch",
            imageName: "shrike_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Lyrebird’s group is called a flock",
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
        
          
     
        if UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel1Completed") {
            image1.image = UIImage(named: "done")
        } else {
            image1.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel2Completed") {
            image2.image = UIImage(named: "done")
        } else {
            image2.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel3Completed") {
            image3.image = UIImage(named: "done")
        } else {
            image3.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNamesLevel4Completed") {
            image4.image = UIImage(named: "done")
        } else {
            image4.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel5Completed") {
            image5.image = UIImage(named: "done")
        } else {
            image5.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel6Completed") {
            image6.image = UIImage(named: "done")
        } else {
            image6.image = nil
        }
        
        
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel6Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        image1.image = UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel1Completed") ? UIImage(named: "done") : nil
        image2.image = UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel2Completed") ? UIImage(named: "done") : nil
        image3.image = UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel3Completed") ? UIImage(named: "done") : nil
        image4.image = UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel4Completed") ? UIImage(named: "done") : nil
        image5.image = UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel5Completed") ? UIImage(named: "done") : nil
        image6.image = UserDefaults.standard.bool(forKey: "learnBirdsAnimalGroupNameLevel6Completed") ? UIImage(named: "done") : nil
        
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnBirdsAnimalGroupNameShowVC") as! LearnBirdsAnimalGroupNameShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnBirdsAnimalGroupNameShowVC") as! LearnBirdsAnimalGroupNameShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnBirdsAnimalGroupNameShowVC") as! LearnBirdsAnimalGroupNameShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnBirdsAnimalGroupNameShowVC") as! LearnBirdsAnimalGroupNameShowVC
        vc.planets = planets4
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnBirdsAnimalGroupNameShowVC") as! LearnBirdsAnimalGroupNameShowVC
        vc.planets = planets5
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnBirdsAnimalGroupNameShowVC") as! LearnBirdsAnimalGroupNameShowVC
        vc.planets = planets6
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...6 {
            defaults.removeObject(forKey: "learnBirdsAnimalGroupNameLevel\(i)Completed")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
