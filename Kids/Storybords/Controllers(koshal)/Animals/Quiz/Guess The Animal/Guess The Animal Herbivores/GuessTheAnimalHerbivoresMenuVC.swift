//
//  GuessTheAnimalHerbivoresMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit

class GuessTheAnimalHerbivoresMenuVC: BaseViewController {

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
    
    var didTapLockedLevel = false
    
    let level1Birds: [BirdQuestions] = [
        BirdQuestions(name: "Elephant", imageName: "elephant_and_calf"),
        BirdQuestions(name: "Goat", imageName: "goat_and_kid"),
        BirdQuestions(name: "Cow", imageName: "cow_and_calf"),
        BirdQuestions(name: "Kangaroo", imageName: "kangaroo_and_joey"),
        BirdQuestions(name: "Giraffe", imageName: "giraffe_and_baby"),
        BirdQuestions(name: "Deer", imageName: "deer_and_fawn"),
        BirdQuestions(name: "Rhinoceros", imageName: "rhino_and_baby"),
        BirdQuestions(name: "Donkey", imageName: "donkey_and_foal"),
        BirdQuestions(name: "Sheep", imageName: "sheep_and_lamb"),
        BirdQuestions(name: "Horse", imageName: "horse_and_foal")
    ]
    
    let level2Birds: [BirdQuestions] = [
        BirdQuestions(name: "Koala", imageName: "koala_and_baby"),
        BirdQuestions(name: "Buffalo", imageName: "buffalo_and_baby"),
        BirdQuestions(name: "Bharal", imageName: "bharal_and_baby"),
        BirdQuestions(name: "Panda", imageName: "panda_and_baby"),
        BirdQuestions(name: "Bison", imageName: "bison_and_baby"),
        BirdQuestions(name: "Yak", imageName: "yak_and_baby"),
        BirdQuestions(name: "Camel", imageName: "camel_and_baby"),
        BirdQuestions(name: "Rabbit", imageName: "rabbit_and_baby"),
        BirdQuestions(name: "Llama", imageName: "llama_and_baby"),
        BirdQuestions(name: "Zebra", imageName: "zebra_and_baby")
    ]
    
    let level3Birds: [BirdQuestions] = [
        BirdQuestions(name: "Wildebeest", imageName: "wildebeest_and_baby"),
        BirdQuestions(name: "Okapi", imageName: "okapi_and_baby"),
        BirdQuestions(name: "Tapir", imageName: "tapir_and_baby"),
        BirdQuestions(name: "Mule", imageName: "mule_and_baby"),
        BirdQuestions(name: "Antelope", imageName: "antelope_and_baby"),
        BirdQuestions(name: "Moose", imageName: "moose_and_baby"),
        BirdQuestions(name: "Ibex", imageName: "ibex_and_baby"),
        BirdQuestions(name: "Chamois", imageName: "chamois_and_baby"),
        BirdQuestions(name: "Reindeer", imageName: "reindeer_and_baby"),
        BirdQuestions(name: "Gazelle", imageName: "gazelle_and_baby")
    ]
    
    
    let level4Birds: [BirdQuestions] = [
        BirdQuestions(name: "Vicuña", imageName: "vicuna_and_baby"),
        BirdQuestions(name: "Nyala", imageName: "nyala_and_baby"),
        BirdQuestions(name: "Addax", imageName: "addax_and_baby"),
        BirdQuestions(name: "Pronghorn", imageName: "pronghorn_and_baby"),
        BirdQuestions(name: "Alpaca", imageName: "alpaca_and_baby"),
        BirdQuestions(name: "Oryx", imageName: "oryx_and_baby"),
        BirdQuestions(name: "Saiga", imageName: "saiga_and_baby"),
        BirdQuestions(name: "Eland", imageName: "eland_and_baby"),
        BirdQuestions(name: "Bongo", imageName: "bongo_and_baby")
    ]
    
    let level5Birds: [BirdQuestions] = [
        BirdQuestions(name: "Tahr", imageName: "tahr_and_baby"),
        BirdQuestions(name: "Blackbuck", imageName: "blackbuck_and_baby"),
        BirdQuestions(name: "Serow", imageName: "serow_and_baby"),
        BirdQuestions(name: "Nilgai", imageName: "nilgai_and_baby"),
        BirdQuestions(name: "Markhor", imageName: "markhor_and_baby"),
        BirdQuestions(name: "Barasingha", imageName: "barasingha_and_baby"),
        BirdQuestions(name: "Goral", imageName: "goral_and_baby"),
        BirdQuestions(name: "Muntjac", imageName: "muntjac_and_baby"),
        BirdQuestions(name: "Sambar", imageName: "sambar_and_baby"),
        BirdQuestions(name: "Kouprey", imageName: "kouprey_and_baby")
    ]
    
    let level6Birds: [BirdQuestions] = [
        BirdQuestions(name: "Reedbuck", imageName: "reedbuck_and_baby"),
        BirdQuestions(name: "Argali", imageName: "argali_and_baby"),
        BirdQuestions(name: "Mountain Goat", imageName: "mountain_goat_and_baby"),
        BirdQuestions(name: "Springbok", imageName: "springbok_and_baby"),
        BirdQuestions(name: "Waterbuck", imageName: "waterbuck_and_baby"),
        BirdQuestions(name: "Gaur", imageName: "gaur_and_baby"),
        BirdQuestions(name: "Takin", imageName: "takin_and_baby"),
        BirdQuestions(name: "Hartebeest", imageName: "hartebeest_and_baby"),
        BirdQuestions(name: "Banteng", imageName: "banteng_and_baby"),
        BirdQuestions(name: "Roan Antelope", imageName: "roan_antelope_and_baby")
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
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "guessTheAnimalHerbivoresLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalHerbivoresLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalHerbivoresLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalHerbivoresLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalHerbivoresLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalHerbivoresLevel6Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        // Free levels
        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)

        // Subscription levels
        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lockImage = UIImage(named: "lock")

        let levels: [(Int, UIImageView, UILabel)] = [
            (3, image3, label3),
            (4, image4, label4),
            (5, image5, label5),
            (6, image6, label6)
        ]

        for (level, imageView, label) in levels {

            let completed = UserDefaults.standard.bool(
                forKey: "guessTheAnimalHerbivoresLevel\(level)Completed"
            )

            let percentage = UserDefaults.standard.integer(
                forKey: "guessTheAnimalHerbivoresLevel\(level)Percentage"
            )

            if completed {

                imageView.image = UIImage(named: "done")
                label.text = "\(percentage)%"

            } else {

                imageView.image = subscribed ? nil : lockImage
                label.text = ""
            }
        }
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "guessTheAnimalHerbivoresLevel\(level)Completed"
        let percentageKey = "guessTheAnimalHerbivoresLevel\(level)Percentage"

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
    
    func checkSubscription() -> Bool {

        if SubscriptionManager.shared.isSubscribed() {
            return true
        }

        goToSubscription()
        return false
    }

    func goToSubscription() {

        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier: "SubscriptionVC"
        ) as! SubscriptionVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        let levels: [(Int, UIImageView, UIView)] = [
            (3,image3,viewBG3),
            (4,image4,viewBG4),
            (5,image5,viewBG5),
            (6,image6,viewBG6)
        ]

        let lockImage = UIImage(named: "lock")

        for (level,image,bg) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "guessTheAnimalHerbivoresLevel\(level)Completed"
            )

            if completed {

                // completed → always show done
                image.image = UIImage(named: "done")

                bg.backgroundColor =
                    ColorManager.randomColor()

            } else {

                // not completed
                image.image =
                    subscribed ? nil : lockImage

                bg.backgroundColor =
                    subscribed
                    ? ColorManager.randomColor()
                    : .systemGray4
            }
        }
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalHerbivoresShowVC") as! GuessTheAnimalHerbivoresShowVC
        vc.birds = level1Birds
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalHerbivoresShowVC") as! GuessTheAnimalHerbivoresShowVC
        vc.birds = level2Birds
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheAnimalHerbivoresShowVC"
        ) as! GuessTheAnimalHerbivoresShowVC

        vc.birds = level3Birds
        vc.levelNumber = 3

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheAnimalHerbivoresShowVC"
        ) as! GuessTheAnimalHerbivoresShowVC

        vc.birds = level4Birds
        vc.levelNumber = 4

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheAnimalHerbivoresShowVC"
        ) as! GuessTheAnimalHerbivoresShowVC

        vc.birds = level5Birds
        vc.levelNumber = 5

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheAnimalHerbivoresShowVC"
        ) as! GuessTheAnimalHerbivoresShowVC

        vc.birds = level6Birds
        vc.levelNumber = 6

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...6 {
            defaults.removeObject(
                forKey: "guessTheAnimalHerbivoresLevel\(i)Completed"
            )

            defaults.removeObject(
                forKey: "guessTheAnimalHerbivoresLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
