//
//  PlanentOrderMatchLevel5VC.swift
//  Kids
//
//  Created by Koshal Singh on 24/02/26.
//

import UIKit
import AVFoundation
import LanguageManager_iOS

class PlanentOrderMatchLevel5VC: BaseViewController, AVSpeechSynthesizerDelegate {

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
    
    var quizQuestions: [PlanetQuizQuestion] = [

        PlanetQuizQuestion(
            question: "What is the distance from Earth to the Moon?".localiz(),
            options: [
                "778 million km".localiz(),
                "150 million km".localiz(),
                "384,400 km".localiz(),
                "225 million km".localiz()
            ],
            correctAnswer: "384,400 km".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet is closest to the Sun?".localiz(),
            options: [
                "Earth".localiz(),
                "Venus".localiz(),
                "Mercury".localiz(),
                "Mars".localiz()
            ],
            correctAnswer: "Mercury".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet is closer to the Sun than Earth?".localiz(),
            options: [
                "Mercury".localiz(),
                "Venus".localiz(),
                "Mars".localiz(),
                "Jupiter".localiz()
            ],
            correctAnswer: "Mercury".localiz()
        ),

        PlanetQuizQuestion(
            question: "How far is Mars from the Sun?".localiz(),
            options: [
                "225 million km".localiz(),
                "150 million km".localiz(),
                "108 million km".localiz(),
                "58 million km".localiz()
            ],
            correctAnswer: "225 million km".localiz()
        ),

        PlanetQuizQuestion(
            question: "How far is Saturn from the Sun?".localiz(),
            options: [
                "225 million km".localiz(),
                "778 million km".localiz(),
                "150 million km".localiz(),
                "1.4 billion km".localiz()
            ],
            correctAnswer: "1.4 billion km".localiz()
        ),

        PlanetQuizQuestion(
            question: "How long does sunlight take to reach Earth?".localiz(),
            options: [
                "3 minutes".localiz(),
                "12 minutes".localiz(),
                "8 minutes".localiz(),
                "20 minutes".localiz()
            ],
            correctAnswer: "8 minutes".localiz()
        ),

        PlanetQuizQuestion(
            question: "Does the distance between Earth and Mars change?".localiz(),
            options: [
                "Sometimes".localiz(),
                "Never".localiz(),
                "No".localiz(),
                "Yes".localiz()
            ],
            correctAnswer: "Yes".localiz()
        ),

        PlanetQuizQuestion(
            question: "How far is Jupiter from the Sun?".localiz(),
            options: [
                "225 million km".localiz(),
                "778 million km".localiz(),
                "150 million km".localiz(),
                "1.4 billion km".localiz()
            ],
            correctAnswer: "778 million km".localiz()
        ),

        PlanetQuizQuestion(
            question: "What is the distance from the Sun to Earth?".localiz(),
            options: [
                "58 million km".localiz(),
                "150 million km".localiz(),
                "108 million km".localiz(),
                "225 million km".localiz()
            ],
            correctAnswer: "150 million km".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet is farthest from the Sun?".localiz(),
            options: [
                "Uranus".localiz(),
                "Jupiter".localiz(),
                "Saturn".localiz(),
                "Neptune".localiz()
            ],
            correctAnswer: "Neptune".localiz()
        )
    ]
    
    
        
    var currentQuestionIndex = 0
    var score = 0
 
    
    var isAudioCompleted = false
    var speechSynthesizer = AVSpeechSynthesizer()
    var hasAnswered = false
    
    var correctAnswer: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speechSynthesizer.delegate = self

        setup()

        // ✅ Shuffle first
        quizQuestions.shuffle()

        // ✅ Then load first question
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

        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"

        switch selectedLanguage {

        case "zhHans":
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")

        case "hi":
            utterance.voice = AVSpeechSynthesisVoice(language: "hi-IN")

        case "fr":
            utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")

        case "es":
            utterance.voice = AVSpeechSynthesisVoice(language: "es-ES")

        case "de":
            utterance.voice = AVSpeechSynthesisVoice(language: "de-DE")

        case "ar":
            utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")

        default:
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        }

        utterance.rate = 0.45

        speechSynthesizer.speak(utterance)
    }
    
    func setupQuestion() {

        if currentQuestionIndex >= quizQuestions.count {
            nextBtn.isHidden = true
            questionLabel.text = "Quiz Completed 🎉"
            return
        }

        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil

        [view1, view2, view3, view4].forEach {
            $0?.backgroundColor = .white
            $0?.isUserInteractionEnabled = true
        }

        let currentQuestion = quizQuestions[currentQuestionIndex]

        questionIndexLabel.text = "\("Question".localiz()) \(currentQuestionIndex + 1)"
        
        questionLabel.text = currentQuestion.question
        correctAnswer = currentQuestion.correctAnswer

        speak(text: currentQuestion.question)

        label1.text = currentQuestion.options[0]
        label2.text = currentQuestion.options[1]
        label3.text = currentQuestion.options[2]
        label4.text = currentQuestion.options[3]

       
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex)"
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

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex + 1)"

        [view1, view2, view3, view4].forEach {
            $0?.isUserInteractionEnabled = false
        }
    }

    
    func goToResultScreen() {
        
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        
        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "PlanentOrderMatchResultLevel5VC"
        ) as? PlanentOrderMatchResultLevel5VC {
            
            resultVC.finalScore = score
            navigationController?.pushViewController(resultVC, animated: true)
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
        
        if currentQuestionIndex < quizQuestions.count {
            setupQuestion()
        } else {
            goToResultScreen()
        }
    }

}
