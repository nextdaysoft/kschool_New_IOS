//
//  WriteTimeHoursVC.swift
//  Kids
//
//  Created by Koshal Singh on 07/02/26.
//


import UIKit
import LanguageManager_iOS

class WriteTimeHoursVC: BaseViewController {

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
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btnColon: UIButton!
    @IBOutlet weak var btnCut: UIButton!
    
    @IBOutlet weak var btn1BGView: UIView!
    @IBOutlet weak var btn2BGView: UIView!
    @IBOutlet weak var btn3BGView: UIView!
    @IBOutlet weak var btn4BGView: UIView!
    @IBOutlet weak var btn5BGView: UIView!
    @IBOutlet weak var btn6BGView: UIView!
    @IBOutlet weak var btn7BGView: UIView!
    @IBOutlet weak var btn8BGView: UIView!
    @IBOutlet weak var btn9BGView: UIView!
    @IBOutlet weak var btn0BGView: UIView!
    @IBOutlet weak var btnColonBGView: UIView!
    @IBOutlet weak var btnCutBGView: UIView!
    
    
    var clockView: WriteTimeHoursClockVC!

    var questions: [(hour: Int, minute: Int)] = []
    var currentQuestionIndex = 0
    var score = 0
    var results: [WriteTimeHoursClockResult] = []
    
    var isWaitingForSubmit = false
    var userInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        applyTheme()
        setupClock()
       
        generateQuestions()
        loadQuestion()
        
        scoreLabelBGView.layer.cornerRadius = 10
        timeLabelBGView.layer.cornerRadius = 10
        
        
        btn1BGView.layer.cornerRadius = 5
        btn2BGView.layer.cornerRadius = 5
        btn3BGView.layer.cornerRadius = 5
        btn4BGView.layer.cornerRadius = 5
        btn5BGView.layer.cornerRadius = 5
        btn6BGView.layer.cornerRadius = 5
        btn7BGView.layer.cornerRadius = 5
        btn8BGView.layer.cornerRadius = 5
        btn9BGView.layer.cornerRadius = 5
        btn0BGView.layer.cornerRadius = 5
        btnColonBGView.layer.cornerRadius = 5
        btnCutBGView.layer.cornerRadius = 5
        
        nextBtn.setTitle("Submit".localiz(), for: .normal)
        isWaitingForSubmit = true
        
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex + 1)"
    }
    
    func updateTimeLabel() {
        timeLabel.text = userInput
        validateInput()
    }

    func appendInput(_ value: String) {

        // Submit ke baad input allow nahi hoga
        guard isWaitingForSubmit else { return }

        // Max 5 chars: H:MM
        if userInput.count >= 5 { return }

        userInput.append(value)
        updateTimeLabel()
    }

    func validateInput() {
        // Valid pattern: H:MM or HH:MM
        let pattern = #"^\d{1,2}:\d{1,2}$"#
        let isValid = userInput.range(of: pattern, options: .regularExpression) != nil
        
        nextBtn.isHidden = !isValid
    }

    func clearInput() {
        userInput = ""
        updateTimeLabel()
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

            let whiteViews = [
                btn1BGView,
                btn2BGView,
                btn3BGView,
                btn4BGView,
                btn5BGView,
                btn6BGView,
                btn7BGView,
                btn8BGView,
                btn9BGView,
                btn0BGView,
                btnColonBGView
            ]

            whiteViews.forEach { $0?.backgroundColor = .white }

            // Delete button हमेशा Red रहेगा
            btnCutBGView.backgroundColor = .systemRed

            let buttons = [
                btn1, btn2, btn3, btn4, btn5,
                btn6, btn7, btn8, btn9, btn0,
                btnColon
            ]

            buttons.forEach {
                $0?.setTitleColor(.black, for: .normal)
            }

            btnCut.setTitleColor(.white, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            scoreLabelBGView.backgroundColor = color

            let randomViews = [
                btn1BGView,
                btn2BGView,
                btn3BGView,
                btn4BGView,
                btn5BGView,
                btn6BGView,
                btn7BGView,
                btn8BGView,
                btn9BGView,
                btn0BGView,
                btnColonBGView
            ]

            randomViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }

            // Delete button हमेशा Red रहेगा
            btnCutBGView.backgroundColor = .systemRed

            let buttons = [
                btn1, btn2, btn3, btn4, btn5,
                btn6, btn7, btn8, btn9, btn0,
                btnColon
            ]

            buttons.forEach {
                $0?.setTitleColor(.white, for: .normal)
            }

            btnCut.setTitleColor(.white, for: .normal)
        }
    }
    
    func setupClock() {
        clockView = WriteTimeHoursClockVC(frame: clockBGView.bounds)
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
            (5, 0),
            (7, 0),
            (5, 0),
            (7, 0),
            (4, 0),
            (6, 0),
            (5, 0),
            (4, 0),
            (7, 0),
            (10, 0)
        ]
    }
    
    func loadQuestion() {
        guard currentQuestionIndex < questions.count else { return }

        let q = questions[currentQuestionIndex]

        questionLabel.text = "\("Question".localiz()) \(currentQuestionIndex + 1)"
        
        timeLabel.text = ""
        rightOrWrongImgView.image = nil

        nextBtn.setTitle("Submit".localiz(), for: .normal)
        isWaitingForSubmit = true

        // Disable interaction (user cannot move hands)
        clockView.setInteractionEnabled(false)

        // Set exact question time
        clockView.setTime(hour: q.hour, minute: q.minute)

        clearInput()
        nextBtn.isHidden = true
    }
    
    func showResultScreen() {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "WriteTimeHoursResultVC"
        ) as? WriteTimeHoursResultVC {

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

            // ✅ Correct time
            let correctTime = "\(q.hour):\(String(format: "%02d", q.minute))"

            // ✅ Normalize user input
            let parts = userInput.split(separator: ":")

            var enteredHour = 0
            var enteredMinute = 0

            if parts.count == 2 {
                enteredHour = Int(parts[0]) ?? -1
                enteredMinute = Int(parts[1]) ?? -1
            }

            let correct = (
                enteredHour == q.hour &&
                enteredMinute == q.minute
            )

            if correct {
                rightOrWrongImgView.image = UIImage(named: "check mark")
                score += 1
            } else {
                rightOrWrongImgView.image = UIImage(named: "close")
            }

            scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex + 1)"

            let result = WriteTimeHoursClockResult(
                correctTime: correctTime,
                userTime: userInput,
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

    @IBAction func btnTap1(_ sender: UIButton) {
        appendInput("1")
    }
    @IBAction func btnTap2(_ sender: UIButton) {
        appendInput("2")
    }
    @IBAction func btnTap3(_ sender: UIButton) {
        appendInput("3")
    }
    @IBAction func btnTap4(_ sender: UIButton) {
        appendInput("4")
    }
    @IBAction func btnTap5(_ sender: UIButton) {
        appendInput("5")
    }
    @IBAction func btnTap6(_ sender: UIButton) {
        appendInput("6")
    }
    @IBAction func btnTap7(_ sender: UIButton) {
        appendInput("7")
    }
    @IBAction func btnTap8(_ sender: UIButton) {
        appendInput("8")
    }
    @IBAction func btnTap9(_ sender: UIButton) {
        appendInput("9")
    }
    @IBAction func btnTap0(_ sender: UIButton) {
        appendInput("0")
    }
    @IBAction func btnTapColon(_ sender: UIButton) {

        guard isWaitingForSubmit else { return }

        if !userInput.contains(":") &&
            userInput.count > 0 &&
            userInput.count <= 2 {

            appendInput(":")
        }
    }
    
    @IBAction func btnTapCut(_ sender: UIButton) {

        guard isWaitingForSubmit else { return }
        guard !userInput.isEmpty else { return }

        userInput.removeLast()
        updateTimeLabel()
    }
    
    
}
