//
//  ProperNounVC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//

import LanguageManager_iOS
struct ProperNounQuestion {
    let sentence: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct ProperNounVerbResult {
    let sentence: String
    let selectedAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
}

import UIKit

class ProperNounVC: BaseViewController {

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
    
    var questions: [ProperNounQuestion] = [

        ProperNounQuestion(
            sentence: "Raja is eating".localiz(),
            option1: "Raja".localiz(),
            option2: "is".localiz(),
            option3: "eating".localiz(),
            correctAnswer: "Raja".localiz()
        ),

        ProperNounQuestion(
            sentence: "Rani plays in Delhi".localiz(),
            option1: "plays".localiz(),
            option2: "in".localiz(),
            option3: "Delhi".localiz(),
            correctAnswer: "Delhi".localiz()
        ),

        ProperNounQuestion(
            sentence: "Tina draws Taj".localiz(),
            option1: "draws".localiz(),
            option2: "Taj".localiz(),
            option3: "Tina".localiz(),
            correctAnswer: "Tina".localiz()
        ),

        ProperNounQuestion(
            sentence: "Mohan jumps high".localiz(),
            option1: "jumps".localiz(),
            option2: "Mohan".localiz(),
            option3: "high".localiz(),
            correctAnswer: "Mohan".localiz()
        ),

        ProperNounQuestion(
            sentence: "Amit reads book".localiz(),
            option1: "book".localiz(),
            option2: "reads".localiz(),
            option3: "Amit".localiz(),
            correctAnswer: "Amit".localiz()
        ),

        ProperNounQuestion(
            sentence: "Gita writes name".localiz(),
            option1: "Gita".localiz(),
            option2: "writes".localiz(),
            option3: "name".localiz(),
            correctAnswer: "Gita".localiz()
        ),

        ProperNounQuestion(
            sentence: "Raju sings song".localiz(),
            option1: "song".localiz(),
            option2: "Raju".localiz(),
            option3: "sings".localiz(),
            correctAnswer: "Raju".localiz()
        ),

        ProperNounQuestion(
            sentence: "Mira drinks milk".localiz(),
            option1: "milk".localiz(),
            option2: "Mira".localiz(),
            option3: "drinks".localiz(),
            correctAnswer: "Mira".localiz()
        ),

        ProperNounQuestion(
            sentence: "Ravi runs fast".localiz(),
            option1: "Ravi".localiz(),
            option2: "fast".localiz(),
            option3: "runs".localiz(),
            correctAnswer: "Ravi".localiz()
        ),

        ProperNounQuestion(
            sentence: "Sita washes hands".localiz(),
            option1: "hands".localiz(),
            option2: "washes".localiz(),
            option3: "Sita".localiz(),
            correctAnswer: "Sita".localiz()
        )
    ]
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [ProperNounVerbResult] = []

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
                button?.setTitleColor(.white, for: .normal)
            }
        }
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

            nama1Btn.setTitleColor(.black, for: .normal)
            nama2Btn.setTitleColor(.black, for: .normal)
            nama3Btn.setTitleColor(.black, for: .normal)

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

            nama1Btn.setTitleColor(.white, for: .normal)
            nama2Btn.setTitleColor(.white, for: .normal)
            nama3Btn.setTitleColor(.white, for: .normal)

            defaultBGColor = nama1Btn.backgroundColor
            defaultTextColor = .white
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
            ProperNounVerbResult(
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
                btn?.setTitleColor(.white, for: .normal)
            }

            if !isCorrect && btn?.title(for: .normal) == q.correctAnswer {
                btn?.backgroundColor = .systemGreen
                btn?.setTitleColor(.white, for: .normal)
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
                withIdentifier: "ProperNounResultVC"
            ) as! ProperNounResultVC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

