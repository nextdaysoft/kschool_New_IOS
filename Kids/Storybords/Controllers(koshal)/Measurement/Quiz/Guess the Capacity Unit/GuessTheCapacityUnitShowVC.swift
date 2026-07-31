//
//  GuessTheCapacityUnitShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 03/04/26.
//

import UIKit
import AVFoundation

class GuessTheCapacityUnitShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
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
            question: "Which is the smallest volume unit?",
            options: ["Litre (L)", "Kilolitre (kL)", "Millilitre (mL)", "Gallon (gal)"],
            correctAnswer: "Millilitre (mL)"
        ),

        WeightUnitQuestion(
            question: "Which symbol represents millilitre?",
            options: ["kL", "mL", "L", "gal"],
            correctAnswer: "mL"
        ),

        WeightUnitQuestion(
            question: "1 kilolitre is equal to?",
            options: ["100 millilitre (mL)", "1000 litre (L)", "1000 millilitre (mL)", "100 litre (L)"],
            correctAnswer: "1000 litre (L)"
        ),

        WeightUnitQuestion(
            question: "Which container holds more liquid?",
            options: ["1 gallon jar (gal)", "1 kilolitre tank (kL)", "1 litre bottle (L)", "500 millilitre cup (mL)"],
            correctAnswer: "1 kilolitre tank (kL)"
        ),

        WeightUnitQuestion(
            question: "1 litre is equal to?",
            options: ["1000 litre (L)", "1000 millilitre (mL)", "10 millilitre (mL)", "100 millilitre (mL)"],
            correctAnswer: "1000 millilitre (mL)"
        ),

        WeightUnitQuestion(
            question: "Which symbol represents kilolitre?",
            options: ["mL", "gal", "kL", "L"],
            correctAnswer: "kL"
        ),

        WeightUnitQuestion(
            question: "Which is the largest volume unit?",
            options: ["Gallon (gal)", "Kilolitre (kL)", "Millilitre (mL)", "Litre (L)"],
            correctAnswer: "Kilolitre (kL)"
        ),

        WeightUnitQuestion(
            question: "Which symbol represents litre?",
            options: ["kL", "mL", "L", "gal"],
            correctAnswer: "L"
        ),

        WeightUnitQuestion(
            question: "1 gallon is equal to?",
            options: ["1 litre (L)", "10 litre (L)", "3.78541 litre (L)", "3 litre (L)"],
            correctAnswer: "3.78541 litre (L)"
        ),

        WeightUnitQuestion(
            question: "Which symbol represents gallon?",
            options: ["mL", "gal", "kL", "L"],
            correctAnswer: "gal"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = capacityUnitQuestions
        
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
            $0?.font = UIFont.systemFont(ofSize: 18)
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
            $0?.backgroundColor = .white
            $0?.isUserInteractionEnabled = true
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
            withIdentifier: "GuessTheCapacityUnitResultVC"
        ) as? GuessTheCapacityUnitResultVC {

            resultVC.levelNumber = self.levelNumber   // 👈 IMPORTANT
            resultVC.finalScore = score
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
