//
//  ConfusingWordsLevel3VC.swift
//  Kids
//
//  Created by Koshal Singh on 30/01/26.
//

import UIKit
import LanguageManager_iOS

class ConfusingWordsLevel3VC: BaseViewController {

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
            sentence: "I made a card _ _ _ you.".localiz(),
            option1: "for".localiz(),
            option2: "four".localiz(),
            option3: "too".localiz(),
            correctAnswer: "for".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "A bed is _ _ _ sleeping.".localiz(),
            option1: "for".localiz(),
            option2: "four".localiz(),
            option3: "to".localiz(),
            correctAnswer: "for".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "Dad made a cake _ _ _ me.".localiz(),
            option1: "for".localiz(),
            option2: "four".localiz(),
            option3: "to".localiz(),
            correctAnswer: "for".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "This gift is _ _ _ Mom.".localiz(),
            option1: "four".localiz(),
            option2: "two".localiz(),
            option3: "for".localiz(),
            correctAnswer: "for".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "There are _ _ _ kids playing.".localiz(),
            option1: "to".localiz(),
            option2: "four".localiz(),
            option3: "for".localiz(),
            correctAnswer: "four".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "I have _ _ _ books.".localiz(),
            option1: "too".localiz(),
            option2: "four".localiz(),
            option3: "for".localiz(),
            correctAnswer: "four".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "This is _ _ _ you.".localiz(),
            option1: "to".localiz(),
            option2: "four".localiz(),
            option3: "for".localiz(),
            correctAnswer: "for".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "There are _ _ _ chairs.".localiz(),
            option1: "four".localiz(),
            option2: "for".localiz(),
            option3: "too".localiz(),
            correctAnswer: "four".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "We have _ _ _ apples.".localiz(),
            option1: "four".localiz(),
            option2: "too".localiz(),
            option3: "for".localiz(),
            correctAnswer: "four".localiz()
        ),

        ConfusingWordsQuestion(
            sentence: "This toy is _ _ _ you.".localiz(),
            option1: "to".localiz(),
            option2: "for".localiz(),
            option3: "four".localiz(),
            correctAnswer: "for".localiz()
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
            nextBtn.setTitleColor(.black, for: .normal)

            scoreLabelBGView.backgroundColor = .white

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white
            nama3Btn.backgroundColor = .white

            nama1Btn.setTitleColor(.black, for: .normal)
            nama2Btn.setTitleColor(.black, for: .normal)
            nama3Btn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            scoreLabelBGView.backgroundColor = color

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()
            nama3Btn.backgroundColor = ColorManager.randomColor()

            nama1Btn.setTitleColor(.white, for: .normal)
            nama2Btn.setTitleColor(.white, for: .normal)
            nama3Btn.setTitleColor(.white, for: .normal)
        }

        defaultBGColor = nama1Btn.backgroundColor
        defaultTextColor = nama1Btn.titleColor(for: .normal)
    }
    
    func resetButtons() {
        [nama1Btn, nama2Btn, nama3Btn].forEach { btn in
            btn?.backgroundColor = defaultBGColor
            btn?.setTitleColor(defaultTextColor, for: .normal)
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
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ConfusingWordsResultLevel3VC"
            ) as! ConfusingWordsResultLevel3VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
