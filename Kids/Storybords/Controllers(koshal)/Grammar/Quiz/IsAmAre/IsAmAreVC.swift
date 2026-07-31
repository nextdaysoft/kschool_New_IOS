//
//  IsAmAreVC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//

import LanguageManager_iOS
struct IsAmAreQuestion {
    let sentence: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct IsAmAreResult {
    let selectedSentence: String
    let correctSentence: String
    let isCorrect: Bool
}

import UIKit

class IsAmAreVC: BaseViewController {

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
    
    var questions: [IsAmAreQuestion] = [

        IsAmAreQuestion(
            sentence: "I _ _ _ hungry.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "am".localiz()
        ),

        IsAmAreQuestion(
            sentence: "She _ _ _ my friend.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "is".localiz()
        ),

        IsAmAreQuestion(
            sentence: "They _ _ _ playing.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "are".localiz()
        ),

        IsAmAreQuestion(
            sentence: "He _ _ _ tall.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "is".localiz()
        ),

        IsAmAreQuestion(
            sentence: "We _ _ _ ready.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "are".localiz()
        ),

        IsAmAreQuestion(
            sentence: "I _ _ _ a student.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "am".localiz()
        ),

        IsAmAreQuestion(
            sentence: "The cat _ _ _ black.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "is".localiz()
        ),

        IsAmAreQuestion(
            sentence: "You _ _ _ late.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "are".localiz()
        ),

        IsAmAreQuestion(
            sentence: "It _ _ _ cold.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "is".localiz()
        ),

        IsAmAreQuestion(
            sentence: "We _ _ _ friends.".localiz(),
            option1: "is".localiz(),
            option2: "am".localiz(),
            option3: "are".localiz(),
            correctAnswer: "are".localiz()
        )
    ]
    
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [IsAmAreResult] = []

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

        nama1Btn.backgroundColor = ColorManager.randomColor()
        nama2Btn.backgroundColor = ColorManager.randomColor()
        nama3Btn.backgroundColor = ColorManager.randomColor()

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
            IsAmAreResult(
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
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "IsAmAreResultVC"
            ) as! IsAmAreResultVC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
