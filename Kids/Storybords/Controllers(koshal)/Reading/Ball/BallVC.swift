//
//  BallVC.swift
//  Kids
//
//  Created by Koshal Singh on 06/02/26.
//

import LanguageManager_iOS
struct BallQuestion {
    let storyTitle: String
    let storyText: String
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct BallResult {
    let sentence: String
    let selectedAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
}

import UIKit

class BallVC: BaseViewController {

    @IBOutlet weak var topBGView: UIView!
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
    
    var questions: [BallQuestion] = [

        BallQuestion(
            storyTitle: "Ball".localiz(),
            storyText: """
            This is my ball.
            The ball is red and blue.
            I throw the ball.
            I catch the ball.
            """.localiz(),
            question: "What do I do after throwing the ball?".localiz(),
            option1: "Catch it".localiz(),
            option2: "Kick it".localiz(),
            option3: "Hide it".localiz(),
            correctAnswer: "Catch it".localiz()
        ),

        BallQuestion(
            storyTitle: "Ball".localiz(),
            storyText: """
            This is my ball.
            The ball is red and blue.
            I throw the ball.
            I catch the ball.
            """.localiz(),
            question: "Is the ball round or flat?".localiz(),
            option1: "Round".localiz(),
            option2: "Square".localiz(),
            option3: "Flat".localiz(),
            correctAnswer: "Round".localiz()
        ),

        BallQuestion(
            storyTitle: "Ball".localiz(),
            storyText: """
            This is my ball.
            The ball is red and blue.
            I throw the ball.
            I catch the ball.
            """.localiz(),
            question: "What do I do with the ball?".localiz(),
            option1: "Draw it".localiz(),
            option2: "Throw it".localiz(),
            option3: "Eat it".localiz(),
            correctAnswer: "Throw it".localiz()
        ),

        BallQuestion(
            storyTitle: "Ball".localiz(),
            storyText: """
            This is my ball.
            The ball is red and blue.
            I throw the ball.
            I catch the ball.
            """.localiz(),
            question: "What colors are on the ball?".localiz(),
            option1: "Red and blue".localiz(),
            option2: "Black and white".localiz(),
            option3: "Yellow and green".localiz(),
            correctAnswer: "Red and blue".localiz()
        ),

        BallQuestion(
            storyTitle: "Ball".localiz(),
            storyText: """
            This is my ball.
            The ball is red and blue.
            I throw the ball.
            I catch the ball.
            """.localiz(),
            question: "What is in the story?".localiz(),
            option1: "Bat".localiz(),
            option2: "Car".localiz(),
            option3: "Ball".localiz(),
            correctAnswer: "Ball".localiz()
        )
    ]
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [BallResult] = []

    var defaultBGColor: UIColor?
    var defaultTextColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        scoreLabelBGView.layer.cornerRadius = 10
        imgBGView.layer.cornerRadius = 10
        topBGView.layer.cornerRadius = 10
        
        nextBtn.layer.cornerRadius = 10
        nextBtn.backgroundColor = ColorManager.randomColor()
        nextBtn.layer.borderColor = UIColor.black.cgColor
        
        
        nama1Btn.layer.cornerRadius = 10
        nama2Btn.layer.cornerRadius = 10
        nama3Btn.layer.cornerRadius = 10

        
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
            topBGView.backgroundColor = .white
            imgBGView.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            scoreLabelBGView.backgroundColor = color
            topBGView.backgroundColor = ColorManager.randomColor()
            imgBGView.backgroundColor = ColorManager.randomColor()
        }
    }
    
    func resetButtons() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white
            nama3Btn.backgroundColor = .white

            nama1Btn.setTitleColor(.black, for: .normal)
            nama2Btn.setTitleColor(.black, for: .normal)
            nama3Btn.setTitleColor(.black, for: .normal)

        } else {

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
    
    
    func loadQuestion() {
        let q = questions[currentIndex]

        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        allNameLalel.text = q.question

        let options = [q.option1, q.option2, q.option3].shuffled()

        nama1Btn.setTitle(options[0], for: .normal)
        nama2Btn.setTitle(options[1], for: .normal)
        nama3Btn.setTitle(options[2], for: .normal)

        resetButtons()

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"

        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil
    }

    
    func handleAnswer(_ selected: String) {

        if hasAnswered { return }
        hasAnswered = true

        let q = questions[currentIndex]
        let isCorrect = (selected == q.correctAnswer)

        results.append(
            BallResult(
                sentence: q.question,   // ← yaha change karo
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
                btn?.setTitleColor(.black, for: .normal)
            }

            if !isCorrect && btn?.title(for: .normal) == q.correctAnswer {
                btn?.backgroundColor = .systemGreen
                btn?.setTitleColor(.black, for: .normal)
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
                withIdentifier: "BallResultVC"
            ) as! BallResultVC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

