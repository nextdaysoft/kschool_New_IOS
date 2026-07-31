//
//  GuessTheAnimalBirdsMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//
struct BirdQuestions {
    let name: String
    let imageName: String
}

import UIKit

class GuessTheAnimalBirdsMenuVC: BaseViewController {

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
        BirdQuestions(name: "Peacock", imageName: "peacock_and_baby"),
        BirdQuestions(name: "Ostrich", imageName: "ostrich_and_baby"),
        BirdQuestions(name: "Turkey", imageName: "turkey_and_baby"),
        BirdQuestions(name: "Owl", imageName: "owl_and_baby"),
        BirdQuestions(name: "Swan", imageName: "swan_and_baby"),
        BirdQuestions(name: "Parrot", imageName: "parrot_and_baby"),
        BirdQuestions(name: "Sparrow", imageName: "sparrow_and_baby"),
        BirdQuestions(name: "Pigeon", imageName: "pigeon_and_baby"),
        BirdQuestions(name: "Hen", imageName: "hen_and_chick"),
        BirdQuestions(name: "Duck", imageName: "duck_and_duckling")
    ]
    
    let level2Birds: [BirdQuestions] = [
        BirdQuestions(name: "Eagle", imageName: "hawk_and_baby"),
        BirdQuestions(name: "Crow", imageName: "crow_and_baby"),
        BirdQuestions(name: "Hawk", imageName: "hawk_and_baby"),
        BirdQuestions(name: "Penguin", imageName: "penguin_baby"),
        BirdQuestions(name: "Goose", imageName: "goose_and_baby"),
        BirdQuestions(name: "Seagull", imageName: "seagull_and_baby"),
        BirdQuestions(name: "Emu", imageName: "emu_and_baby"),
        BirdQuestions(name: "Dove", imageName: "dove_and_baby"),
        BirdQuestions(name: "Flamingo", imageName: "flamingo_and_baby"),
        BirdQuestions(name: "Falcon", imageName: "falcon_and_baby")
    ]
    
    let level3Birds: [BirdQuestions] = [
        BirdQuestions(name: "Crane", imageName: "crane_and_baby"),
        BirdQuestions(name: "Myna", imageName: "myna_and_baby"),
        BirdQuestions(name: "Heron", imageName: "heron_and_baby"),
        BirdQuestions(name: "Vulture", imageName: "vulture_and_baby"),
        BirdQuestions(name: "Cuckoo", imageName: "cuckoo_and_baby"),
        BirdQuestions(name: "Albatross", imageName: "albatross_and_baby"),
        BirdQuestions(name: "Magpie", imageName: "magpie_and_baby"),
        BirdQuestions(name: "Blackbird", imageName: "blackbird_and_baby"),
        BirdQuestions(name: "Canary", imageName: "canary_and_baby"),
        BirdQuestions(name: "Robin", imageName: "robin_and_baby")
    ]
    
    let level4Birds: [BirdQuestions] = [
        BirdQuestions(name: "Starling", imageName: "starling_and_baby"),
        BirdQuestions(name: "Buzzard", imageName: "buzzard_and_baby"),
        BirdQuestions(name: "Crow Pheasant", imageName: "crow_pheasant_and_baby"),
        BirdQuestions(name: "Kingfisher", imageName: "kingfisher_and_baby"),
        BirdQuestions(name: "Hornbill", imageName: "hornbill_and_baby"),
        BirdQuestions(name: "Quail", imageName: "quail_and_baby"),
        BirdQuestions(name: "Pelican", imageName: "pelican_and_baby"),
        BirdQuestions(name: "Ptarmigan", imageName: "ptarmigan_and_baby"),
        BirdQuestions(name: "Stork", imageName: "stork_and_baby"),
        BirdQuestions(name: "Woodpecker", imageName: "woodpecker_and_baby")
    ]
    
    let level5Birds: [BirdQuestions] = [
        BirdQuestions(name: "Lark", imageName: "lark_and_baby"),
        BirdQuestions(name: "Wagtail", imageName: "wagtail_and_baby"),
        BirdQuestions(name: "Ibis", imageName: "ibis_and_baby"),
        BirdQuestions(name: "Cormorant", imageName: "cormorant_and_baby"),
        BirdQuestions(name: "Spoonbill", imageName: "spoonbill_and_baby"),
        BirdQuestions(name: "Condor", imageName: "condor_and_baby"),
        BirdQuestions(name: "Sunbird", imageName: "sunbird_and_baby"),
        BirdQuestions(name: "Swift", imageName: "swift_and_baby"),
        BirdQuestions(name: "Bulbul", imageName: "bulbul_and_baby"),
        BirdQuestions(name: "Finch", imageName: "finch_and_baby")
    ]
    
    let level6Birds: [BirdQuestions] = [
        BirdQuestions(name: "Treepie", imageName: "treepie_and_baby"),
        BirdQuestions(name: "Toucan", imageName: "toucan_and_baby"),
        BirdQuestions(name: "Nightingale", imageName: "nightingale_and_baby"),
        BirdQuestions(name: "Kestrel", imageName: "kestrel_and_baby"),
        BirdQuestions(name: "Osprey", imageName: "osprey_and_baby"),
        BirdQuestions(name: "Oriole", imageName: "oriole_and_baby"),
        BirdQuestions(name: "Babbler", imageName: "babbler_and_baby"),
        BirdQuestions(name: "Macaw", imageName: "macaw_and_baby"),
        BirdQuestions(name: "Shrike", imageName: "shrike_and_baby"),
        BirdQuestions(name: "Lyrebird", imageName: "lyrebird_and_baby")
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
            UserDefaults.standard.bool(forKey: "guessTheAnimalBirdsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalBirdsLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalBirdsLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalBirdsLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalBirdsLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheAnimalBirdsLevel6Completed")
        
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
                forKey: "guessTheAnimalBirdsLevel\(level)Completed"
            )

            let percentage = UserDefaults.standard.integer(
                forKey: "guessTheAnimalBirdsLevel\(level)Percentage"
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

        let completedKey = "guessTheAnimalBirdsLevel\(level)Completed"
        let percentageKey = "guessTheAnimalBirdsLevel\(level)Percentage"

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
                forKey: "guessTheAnimalBirdsLevel\(level)Completed"
            )

            if completed {

                // completed => always show done
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalBirdsShowVC") as! GuessTheAnimalBirdsShowVC
        vc.birds = level1Birds
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalBirdsShowVC") as! GuessTheAnimalBirdsShowVC
        vc.birds = level2Birds
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheAnimalBirdsShowVC"
        ) as! GuessTheAnimalBirdsShowVC

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
            withIdentifier: "GuessTheAnimalBirdsShowVC"
        ) as! GuessTheAnimalBirdsShowVC

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
            withIdentifier: "GuessTheAnimalBirdsShowVC"
        ) as! GuessTheAnimalBirdsShowVC

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
            withIdentifier: "GuessTheAnimalBirdsShowVC"
        ) as! GuessTheAnimalBirdsShowVC

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
            defaults.removeObject(forKey: "guessTheAnimalBirdsLevel\(i)Completed")
            defaults.removeObject(forKey: "guessTheAnimalBirdsLevel\(i)Percentage")
        }

        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
