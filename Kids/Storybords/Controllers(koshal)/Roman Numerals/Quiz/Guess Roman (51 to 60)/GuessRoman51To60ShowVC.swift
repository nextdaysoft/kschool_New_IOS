//
//  GuessRoman51To60ShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 07/04/26.
//

import UIKit
import AVFoundation

class GuessRoman51To60ShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
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
            question: "51",
            options: ["LI", "L", "XLIX", "LII"],
            correctAnswer: "LI"
        ),

        WeightUnitQuestion(
            question: "52",
            options: ["LII", "LI", "LIII", "L"],
            correctAnswer: "LII"
        ),

        WeightUnitQuestion(
            question: "53",
            options: ["LIII", "LII", "LIV", "LI"],
            correctAnswer: "LIII"
        ),

        WeightUnitQuestion(
            question: "54",
            options: ["LIV", "LV", "LIII", "LII"],
            correctAnswer: "LIV"
        ),

        WeightUnitQuestion(
            question: "55",
            options: ["LV", "LIV", "LVI", "LIII"],
            correctAnswer: "LV"
        ),

        WeightUnitQuestion(
            question: "56",
            options: ["LVI", "LV", "LVII", "LIV"],
            correctAnswer: "LVI"
        ),

        WeightUnitQuestion(
            question: "57",
            options: ["LVII", "LVI", "LVIII", "LV"],
            correctAnswer: "LVII"
        ),

        WeightUnitQuestion(
            question: "58",
            options: ["LVIII", "LVII", "LIX", "LVI"],
            correctAnswer: "LVIII"
        ),

        WeightUnitQuestion(
            question: "59",
            options: ["LIX", "LX", "LVIII", "LVII"],
            correctAnswer: "LIX"
        ),

        WeightUnitQuestion(
            question: "60",
            options: ["LX", "LIX", "LVIII", "LV"],
            correctAnswer: "LX"
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
       
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
       
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
        scoreBGVIew.layer.cornerRadius = 6
        nextBtn.layer.cornerRadius = 6
        nextBtn.backgroundColor = color
        
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
            withIdentifier: "GuessRoman51To60ResultVC"
        ) as? GuessRoman51To60ResultVC {

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
