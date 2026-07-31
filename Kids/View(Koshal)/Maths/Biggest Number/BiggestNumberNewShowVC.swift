//
//  BiggestNumberNewShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 15/04/26.
//

import LanguageManager_iOS
struct BiggestNumberQuestion {
    let options: [Int]
    let correctAnswer: Int
}
struct NumberResult {
    let numbers: [Int]
    let selectedAnswer: Int
    let correctAnswer: Int
    let isCorrect: Bool
}

import UIKit

class BiggestNumberNewShowVC: BaseViewController {

    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var scoreBGVIew: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionIndexLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!

    @IBOutlet weak var titelLbl: UILabel!
    
    @IBOutlet weak var texLbl: UILabel!
    
    @IBOutlet weak var LevelLbl: UILabel!
    
    var isBiggestMode: Bool = true
    
    var levelNumber: Int = 1
    
    var currentQuestionIndex = 0
    var score = 0
 
    
    var isAudioCompleted = false
    var hasAnswered = false
    
    var questions: [BiggestNumberQuestion] = []
    var correctAnswer: Int?
    
    var results: [NumberResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        setupQuestion()
        
        nextBtn.isHidden = true
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))

        view1.addGestureRecognizer(tap1)
        view2.addGestureRecognizer(tap2)
        view3.addGestureRecognizer(tap3)
        view4.addGestureRecognizer(tap4)

        view1.tag = 0
        view2.tag = 1
        view3.tag = 2
        view4.tag = 3
        
        [label1, label2, label3, label4].forEach {
            $0?.textAlignment = .center
            $0?.font = UIFont.systemFont(ofSize: 17)
        }
       
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
        scoreBGVIew.layer.cornerRadius = 10
        
        if isBiggestMode {
            titelLbl.text = "Biggest Number".localiz()
            texLbl.text = "Select the Biggest Number".localiz()
        } else {
            titelLbl.text = "Smallest Number".localiz()
            texLbl.text = "Select the Smallest Number".localiz()
        }

        LevelLbl.text = "# \("Level".localiz()) \(levelNumber)"
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

            scoreBGVIew.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreBGVIew.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)
        }
    }
    
    func setupQuestion() {

        if currentQuestionIndex >= questions.count {
            goToResultScreen()
            return
        }

        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil
        
        [view1, view2, view3, view4].forEach {
            $0?.backgroundColor = .white
            $0?.isUserInteractionEnabled = true
        }

        let currentQuestion = questions[currentQuestionIndex]

        
        questionIndexLabel.text = "\("Question".localiz()) \(currentQuestionIndex)"
        correctAnswer = currentQuestion.correctAnswer

        let shuffledOptions = currentQuestion.options.shuffled()

        label1.text = "\(shuffledOptions[0])"
        label2.text = "\(shuffledOptions[1])"
        label3.text = "\(shuffledOptions[2])"
        label4.text = "\(shuffledOptions[3])"

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex)"
    }
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let index = sender.view?.tag else { return }

        let selectedText = [label1.text, label2.text, label3.text, label4.text][index]
        let selectedAnswer = Int(selectedText ?? "")

        [view1, view2, view3, view4].forEach {
            $0?.isUserInteractionEnabled = false
        }

        let currentQuestion = questions[currentQuestionIndex]

        let isCorrect = selectedAnswer == correctAnswer

        // ✅ SAVE RESULT
        let result = NumberResult(
            numbers: currentQuestion.options,
            selectedAnswer: selectedAnswer ?? 0,
            correctAnswer: correctAnswer ?? 0,
            isCorrect: isCorrect
        )
        results.append(result)

        if isCorrect {

            sender.view?.backgroundColor = .systemGreen
            rightOrWrongImgView.image = UIImage(named: "check mark")
            score += 1

        } else {

            sender.view?.backgroundColor = .systemRed
            rightOrWrongImgView.image = UIImage(named: "close")

            let labels = [label1, label2, label3, label4]
            let views = [view1, view2, view3, view4]

            for (i, label) in labels.enumerated() {
                if Int(label?.text ?? "") == correctAnswer {
                    views[i]?.backgroundColor = .systemGreen
                }
            }
        }

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex)"
    }
    
    
    func goToResultScreen() {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "BiggestNumberNewResultVC"
        ) as? BiggestNumberNewResultVC {

            resultVC.levelNumber = self.levelNumber
            resultVC.finalScore = score
            resultVC.totalScore = questions.count
            resultVC.isBiggestMode = self.isBiggestMode
            resultVC.results = self.results   // ✅ ADD THIS

            navigationController?.pushViewController(resultVC, animated: false)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            setupQuestion()
        } else {
            goToResultScreen()
        }
    }

}

