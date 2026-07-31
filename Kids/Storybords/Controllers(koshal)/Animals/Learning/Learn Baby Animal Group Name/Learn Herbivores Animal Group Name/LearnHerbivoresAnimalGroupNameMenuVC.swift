//
//  LearnHerbivoresAnimalGroupNameMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 26/02/26.
//

import UIKit

class LearnHerbivoresAnimalGroupNameMenuVC: BaseViewController {

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
            text: "Elephant’s group is called a herd",
            imageName: "elephant_and_calf"
        ),
        
        LearnPlanetsItem(
            text: "Goat’s group is called a herd",
            imageName: "goat_and_kid"
        ),
        
        LearnPlanetsItem(
            text: "Cow’s group is called a herd",
            imageName: "cow_and_calf"
        ),
        
        LearnPlanetsItem(
            text: "Kangaroo’s group is called a mob",
            imageName: "kangaroo_and_joey"
        ),
        
        LearnPlanetsItem(
            text: "Giraffe’s group is called a tower",
            imageName: "giraffe_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Deer’s group is called a herd",
            imageName: "deer_and_fawn"
        ),
        
        LearnPlanetsItem(
            text: "Rhinoceros’s group is called a crash",
            imageName: "rhino_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Donkey’s group is called a herd",
            imageName: "donkey_and_foal"
        ),
        
        LearnPlanetsItem(
            text: "Sheep’s group is called a flock",
            imageName: "sheep_and_lamb"
        ),
        
        LearnPlanetsItem(
            text: "Horse’s group is called a herd",
            imageName: "horse_and_foal"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Koala’s group is called a colony",
            imageName: "koala_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Buffalo’s group is called a herd",
            imageName: "buffalo_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Bharal’s group is called a herd",
            imageName: "bharal_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Panda’s group is called an embarrassment",
            imageName: "panda_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Bison’s group is called a herd",
            imageName: "bison_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Yak’s group is called a herd",
            imageName: "yak_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Camel’s group is called a caravan",
            imageName: "camel_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Rabbit’s group is called a colony",
            imageName: "rabbit_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Llama’s group is called a herd",
            imageName: "llama_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Zebra’s group is called a dazzle",
            imageName: "zebra_and_baby"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Wildebeest’s group is called a herd",
            imageName: "wildebeest_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Okapi’s group is called a herd",
            imageName: "okapi_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Tapir’s group is called a herd",
            imageName: "tapir_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Mule’s group is called a pack",
            imageName: "mule_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Antelope’s group is called a herd",
            imageName: "antelope_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Moose’s group is called a herd",
            imageName: "moose_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Ibex’s group is called a herd",
            imageName: "ibex_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Chamois’s group is called a herd",
            imageName: "chamois_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Reindeer’s group is called a herd",
            imageName: "reindeer_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Gazelle’s group is called a herd",
            imageName: "gazelle_and_baby"
        )
    ]
    
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Vicuña’s group is called a herd",
            imageName: "vicuna_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Nyala’s group is called a herd",
            imageName: "nyala_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Addax’s group is called a herd",
            imageName: "addax_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Pronghorn’s group is called a herd",
            imageName: "pronghorn_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Alpaca’s group is called a herd",
            imageName: "alpaca_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Oryx’s group is called a herd",
            imageName: "oryx_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Saiga’s group is called a herd",
            imageName: "saiga_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Eland’s group is called a herd",
            imageName: "eland_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Bongo’s group is called a herd",
            imageName: "bongo_and_baby"
        )
    ]
    
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Tahr’s group is called a herd",
            imageName: "tahr_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Blackbuck’s group is called a herd",
            imageName: "blackbuck_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Serow’s group is called a herd",
            imageName: "serow_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Nilgai’s group is called a herd",
            imageName: "nilgai_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Markhor’s group is called a herd",
            imageName: "markhor_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Barasingha’s group is called a herd",
            imageName: "barasingha_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Goral’s group is called a herd",
            imageName: "goral_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Muntjac’s group is called a herd",
            imageName: "muntjac_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Sambar’s group is called a herd",
            imageName: "sambar_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Kouprey’s group is called a herd",
            imageName: "kouprey_and_baby"
        )
    ]
    
    let planets6: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Reedbuck’s group is called a herd",
            imageName: "reedbuck_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Argali’s group is called a herd",
            imageName: "argali_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Mountain Goat’s group is called a herd",
            imageName: "mountain_goat_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Springbok’s group is called a herd",
            imageName: "springbok_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Waterbuck’s group is called a herd",
            imageName: "waterbuck_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Gaur’s group is called a herd",
            imageName: "gaur_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Takin’s group is called a herd",
            imageName: "takin_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Hartebeest’s group is called a herd",
            imageName: "hartebeest_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Banteng’s group is called a herd",
            imageName: "banteng_and_baby"
        ),
        
        LearnPlanetsItem(
            text: "Roan Antelope’s group is called a herd",
            imageName: "roan_antelope_and_baby"
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
        
          
     
        if UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel1Completed") {
            image1.image = UIImage(named: "done")
        } else {
            image1.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel2Completed") {
            image2.image = UIImage(named: "done")
        } else {
            image2.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel3Completed") {
            image3.image = UIImage(named: "done")
        } else {
            image3.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel4Completed") {
            image4.image = UIImage(named: "done")
        } else {
            image4.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel5Completed") {
            image5.image = UIImage(named: "done")
        } else {
            image5.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel6Completed") {
            image6.image = UIImage(named: "done")
        } else {
            image6.image = nil
        }
        
        
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel6Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        image1.image = UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel1Completed") ? UIImage(named: "done") : nil
        image2.image = UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel2Completed") ? UIImage(named: "done") : nil
        image3.image = UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel3Completed") ? UIImage(named: "done") : nil
        image4.image = UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel4Completed") ? UIImage(named: "done") : nil
        image5.image = UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel5Completed") ? UIImage(named: "done") : nil
        image6.image = UserDefaults.standard.bool(forKey: "learnHerbivoresGroupNameLevel6Completed") ? UIImage(named: "done") : nil
        
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnHerbivoresAnimalGroupNameShowVC") as! LearnHerbivoresAnimalGroupNameShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnHerbivoresAnimalGroupNameShowVC") as! LearnHerbivoresAnimalGroupNameShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnHerbivoresAnimalGroupNameShowVC") as! LearnHerbivoresAnimalGroupNameShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnHerbivoresAnimalGroupNameShowVC") as! LearnHerbivoresAnimalGroupNameShowVC
        vc.planets = planets4
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnHerbivoresAnimalGroupNameShowVC") as! LearnHerbivoresAnimalGroupNameShowVC
        vc.planets = planets5
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnHerbivoresAnimalGroupNameShowVC") as! LearnHerbivoresAnimalGroupNameShowVC
        vc.planets = planets6
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...6 {
            defaults.removeObject(forKey: "learnHerbivoresGroupNameLevel\(i)Completed")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
