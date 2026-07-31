//
//  GuessRoman71To80ShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 07/04/26.
//

import UIKit
import AVFoundation

class GuessRoman71To80ShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var repeatBtn: UIButton!
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
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionBGView: UIView!
    
    var questions: [WeightUnitQuestion] = []
    var levelNumber: Int = 1
    
    var currentQuestionIndex = 0
    var score = 0
 
    
    var isAudioCompleted = false
    var speechSynthesizer = AVSpeechSynthesizer()
    var hasAnswered = false
    
    var correctAnswer: String?
    
    
    var capacityUnitQuestions: [WeightUnitQuestion] = [

        WeightUnitQuestion(
            question: "71",
            options: ["LXXI", "LXX", "LXIX", "LXXII"],
            correctAnswer: "LXXI"
        ),

        WeightUnitQuestion(
            question: "72",
            options: ["LXXII", "LXXI", "LXXIII", "LXX"],
            correctAnswer: "LXXII"
        ),

        WeightUnitQuestion(
            question: "73",
            options: ["LXXIII", "LXXII", "LXXIV", "LXXI"],
            correctAnswer: "LXXIII"
        ),

        WeightUnitQuestion(
            question: "74",
            options: ["LXXIV", "LXXV", "LXXIII", "LXXII"],
            correctAnswer: "LXXIV"
        ),

        WeightUnitQuestion(
            question: "75",
            options: ["LXXV", "LXXIV", "LXXVI", "LXXIII"],
            correctAnswer: "LXXV"
        ),

        WeightUnitQuestion(
            question: "76",
            options: ["LXXVI", "LXXV", "LXXVII", "LXXIV"],
            correctAnswer: "LXXVI"
        ),

        WeightUnitQuestion(
            question: "77",
            options: ["LXXVII", "LXXVI", "LXXVIII", "LXXV"],
            correctAnswer: "LXXVII"
        ),

        WeightUnitQuestion(
            question: "78",
            options: ["LXXVIII", "LXXVII", "LXXIX", "LXXVI"],
            correctAnswer: "LXXVIII"
        ),

        WeightUnitQuestion(
            question: "79",
            options: ["LXXIX", "LXXX", "LXXVIII", "LXXVII"],
            correctAnswer: "LXXIX"
        ),

        WeightUnitQuestion(
            question: "80",
            options: ["LXXX", "LXXIX", "LXXVIII", "LXXV"],
            correctAnswer: "LXXX"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = capacityUnitQuestions.shuffled()
        
        speechSynthesizer.delegate = self
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
            $0?.font = UIFont.systemFont(ofSize: 40)
        }
        
        nextBtn.layer.cornerRadius = 10
        nextBtn.backgroundColor = ColorManager.randomColor()
        nextBtn.layer.borderColor = UIColor.black.cgColor
       
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
        scoreBGVIew.layer.cornerRadius = 10
        questionBGView.layer.cornerRadius = 10
        
        questionLabel.numberOfLines = 0
        questionLabel.lineBreakMode = .byWordWrapping
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

    func speak(text: String) {
        isAudioCompleted = false

        speechSynthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.45
        speechSynthesizer.speak(utterance)
    }
    
    func setupQuestion() {

        if currentQuestionIndex >= questions.count {
            goToResultScreen()
            return
        }

        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil

        [view1, view2, view3, view4].forEach {
            $0?.layer.borderWidth = 0
            $0?.layer.borderColor = UIColor.clear.cgColor
            $0?.isUserInteractionEnabled = true   // ✅ YE ADD KARNA HAI
        }

        let currentQuestion = questions[currentQuestionIndex]

        questionIndexLabel.text = "Question \(currentQuestionIndex + 1)"
        questionLabel.text = currentQuestion.question
        correctAnswer = currentQuestion.correctAnswer

        speak(text: currentQuestion.question)

        // 🔥 Shuffle options
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

        // Disable all views
        [view1, view2, view3, view4].forEach {
            $0?.isUserInteractionEnabled = false
        }

        if selectedAnswer == correctAnswer {

            sender.view?.layer.borderWidth = 5
            sender.view?.layer.borderColor = UIColor.systemGreen.cgColor

            rightOrWrongImgView.image = UIImage(named: "check mark")
            score += 1

        } else {

            sender.view?.layer.borderWidth = 5
            sender.view?.layer.borderColor = UIColor.systemRed.cgColor

            rightOrWrongImgView.image = UIImage(named: "close")

            // Highlight correct answer
            let labels = [label1, label2, label3, label4]
            let views = [view1, view2, view3, view4]

            for (i, label) in labels.enumerated() {
                if label?.text == correctAnswer {
                    views[i]?.layer.borderWidth = 5
                    views[i]?.layer.borderColor = UIColor.systemGreen.cgColor
                }
            }
        }

        scoreLabel.text = "Score : \(score) / \(currentQuestionIndex + 1)"
    }
    func goToResultScreen() {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman71To80ResultVC"
        ) as? GuessRoman71To80ResultVC {

            resultVC.levelNumber = self.levelNumber   // 👈 IMPORTANT
            resultVC.finalScore = score
            resultVC.totalScore = currentQuestionIndex
            navigationController?.pushViewController(resultVC, animated: false)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func repeatTapBtn(_ sender: UIButton) {
        if let questionText = questionLabel.text {
            speak(text: questionText)
        }
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            setupQuestion()
        } else {
            goToResultScreen()
        }
    }

}
