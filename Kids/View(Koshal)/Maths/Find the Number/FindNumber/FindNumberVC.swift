//
//  FindNumberVC.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 16/01/26.
//

import UIKit
import LanguageManager_iOS

class FindNumberVC: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var abacusView: AbacusView!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var lblLevel: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
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
    @IBOutlet weak var btnX: UIButton!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var enterNumberLalebl: UILabel!
    @IBOutlet weak var enterNumberLaleblBGView: UIView!
    @IBOutlet weak var allRightOrWrongImageView: UIImageView!
    
    var currentAnswer: Int = 0
    var userAnswer: String = ""

    var currentQuestion: Int = 1
    var totalQuestions: Int = 10

    var score: Int = 0
    
    var isAnswerSubmitted: Bool = false
    
    var leftAnswer: Int = 0
    var rightAnswer: Int = 0
    
    private var isFirstLayout = true
    
    var levelNumber: Int = 1
    var thirdAnswer: Int = 0
    
    var displayLevel: Int = 1
    
    var actualLevel: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        
       
        lblLevel.text = "# \("Level".localiz()) \(displayLevel)"
        lblQuestionNumber.text = "\("Question".localiz()) \(currentQuestion)"
        scorelbl.text = "Score: 0 / 0"
        
        if levelNumber == 1 {
            abacusView.rodCount = 1
        } else if levelNumber == 2 {
            abacusView.rodCount = 2
        } else if levelNumber >= 3 {
            abacusView.rodCount = 3   // 👈 LEVEL 6 case
        }
        
        nextBtn.isHidden = true
        allRightOrWrongImageView.isHidden = true
        nextBtn.setTitle("Submit", for: .normal)
        
        btn1.layer.cornerRadius = 5
        btn1.backgroundColor = ColorManager.randomColor()
        btn1.layer.borderColor = UIColor.black.cgColor
        
        btn2.layer.cornerRadius = 5
        btn3.layer.cornerRadius = 5
        btn4.layer.cornerRadius = 5
        btn5.layer.cornerRadius = 5
        btn6.layer.cornerRadius = 5
        btn7.layer.cornerRadius = 5
        btn8.layer.cornerRadius = 5
        btn9.layer.cornerRadius = 5
        btn0.layer.cornerRadius = 5
        
        btnX.layer.cornerRadius = 5
        btnX.backgroundColor = .systemRed
        btnX.setTitleColor(.white, for: .normal)
        
        enterNumberLaleblBGView.layer.cornerRadius = 5
        scoreView.layer.cornerRadius = 10
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isFirstLayout {
            isFirstLayout = false
            
            DispatchQueue.main.async { [weak self] in
                self?.generateRandomBeads()
            }
        }
    }
    
    // MARK: Functions
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        let keypadButtons = [
            btn1, btn2, btn3, btn4, btn5,
            btn6, btn7, btn8, btn9, btn0
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            scoreView.backgroundColor = .white
            enterNumberLaleblBGView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

            keypadButtons.forEach {
                $0?.backgroundColor = .white
                $0?.setTitleColor(.black, for: .normal)
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreView.backgroundColor = color
            enterNumberLaleblBGView.backgroundColor = .white

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            keypadButtons.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
                $0?.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    func generateRandomBeads() {

        // RESET ALL BEADS POSITION
        for case let bead as BeadView in abacusView.subviews {
            bead.resetPosition()
        }

        if levelNumber == 1 {

            leftAnswer = Int.random(in: 1...9)
            showBeads(for: leftAnswer)
            return
        }

        if levelNumber == 2 {

            repeat {
                leftAnswer = Int.random(in: 1...9)
                rightAnswer = Int.random(in: 1...9)
            } while leftAnswer == rightAnswer

        } else {

            leftAnswer = Int.random(in: 1...9)
            rightAnswer = Int.random(in: 1...9)
            thirdAnswer = Int.random(in: 1...9)
        }

        let rodLimit = (levelNumber >= 3) ? 3 : 2

        for rodIndex in 0..<rodLimit {

            let randomCount: Int

            if rodIndex == 0 {
                randomCount = leftAnswer
            } else if rodIndex == 1 {
                randomCount = rightAnswer
            } else {
                randomCount = thirdAnswer
            }

            var beadsInRod: [BeadView] = []

            let rodX = abacusView.bounds.width / CGFloat(rodLimit + 1) * CGFloat(rodIndex + 1)

            for case let bead as BeadView in abacusView.subviews {
                if abs(bead.center.x - rodX) < 40 {
                    beadsInRod.append(bead)
                }
            }

            beadsInRod.sort { $0.center.y > $1.center.y }

            for (index, bead) in beadsInRod.enumerated() {
                bead.isHidden = index >= randomCount
            }
        }
    }
    
    func appendNumber(_ number: String) {

        // ✅ Submit ke baad keypad disable
        guard !isAnswerSubmitted else { return }

        let maxLength: Int

        if levelNumber == 1 {
            maxLength = 1
        } else if levelNumber == 2 {
            maxLength = 2
        } else {
            maxLength = 3
        }

        if userAnswer.count >= maxLength { return }

        userAnswer += number

        enterNumberLalebl.attributedText = nil
        enterNumberLalebl.text = userAnswer
        enterNumberLalebl.textColor = .black

        nextBtn.isHidden = false
    }
    
    func showBeads(for number: Int) {

        leftAnswer = number   // 👈 direct set

        var beadsInRod: [BeadView] = []

        let rodX = abacusView.bounds.width / 2   // single rod center

        for case let bead as BeadView in abacusView.subviews {
            if abs(bead.center.x - rodX) < 40 {
                beadsInRod.append(bead)
            }
        }

        beadsInRod.sort { $0.center.y > $1.center.y }

        for (index, bead) in beadsInRod.enumerated() {
            bead.isHidden = index >= number
        }
    }
    
    // MARK: Actions
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {

        if userAnswer.isEmpty { return }

        if !isAnswerSubmitted {

            let correctText: String

            if levelNumber == 1 {
                correctText = "\(leftAnswer)"
            } else if levelNumber >= 3 {
                correctText = "\(leftAnswer)\(rightAnswer)\(thirdAnswer)"
            } else {
                correctText = "\(leftAnswer)\(rightAnswer)"
            }

            let userValue = Int(userAnswer) ?? -1
            let correctValue = Int(correctText) ?? -2

            let isFullyCorrect = (userValue == correctValue)

            let fullText = "\(userAnswer)   \(correctText)"
            let attributed = NSMutableAttributedString(string: fullText)

            let font = enterNumberLalebl.font ?? UIFont.systemFont(ofSize: 20)
            attributed.addAttribute(.font, value: font, range: NSRange(location: 0, length: fullText.count))

            for index in 0..<userAnswer.count {

                attributed.addAttribute(.foregroundColor,
                                        value: UIColor.systemRed,
                                        range: NSRange(location: index, length: 1))

                attributed.addAttribute(.strikethroughStyle,
                                        value: NSUnderlineStyle.single.rawValue,
                                        range: NSRange(location: index, length: 1))

                attributed.addAttribute(.strikethroughColor,
                                        value: UIColor.systemRed,
                                        range: NSRange(location: index, length: 1))
            }

            let correctRange = NSRange(location: userAnswer.count + 3, length: correctText.count)
            attributed.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: correctRange)

            if isFullyCorrect {

                enterNumberLalebl.text = correctText
                enterNumberLalebl.textColor = .systemGreen
                enterNumberLalebl.textAlignment = .center

                score += 1
                allRightOrWrongImageView.image = UIImage(named: "check mark")

            } else {

                enterNumberLalebl.attributedText = attributed
                enterNumberLalebl.textAlignment = .center

                allRightOrWrongImageView.image = UIImage(named: "close")
            }

            allRightOrWrongImageView.isHidden = false
            scorelbl.text = "Score: \(score) / \(currentQuestion)"

            nextBtn.setTitle("Next", for: .normal)
            isAnswerSubmitted = true

        } else {

            currentQuestion += 1

            if currentQuestion > totalQuestions {
                goToResult()
                return
            }

            lblQuestionNumber.text = "\("Question".localiz()) \(currentQuestion)"

            userAnswer = ""
            enterNumberLalebl.text = ""
            allRightOrWrongImageView.isHidden = true
            nextBtn.isHidden = true

            nextBtn.setTitle("Submit", for: .normal)
            isAnswerSubmitted = false

            generateRandomBeads()
        }
    }
    
    @IBAction func nextTap1(_ sender: UIButton) { appendNumber("1") }
    @IBAction func nextTap2(_ sender: UIButton) { appendNumber("2") }
    @IBAction func nextTap3(_ sender: UIButton) { appendNumber("3") }
    @IBAction func nextTap4(_ sender: UIButton) { appendNumber("4") }
    @IBAction func nextTap5(_ sender: UIButton) { appendNumber("5") }
    @IBAction func nextTap6(_ sender: UIButton) { appendNumber("6") }
    @IBAction func nextTap7(_ sender: UIButton) { appendNumber("7") }
    @IBAction func nextTap8(_ sender: UIButton) { appendNumber("8") }
    @IBAction func nextTap9(_ sender: UIButton) { appendNumber("9") }
    @IBAction func nextTap0(_ sender: UIButton) { appendNumber("0") }
    
    @IBAction func nextTapX(_ sender: UIButton) {

        // ✅ Submit ke baad delete bhi nahi chalega
        guard !isAnswerSubmitted else { return }

        if !userAnswer.isEmpty {
            userAnswer.removeLast()
        }

        enterNumberLalebl.attributedText = nil
        enterNumberLalebl.text = userAnswer
        enterNumberLalebl.textColor = .black
        nextBtn.isHidden = userAnswer.isEmpty
    }
    
    func goToResult() {

        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FindTheNumberResultVC"
        ) as? FindTheNumberResultVC {

            vc.finalScore = score
            vc.totalRounds = totalQuestions

            // ❌ old
            // vc.levelNumber = displayLevel

            // ✅ actual save level
            vc.levelNumber = actualLevel

            navigationController?.pushViewController(
                vc,
                animated: true
            )
        }
    }
    
}
