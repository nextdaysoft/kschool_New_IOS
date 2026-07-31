//
//  AnimalFamiliesMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 22/04/26.
//

import UIKit

class AnimalFamiliesMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
   
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
   
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    
    @IBOutlet weak var learningView: UIView!
    @IBOutlet weak var learningArrowImg: UIImageView!
    
    @IBOutlet weak var quizView: UIView!
    @IBOutlet weak var quizArrowImg: UIImageView!
    
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var learningButton: UIButton!
    
    
    var isLearningExpanded = false
    var isQuizExpanded = false

    var level2Percentage: Int = 0
    var level3Percentage: Int = 0
    var level4Percentage: Int = 0

    var didTapLockedLevel = false
    
    var allAnimalFamilyQuestions: [BabyAnimalQuestion] = [

        BabyAnimalQuestion(question: "Lion's baby is called...?",
                           options: ["Cub", "Calf", "Kid", "Foal"],
                           correctAnswer: "Cub",
                           imageName: "lion_family"),

        BabyAnimalQuestion(question: "Cat's baby is called...?",
                           options: ["Kitten", "Cub", "Puppy", "Kid"],
                           correctAnswer: "Kitten",
                           imageName: "cat_family"),

        BabyAnimalQuestion(question: "Cow's baby is called...?",
                           options: ["Calf", "Cub", "Foal", "Kid"],
                           correctAnswer: "Calf",
                           imageName: "cow_family"),

        BabyAnimalQuestion(question: "Goat's baby is called...?",
                           options: ["Kid", "Calf", "Cub", "Foal"],
                           correctAnswer: "Kid",
                           imageName: "goat_family"),

        BabyAnimalQuestion(question: "Horse's baby is called...?",
                           options: ["Foal", "Calf", "Kid", "Cub"],
                           correctAnswer: "Foal",
                           imageName: "horse_family"),

        BabyAnimalQuestion(question: "Tiger's baby is called...?",
                           options: ["Cub", "Calf", "Kid", "Foal"],
                           correctAnswer: "Cub",
                           imageName: "tiger_family"),

        BabyAnimalQuestion(question: "Sheep's baby is called...?",
                           options: ["Lamb", "Kid", "Calf", "Cub"],
                           correctAnswer: "Lamb",
                           imageName: "sheep_family"),

        BabyAnimalQuestion(question: "Pig's baby is called...?",
                           options: ["Piglet", "Cub", "Kid", "Calf"],
                           correctAnswer: "Piglet",
                           imageName: "pig_family"),

        BabyAnimalQuestion(question: "Deer's baby is called...?",
                           options: ["Fawn", "Cub", "Kid", "Calf"],
                           correctAnswer: "Fawn",
                           imageName: "deer_family"),

        BabyAnimalQuestion(question: "Rabbit's baby is called...?",
                           options: ["Kit", "Cub", "Kid", "Calf"],
                           correctAnswer: "Kit",
                           imageName: "rabbit_family"),

        BabyAnimalQuestion(question: "Fox's baby is called...?",
                           options: ["Cub", "Kit", "Pup", "Calf"],
                           correctAnswer: "Cub",
                           imageName: "fox_family"),
    ]
    
    
    var level3Questions: [BabyAnimalQuestion] = [

        // Lion
        BabyAnimalQuestion(
            question: "Male lion is called...?",
            options: ["Lion", "Tiger", "Cub", "Bull"],
            correctAnswer: "Lion",
            imageName: "lion_family"
        ),

        // Tiger
        BabyAnimalQuestion(
            question: "Male tiger is called...?",
            options: ["Tiger", "Lion", "Cub", "Bull"],
            correctAnswer: "Tiger",
            imageName: "tiger_family"
        ),

        // Cat
        BabyAnimalQuestion(
            question: "Male cat is called...?",
            options: ["Tom", "Kitten", "Cub", "Bull"],
            correctAnswer: "Tom",
            imageName: "cat_family"
        ),

        // Cow
        BabyAnimalQuestion(
            question: "Male cow is called...?",
            options: ["Bull", "Cow", "Calf", "Ox"],
            correctAnswer: "Bull",
            imageName: "cow_family"
        ),

        // Goat
        BabyAnimalQuestion(
            question: "Male goat is called...?",
            options: ["Buck", "Kid", "Doe", "Bull"],
            correctAnswer: "Buck",
            imageName: "goat_family"
        ),

        // Horse
        BabyAnimalQuestion(
            question: "Male horse is called...?",
            options: ["Stallion", "Mare", "Foal", "Colt"],
            correctAnswer: "Stallion",
            imageName: "horse_family"
        ),

        // Sheep
        BabyAnimalQuestion(
            question: "Male sheep is called...?",
            options: ["Ram", "Ewe", "Lamb", "Cow"],
            correctAnswer: "Ram",
            imageName: "sheep_family"
        ),

        // Pig
        BabyAnimalQuestion(
            question: "Male pig is called...?",
            options: ["Boar", "Sow", "Piglet", "Cow"],
            correctAnswer: "Boar",
            imageName: "pig_family"
        ),

        // Deer
        BabyAnimalQuestion(
            question: "Male deer is called...?",
            options: ["Stag", "Doe", "Fawn", "Cow"],
            correctAnswer: "Stag",
            imageName: "deer_family"
        ),

        // Rabbit
        BabyAnimalQuestion(
            question: "Male rabbit is called...?",
            options: ["Buck", "Doe", "Kit", "Cub"],
            correctAnswer: "Buck",
            imageName: "rabbit_family"
        ),

        // Fox
        BabyAnimalQuestion(
            question: "Male fox is called...?",
            options: ["Dog", "Vixen", "Cub", "Bull"],
            correctAnswer: "Dog",
            imageName: "fox_family"
        ),

        // Duck
        BabyAnimalQuestion(
            question: "Male duck is called...?",
            options: ["Duckling", "Drake", "Goose", "Duck"],
            correctAnswer: "Drake",
            imageName: "duck_family"
        ),

        // Peacock
        BabyAnimalQuestion(
            question: "Male peacock is called...?",
            options: ["Peacock", "Peahen", "Chick", "Bird"],
            correctAnswer: "Peacock",
            imageName: "peacock_family"
        ),

        // ✅ Goose (NEW)
        BabyAnimalQuestion(
            question: "Male goose is called...?",
            options: ["Gander", "Goose", "Duck", "Drake"],
            correctAnswer: "Gander",
            imageName: "goose_family"
        ),
        
        // ✅ Chicken (NEW)
        BabyAnimalQuestion(
            question: "Male chicken is called...?",
            options: ["Rooster", "Hen", "Chick", "Duck"],
            correctAnswer: "Rooster",
            imageName: "chicken_family"
        )
    ]
    
    
    var level4Questions: [BabyAnimalQuestion] = [

        // Cow
        BabyAnimalQuestion(
            question: "Female cow is called...?",
            options: ["Bull", "Buck", "Cow", "Calf"],
            correctAnswer: "Cow",
            imageName: "cow_family"
        ),

        // Lion
        BabyAnimalQuestion(
            question: "Female lion is called...?",
            options: ["Lioness", "Tiger", "Cow", "Cub"],
            correctAnswer: "Lioness",
            imageName: "lion_family"
        ),


        // Cat
        BabyAnimalQuestion(
            question: "Female cat is called...?",
            options: ["Queen", "Cat", "Cow", "Cub"],
            correctAnswer: "Queen",
            imageName: "cat_family"
        ),

        // Horse
        BabyAnimalQuestion(
            question: "Female horse is called...?",
            options: ["Mare", "Stallion", "Foal", "Colt"],
            correctAnswer: "Mare",
            imageName: "horse_family"
        ),

        // Goat
        BabyAnimalQuestion(
            question: "Female goat is called...?",
            options: ["Doe", "Kid", "Buck", "Cow"],
            correctAnswer: "Doe",
            imageName: "goat_family"
        ),

        // Sheep
        BabyAnimalQuestion(
            question: "Female sheep is called...?",
            options: ["Ewe", "Ram", "Lamb", "Cow"],
            correctAnswer: "Ewe",
            imageName: "sheep_family"
        ),

        // Pig
        BabyAnimalQuestion(
            question: "Female pig is called...?",
            options: ["Sow", "Boar", "Piglet", "Cow"],
            correctAnswer: "Sow",
            imageName: "pig_family"
        ),


        // Tiger
        BabyAnimalQuestion(
            question: "Female tiger is called...?",
            options: ["Tigeress", "Lioness", "Cow", "Cub"],
            correctAnswer: "Tigeress",
            imageName: "tiger_family"
        ),

        // Deer
        BabyAnimalQuestion(
            question: "Female deer is called...?",
            options: ["Doe", "Stag", "Fawn", "Cow"],
            correctAnswer: "Doe",
            imageName: "deer_family"
        ),

        // Rabbit
        BabyAnimalQuestion(
            question: "Female rabbit is called...?",
            options: ["Doe", "Buck", "Kit", "Cub"],
            correctAnswer: "Doe",
            imageName: "rabbit_family"
        ),

        // Fox
        BabyAnimalQuestion(
            question: "Female fox is called...?",
            options: ["Vixen", "Dog", "Cub", "Bull"],
            correctAnswer: "Vixen",
            imageName: "fox_family"
        ),

        // Duck
        BabyAnimalQuestion(
            question: "Female duck is called...?",
            options: ["Duck", "Drake", "Goose", "Hen"],
            correctAnswer: "Duck",
            imageName: "duck_family"
        ),

        // Peacock
        BabyAnimalQuestion(
            question: "Female peacock is called...?",
            options: ["Peahen", "Peacock", "Chick", "Bird"],
            correctAnswer: "Peahen",
            imageName: "peacock_family"
        ),

        // Goose
        BabyAnimalQuestion(
            question: "Female goose is called...?",
            options: ["Goose", "Gander", "Duck", "Hen"],
            correctAnswer: "Goose",
            imageName: "goose_family"
        ),

        // Chicken
        BabyAnimalQuestion(
            question: "Female chicken is called...?",
            options: ["Hen", "Rooster", "Chick", "Duck"],
            correctAnswer: "Hen",
            imageName: "chicken_family"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setup()
        setupForRestBtn()
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()

        viewBG4.layer.cornerRadius = 10
        viewBG4.backgroundColor = ColorManager.randomColor()
    

     
        learningView.layer.cornerRadius = 10
        quizView.layer.cornerRadius = 10
        
        viewBG1.isHidden = true
        
        viewBG2.isHidden = true
        viewBG3.isHidden = true
        viewBG4.isHidden = true
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let isCompleted2 = UserDefaults.standard.bool(forKey: "animalFamiliesLevel2Completed")
           let percentage2 = UserDefaults.standard.integer(forKey: "animalFamiliesLevel2Percentage")

           if isCompleted2 {
               image2.image = UIImage(named: "done")
               label2.text = "\(percentage2)%"
           } else {
               image2.image = nil
               label2.text = ""
           }
        
        let isCompleted3 = UserDefaults.standard.bool(forKey: "animalFamiliesLevel3Completed")
           let percentage3 = UserDefaults.standard.integer(forKey: "animalFamiliesLevel3Percentage")

           if isCompleted3 {
               image3.image = UIImage(named: "done")
               label3.text = "\(percentage3)%"
           } else {
               image3.image = nil
               label3.text = ""
           }
        
        let isCompleted4 = UserDefaults.standard.bool(forKey: "animalFamiliesLevel4Completed")
           let percentage4 = UserDefaults.standard.integer(forKey: "animalFamiliesLevel4Percentage")

           if isCompleted4 {
               image4.image = UIImage(named: "done")
               label4.text = "\(percentage4)%"
           } else {
               image4.image = nil
               label4.text = ""
           }

        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "animalFamiliesLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "animalFamiliesLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "animalFamiliesLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "animalFamiliesLevel5Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
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
    
    func getRandomQuestions() -> [BabyAnimalQuestion] {
        return Array(allAnimalFamilyQuestions.shuffled().prefix(10))
    }
    func getRandomLevel3Questions() -> [BabyAnimalQuestion] {
        return Array(level3Questions.shuffled().prefix(10))
    }

    func getRandomLevel4Questions() -> [BabyAnimalQuestion] {
        return Array(level4Questions.shuffled().prefix(10))
    }
    
    func toggleViews(_ views: [UIView], expand: Bool) {
        
        if expand {
            // Show
            views.forEach {
                $0.isHidden = false
                $0.alpha = 0
                $0.transform = CGAffineTransform(translationX: 0, y: -10)
            }
            
            UIView.animate(withDuration: 0.3) {
                views.forEach {
                    $0.alpha = 1
                    $0.transform = .identity
                }
            }
            
        } else {
            // Hide
            UIView.animate(withDuration: 0.3, animations: {
                views.forEach {
                    $0.alpha = 0
                    $0.transform = CGAffineTransform(translationX: 0, y: -10)
                }
            }) { _ in
                views.forEach {
                    $0.isHidden = true
                }
            }
        }
    }
    
    func rotateArrow(_ imageView: UIImageView, expanded: Bool) {

        if expanded {

            // ⌄ → <
            UIView.animate(
                withDuration: 0.25,
                delay: 0,
                options: [.curveLinear],
                animations: {
                    imageView.transform = CGAffineTransform(rotationAngle: .pi / 2)
                },
                completion: nil
            )

            // < → ^
            UIView.animate(
                withDuration: 0.25,
                delay: 0.12,
                options: [.curveLinear],
                animations: {
                    imageView.transform = CGAffineTransform(rotationAngle: .pi)
                },
                completion: nil
            )

        } else {

            // ^ → <
            UIView.animate(
                withDuration: 0.25,
                delay: 0,
                options: [.curveLinear],
                animations: {
                    imageView.transform = CGAffineTransform(rotationAngle: .pi / 2)
                },
                completion: nil
            )

            // < → ⌄
            UIView.animate(
                withDuration: 0.25,
                delay: 0.12,
                options: [.curveLinear],
                animations: {
                    imageView.transform = .identity
                },
                completion: nil
            )
        }
    }
    
    func highlightAnimation(_ view: UIView) {
        
        let originalColor = view.backgroundColor
        
        UIView.animate(withDuration: 0.18, animations: {
            view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.35)
        }) { _ in
            
            UIView.animate(withDuration: 0.25) {
                view.backgroundColor = originalColor
            }
        }
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

        let completed2 =
        UserDefaults.standard.bool(
            forKey: "animalFamiliesLevel2Completed"
        )

        let completed3 =
        UserDefaults.standard.bool(
            forKey: "animalFamiliesLevel3Completed"
        )

        let completed4 =
        UserDefaults.standard.bool(
            forKey: "animalFamiliesLevel4Completed"
        )

        let percentage2 =
        UserDefaults.standard.integer(
            forKey: "animalFamiliesLevel2Percentage"
        )

        let percentage3 =
        UserDefaults.standard.integer(
            forKey: "animalFamiliesLevel3Percentage"
        )

        let percentage4 =
        UserDefaults.standard.integer(
            forKey: "animalFamiliesLevel4Percentage"
        )

        // Level 2
        if completed2 {
            image2.image = UIImage(named:"done")
            label2.text = "\(percentage2)%"
        } else {
            image2.image = subscribed ? nil : UIImage(named:"lock")
            label2.text = ""
        }

        // Level 3
        if completed3 {
            image3.image = UIImage(named:"done")
            label3.text = "\(percentage3)%"
        } else {
            image3.image = subscribed ? nil : UIImage(named:"lock")
            label3.text = ""
        }

        // Level 4
        if completed4 {
            image4.image = UIImage(named:"done")
            label4.text = "\(percentage4)%"
        } else {
            image4.image = subscribed ? nil : UIImage(named:"lock")
            label4.text = ""
        }

        viewBG2.backgroundColor =
        subscribed ? ColorManager.randomColor()
                   : .systemGray4

        viewBG3.backgroundColor =
        subscribed ? ColorManager.randomColor()
                   : .systemGray4

        viewBG4.backgroundColor =
        subscribed ? ColorManager.randomColor()
                   : .systemGray4
    }
    
    
    @IBAction func learningBtn(_ sender: UIButton) {
        
        highlightAnimation(learningView)
        
        
        isLearningExpanded.toggle()
        
        toggleViews([viewBG1],
                    expand: isLearningExpanded)
        
        rotateArrow(learningArrowImg,
                    expanded: isLearningExpanded)
    }
    
    
    @IBAction func quizBtn(_ sender: UIButton) {
        
        highlightAnimation(quizView)
        
        isQuizExpanded.toggle()
        
        toggleViews([viewBG2, viewBG3, viewBG4],
                    expand: isQuizExpanded)
        
        rotateArrow(quizArrowImg,
                    expanded: isQuizExpanded)
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "AnimalFamiliesVC"
        ) as! AnimalFamiliesVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessAnimalFamiliesVC"
        ) as! GuessAnimalFamiliesVC

        vc.questions = getRandomQuestions()
        vc.levelNumber = 2

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessAnimalFamiliesVC"
        ) as! GuessAnimalFamiliesVC

        vc.questions = getRandomLevel3Questions()
        vc.levelNumber = 3

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessAnimalFamiliesVC"
        ) as! GuessAnimalFamiliesVC

        vc.questions = getRandomLevel4Questions()
        vc.levelNumber = 4

        navigationController?.pushViewController(vc, animated: true)
    }

    
    @IBAction func restTapBtn(_ sender: UIButton) {

        UserDefaults.standard.set(
            false,
            forKey: "animalFamiliesLevel2Completed"
        )

        UserDefaults.standard.set(
            0,
            forKey: "animalFamiliesLevel2Percentage"
        )

        UserDefaults.standard.set(
            false,
            forKey: "animalFamiliesLevel3Completed"
        )

        UserDefaults.standard.set(
            0,
            forKey: "animalFamiliesLevel3Percentage"
        )

        UserDefaults.standard.set(
            false,
            forKey: "animalFamiliesLevel4Completed"
        )

        UserDefaults.standard.set(
            0,
            forKey: "animalFamiliesLevel4Percentage"
        )

        updateResetVisibility()

        // lock / unlock state restore
        setupSubscriptionLock()
    }
    
    
}
