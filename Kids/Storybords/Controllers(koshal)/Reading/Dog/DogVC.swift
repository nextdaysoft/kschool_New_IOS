//
//  DogVC.swift
//  Kids
//
//  Created by Koshal Singh on 06/02/26.
//


struct DogQuestion {
    let storyTitle: String
    let storyText: String
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct DogResult {
    let sentence: String
    let selectedAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
}


import UIKit
import LanguageManager_iOS

class DogVC: BaseViewController {

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
    
    var questions: [DogQuestion] = [

        DogQuestion(
            storyTitle: "Dog".localiz(),
            storyText: """
            This is my dog.
            The dog is brown.
            It has a small tail.
            I play with my dog.
            """.localiz(),
            question: "What does the dog have?".localiz(),
            option1: "A small tail".localiz(),
            option2: "A long nose".localiz(),
            option3: "A red hat".localiz(),
            correctAnswer: "A small tail".localiz()
        ),

        DogQuestion(
            storyTitle: "Dog".localiz(),
            storyText: """
            This is my dog.
            The dog is brown.
            It has a small tail.
            I play with my dog.
            """.localiz(),
            question: "What color is the dog?".localiz(),
            option1: "Brown".localiz(),
            option2: "White".localiz(),
            option3: "Black".localiz(),
            correctAnswer: "Brown".localiz()
        ),

        DogQuestion(
            storyTitle: "Dog".localiz(),
            storyText: """
            This is my dog.
            The dog is brown.
            It has a small tail.
            I play with my dog.
            """.localiz(),
            question: "Whose dog is it?".localiz(),
            option1: "My dog".localiz(),
            option2: "My bird".localiz(),
            option3: "My cat".localiz(),
            correctAnswer: "My dog".localiz()
        ),

        DogQuestion(
            storyTitle: "Dog".localiz(),
            storyText: """
            This is my dog.
            The dog is brown.
            It has a small tail.
            I play with my dog.
            """.localiz(),
            question: "What do I do with my dog?".localiz(),
            option1: "Play with it".localiz(),
            option2: "Run away".localiz(),
            option3: "Sleep on it".localiz(),
            correctAnswer: "Play with it".localiz()
        ),

        DogQuestion(
            storyTitle: "Dog".localiz(),
            storyText: """
            This is my dog.
            The dog is brown.
            It has a small tail.
            I play with my dog.
            """.localiz(),
            question: "Is the dog big or small?".localiz(),
            option1: "Big".localiz(),
            option2: "Small".localiz(),
            option3: "Tiny".localiz(),
            correctAnswer: "Small".localiz()
        )
    ]
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [DogResult] = []

    var defaultBGColor: UIColor?
    var defaultTextColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        
        scoreLabelBGView.layer.cornerRadius = 10
        imgBGView.layer.cornerRadius = 10
        topBGView.layer.cornerRadius = 10
     
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
            DogResult(
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
                withIdentifier: "DogResultVC"
            ) as! DogResultVC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

