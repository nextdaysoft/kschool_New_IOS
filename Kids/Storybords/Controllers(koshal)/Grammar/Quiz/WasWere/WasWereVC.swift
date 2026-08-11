//
//  WasWereVC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//

import LanguageManager_iOS
struct WasWereQuestion {
    let sentence: String
    let option1: String
    let option2: String
    let correctAnswer: String
}

struct WasWereResult {
    let selectedSentence: String
    let correctSentence: String
    let isCorrect: Bool
}

import UIKit

class WasWereVC: BaseViewController {

    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    @IBOutlet weak var allNameLalel: UILabel!
    @IBOutlet weak var nama1Btn: UIButton!
    @IBOutlet weak var nama2Btn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var questions: [WasWereQuestion] = [

        WasWereQuestion(
            sentence: "It _ _ _ a sunny day".localiz(),
            option1: "were".localiz(),
            option2: "was".localiz(),
            correctAnswer: "was".localiz()
        ),

        WasWereQuestion(
            sentence: "I _ _ _ at the park".localiz(),
            option1: "were".localiz(),
            option2: "was".localiz(),
            correctAnswer: "was".localiz()
        ),

        WasWereQuestion(
            sentence: "We _ _ _ at school".localiz(),
            option1: "was".localiz(),
            option2: "were".localiz(),
            correctAnswer: "were".localiz()
        ),

        WasWereQuestion(
            sentence: "She _ _ _ in the room".localiz(),
            option1: "was".localiz(),
            option2: "were".localiz(),
            correctAnswer: "was".localiz()
        ),

        WasWereQuestion(
            sentence: "You _ _ _ very kind".localiz(),
            option1: "was".localiz(),
            option2: "were".localiz(),
            correctAnswer: "were".localiz()
        ),

        WasWereQuestion(
            sentence: "He _ _ _ my best friend".localiz(),
            option1: "was".localiz(),
            option2: "were".localiz(),
            correctAnswer: "was".localiz()
        ),

        WasWereQuestion(
            sentence: "The boys _ _ _ playing".localiz(),
            option1: "was".localiz(),
            option2: "were".localiz(),
            correctAnswer: "were".localiz()
        ),

        WasWereQuestion(
            sentence: "They _ _ _ very happy".localiz(),
            option1: "were".localiz(),
            option2: "was".localiz(),
            correctAnswer: "were".localiz()
        ),

        WasWereQuestion(
            sentence: "The dog _ _ _ hungry".localiz(),
            option1: "were".localiz(),
            option2: "was".localiz(),
            correctAnswer: "was".localiz()
        ),

        WasWereQuestion(
            sentence: "The girl _ _ _ late".localiz(),
            option1: "was".localiz(),
            option2: "were".localiz(),
            correctAnswer: "was".localiz()
        )
    ]
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [WasWereResult] = []

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

            [nama1Btn, nama2Btn].forEach {
                $0?.backgroundColor = .white
                $0?.setTitleColor(.black, for: .normal)
            }

        } else {

            let colors = [
                ColorManager.randomColor(),
                ColorManager.randomColor()
            ]

            let buttons = [nama1Btn, nama2Btn]

            for (button, color) in zip(buttons, colors) {
                button?.backgroundColor = color
                button?.setTitleColor(defaultTextColor, for: .normal)
            }
        }
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white
           

            scoreLabelBGView.backgroundColor = .white
            imgBGView.backgroundColor = .white

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white

            defaultBGColor = .white
            defaultTextColor = .black

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            scoreLabelBGView.backgroundColor = color
            imgBGView.backgroundColor = .white

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()

            defaultBGColor = nama1Btn.backgroundColor
            defaultTextColor = .black
        }
    }
    
    
    func loadQuestion() {
        let q = questions[currentIndex]

        allNameLalel.text = q.sentence
        nama1Btn.setTitle(q.option1, for: .normal)
        nama2Btn.setTitle(q.option2, for: .normal)

       
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

        let selectedSentence = q.sentence.replacingOccurrences(of: "_ _ _", with: selected)
        let correctSentence  = q.sentence.replacingOccurrences(of: "_ _ _", with: q.correctAnswer)

        // ✅ BUTTON CLICK PE TEXT ADD HOGA
        allNameLalel.text = selectedSentence

        let isCorrect = (selected == q.correctAnswer)

        results.append(
            WasWereResult(
                selectedSentence: selectedSentence,
                correctSentence: correctSentence,
                isCorrect: isCorrect
            )
        )

        let buttons = [nama1Btn, nama2Btn]

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


    // MARK: - Submit / Next
    @IBAction func nextTapBtn(_ sender: UIButton) {

        guard hasAnswered else { return }

        currentIndex += 1

        if currentIndex < questions.count {
            loadQuestion()
        } else {
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "WasWereResultVC"
            ) as! WasWereResultVC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
