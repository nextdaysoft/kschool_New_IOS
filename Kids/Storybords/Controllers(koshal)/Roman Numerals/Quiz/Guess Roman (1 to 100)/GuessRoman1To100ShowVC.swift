//
//  GuessRoman1To100ShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 07/04/26.
//

import UIKit
import AVFoundation

class GuessRoman1To100ShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
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
            question: "1",
            options: ["I", "V", "X", "II"],
            correctAnswer: "I"
        ),

        WeightUnitQuestion(
            question: "2",
            options: ["II", "III", "I", "V"],
            correctAnswer: "II"
        ),

        WeightUnitQuestion(
            question: "3",
            options: ["III", "II", "IV", "I"],
            correctAnswer: "III"
        ),

        WeightUnitQuestion(
            question: "4",
            options: ["IV", "VI", "V", "III"],
            correctAnswer: "IV"
        ),

        WeightUnitQuestion(
            question: "5",
            options: ["V", "IV", "VI", "I"],
            correctAnswer: "V"
        ),

        WeightUnitQuestion(
            question: "6",
            options: ["VI", "IV", "VII", "V"],
            correctAnswer: "VI"
        ),

        WeightUnitQuestion(
            question: "7",
            options: ["VII", "VI", "VIII", "V"],
            correctAnswer: "VII"
        ),

        WeightUnitQuestion(
            question: "8",
            options: ["VIII", "VII", "IX", "VI"],
            correctAnswer: "VIII"
        ),

        WeightUnitQuestion(
            question: "9",
            options: ["IX", "XI", "VIII", "V"],
            correctAnswer: "IX"
        ),

        WeightUnitQuestion(
            question: "10",
            options: ["X", "IX", "V", "XI"],
            correctAnswer: "X"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = generateRandomQuestions()
        
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
    
    func toRoman(_ num: Int) -> String {
        let romanValues: [(Int, String)] = [
            (100,"C"), (90,"XC"), (50,"L"), (40,"XL"),
            (10,"X"), (9,"IX"), (5,"V"), (4,"IV"), (1,"I")
        ]
        
        var number = num
        var result = ""
        
        for (value, symbol) in romanValues {
            while number >= value {
                result += symbol
                number -= value
            }
        }
        
        return result
    }
    
    func generateRandomQuestions() -> [WeightUnitQuestion] {
        
        let numbers = Array(1...100).shuffled().prefix(10) // ✅ sirf 10 random numbers
        
        var questions: [WeightUnitQuestion] = []
        
        for num in numbers {
            
            let correct = toRoman(num)
            
            // random wrong options
            var optionsSet: Set<String> = [correct]
            
            while optionsSet.count < 4 {
                let randomNum = Int.random(in: 1...100)
                optionsSet.insert(toRoman(randomNum))
            }
            
            let options = Array(optionsSet).shuffled()
            
            let q = WeightUnitQuestion(
                question: "\(num)",
                options: options,
                correctAnswer: correct
            )
            
            questions.append(q)
        }
        
        return questions
    }
    
    func goToResultScreen() {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman1To100ResultVC"
        ) as? GuessRoman1To100ResultVC {

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
