//
//  IdentifyActionVerbVC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//

import LanguageManager_iOS
struct IdentifyActionVerbQuestion {
    let sentence: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct IdentifyActionVerbResult {
    let sentence: String
    let selectedAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
}

import UIKit

class IdentifyActionVerbVC: BaseViewController {

    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    @IBOutlet weak var allNameLalel: UILabel!
    @IBOutlet weak var nama1Btn: UIButton!
    @IBOutlet weak var nama2Btn: UIButton!
    @IBOutlet weak var nama3Btn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var questions: [IdentifyActionVerbQuestion] = [

        IdentifyActionVerbQuestion(
            sentence: "Raja is eating rice".localiz(),
            option1: "eating".localiz(),
            option2: "rice".localiz(),
            option3: "Raja".localiz(),
            correctAnswer: "eating".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Amit is reading a book".localiz(),
            option1: "book".localiz(),
            option2: "is".localiz(),
            option3: "reading".localiz(),
            correctAnswer: "reading".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Gita is writing name".localiz(),
            option1: "is".localiz(),
            option2: "name".localiz(),
            option3: "writing".localiz(),
            correctAnswer: "writing".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Tina is drawing a picture".localiz(),
            option1: "a".localiz(),
            option2: "is".localiz(),
            option3: "drawing".localiz(),
            correctAnswer: "drawing".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Rani is playing ball".localiz(),
            option1: "is".localiz(),
            option2: "Rani".localiz(),
            option3: "playing".localiz(),
            correctAnswer: "playing".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Ravi is running fast".localiz(),
            option1: "running".localiz(),
            option2: "Ravi".localiz(),
            option3: "is".localiz(),
            correctAnswer: "running".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Mohan is jumping high".localiz(),
            option1: "high".localiz(),
            option2: "jumping".localiz(),
            option3: "Mohan".localiz(),
            correctAnswer: "jumping".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Sita is washing hands".localiz(),
            option1: "hands".localiz(),
            option2: "washing".localiz(),
            option3: "Sita".localiz(),
            correctAnswer: "washing".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Mira is drinking milk".localiz(),
            option1: "drinking".localiz(),
            option2: "Mira".localiz(),
            option3: "is".localiz(),
            correctAnswer: "drinking".localiz()
        ),

        IdentifyActionVerbQuestion(
            sentence: "Raju is singing a song".localiz(),
            option1: "song".localiz(),
            option2: "singing".localiz(),
            option3: "Raju".localiz(),
            correctAnswer: "singing".localiz()
        )
    ]
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [IdentifyActionVerbResult] = []

    var defaultBGColor: UIColor?
    var defaultTextColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()

        scoreLabelBGView.layer.cornerRadius = 6

        imgBGView.layer.cornerRadius = 10
      
        nama1Btn.layer.cornerRadius = 6
        nama2Btn.layer.cornerRadius = 6
        nama3Btn.layer.cornerRadius = 6

        defaultBGColor = nama1Btn.backgroundColor
        defaultTextColor = nama1Btn.titleColor(for: .normal)

        nextBtn.isHidden = true
        loadQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
    }

    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

            scoreLabelBGView.backgroundColor = .white
            imgBGView.backgroundColor = .white

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white
            nama3Btn.backgroundColor = .white

            defaultBGColor = .white
            defaultTextColor = .black

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            scoreLabelBGView.backgroundColor = color
            imgBGView.backgroundColor = .white

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()
            nama3Btn.backgroundColor = ColorManager.randomColor()

            defaultBGColor = nama1Btn.backgroundColor
            defaultTextColor = .black
        }
    }
    
    func resetButtons() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            [nama1Btn, nama2Btn, nama3Btn].forEach {
                $0?.backgroundColor = .white
                $0?.setTitleColor(.black, for: .normal)
            }

        } else {

            let colors = [
                ColorManager.randomColor(),
                ColorManager.randomColor(),
                ColorManager.randomColor()
            ]

            let buttons = [nama1Btn, nama2Btn, nama3Btn]

            for (button, color) in zip(buttons, colors) {
                button?.backgroundColor = color
                button?.setTitleColor(defaultTextColor, for: .normal)
            }
        }
    }
    
    func loadQuestion() {
        let q = questions[currentIndex]

        allNameLalel.text = q.sentence
        nama1Btn.setTitle(q.option1, for: .normal)
        nama2Btn.setTitle(q.option2, for: .normal)
        nama3Btn.setTitle(q.option3, for: .normal)

        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        
        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil

        resetButtons()
    }
    
    func handleAnswer(_ selected: String) {

        if hasAnswered { return }
        hasAnswered = true

        let q = questions[currentIndex]
        let isCorrect = (selected == q.correctAnswer)

        results.append(
            IdentifyActionVerbResult(
                sentence: q.sentence,
                selectedAnswer: selected,
                correctAnswer: q.correctAnswer,
                isCorrect: isCorrect
            )
        )

        let buttons = [nama1Btn, nama2Btn, nama3Btn]

        if isCorrect {
            score += 1
            rightOrWrongImgView.image = UIImage(named: "check mark")
        } else {
            rightOrWrongImgView.image = UIImage(named: "close")
        }

        for btn in buttons {
            if btn?.title(for: .normal) == selected {
                btn?.backgroundColor = isCorrect ? .systemGreen : .systemRed
                btn?.setTitleColor(defaultTextColor, for: .normal)
            }

            if !isCorrect && btn?.title(for: .normal) == q.correctAnswer {
                btn?.backgroundColor = .systemGreen
                btn?.setTitleColor(defaultTextColor, for: .normal)
            }
        }

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        
        nextBtn.isHidden = false
    }

    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Option Buttons
    @IBAction func option1Tap(_ sender: UIButton) {
        if let text = sender.title(for: .normal) {
            handleAnswer(text)
        }
    }

    @IBAction func option2Tap(_ sender: UIButton) {
        if let text = sender.title(for: .normal) {
            handleAnswer(text)
        }
    }
    
    @IBAction func option3Tap(_ sender: UIButton) {
        if let text = sender.title(for: .normal) {
            handleAnswer(text)
        }
    }


    // MARK: - Submit / Next
    @IBAction func nextTapBtn(_ sender: UIButton) {

        guard hasAnswered else { return }

        currentIndex += 1

        if currentIndex < questions.count {
            loadQuestion()
        } else {
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "IdentifyActionVerbResultVC"
            ) as! IdentifyActionVerbResultVC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

