//
//  RhymingWordsLevel1VC.swift
//  Kids
//
//  Created by Koshal Singh on 02/02/26.
//
import LanguageManager_iOS
struct RhymingWordsQuestion {
    let sentence: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct RhymingWordsResult {
    let selectedSentence: String
    let correctSentence: String
    let isCorrect: Bool
}
import UIKit

class RhymingWordsLevel1VC: BaseViewController {
    
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
    
    var questions: [RhymingWordsQuestion] = [

        RhymingWordsQuestion(
            sentence: "hat, mat, _ _ _".localiz(),
            option1: "pen".localiz(),
            option2: "cat".localiz(),
            option3: "fox".localiz(),
            correctAnswer: "cat".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "sun, fun, _ _ _".localiz(),
            option1: "tree".localiz(),
            option2: "car".localiz(),
            option3: "run".localiz(),
            correctAnswer: "run".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "ball, tall, _ _ _".localiz(),
            option1: "car".localiz(),
            option2: "sun".localiz(),
            option3: "mall".localiz(),
            correctAnswer: "mall".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "pen, hen, _ _ _".localiz(),
            option1: "star".localiz(),
            option2: "cup".localiz(),
            option3: "ten".localiz(),
            correctAnswer: "ten".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "dog, log, _ _ _".localiz(),
            option1: "ball".localiz(),
            option2: "hat".localiz(),
            option3: "frog".localiz(),
            correctAnswer: "frog".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "bat, cat, _ _ _".localiz(),
            option1: "rat".localiz(),
            option2: "dog".localiz(),
            option3: "sun".localiz(),
            correctAnswer: "rat".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "fox, box, _ _ _".localiz(),
            option1: "ten".localiz(),
            option2: "cat".localiz(),
            option3: "pox".localiz(),
            correctAnswer: "pox".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "tree, bee, _ _ _".localiz(),
            option1: "see".localiz(),
            option2: "hat".localiz(),
            option3: "ball".localiz(),
            correctAnswer: "see".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "cup, pup, _ _ _".localiz(),
            option1: "dog".localiz(),
            option2: "rat".localiz(),
            option3: "sup".localiz(),
            correctAnswer: "sup".localiz()
        ),

        RhymingWordsQuestion(
            sentence: "star, car, _ _ _".localiz(),
            option1: "pup".localiz(),
            option2: "bee".localiz(),
            option3: "bar".localiz(),
            correctAnswer: "bar".localiz()
        )
    ]
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [RhymingWordsResult] = []

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

            imgBGView.backgroundColor = .white

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white
            nama3Btn.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            
            imgBGView.backgroundColor = .white

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()
            nama3Btn.backgroundColor = ColorManager.randomColor()
        }

        defaultBGColor = nama1Btn.backgroundColor
        defaultTextColor = nama1Btn.titleColor(for: .normal)
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
            RhymingWordsResult(
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
                withIdentifier: "RhymingWordsResultLevel1VC"
            ) as! RhymingWordsResultLevel1VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

