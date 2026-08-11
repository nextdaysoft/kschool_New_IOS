//
//  PlanentOrderMatchLevel2VC.swift
//  Kids
//
//  Created by Koshal Singh on 24/02/26.
//

import UIKit
import AVFoundation
import LanguageManager_iOS

class PlanentOrderMatchLevel2VC: BaseViewController, AVSpeechSynthesizerDelegate {

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
            question: "Which planet has a longer day than its year?".localiz(),
            options: [
                "Mars".localiz(),
                "Mercury".localiz(),
                "Jupiter".localiz(),
                "Venus".localiz()
            ],
            correctAnswer: "Venus".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet supports life?".localiz(),
            options: [
                "Mars".localiz(),
                "Earth".localiz(),
                "Jupiter".localiz(),
                "Venus".localiz()
            ],
            correctAnswer: "Earth".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet has the fastest winds in the solar system?".localiz(),
            options: [
                "Neptune".localiz(),
                "Saturn".localiz(),
                "Jupiter".localiz(),
                "Uranus".localiz()
            ],
            correctAnswer: "Neptune".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet has the tallest volcano in the solar system?".localiz(),
            options: [
                "Venus".localiz(),
                "Jupiter".localiz(),
                "Earth".localiz(),
                "Mars".localiz()
            ],
            correctAnswer: "Mars".localiz()
        ),

        PlanetQuizQuestion(
            question: "How many days does Earth take to orbit the Sun?".localiz(),
            options: [
                "687 days".localiz(),
                "225 days".localiz(),
                "365 days".localiz(),
                "88 days".localiz()
            ],
            correctAnswer: "365 days".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet has the shortest year in the solar system?".localiz(),
            options: [
                "Mars".localiz(),
                "Earth".localiz(),
                "Mercury".localiz(),
                "Venus".localiz()
            ],
            correctAnswer: "Mercury".localiz()
        ),

        PlanetQuizQuestion(
            question: "How long does the Moon take to orbit Earth?".localiz(),
            options: [
                "365 days".localiz(),
                "30 days".localiz(),
                "27 days".localiz(),
                "50 days".localiz()
            ],
            correctAnswer: "27 days".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet has the Great Red Spot?".localiz(),
            options: [
                "Jupiter".localiz(),
                "Neptune".localiz(),
                "Saturn".localiz(),
                "Uranus".localiz()
            ],
            correctAnswer: "Jupiter".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet spins on its side?".localiz(),
            options: [
                "Jupiter".localiz(),
                "Saturn".localiz(),
                "Neptune".localiz(),
                "Uranus".localiz()
            ],
            correctAnswer: "Uranus".localiz()
        ),

        PlanetQuizQuestion(
            question: "Which planet is less dense than water?".localiz(),
            options: [
                "Earth".localiz(),
                "Saturn".localiz(),
                "Jupiter".localiz(),
                "Mars".localiz()
            ],
            correctAnswer: "Saturn".localiz()
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
            withIdentifier: "PlanentOrderMatchResultLevel2VC"
        ) as? PlanentOrderMatchResultLevel2VC {
            
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
