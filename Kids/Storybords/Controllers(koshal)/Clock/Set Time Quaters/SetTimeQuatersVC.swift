//
//  SetTimeQuatersVC.swift
//  Kids
//
//  Created by Koshal Singh on 07/02/26.
//

import UIKit
import LanguageManager_iOS

class SetTimeQuatersVC: BaseViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    @IBOutlet weak var clockBGView: UIView!

    @IBOutlet weak var timeLabelBGView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var clockView: ClockView!

    var questions: [(hour: Int, minute: Int)] = []
    var currentQuestionIndex = 0
    var score = 0
    var results: [ClockResult] = []
    
    var isWaitingForSubmit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        applyTheme()
        setupClock()
       
        generateQuestions()
        loadQuestion()
        
        scoreLabelBGView.layer.cornerRadius = 10
        timeLabelBGView.layer.cornerRadius = 10
        
        nextBtn.setTitle("Submit".localiz(), for: .normal)
        isWaitingForSubmit = true
        
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex + 1)"
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

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            scoreLabelBGView.backgroundColor = color
        }
    }
    
    func setupClock() {
        clockView = ClockView(frame: clockBGView.bounds)
        clockView.translatesAutoresizingMaskIntoConstraints = false
        clockBGView.addSubview(clockView)

        NSLayoutConstraint.activate([
            clockView.centerXAnchor.constraint(equalTo: clockBGView.centerXAnchor),
            clockView.centerYAnchor.constraint(equalTo: clockBGView.centerYAnchor),
            clockView.widthAnchor.constraint(equalTo: clockBGView.widthAnchor, multiplier: 0.8),
            clockView.heightAnchor.constraint(equalTo: clockBGView.heightAnchor, multiplier: 0.8)
        ])
    }
    
    func generateQuestions() {
        questions = [
            (2, 30),
            (11, 15),
            (8, 15),
            (10, 45),
            (12, 30),
            (10, 15),
            (1, 15),
            (12, 45),
            (2, 30),
            (5, 15)
        ]
    }
    
    func loadQuestion() {
        guard currentQuestionIndex < questions.count else { return }

        let q = questions[currentQuestionIndex]

        questionLabel.text = "\("Question".localiz()) \(currentQuestionIndex + 1)"
        
        timeLabel.text = "\(q.hour):\(String(format: "%02d", q.minute))"
        rightOrWrongImgView.image = nil

        nextBtn.setTitle("Submit".localiz(), for: .normal)
        isWaitingForSubmit = true

        // Enable interaction
        clockView.setInteractionEnabled(true)

        // Set random starting position
        clockView.setRandomTime()
    }
    
    func showResultScreen() {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "SetTimeQuatersResultVC"
        ) as? SetTimeQuatersResultVC {

            vc.finalScore = score
            vc.clockResults = results

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {

        // Submit state
        if isWaitingForSubmit {

            let q = questions[currentQuestionIndex]
            let user = clockView.getCurrentTime()

            let correct = (user.hour == q.hour && user.minute == q.minute)

            if correct {
                rightOrWrongImgView.image = UIImage(named: "check mark")
                score += 1
            } else {
                rightOrWrongImgView.image = UIImage(named: "close")
            }

            scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex + 1)"

            let result = ClockResult(
                correctTime: "\(q.hour):\(q.minute)",
                userTime: "\(user.hour):\(user.minute)",
                isCorrect: correct
            )
            results.append(result)

            currentQuestionIndex += 1
            isWaitingForSubmit = false
            nextBtn.setTitle("Next".localiz(), for: .normal)

            // Disable interaction after submit
            clockView.setInteractionEnabled(false)

            if currentQuestionIndex >= questions.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.showResultScreen()
                }
            }

            return
        }

        // Next state → load next question
        loadQuestion()
    }

}
