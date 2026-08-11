//
//  HealthyFoodHabitsLevel1VC.swift
//  Kids
//
//  Created by Koshal Singh on 28/01/26.
//

import LanguageManager_iOS
struct PickFoodQuestion {
    let imageName: String
    let sentence: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct PickFoodOptionResult {
    let selectedSentence: String
    let correctSentence: String
    let isCorrect: Bool
}

import UIKit

class HealthyFoodHabitsLevel1VC: BaseViewController {

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
            imageName: "NoJunkFood",
            sentence: "Avoid too much Junk food.".localiz(),
            option1: "Healthy".localiz(),
            option2: "Green".localiz(),
            option3: "Junk".localiz(),
            correctAnswer: "Junk".localiz()
        ),

        PickFoodQuestion(
            imageName: "EatingApple",
            sentence: "Eat fresh Fruits every day.".localiz(),
            option1: "Chips".localiz(),
            option2: "Fruits".localiz(),
            option3: "Sweets".localiz(),
            correctAnswer: "Fruits".localiz()
        ),

        PickFoodQuestion(
            imageName: "ThankYou",
            sentence: "Be Thankful for your food.".localiz(),
            option1: "Lazy".localiz(),
            option2: "Angry".localiz(),
            option3: "Thankful".localiz(),
            correctAnswer: "Thankful".localiz()
        ),

        PickFoodQuestion(
            imageName: "drink-water",
            sentence: "Drink plenty of Water.".localiz(),
            option1: "Water".localiz(),
            option2: "Soda".localiz(),
            option3: "Juice".localiz(),
            correctAnswer: "Water".localiz()
        ),

        PickFoodQuestion(
            imageName: "breakfast",
            sentence: "Never skip your Breakfast.".localiz(),
            option1: "Breakfast".localiz(),
            option2: "Lunch".localiz(),
            option3: "Dinner".localiz(),
            correctAnswer: "Breakfast".localiz()
        ),

        PickFoodQuestion(
            imageName: "EatingApple",
            sentence: "Chew your food properly.".localiz(),
            option1: "Throw".localiz(),
            option2: "Chew".localiz(),
            option3: "Drink".localiz(),
            correctAnswer: "Chew".localiz()
        ),

        PickFoodQuestion(
            imageName: "SharingFood",
            sentence: "Share your food with friends.".localiz(),
            option1: "Share".localiz(),
            option2: "Throw".localiz(),
            option3: "Hide".localiz(),
            correctAnswer: "Share".localiz()
        ),

        PickFoodQuestion(
            imageName: "WashingDishes",
            sentence: "Keep your Plate clean.".localiz(),
            option1: "Plate".localiz(),
            option2: "Bag".localiz(),
            option3: "Shoes".localiz(),
            correctAnswer: "Plate".localiz()
        ),

        PickFoodQuestion(
            imageName: "BrushingTeeth",
            sentence: "Brush your teeth after eating.".localiz(),
            option1: "Wash".localiz(),
            option2: "Bite".localiz(),
            option3: "Brush".localiz(),
            correctAnswer: "Brush".localiz()
        ),

        PickFoodQuestion(
            imageName: "washyourhands",
            sentence: "Wash Hands before and after eating.".localiz(),
            option1: "Legs".localiz(),
            option2: "Hands".localiz(),
            option3: "Face".localiz(),
            correctAnswer: "Hands".localiz()
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
                withIdentifier: "HealthyFoodHabitsResultLevel1VC"
            ) as! HealthyFoodHabitsResultLevel1VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }
  
}
