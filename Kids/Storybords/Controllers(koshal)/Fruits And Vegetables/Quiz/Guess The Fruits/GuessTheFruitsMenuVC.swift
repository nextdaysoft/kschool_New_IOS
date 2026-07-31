//
//  GuessTheFruitsMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 02/03/26.
//
struct FruitsQuestions {
    let name: String
    let imageName: String
}

import UIKit

class GuessTheFruitsMenuVC: BaseViewController {

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
    
    let level1fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Orange", imageName: "orange"),
        FruitsQuestions(name: "Banana", imageName: "banana"),
        FruitsQuestions(name: "Grapes", imageName: "grapes"),
        FruitsQuestions(name: "Watermelon", imageName: "watermelon"),
        FruitsQuestions(name: "Apple", imageName: "apple"),
        FruitsQuestions(name: "Pineapple", imageName: "pineapple"),
        FruitsQuestions(name: "Guava", imageName: "guava"),
        FruitsQuestions(name: "Papaya", imageName: "papaya"),
        FruitsQuestions(name: "Lemon", imageName: "lemon"),
        FruitsQuestions(name: "Mango", imageName: "mango")
    ]
    
    let level2fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Cherry", imageName: "cherry"),
        FruitsQuestions(name: "Avocado", imageName: "avocado"),
        FruitsQuestions(name: "Pear", imageName: "pear"),
        FruitsQuestions(name: "Strawberry", imageName: "strawberry"),
        FruitsQuestions(name: "Litchi", imageName: "litchi"),
        FruitsQuestions(name: "Pomegranate", imageName: "pomegranate"),
        FruitsQuestions(name: "Peach", imageName: "peach"),
        FruitsQuestions(name: "Coconut", imageName: "coconut"),
        FruitsQuestions(name: "Kiwi", imageName: "kiwi"),
        FruitsQuestions(name: "Melon", imageName: "melon")
    ]
    let level3fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Fig", imageName: "fig"),
        FruitsQuestions(name: "Dates", imageName: "dates"),
        FruitsQuestions(name: "Blueberry", imageName: "blueberry"),
        FruitsQuestions(name: "Jackfruit", imageName: "jackfruit"),
        FruitsQuestions(name: "Sapodilla", imageName: "sapodilla"),
        FruitsQuestions(name: "Raspberry", imageName: "raspberry"),
        FruitsQuestions(name: "Dragon Fruit", imageName: "dragonFruit"),
        FruitsQuestions(name: "Gooseberry", imageName: "gooseberry"),
        FruitsQuestions(name: "Custard Apple", imageName: "custardApple"),
        FruitsQuestions(name: "Apricot", imageName: "apricot")
    ]
    
    let level4fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Passion Fruit", imageName: "passion_fruit"),
        FruitsQuestions(name: "Breadfruit", imageName: "breadfruit"),
        FruitsQuestions(name: "Longan", imageName: "longan"),
        FruitsQuestions(name: "Mangosteen", imageName: "mangosteen"),
        FruitsQuestions(name: "Blackberry", imageName: "blackberry"),
        FruitsQuestions(name: "Rambutan", imageName: "rambutan"),
        FruitsQuestions(name: "Tamarind", imageName: "tamarind"),
        FruitsQuestions(name: "Durian", imageName: "durian"),
        FruitsQuestions(name: "Starfruit", imageName: "starfruit"),
        FruitsQuestions(name: "Soursop", imageName: "soursop")
    ]
    
    let level5fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Jujube", imageName: "jujube"),
        FruitsQuestions(name: "Plum", imageName: "plum"),
        FruitsQuestions(name: "Mulberry", imageName: "mulberry"),
        FruitsQuestions(name: "Cranberry", imageName: "cranberry"),
        FruitsQuestions(name: "Elderberry", imageName: "elderberry"),
        FruitsQuestions(name: "Ackee", imageName: "ackee"),
        FruitsQuestions(name: "Pomelo", imageName: "pomelo"),
        FruitsQuestions(name: "Nectarine", imageName: "nectarine"),
        FruitsQuestions(name: "Persimmon", imageName: "persimmon"),
        FruitsQuestions(name: "Salak", imageName: "salak")
    ]
    
    let level6fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Miracle Fruit", imageName: "miracle_fruit"),
        FruitsQuestions(name: "Langsat", imageName: "langsat"),
        FruitsQuestions(name: "Osage Orange", imageName: "osage_orange"),
        FruitsQuestions(name: "Llama", imageName: "llama"),
        FruitsQuestions(name: "Feijoa", imageName: "feijoa"),
        FruitsQuestions(name: "Wood Apple (Bael)", imageName: "bael"),
        FruitsQuestions(name: "Surinam Cherry", imageName: "surinam_cherry"),
        FruitsQuestions(name: "Currants", imageName: "currants"),
        FruitsQuestions(name: "Ugli Fruit", imageName: "ugli_fruit"),
        FruitsQuestions(name: "Rose Apple", imageName: "rose_apple")
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
            UserDefaults.standard.bool(forKey: "guessTheFruitLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheFruitLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheFruitLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheFruitLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheFruitLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "guessTheFruitLevel6Completed")
        
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
                forKey: "guessTheFruitLevel\(level)Completed"
            )

            let percentage = UserDefaults.standard.integer(
                forKey: "guessTheFruitLevel\(level)Percentage"
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

        let completedKey = "guessTheFruitLevel\(level)Completed"
        let percentageKey = "guessTheFruitLevel\(level)Percentage"

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
            (3, image3, viewBG3),
            (4, image4, viewBG4),
            (5, image5, viewBG5),
            (6, image6, viewBG6)
        ]

        let lockImage = UIImage(named: "lock")

        for (level, image, bg) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "guessTheFruitLevel\(level)Completed"
            )

            if completed {

                // completed -> always done
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheFruitsShowVC") as! GuessTheFruitsShowVC
        vc.fruits = level1fruits
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheFruitsShowVC") as! GuessTheFruitsShowVC
        vc.fruits = level2fruits
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheFruitsShowVC"
        ) as! GuessTheFruitsShowVC

        vc.fruits = level3fruits
        vc.levelNumber = 3

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheFruitsShowVC"
        ) as! GuessTheFruitsShowVC

        vc.fruits = level4fruits
        vc.levelNumber = 4

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheFruitsShowVC"
        ) as! GuessTheFruitsShowVC

        vc.fruits = level5fruits
        vc.levelNumber = 5

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheFruitsShowVC"
        ) as! GuessTheFruitsShowVC

        vc.fruits = level6fruits
        vc.levelNumber = 6

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...6 {
            defaults.removeObject(
                forKey: "guessTheFruitLevel\(i)Completed"
            )

            defaults.removeObject(
                forKey: "guessTheFruitLevel\(i)Percentage"
            )
        }

        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
