//
//  ConfusingWordsLevel1VC.swift
//  Kids
//
//  Created by Koshal Singh on 30/01/26.
//

import LanguageManager_iOS
struct ConfusingWordsQuestion {
    let sentence: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct ConfusingWordsResult {
    let selectedSentence: String
    let correctSentence: String
    let isCorrect: Bool
}

import UIKit

class ConfusingWordsLevel1VC: BaseViewController {

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
    
    var questions: [ConfusingWordsQuestion] = [

        ConfusingWordsQuestion(
            sentence: "She went _ _ _ play.".localiz(),
            option1: "too".localiz(),
            option2: "two".localiz(),
            option3: "to".localiz(),
            correctAnswer: "to".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "I like ice cream _ _ _.".localiz(),
            option1: "to".localiz(),
            option2: "too".localiz(),
            option3: "two".localiz(),
            correctAnswer: "too".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "I go _ _ _ school.".localiz(),
            option1: "too".localiz(),
            option2: "two".localiz(),
            option3: "to".localiz(),
            correctAnswer: "to".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "I have _ _ _ toys.".localiz(),
            option1: "two".localiz(),
            option2: "too".localiz(),
            option3: "to".localiz(),
            correctAnswer: "two".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "Mom gave it _ _ _ Dad.".localiz(),
            option1: "two".localiz(),
            option2: "to".localiz(),
            option3: "too".localiz(),
            correctAnswer: "to".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "I have two _ _ _.".localiz(),
            option1: "too".localiz(),
            option2: "to".localiz(),
            option3: "two".localiz(),
            correctAnswer: "two".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "He ran _ _ _ fast.".localiz(),
            option1: "two".localiz(),
            option2: "to".localiz(),
            option3: "too".localiz(),
            correctAnswer: "too".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "We saw _ _ _ cats.".localiz(),
            option1: "two".localiz(),
            option2: "to".localiz(),
            option3: "too".localiz(),
            correctAnswer: "two".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "Give it _ _ _ me.".localiz(),
            option1: "too".localiz(),
            option2: "to".localiz(),
            option3: "two".localiz(),
            correctAnswer: "to".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "I like apples _ _ _.".localiz(),
            option1: "to".localiz(),
            option2: "too".localiz(),
            option3: "two".localiz(),
            correctAnswer: "too".localiz()
        )
    ]
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [ConfusingWordsResult] = []

    var defaultBGColor: UIColor?
    var defaultTextColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()

        questions.shuffle()
        
        scoreLabelBGView.layer.cornerRadius = 10
        imgBGView.layer.cornerRadius = 10
   
        
        nama1Btn.layer.cornerRadius = 10
        nama2Btn.layer.cornerRadius = 10
        nama3Btn.layer.cornerRadius = 10

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

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white
            nama3Btn.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()
            nama3Btn.backgroundColor = ColorManager.randomColor()
        }

        defaultBGColor = nama1Btn.backgroundColor
    }

    
    func resetButtons() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white
            nama3Btn.backgroundColor = .white

        } else {

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()
            nama3Btn.backgroundColor = ColorManager.randomColor()
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

        resetButtons()   // 🔥 IMPORTANT

        applyTheme()
    }
    
    func handleAnswer(_ selected: String) {

        if hasAnswered { return }
        hasAnswered = true

        let q = questions[currentIndex]

        let selectedSentence = q.sentence.replacingOccurrences(of: "_ _ _", with: selected)
        let correctSentence  = q.sentence.replacingOccurrences(of: "_ _ _", with: q.correctAnswer)

        // ✅ BUTTON CLICK PE TEXT ADD HOGA
        allNameLalel.text = selectedSentence

        let isCorrect = (selected == q.correctAnswer)

        results.append(
            ConfusingWordsResult(
                selectedSentence: selectedSentence,
                correctSentence: correctSentence,
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
            }

            if !isCorrect && btn?.title(for: .normal) == q.correctAnswer {
                btn?.backgroundColor = .systemGreen
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
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ConfusingWordsResultLevel1VC"
            ) as! ConfusingWordsResultLevel1VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
