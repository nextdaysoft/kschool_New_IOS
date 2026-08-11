//
//  GuessAnimalEatingStyleVC.swift
//  KSchool
//
//  Created by Koshal Singh on 22/04/26.
//
struct AnimalEatingQuestion {
    let options: [String]
    let correctAnswer: String
    let imageName: String
}

import UIKit


class GuessAnimalEatingStyleVC: BaseViewController {
    
    @IBOutlet weak var allImages: UIImageView!
   
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var scoreBGVIew: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionIndexLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var questionBGView: UIView!
    
    @IBOutlet weak var LevelLabel: UILabel!
    
    var questions: [AnimalEatingQuestion] = []
    
    var levelNumber: Int = 1
    
    var currentQuestionIndex = 0
    var score = 0
 
    
    var isAudioCompleted = false
    var hasAnswered = false
    
    var correctAnswer: String?
    
    
    var eatingQuestions: [AnimalEatingQuestion] = [

        AnimalEatingQuestion(
            options: ["Graze", "Forage", "Gnaw", "Lap"],
            correctAnswer: "Forage",
            imageName: "pig_foraging"
        ),

        AnimalEatingQuestion(
            options: ["Browse", "Graze", "Peck", "Gnaw"],
            correctAnswer: "Browse",
            imageName: "goat_browsing"
        ),

        AnimalEatingQuestion(
            options: ["Lap", "Gnaw", "Peck", "Munch"],
            correctAnswer: "Lap",
            imageName: "cat_laping"
        ),

        AnimalEatingQuestion(
            options: ["Lick", "Gnaw", "Peck", "Graze"],
            correctAnswer: "Lick",
            imageName: "dog_licking"
        ),

        AnimalEatingQuestion(
            options: ["Munch", "Chomp", "Gnaw", "Peck"],
            correctAnswer: "Chomp",
            imageName: "crocodile_choming"
        ),

        AnimalEatingQuestion(
            options: ["Gnaw", "Lap", "Graze", "Browse"],
            correctAnswer: "Gnaw",
            imageName: "rat_gnawing"
        ),

        AnimalEatingQuestion(
            options: ["Peck", "Gnaw", "Munch", "Lap"],
            correctAnswer: "Peck",
            imageName: "sparrow_pecking"
        ),

        AnimalEatingQuestion(
            options: ["Graze", "Browse", "Peck", "Gnaw"],
            correctAnswer: "Graze",
            imageName: "cow_grazing"
        ),

        AnimalEatingQuestion(
            options: ["Munch", "Gnaw", "Peck", "Lap"],
            correctAnswer: "Munch",
            imageName: "horse_munching"
        ),

        AnimalEatingQuestion(
            options: ["Nibble", "Gnaw", "Graze", "Peck"],
            correctAnswer: "Nibble",
            imageName: "rabbit_nibbling"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eatingQuestions.shuffle()
        
        LevelLabel.text = "# Level \(levelNumber)"
        
        setup()
        setupQuestion()
        
        nextBtn.isHidden = true
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))

        view1.addGestureRecognizer(tap1)
        view2.addGestureRecognizer(tap2)
        view3.addGestureRecognizer(tap3)
        view4.addGestureRecognizer(tap4)

        view1.tag = 0
        view2.tag = 1
        view3.tag = 2
        view4.tag = 3
        
        [label1, label2, label3, label4].forEach {
            $0?.textAlignment = .center
            $0?.font = UIFont.systemFont(ofSize: 18)
        }
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
        scoreBGVIew.layer.cornerRadius = 6
        questionBGView.layer.cornerRadius = 10
        
    }
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        scoreBGVIew.layer.cornerRadius = 6
        nextBtn.layer.cornerRadius = 6
        nextBtn.backgroundColor = color
    }

    func setupQuestion() {

        if currentQuestionIndex >= eatingQuestions.count {
            goToResultScreen()
            return
        }

        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil

        [view1, view2, view3, view4].forEach {
            $0?.backgroundColor = .white
            $0?.isUserInteractionEnabled = true
        }

        let currentQuestion = eatingQuestions[currentQuestionIndex]

        questionIndexLabel.text = "Question \(currentQuestionIndex + 1)"
        correctAnswer = currentQuestion.correctAnswer

        allImages.image = UIImage(named: currentQuestion.imageName)

        let shuffledOptions = currentQuestion.options.shuffled()

        label1.text = shuffledOptions[0]
        label2.text = shuffledOptions[1]
        label3.text = shuffledOptions[2]
        label4.text = shuffledOptions[3]

        scoreLabel.text = "Score : \(score) / \(currentQuestionIndex)"
    }
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let index = sender.view?.tag else { return }

        let selectedAnswer = [label1.text, label2.text, label3.text, label4.text][index]

        if selectedAnswer == correctAnswer {

            sender.view?.backgroundColor = .systemGreen
            rightOrWrongImgView.image = UIImage(named: "check mark")

            score += 1

        } else {

            sender.view?.backgroundColor = .systemRed
            rightOrWrongImgView.image = UIImage(named: "close")

            // Highlight correct answer
            let labels = [label1, label2, label3, label4]
            for (i, label) in labels.enumerated() {
                if label?.text == correctAnswer {
                    let correctView = [view1, view2, view3, view4][i]
                    correctView?.backgroundColor = .systemGreen
                }
            }
        }

        scoreLabel.text = "Score : \(score) / \(currentQuestionIndex + 1)"

        [view1, view2, view3, view4].forEach {
            $0?.isUserInteractionEnabled = false
        }
    }

    func goToResultScreen() {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "GuessAnimalEatingStyleResultVC"
        ) as? GuessAnimalEatingStyleResultVC {

            resultVC.levelNumber = self.levelNumber   // 👈 IMPORTANT
            resultVC.finalScore = score
            navigationController?.pushViewController(resultVC, animated: false)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < eatingQuestions.count {
            setupQuestion()
        } else {
            goToResultScreen()
        }
    }

}
