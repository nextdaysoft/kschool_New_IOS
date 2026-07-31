//
//  PickTheCorrectOptionVC.swift
//  Find Pair
//

import UIKit
import LanguageManager_iOS

struct PickQuestion {
    let imageName: String
    let sentence: String
    let option1: String
    let option2: String
    let correctAnswer: String
}

struct PickOptionResult {
    let fullSentence: String
    let isCorrect: Bool
}

class PickTheCorrectOptionLevel1VC: BaseViewController {

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
        PickQuestion(imageName: "cow", sentence: "A cow gives us".localiz(), option1: "Milk".localiz(), option2: "Juice".localiz(), correctAnswer: "Milk".localiz()),
        
        PickQuestion(imageName: "drink-water", sentence: "We drink".localiz(), option1: "Water".localiz(), option2: "Sand".localiz(), correctAnswer: "Water".localiz()),
        
        PickQuestion(imageName: "bird", sentence: "Bird can".localiz(), option1: "Fly".localiz(), option2: "Swim".localiz(), correctAnswer: "Fly".localiz()),
        
        PickQuestion(imageName: "cat", sentence: "A cat says".localiz(), option1: "Meow".localiz(), option2: "Moo".localiz(), correctAnswer: "Meow".localiz()),
        
        PickQuestion(imageName: "sun", sentence: "The sun is".localiz(), option1: "Cold".localiz(), option2: "Hot".localiz(), correctAnswer: "Hot".localiz()),
        
        PickQuestion(imageName: "grass", sentence: "The grass is".localiz(), option1: "Green".localiz(), option2: "Blue".localiz(), correctAnswer: "Green".localiz()),
        
        PickQuestion(imageName: "clown-fish", sentence: "Fish can".localiz(), option1: "Fly".localiz(), option2: "Swim".localiz(), correctAnswer: "Swim".localiz()),
        
        PickQuestion(imageName: "clouds", sentence: "The sky is".localiz(), option1: "Blue".localiz(), option2: "Green".localiz(), correctAnswer: "Blue".localiz()),
        
        PickQuestion(imageName: "eatSpoon", sentence: "We eat with a".localiz(), option1: "Spoon".localiz(), option2: "Pencil".localiz(), correctAnswer: "Spoon".localiz()),
        
        PickQuestion(imageName: "writting", sentence: "We write with a".localiz(), option1: "Pencil".localiz(), option2: "Spoon".localiz(), correctAnswer: "Pencil".localiz())
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

        // QUESTION SHUFFLE
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

    // MARK: - Load Question
    func loadQuestion() {

        let q = questions[currentIndex]

        allImgs.image = UIImage(named: q.imageName)
        allNameLalel.text = "\(q.sentence) _ _ _."

        // OPTION SHUFFLE
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

    func handleAnswer(_ selected: String) {

        if hasAnswered { return }

        hasAnswered = true

        let q = questions[currentIndex]

        allNameLalel.text = "\(q.sentence) \(selected)."

        let isCorrect = (selected == q.correctAnswer)

        let fullSentence = "\(q.sentence) \(selected)."

        let result = PickOptionResult(
            fullSentence: fullSentence,
            isCorrect: isCorrect
        )

        results.append(result)

        resetOptionButtons()

        let tappedButton = (nama1Btn.title(for: .normal) == selected)
            ? nama1Btn!
            : nama2Btn!

        let otherButton = (tappedButton == nama1Btn)
            ? nama2Btn!
            : nama1Btn!

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
                button?.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    // MARK: Action
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

    // MARK: - Next
    @IBAction func nextTapBtn(_ sender: UIButton) {

        guard hasAnswered else { return }

        currentIndex += 1

        if currentIndex < questions.count {

            loadQuestion()

        } else {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let vc = storyboard.instantiateViewController(
                withIdentifier: "PickTheCorrectOptionResultLevel1VC"
            ) as! PickTheCorrectOptionResultLevel1VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
