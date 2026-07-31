//
//  PickTheCorrectOptionLevel3VC.swift
//  Kids
//
//  Created by Koshal Singh on 30/01/26.
//

import UIKit
import LanguageManager_iOS

class PickTheCorrectOptionLevel3VC: BaseViewController {

    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    @IBOutlet weak var allImgs: UIImageView!
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
    
    
    var questions: [PickQuestion] = [

        PickQuestion(
            imageName: "BrushingTeeth",
            sentence: "We brush our teeth with a toothbrush".localiz(),
            option1: "toothbrush".localiz(),
            option2: "comb".localiz(),
            correctAnswer: "toothbrush".localiz()
        ),

        PickQuestion(
            imageName: "train",
            sentence: "The train runs on tracks".localiz(),
            option1: "road".localiz(),
            option2: "tracks".localiz(),
            correctAnswer: "tracks".localiz()
        ),

        PickQuestion(
            imageName: "sun",
            sentence: "The opposite of 'cold' is Cool.".localiz(),
            option1: "hot".localiz(),
            option2: "Cool".localiz(),
            correctAnswer: "Cool".localiz()
        ),

        PickQuestion(
            imageName: "field",
            sentence: "The farmer works in the field".localiz(),
            option1: "office".localiz(),
            option2: "field".localiz(),
            correctAnswer: "field".localiz()
        ),

        PickQuestion(
            imageName: "shoes",
            sentence: "We wear shoes on our feet".localiz(),
            option1: "feet".localiz(),
            option2: "Hands".localiz(),
            correctAnswer: "feet".localiz()
        ),

        PickQuestion(
            imageName: "car",
            sentence: "A car has four wheels".localiz(),
            option1: "four".localiz(),
            option2: "Three".localiz(),
            correctAnswer: "four".localiz()
        ),

        PickQuestion(
            imageName: "babyCrying",
            sentence: "The baby drinks milk".localiz(),
            option1: "tea".localiz(),
            option2: "Milk".localiz(),
            correctAnswer: "Milk".localiz()
        ),

        PickQuestion(
            imageName: "natureNew",
            sentence: "The moon comes out at night".localiz(),
            option1: "night".localiz(),
            option2: "day".localiz(),
            correctAnswer: "night".localiz()
        ),

        PickQuestion(
            imageName: "sun",
            sentence: "The opposite of 'cold' is hot".localiz(),
            option1: "cool".localiz(),
            option2: "hot".localiz(),
            correctAnswer: "hot".localiz()
        ),

        PickQuestion(
            imageName: "natureNew",
            sentence: "The opposite of 'night' is day".localiz(),
            option1: "dark".localiz(),
            option2: "day".localiz(),
            correctAnswer: "day".localiz()
        )
    ]

    var currentIndex = 0
    var score = 0
    var selectedAnswer: String?
    var hasAnswered = false
    var defaultOptionBGColor: UIColor?
    var defaultOptionTextColor: UIColor?
    var results: [PickOptionResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions.shuffle()
        
        setup()
        applyTheme()

        imgBGView.layer.cornerRadius = 10
        
        
        nama1Btn.layer.cornerRadius = 10
        nama2Btn.layer.cornerRadius = 10
        
        scoreLabelBGView.layer.cornerRadius = 10

        defaultOptionBGColor = nama1Btn.backgroundColor
        defaultOptionTextColor = nama1Btn.titleColor(for: .normal)

           nextBtn.isHidden = true
           loadQuestion()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    func setup() {

        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)

        let img = UIImage(
            systemName: "arrow.backward.circle",
            withConfiguration: config
        )

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

            nama1Btn.setTitleColor(.black, for: .normal)
            nama2Btn.setTitleColor(.black, for: .normal)

            defaultOptionBGColor = .white
            defaultOptionTextColor = .black

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

            nama1Btn.setTitleColor(.white, for: .normal)
            nama2Btn.setTitleColor(.white, for: .normal)

            defaultOptionBGColor = nama1Btn.backgroundColor
            defaultOptionTextColor = .white
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Load Question
    func loadQuestion() {

        let q = questions[currentIndex]

        allImgs.image = UIImage(named: q.imageName)

        allNameLalel.text = sentenceWithBlanks(
            sentence: q.sentence,
            answer: q.correctAnswer
        )

        // OPTIONS SHUFFLE
        let options = [q.option1, q.option2].shuffled()

        nama1Btn.setTitle(options[0], for: .normal)
        nama2Btn.setTitle(options[1], for: .normal)

        rightOrWrongImgView.image = nil
        hasAnswered = false

        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        
        
        resetOptionButtons()

        nextBtn.isHidden = true
    }
    
    func sentenceWithBlanks(sentence: String, answer: String) -> String {

        let words = answer.split(separator: " ")
        let blank = words.map { _ in "_ _ _" }.joined(separator: " ")

        let pattern = "\\b\(NSRegularExpression.escapedPattern(for: answer))\\b"

        if let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive]) {
            let range = NSRange(sentence.startIndex..., in: sentence)
            return regex.stringByReplacingMatches(
                in: sentence,
                options: [],
                range: range,
                withTemplate: blank
            )
        }

        return sentence
    }
    
    func handleAnswer(_ selected: String) {

        if hasAnswered { return }
        hasAnswered = true

        let q = questions[currentIndex]

        // 🔹 Blank wali jagah selected word bharo
        let selectedSentence = q.sentence.replacingOccurrences(
            of: q.correctAnswer,
            with: selected
        )

        allNameLalel.text = selectedSentence

        let isCorrect = (selected == q.correctAnswer)

        let result = PickOptionResult(
            fullSentence: selectedSentence,
            isCorrect: isCorrect
        )
        results.append(result)

        resetOptionButtons()

        let tappedButton = (nama1Btn.title(for: .normal) == selected) ? nama1Btn! : nama2Btn!
        let otherButton  = (tappedButton == nama1Btn) ? nama2Btn! : nama1Btn!

        if isCorrect {
            tappedButton.backgroundColor = .systemGreen
            tappedButton.setTitleColor(.white, for: .normal)
            rightOrWrongImgView.image = UIImage(named: "check mark")
            score += 1
        } else {
            tappedButton.backgroundColor = .systemRed
            tappedButton.setTitleColor(.white, for: .normal)
            rightOrWrongImgView.image = UIImage(named: "close")

            if otherButton.title(for: .normal) == q.correctAnswer {
                otherButton.backgroundColor = .systemGreen
                otherButton.setTitleColor(.white, for: .normal)
            }
        }

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        
        nextBtn.isHidden = false
    }
    
    
    func resetOptionButtons() {
        [nama1Btn, nama2Btn].forEach { button in
            button?.backgroundColor = defaultOptionBGColor
            button?.setTitleColor(defaultOptionTextColor, for: .normal)
        }
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

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "PickTheCorrectOptionResultLevel3VC"
            ) as! PickTheCorrectOptionResultLevel3VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
