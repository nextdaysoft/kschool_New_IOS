//
//  HealthyFoodHabitsLevel2VC.swift
//  Kids
//
//  Created by Koshal Singh on 28/01/26.
//

import UIKit
import LanguageManager_iOS

class HealthyFoodHabitsLevel2VC: BaseViewController {

    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    @IBOutlet weak var allImgs: UIImageView!
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
   
    
    var questions: [PickFoodQuestion] = [

        PickFoodQuestion(
            imageName: "freshVegetable",
            sentence: "Eat green Vegetables daily.".localiz(),
            option1: "Vegetables".localiz(),
            option2: "Candies".localiz(),
            option3: "Burgers".localiz(),
            correctAnswer: "Vegetables".localiz()
        ),

        PickFoodQuestion(
            imageName: "ExerciseStretching",
            sentence: "Play and Exercise every day.".localiz(),
            option1: "Sleep".localiz(),
            option2: "Exercise".localiz(),
            option3: "Eat".localiz(),
            correctAnswer: "Exercise".localiz()
        ),

        PickFoodQuestion(
            imageName: "NoJunkFood",
            sentence: "Say no to Cold drinks.".localiz(),
            option1: "Sweet".localiz(),
            option2: "Warm".localiz(),
            option3: "Cold".localiz(),
            correctAnswer: "Cold".localiz()
        ),

        PickFoodQuestion(
            imageName: "eating",
            sentence: "Eat Slowly and calmly.".localiz(),
            option1: "Fast".localiz(),
            option2: "Slowly".localiz(),
            option3: "Standing".localiz(),
            correctAnswer: "Slowly".localiz()
        ),

        PickFoodQuestion(
            imageName: "milk",
            sentence: "Drink Milk to grow strong.".localiz(),
            option1: "Milk".localiz(),
            option2: "Juice".localiz(),
            option3: "Soda".localiz(),
            correctAnswer: "Milk".localiz()
        ),

        PickFoodQuestion(
            imageName: "EatingApple",
            sentence: "Eat small Meals often.".localiz(),
            option1: "Meals".localiz(),
            option2: "Bags".localiz(),
            option3: "Drinks".localiz(),
            correctAnswer: "Meals".localiz()
        ),

        PickFoodQuestion(
            imageName: "dining",
            sentence: "Eat with Family happily.".localiz(),
            option1: "Family".localiz(),
            option2: "Pets".localiz(),
            option3: "Strangers".localiz(),
            correctAnswer: "Family".localiz()
        ),

        PickFoodQuestion(
            imageName: "sleeping",
            sentence: "Sleep Early to stay healthy.".localiz(),
            option1: "Less".localiz(),
            option2: "Late".localiz(),
            option3: "Early".localiz(),
            correctAnswer: "Early".localiz()
        ),

        PickFoodQuestion(
            imageName: "sneezing",
            sentence: "Use a Napkin while eating.".localiz(),
            option1: "Toy".localiz(),
            option2: "Book".localiz(),
            option3: "Napkin".localiz(),
            correctAnswer: "Napkin".localiz()
        ),

        PickFoodQuestion(
            imageName: "ServeFood",
            sentence: "Always Cover your food.".localiz(),
            option1: "Hide".localiz(),
            option2: "Cover".localiz(),
            option3: "Throw".localiz(),
            correctAnswer: "Cover".localiz()
        )
    ]
    

    var currentIndex = 0
    var score = 0
    var selectedAnswer: String?
    var hasAnswered = false
    var defaultOptionBGColor: UIColor?
    var defaultOptionTextColor: UIColor?
    var results: [PickFoodOptionResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        
        imgBGView.layer.cornerRadius = 10
      
        nama1Btn.layer.cornerRadius = 10
        nama2Btn.layer.cornerRadius = 10
        nama3Btn.layer.cornerRadius = 10

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
    
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
    }
    
    
    func applyTheme() {

        let optionButtons = [
            nama1Btn,
            nama2Btn,
            nama3Btn
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white
            nextBtn.backgroundColor = .white
        
            optionButtons.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            optionButtons.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }

        defaultOptionBGColor = nama1Btn.backgroundColor
    }
    
    func handleAnswer(_ selected: String) {

        if hasAnswered { return }
        hasAnswered = true

        let q = questions[currentIndex]

        let selectedSentence = q.sentence.replacingOccurrences(
            of: q.correctAnswer,
            with: selected
        )

        let correctSentence = q.sentence

        allNameLalel.text = selectedSentence

        let isCorrect = (selected == q.correctAnswer)

        let result = PickFoodOptionResult(
            selectedSentence: selectedSentence,
            correctSentence: correctSentence,
            isCorrect: isCorrect
        )
        results.append(result)

        resetOptionButtons()

        let buttons = [nama1Btn, nama2Btn, nama3Btn].compactMap { $0 }

        guard let tappedButton = buttons.first(where: {
            $0.title(for: .normal) == selected
        }) else { return }

        if isCorrect {

            tappedButton.backgroundColor = .systemGreen
            tappedButton.setTitleColor(.black, for: .normal)

            rightOrWrongImgView.image = UIImage(named: "check mark")
            score += 1

        } else {

            tappedButton.backgroundColor = .systemRed
            tappedButton.setTitleColor(.black, for: .normal)

            rightOrWrongImgView.image = UIImage(named: "close")

            if let correctButton = buttons.first(where: {
                $0.title(for: .normal) == q.correctAnswer
            }) {
                correctButton.backgroundColor = .systemGreen
                correctButton.setTitleColor(.black, for: .normal)
            }
        }

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        nextBtn.isHidden = false
    }
    
    
    
    func resetOptionButtons() {

        [nama1Btn, nama2Btn, nama3Btn].forEach { button in

            button?.backgroundColor = defaultOptionBGColor
            button?.setTitleColor(.black, for: .normal)
        }
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func sentenceWithBlanks(sentence: String, answer: String) -> String {

        let words = answer.split(separator: " ")
        let blank = words.map { _ in "_ _ _" }.joined(separator: " ")

        // Case-insensitive replace
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
    
    // MARK: - Load Question
    func loadQuestion() {
        let q = questions[currentIndex]

        allImgs.image = UIImage(named: q.imageName)

        // ✅ NOW THIS WILL WORK
        allNameLalel.text = sentenceWithBlanks(
            sentence: q.sentence,
            answer: q.correctAnswer
        )

        nama1Btn.setTitle(q.option1, for: .normal)
        nama2Btn.setTitle(q.option2, for: .normal)
        nama3Btn.setTitle(q.option3, for: .normal)

        rightOrWrongImgView.image = nil
        hasAnswered = false

        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"

        resetOptionButtons()
        nextBtn.isHidden = true
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
                withIdentifier: "HealthyFoodHabitsResultLevel2VC"
            ) as! HealthyFoodHabitsResultLevel2VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }
   
}
