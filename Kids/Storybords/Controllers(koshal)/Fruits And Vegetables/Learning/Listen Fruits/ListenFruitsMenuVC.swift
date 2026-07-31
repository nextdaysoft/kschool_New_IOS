//
//  ListenFruitsMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 02/03/26.
//

import UIKit

class ListenFruitsMenuVC: BaseViewController {

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
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Orange",
            imageName: "orange"
        ),
        
        LearnPlanetsItem(
            text: "Banana",
            imageName: "banana"
        ),
        
        LearnPlanetsItem(
            text: "Grapes",
            imageName: "grapes"
        ),
        
        LearnPlanetsItem(
            text: "Watermelon",
            imageName: "watermelon"
        ),
        
        LearnPlanetsItem(
            text: "Apple",
            imageName: "apple"
        ),
        
        LearnPlanetsItem(
            text: "Pineapple",
            imageName: "pineapple"
        ),
        
        LearnPlanetsItem(
            text: "Guava",
            imageName: "guava"
        ),
        
        LearnPlanetsItem(
            text: "Papaya",
            imageName: "papaya"
        ),
        
        LearnPlanetsItem(
            text: "Lemon",
            imageName: "lemon"
        ),
        
        LearnPlanetsItem(
            text: "Mango",
            imageName: "mango"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Cherry",
            imageName: "cherry"
        ),
        
        LearnPlanetsItem(
            text: "Avocado",
            imageName: "avocado"
        ),
        
        LearnPlanetsItem(
            text: "Pear",
            imageName: "pear"
        ),
        
        LearnPlanetsItem(
            text: "Strawberry",
            imageName: "strawberry"
        ),
        
        LearnPlanetsItem(
            text: "Litchi",
            imageName: "litchi"
        ),
        
        LearnPlanetsItem(
            text: "Pomegranate",
            imageName: "pomegranate"
        ),
        
        LearnPlanetsItem(
            text: "Peach",
            imageName: "peach"
        ),
        
        LearnPlanetsItem(
            text: "Coconut",
            imageName: "coconut"
        ),
        
        LearnPlanetsItem(
            text: "Kiwi",
            imageName: "kiwi"
        ),
        
        LearnPlanetsItem(
            text: "Melon",
            imageName: "melon"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Fig",
            imageName: "fig"
        ),
        
        LearnPlanetsItem(
            text: "Dates",
            imageName: "dates"
        ),
        
        LearnPlanetsItem(
            text: "Blueberry",
            imageName: "blueberry"
        ),
        
        LearnPlanetsItem(
            text: "Jackfruit",
            imageName: "jackfruit"
        ),
        
        LearnPlanetsItem(
            text: "Sapodilla",
            imageName: "sapodilla"
        ),
        
        LearnPlanetsItem(
            text: "Raspberry",
            imageName: "raspberry"
        ),
        
        LearnPlanetsItem(
            text: "Dragon Fruit",
            imageName: "dragonFruit"
        ),
        
        LearnPlanetsItem(
            text: "Gooseberry",
            imageName: "gooseberry"
        ),
        
        LearnPlanetsItem(
            text: "Custard Apple",
            imageName: "custardApple"
        ),
        
        LearnPlanetsItem(
            text: "Apricot",
            imageName: "apricot"
        )
    ]
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Passion Fruit",
            imageName: "passion_fruit"
        ),
        
        LearnPlanetsItem(
            text: "Breadfruit",
            imageName: "soursop"
        ),
        
        LearnPlanetsItem(
            text: "Longan",
            imageName: "longan"
        ),
        
        LearnPlanetsItem(
            text: "Mangosteen",
            imageName: "mangosteen"
        ),
        
        LearnPlanetsItem(
            text: "Blackberry",
            imageName: "breadfruit"
        ),
        
        LearnPlanetsItem(
            text: "Rambutan",
            imageName: "rambutan"
        ),
        
        LearnPlanetsItem(
            text: "Tamarind",
            imageName: "tamarind"
        ),
        
        LearnPlanetsItem(
            text: "Breadfruit",
            imageName: "blackberry"
        ),
        
        LearnPlanetsItem(
            text: "Durian",
            imageName: "durian"
        ),
        
        LearnPlanetsItem(
            text: "Starfruit",
            imageName: "starfruit"
        )
    ]
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Jujube",
            imageName: "jujube"
        ),
        
        LearnPlanetsItem(
            text: "Plum",
            imageName: "plum"
        ),
        
        LearnPlanetsItem(
            text: "Mulberry",
            imageName: "mulberry"
        ),
        
        LearnPlanetsItem(
            text: "Cranberry",
            imageName: "cranberry"
        ),
        
        LearnPlanetsItem(
            text: "Elderberry",
            imageName: "elderberry"
        ),
        
        LearnPlanetsItem(
            text: "Ackee",
            imageName: "ackee"
        ),
        
        LearnPlanetsItem(
            text: "Pomelo",
            imageName: "pomelo"
        ),
        
        LearnPlanetsItem(
            text: "Nectarine",
            imageName: "nectarine"
        ),
        
        LearnPlanetsItem(
            text: "Persimmon",
            imageName: "persimmon"
        ),
        
        LearnPlanetsItem(
            text: "Salak",
            imageName: "salak"
        )
    ]
    
    
    let planets6: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Miracle Fruit",
            imageName: "miracle_fruit"
        ),
        
        LearnPlanetsItem(
            text: "Langsat",
            imageName: "langsat"
        ),
        
        LearnPlanetsItem(
            text: "Osage Orange",
            imageName: "osage_orange"
        ),
        
        LearnPlanetsItem(
            text: "Llama",
            imageName: "llama"
        ),
        
        LearnPlanetsItem(
            text: "Feijoa",
            imageName: "feijoa"
        ),
        
        LearnPlanetsItem(
            text: "Wood Apple (Bael)",
            imageName: "bael"
        ),
        
        LearnPlanetsItem(
            text: "Surinam Cherry",
            imageName: "surinam_cherry"
        ),
        
        LearnPlanetsItem(
            text: "Currants",
            imageName: "currants"
        ),
        
        LearnPlanetsItem(
            text: "Ugli Fruit",
            imageName: "ugli_fruit"
        ),
        
        LearnPlanetsItem(
            text: "Rose Apple",
            imageName: "rose_apple"
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
        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "listenFruitsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "listenFruitsLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "listenFruitsLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "listenFruitsLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "listenFruitsLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "listenFruitsLevel6Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelImages() {

        // Free levels
        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)

        // Subscription levels
        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lockImage = UIImage(named: "lock")

        let levels: [(Int, UIImageView)] = [
            (3, image3),
            (4, image4),
            (5, image5),
            (6, image6)
        ]

        for (level, imageView) in levels {

            let completed = UserDefaults.standard.bool(
                forKey: "listenFruitsLevel\(level)Completed"
            )

            if completed {
                imageView.image = UIImage(named: "done")
            } else {
                imageView.image = subscribed ? nil : lockImage
            }
        }
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView) {

        let completedKey = "listenFruitsLevel\(level)Completed"

        imageView.image = UserDefaults.standard.bool(forKey: completedKey)
            ? UIImage(named: "done")
            : nil
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

        let subscribed =
        SubscriptionManager.shared.isSubscribed()

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
                forKey: "listenFruitsLevel\(level)Completed"
            )

            if completed {

                // completed → always done
                image.image = UIImage(named:"done")

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenFruitsShowVC") as! ListenFruitsShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenFruitsShowVC") as! ListenFruitsShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ListenFruitsShowVC"
        ) as! ListenFruitsShowVC

        vc.planets = planets3
        vc.levelNumber = 3

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ListenFruitsShowVC"
        ) as! ListenFruitsShowVC

        vc.planets = planets4
        vc.levelNumber = 4

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ListenFruitsShowVC"
        ) as! ListenFruitsShowVC

        vc.planets = planets5
        vc.levelNumber = 5

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ListenFruitsShowVC"
        ) as! ListenFruitsShowVC

        vc.planets = planets6
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
                forKey: "listenFruitsLevel\(i)Completed"
            )
        }

        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
