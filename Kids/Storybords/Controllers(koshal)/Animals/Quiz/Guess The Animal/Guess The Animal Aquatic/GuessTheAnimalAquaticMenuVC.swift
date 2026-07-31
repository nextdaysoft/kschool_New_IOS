//
//  GuessTheAnimalAquaticMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalAquaticMenuVC: BaseViewController {

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
        BirdQuestions(name: "Gold Fish", imageName: "gold_fish"),
        BirdQuestions(name: "Angel Fish", imageName: "angel_fish"),
        BirdQuestions(name: "Betta Fish", imageName: "betta_fish"),
        BirdQuestions(name: "Neon Tetra", imageName: "neon_tetra"),
        BirdQuestions(name: "Molly", imageName: "molly"),
        BirdQuestions(name: "Sword Fish", imageName: "sword_fish"),
        BirdQuestions(name: "Cat Fish", imageName: "cat_fish"),
        BirdQuestions(name: "Koi", imageName: "koi"),
        BirdQuestions(name: "Clown Fish", imageName: "clown_fish"),
        BirdQuestions(name: "Guppy", imageName: "guppy")
    ]
    
   
    let level2Birds: [BirdQuestions] = [
        BirdQuestions(name: "Beluga Whale", imageName: "beluga_whale"),
        BirdQuestions(name: "Cuttlefish", imageName: "cuttlefish"),
        BirdQuestions(name: "Humpback Whale", imageName: "humpback_whale"),
        BirdQuestions(name: "Cardinalfish", imageName: "cardinalfish"),
        BirdQuestions(name: "Dolphin", imageName: "dolphin_fish"),
        BirdQuestions(name: "Orca", imageName: "orca"),
        BirdQuestions(name: "Crab", imageName: "crab"),
        BirdQuestions(name: "Manatee", imageName: "manatee"),
        BirdQuestions(name: "Narwhal", imageName: "narwhal"),
        BirdQuestions(name: "Blue Whale", imageName: "blue_whale")
    ]
    
    let level3Birds: [BirdQuestions] = [
        BirdQuestions(name: "Leopard Shark", imageName: "leopard_shark"),
        BirdQuestions(name: "Sea Horse", imageName: "sea_horse"),
        BirdQuestions(name: "Lobster", imageName: "lobster"),
        BirdQuestions(name: "Stingray", imageName: "stingray"),
        BirdQuestions(name: "Shrimp", imageName: "shrimp"),
        BirdQuestions(name: "Electric Eel", imageName: "electric_eel"),
        BirdQuestions(name: "Lion Fish", imageName: "lion_fish"),
        BirdQuestions(name: "Puffer Fish", imageName: "puffer_fish"),
        BirdQuestions(name: "Squid", imageName: "squid"),
        BirdQuestions(name: "Octopus", imageName: "octopus")
    ]
    
    let level4Birds: [BirdQuestions] = [
        BirdQuestions(name: "Mussel", imageName: "mussel"),
        BirdQuestions(name: "Piranha", imageName: "piranha"),
        BirdQuestions(name: "Hammerhead Shark", imageName: "hammerhead_shark"),
        BirdQuestions(name: "Sea Cucumber", imageName: "sea_cucumber"),
        BirdQuestions(name: "Jellyfish", imageName: "jellyfish"),
        BirdQuestions(name: "Oyster", imageName: "oyster"),
        BirdQuestions(name: "Marlin", imageName: "marlin"),
        BirdQuestions(name: "Great White Shark", imageName: "great_white_shark"),
        BirdQuestions(name: "Starfish", imageName: "starfish"),
        BirdQuestions(name: "Clam", imageName: "clam")
    ]
    
    let level5Birds: [BirdQuestions] = [
        BirdQuestions(name: "Goblin Shark", imageName: "goblin_shark"),
        BirdQuestions(name: "Sperm Whale", imageName: "sperm_whale"),
        BirdQuestions(name: "Dugong", imageName: "dugong"),
        BirdQuestions(name: "Beaked Whale", imageName: "beaked_whale"),
        BirdQuestions(name: "Whale Shark", imageName: "whale_shark"),
        BirdQuestions(name: "Boxfish", imageName: "boxfish"),
        BirdQuestions(name: "Flying Fish", imageName: "flying_fish"),
        BirdQuestions(name: "Nautilus", imageName: "nautilus"),
        BirdQuestions(name: "Sawfish", imageName: "sawfish"),
        BirdQuestions(name: "Blue Tang", imageName: "blue_tang")
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
            UserDefaults.standard.bool(forKey: "guessTheAnimalAquaticLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalAquaticLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalAquaticLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalAquaticLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalAquaticLevel5Completed")
           
        
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

        let completedKey = "guessTheAnimalAquaticLevel\(level)Completed"
        let percentageKey = "guessTheAnimalAquaticLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalAquaticShowVC") as! GuessTheAnimalAquaticShowVC
        vc.birds = level1Birds
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalAquaticShowVC") as! GuessTheAnimalAquaticShowVC
        vc.birds = level2Birds
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalAquaticShowVC") as! GuessTheAnimalAquaticShowVC
        vc.birds = level3Birds
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalAquaticShowVC") as! GuessTheAnimalAquaticShowVC
        vc.birds = level4Birds
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalAquaticShowVC") as! GuessTheAnimalAquaticShowVC
        vc.birds = level5Birds
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard

        for i in 1...5 {
            defaults.removeObject(forKey: "guessTheAnimalAquaticLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalAquaticLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
