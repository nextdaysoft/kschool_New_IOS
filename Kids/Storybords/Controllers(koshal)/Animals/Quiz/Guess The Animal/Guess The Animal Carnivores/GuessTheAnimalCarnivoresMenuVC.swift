//
//  GuessTheAnimalCarnivoresMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalCarnivoresMenuVC: BaseViewController {

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
        BirdQuestions(name: "Jaguar", imageName: "jaguar_and_baby"),
        BirdQuestions(name: "Mountain Lion", imageName: "mountain_lion_and_baby"),
        BirdQuestions(name: "Cheetah", imageName: "cheetah_and_baby"),
        BirdQuestions(name: "Wolf", imageName: "wolf_and_pup"),
        BirdQuestions(name: "Panther", imageName: "panther_and_baby"),
        BirdQuestions(name: "Lion", imageName: "lion_and_cub"),
        BirdQuestions(name: "Eurasian Lynx", imageName: "eurasian_lynx_and_baby"),
        BirdQuestions(name: "Tiger", imageName: "tiger_and_cub"),
        BirdQuestions(name: "Leopard", imageName: "leopard_and_baby"),
        BirdQuestions(name: "Snow Leopard", imageName: "snow_leopard_and_baby")
    ]
    
    let level2Birds: [BirdQuestions] = [
        BirdQuestions(name: "Marbled Cat", imageName: "marbled_cat"),
        BirdQuestions(name: "African Golden Cat", imageName: "african_golden_cat"),
        BirdQuestions(name: "Coyote", imageName: "coyote_and_baby"),
        BirdQuestions(name: "Gray Wolf", imageName: "gray_wolf_and_baby"),
        BirdQuestions(name: "American Mink", imageName: "american_mink_and_baby"),
        BirdQuestions(name: "African Wild Dog", imageName: "african_wild_dog"),
        BirdQuestions(name: "Wolverine", imageName: "wolverine_and_baby"),
        BirdQuestions(name: "Lynx", imageName: "lynx_and_baby"),
        BirdQuestions(name: "Jackal", imageName: "jackal_and_baby"),
        BirdQuestions(name: "Dingo", imageName: "dingo_and_baby")
    ]
    
    let level3Birds: [BirdQuestions] = [
        BirdQuestions(name: "Pampas Cat", imageName: "pampas_cat"),
        BirdQuestions(name: "Least Weasel", imageName: "least_weasel_and_baby"),
        BirdQuestions(name: "Himalayan Wolf", imageName: "himalayan_wolf"),
        BirdQuestions(name: "Red Wolf", imageName: "red_wolf"),
        BirdQuestions(name: "Ermine", imageName: "ermine_and_baby"),
        BirdQuestions(name: "Fossa", imageName: "fossa_and_baby"),
        BirdQuestions(name: "Iberian Lynx", imageName: "iberian_lynx_and_baby"),
        BirdQuestions(name: "Tasmanian Devil", imageName: "tasmanian_devil_and_baby"),
        BirdQuestions(name: "Asiatic Golden Cat", imageName: "asiatic_golden_cat_and_baby"),
        BirdQuestions(name: "Andean Mountain Cat", imageName: "andean_mountain_cat_and_baby")
    ]
    
    let level4Birds: [BirdQuestions] = [
        BirdQuestions(name: "Ethiopian Wolf", imageName: "ethiopian_wolf_and_baby"),
        BirdQuestions(name: "Kodkod", imageName: "kodkod_and_baby"),
        BirdQuestions(name: "Sand Cat", imageName: "sand_cat_and_baby"),
        BirdQuestions(name: "Indian Desert Fox", imageName: "indian_desert_fox_and_baby"),
        BirdQuestions(name: "Margay", imageName: "margay_and_baby"),
        BirdQuestions(name: "Fisher", imageName: "fisher_and_baby"),
        BirdQuestions(name: "Black-footed Cat", imageName: "black_footed_cat_and_baby"),
        BirdQuestions(name: "Steppe Polecat", imageName: "steppe_polecat_and_baby"),
        BirdQuestions(name: "Pallas Cat", imageName: "pallas_cat_and_baby"),
        BirdQuestions(name: "Himalayan Red Fox", imageName: "himalayan_red_fox_and_baby")
    ]
    
    let level5Birds: [BirdQuestions] = [
        BirdQuestions(name: "Caracal", imageName: "caracal_and_baby"),
        BirdQuestions(name: "Striped Polecat", imageName: "striped_pole_cat_and_baby"),
        BirdQuestions(name: "Serval", imageName: "serval_and_baby"),
        BirdQuestions(name: "Canadian Lynx", imageName: "canadian_lynx_and_baby"),
        BirdQuestions(name: "Tibetan Wolf", imageName: "tibetan_wolf_and_baby"),
        BirdQuestions(name: "Bay Cat", imageName: "bay_cat_and_baby"),
        BirdQuestions(name: "Zorilla", imageName: "zorilla_and_baby"),
        BirdQuestions(name: "Brown Hyena", imageName: "brown_hyena_and_baby"),
        BirdQuestions(name: "Clouded Leopard", imageName: "clouded_leopard_and_baby"),
        BirdQuestions(name: "Arctic Fox", imageName: "arctic_fox_and_baby")
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
            UserDefaults.standard.bool(forKey: "guessTheAnimalCarnivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalCarnivoresLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalCarnivoresLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalCarnivoresLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalCarnivoresLevel5Completed")
           
        
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

        let completedKey = "guessTheAnimalCarnivoresLevel\(level)Completed"
        let percentageKey = "guessTheAnimalCarnivoresLevel\(level)Percentage"

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalCarnivoresShowVC") as! GuessTheAnimalCarnivoresShowVC
        vc.birds = level1Birds
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalCarnivoresShowVC") as! GuessTheAnimalCarnivoresShowVC
        vc.birds = level2Birds
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalCarnivoresShowVC") as! GuessTheAnimalCarnivoresShowVC
        vc.birds = level3Birds
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalCarnivoresShowVC") as! GuessTheAnimalCarnivoresShowVC
        vc.birds = level4Birds
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalCarnivoresShowVC") as! GuessTheAnimalCarnivoresShowVC
        vc.birds = level5Birds
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...5 {
            defaults.removeObject(forKey: "guessTheAnimalCarnivoresLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalCarnivoresLevel\(i)Percentage")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
