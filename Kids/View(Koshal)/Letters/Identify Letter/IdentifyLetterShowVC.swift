//
//  IdentifyLetterShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 20/03/26.
//
struct LetterQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
}

import UIKit
import AVFoundation

class IdentifyLetterShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
   
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
    
    var levelNumber: Int = 1
    
    var currentQuestionIndex = 0
    var score = 0
 
    
    var isAudioCompleted = false
    var speechSynthesizer = AVSpeechSynthesizer()
    var hasAnswered = false
    
    var correctAnswer: String?
    
    var questions: [LetterQuestion] = []
    
    var answerResults: [Bool] = []
    
    let letterSoundMap: [String: String] = [
        "a":"a", "b":"bee", "c":"cee", "d":"dee", "e":"e",
        "f":"ef", "g":"gee", "h":"aitch", "i":"i", "j":"jay",
        "k":"kay", "l":"el", "m":"em", "n":"en", "o":"o",
        "p":"pee", "q":"cue", "r":"ar", "s":"ess", "t":"tee",
        "u":"you", "v":"vee", "w":"double u", "x":"ex", "y":"why", "z":"zee"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = generateLetterQuestions()
        
        speechSynthesizer.delegate = self
        setup()
        applyTheme()
        setupQuestion()
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
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
        
        scoreBGVIew.layer.cornerRadius = 10
       
        
        questionLabel.numberOfLines = 0
        questionLabel.lineBreakMode = .byWordWrapping
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white

            scoreBGVIew.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            scoreBGVIew.backgroundColor = color
        }
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
    }

    func setRandomColors() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            view1.backgroundColor = .white
            view2.backgroundColor = .white
            view3.backgroundColor = .white
            view4.backgroundColor = .white

        } else {

            view1.backgroundColor = ColorManager.randomColor()
            view2.backgroundColor = ColorManager.randomColor()
            view3.backgroundColor = ColorManager.randomColor()
            view4.backgroundColor = ColorManager.randomColor()
        }
    }
    
    
    func generateLetterQuestions() -> [LetterQuestion] {
        
        let letters = (65...90).compactMap { UnicodeScalar($0) }.map { String($0) } // A-Z
        
        var result: [LetterQuestion] = []
        
        for letter in letters {
            
            var options = letters.shuffled().prefix(4)
            
            // Ensure correct answer included
            if !options.contains(letter) {
                options = Array(options.dropLast()) + [letter]
            }
            
            let question = "\(letter)"
            
            result.append(
                LetterQuestion(
                    question: question,
                    options: Array(options).shuffled(),
                    correctAnswer: letter
                )
            )
        }
        
        return result.shuffled()
    }
    
    func speakLetter(_ letter: String) {

        speechSynthesizer.stopSpeaking(at: .immediate)

        let lower = letter.lowercased()   // 🔥 IMPORTANT

        let spokenText = letterSoundMap[lower] ?? lower

        let utterance = AVSpeechUtterance(string: spokenText)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4

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

        // ❌ REMOVE this
        /*
        [view1, view2, view3, view4].forEach {
            $0?.backgroundColor = .white
            $0?.isUserInteractionEnabled = true
        }
        */

        // ✅ REPLACE WITH THIS
        [view1, view2, view3, view4].forEach {
            $0?.isUserInteractionEnabled = true
        }

        setRandomColors()   // 🔥 YAHI MAGIC HAI

        let currentQuestion = questions[currentQuestionIndex]

        questionIndexLabel.text = "Question \(currentQuestionIndex + 1)"
       // questionLabel.text = currentQuestion.question
        
        correctAnswer = currentQuestion.correctAnswer

        speakLetter(currentQuestion.question)

        let options = currentQuestion.options

        label1.text = options[0]
        label2.text = options[1]
        label3.text = options[2]
        label4.text = options[3]

        scoreLabel.text = "Score : \(score) / \(currentQuestionIndex)"
    }
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let index = sender.view?.tag else { return }

        let options = [
            label1.text ?? "",
            label2.text ?? "",
            label3.text ?? "",
            label4.text ?? ""
        ]

        let selectedAnswer = options[index]

        guard let currentLetter = correctAnswer else { return }

        if selectedAnswer == currentLetter {

            // ✅ Correct
            sender.view?.backgroundColor = .systemGreen

            rightOrWrongImgView.image = UIImage(named: "check mark")

            score += 1

            // SAVE RESULT
            answerResults.append(true)

        } else {

            // ❌ Wrong
            sender.view?.backgroundColor = .systemRed

            rightOrWrongImgView.image = UIImage(named: "close")

            // SAVE RESULT
            answerResults.append(false)

            // Highlight correct answer
            let labels = [label1, label2, label3, label4]
            let views = [view1, view2, view3, view4]

            for (i, label) in labels.enumerated() {

                if label?.text == currentLetter {

                    views[i]?.backgroundColor = .systemGreen
                }
            }
        }

        scoreLabel.text = "Score : \(score) / \(currentQuestionIndex + 1)"

        [view1, view2, view3, view4].forEach {
            $0?.isUserInteractionEnabled = false
        }
    }

    func goToResultScreen() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "IdentifyLetterResultVC"
        ) as? IdentifyLetterResultVC {

            resultVC.finalScore = score
            
            resultVC.results = self.answerResults   // 🔥 YE MISSING THA
            
            navigationController?.pushViewController(resultVC, animated: false)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func repeatTapBtn(_ sender: UIButton) {
        if let letter = correctAnswer {
            speakLetter(letter)
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
