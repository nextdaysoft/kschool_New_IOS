//
//  BodmasShowVC.swift
//  New
//
//  Created by Koshal Singh on 16/04/26.
//

import UIKit
import LanguageManager_iOS

class BodmasShowVC: BaseViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var bodmasLabel: UILabel!
    @IBOutlet weak var bodmasLblBGView: UIView!
    @IBOutlet weak var bodmasHeightConstraint: NSLayoutConstraint!

    
    @IBOutlet weak var questionExpressionLbl: UILabel!
    
    
    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreLblBGView: UIView!
    @IBOutlet weak var resultNu: UILabel!
    @IBOutlet weak var rightOrWrongImg: UIImageView!
    
    
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
    
    @IBOutlet weak var hideAnUnhideImg: UIImageView!
    @IBOutlet weak var hideAnUnhideBtn: UIButton!
    
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    
    
    @IBOutlet weak var nextAndSubmitBtn: UIButton!
    
    var isHiddenView = false
    
    var correctAnswer: Int = 0
    var userInput: String = ""
    var isAnswered = false
    var score = 0
    
    var levelNumber: Int = 1
    var totalQuestions = 10
    var currentQuestion = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        setupBodmasText()
        setupQuestion()
        
        scoreLbl.text = "\("Score".localiz()): \(score) / \(currentQuestion)"
        
        bodmasLabel.numberOfLines = 0
        bodmasLabel.adjustsFontSizeToFitWidth = true
        bodmasLabel.minimumScaleFactor = 0.5
        bodmasLabel.lineBreakMode = .byWordWrapping
        
        scoreLblBGView.layer.cornerRadius = 10
        
        btn1.layer.cornerRadius = 10
        btn2.layer.cornerRadius = 10
        btn3.layer.cornerRadius = 10
        btn4.layer.cornerRadius = 10
        btn5.layer.cornerRadius = 10
        btn6.layer.cornerRadius = 10
        btn7.layer.cornerRadius = 10
        btn8.layer.cornerRadius = 10
        btn9.layer.cornerRadius = 10
        btn0.layer.cornerRadius = 10
        btnX.layer.cornerRadius = 10
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateLabelHeight()
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextAndSubmitBtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        let keypadButtons = [
            btn1, btn2, btn3, btn4, btn5,
            btn6, btn7, btn8, btn9, btn0
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            scoreLblBGView.backgroundColor = .white

            nextAndSubmitBtn.backgroundColor = .white
            nextAndSubmitBtn.setTitleColor(.black, for: .normal)

            keypadButtons.forEach {
                $0?.backgroundColor = .white
                $0?.setTitleColor(.black, for: .normal)
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreLblBGView.backgroundColor = color

            nextAndSubmitBtn.backgroundColor = color
            nextAndSubmitBtn.setTitleColor(.white, for: .normal)

            keypadButtons.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
                $0?.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    func setupQuestion() {
        
        questionLbl.text = "\("Question".localiz()) \(currentQuestion)"
        levelLbl.text = "# \("Level".localiz()) \(levelNumber)"
        
          let num1 = Int.random(in: 1...9)

          let num2 = Int.random(in: 1...9)

          let num3 = Int.random(in: 1...9)

          questionExpressionLbl.adjustsFontSizeToFitWidth = true

          questionExpressionLbl.minimumScaleFactor = 0.5

          questionExpressionLbl.numberOfLines = 1
        
        switch levelNumber {

        case 1:

            questionExpressionLbl.text = "\(num1) + \(num2) - \(num3)"
            correctAnswer = num1 + num2 - num3

        case 2:

            let isMultiplyFirst = Bool.random()

            if isMultiplyFirst {

                let mul = num1 * num2

                let sign = mul > num3
                ? (Bool.random() ? "+" : "-")
                : "+"

                questionExpressionLbl.text =
                "\(num1) × \(num2) \(sign) \(num3)"

                correctAnswer = sign == "+"
                ? mul + num3
                : mul - num3

            } else {

                let mul = num2 * num3

                let sign = num1 > mul
                ? (Bool.random() ? "+" : "-")
                : "+"

                questionExpressionLbl.text =
                "\(num1) \(sign) \(num2) × \(num3)"

                correctAnswer = sign == "+"
                ? num1 + mul
                : num1 - mul
            }

        case 3:

            let isDivideFirst = Bool.random()

            if isDivideFirst {

                let divisibleNum = num2 * Int.random(in: 1...5)

                let div = divisibleNum / num2

                let sign = div > num3
                ? (Bool.random() ? "+" : "-")
                : "+"

                questionExpressionLbl.text =
                "\(divisibleNum) ÷ \(num2) \(sign) \(num3)"

                correctAnswer = sign == "+"
                ? div + num3
                : div - num3

            } else {

                let divisibleNum = num3 * Int.random(in: 1...5)

                let div = divisibleNum / num3

                let sign = num1 > div
                ? (Bool.random() ? "+" : "-")
                : "+"

                questionExpressionLbl.text =
                "\(num1) \(sign) \(divisibleNum) ÷ \(num3)"

                correctAnswer = sign == "+"
                ? num1 + div
                : num1 - div
            }

        case 4:

            let isMultiplyFirst = Bool.random()

            if isMultiplyFirst {

                let answer = Int.random(in: 1...10)

                let newNum3 = Int.random(in: 1...5)

                let mulValue = answer * newNum3

                let factors = [
                    (1, mulValue),
                    (2, mulValue / 2),
                    (3, mulValue / 3),
                    (4, mulValue / 4),
                    (5, mulValue / 5)
                ].filter { $0.0 * $0.1 == mulValue }

                let selected = factors.randomElement() ?? (1, mulValue)

                questionExpressionLbl.text =
                "\(selected.0) × \(selected.1) ÷ \(newNum3)"

                correctAnswer = answer

            } else {

                let divAnswer = Int.random(in: 1...10)

                let newNum2 = Int.random(in: 1...5)

                let newNum1 = divAnswer * newNum2

                let newNum3 = Int.random(in: 1...5)

                questionExpressionLbl.text =
                "\(newNum1) ÷ \(newNum2) × \(newNum3)"

                correctAnswer = divAnswer * newNum3
            }

        case 5:

            let isPlusFirst = Bool.random()

            if isPlusFirst {

                let bracketResult = num1 + num2

                if bracketResult > num3 {

                    questionExpressionLbl.text =
                    "(\(num1) + \(num2)) - \(num3)"

                    correctAnswer = bracketResult - num3

                } else {

                    questionExpressionLbl.text =
                    "(\(num1) + \(num2)) + \(num3)"

                    correctAnswer = bracketResult + num3
                }

            } else {

                if num1 > num2 {

                    questionExpressionLbl.text =
                    "(\(num1) - \(num2)) + \(num3)"

                    correctAnswer = (num1 - num2) + num3

                } else {

                    let bracketResult = num1 + num2

                    if bracketResult > num3 {

                        questionExpressionLbl.text =
                        "(\(num1) + \(num2)) - \(num3)"

                        correctAnswer = bracketResult - num3

                    } else {

                        questionExpressionLbl.text =
                        "(\(num1) + \(num2)) + \(num3)"

                        correctAnswer = bracketResult + num3
                    }
                }
            }

        case 6:

            let bracketResult = num1 * num2

            let sign = bracketResult > num3
            ? (Bool.random() ? "+" : "-")
            : "+"

            questionExpressionLbl.text =
            "(\(num1) × \(num2)) \(sign) \(num3)"

            correctAnswer = sign == "+"
            ? bracketResult + num3
            : bracketResult - num3

        case 7:

            let randomType = Int.random(in: 0...3)

            switch randomType {

            case 0:

                let newNum2 = Int.random(in: 1...5)
                let newNum3 = Int.random(in: 1...5)

                let bracketResult = newNum2 * newNum3

                let answer = Int.random(in: 1...10)

                let newNum1 = bracketResult * answer

                questionExpressionLbl.text =
                "\(newNum1) ÷ (\(newNum2) × \(newNum3))"

                correctAnswer = answer

            case 1:

                let newNum1 = Int.random(in: 1...9)
                let newNum2 = Int.random(in: 1...9)

                let mul = newNum1 * newNum2

                let divisors = (1...9).filter { mul % $0 == 0 }

                let newNum3 = divisors.randomElement()!

                questionExpressionLbl.text =
                "(\(newNum1) × \(newNum2)) ÷ \(newNum3)"

                correctAnswer = mul / newNum3

            case 2:

                let divisor = Int.random(in: 1...5)
                let quotient = Int.random(in: 1...5)

                let newNum2 = divisor * quotient

                let newNum1 = Int.random(in: 1...9)

                questionExpressionLbl.text =
                "\(newNum1) × (\(newNum2) ÷ \(divisor))"

                correctAnswer = newNum1 * quotient

            default:

                let divisor = Int.random(in: 1...5)
                let quotient = Int.random(in: 1...5)

                let newNum1 = divisor * quotient

                let newNum3 = Int.random(in: 1...9)

                questionExpressionLbl.text =
                "(\(newNum1) ÷ \(divisor)) × \(newNum3)"

                correctAnswer = quotient * newNum3
            }

        case 8:

            let isMultiplyFirst = Bool.random()

            let divisor = Int.random(in: 1...5)

            let divisibleNum = divisor * Int.random(in: 1...5)

            if isMultiplyFirst {

                let mul = num1 * num2
                let div = divisibleNum / divisor

                let sign = mul > div
                ? (Bool.random() ? "+" : "-")
                : "+"

                questionExpressionLbl.text =
                "\(num1) × \(num2) \(sign) \(divisibleNum) ÷ \(divisor)"

                correctAnswer = sign == "+"
                ? mul + div
                : mul - div

            } else {

                let div = divisibleNum / divisor
                let mul = num2 * div

                let sign = num1 > mul
                ? (Bool.random() ? "+" : "-")
                : "+"

                questionExpressionLbl.text =
                "\(num1) \(sign) \(num2) × \(divisibleNum) ÷ \(divisor)"

                correctAnswer = sign == "+"
                ? num1 + mul
                : num1 - mul
            }

        case 9:

            let base = Int.random(in: 2...9)

            let power = Int.random(in: 2...3)

            questionExpressionLbl.text =
            "\(base)^\(power)"

            correctAnswer =
            Int(pow(Double(base), Double(power)))
            
        case 10:

            let pattern = Int.random(in: 1...4)

            switch pattern {

            case 1:

                let a = Int.random(in: 1...9)

                let divisor = Int.random(in: 1...5)
                let b = divisor * Int.random(in: 1...3)

                let c = Int.random(in: 1...9)

                questionExpressionLbl.text = "\(a) × (\(b) ÷ \(divisor)) + \(c)"

                correctAnswer = a * (b / divisor) + c


            case 2:

                let a = Int.random(in: 1...9)
                let b = Int.random(in: 1...9)

                let divisor = Int.random(in: 1...5)
                let c = divisor * Int.random(in: 1...3)

                questionExpressionLbl.text = "(\(a) × \(b)) + \(c) ÷ \(divisor)"

                correctAnswer = (a * b) + (c / divisor)


            case 3:

                let divisor = Int.random(in: 1...5)

                let answer = Int.random(in: 1...5)

                let a = divisor * answer

                let b = Int.random(in: 2...9)
                let c = b - 1

                questionExpressionLbl.text = "\(a) ÷ \(divisor) × (\(b) - \(c))"

                correctAnswer = (a / divisor) * (b - c)


            default:

                let a = Int.random(in: 1...5)

                let b = Int.random(in: 1...5)

                let c = Int.random(in: 2...9)
                let d = c - 1

                questionExpressionLbl.text = "\(a) × \(b) ÷ (\(c) - \(d))"

                correctAnswer = (a * b) / (c - d)
            }
            
            
        default:
            break
        }
        
        // Reset UI
        resultNu.text = ""
        userInput = ""
        isAnswered = false
        rightOrWrongImg.image = nil
    }
    
    func updateLabelHeight() {
        let maxSize = CGSize(width: bodmasLabel.frame.width, height: CGFloat.greatestFiniteMagnitude)
        
        let neededSize = bodmasLabel.sizeThatFits(maxSize)
        
        // Label height update
        bodmasLabel.frame.size.height = neededSize.height
        
        // BG View height update
        var bgFrame = bodmasLblBGView.frame
        bgFrame.size.height = neededSize.height + 20
        bodmasLblBGView.frame = bgFrame
    }
    
    func setupBodmasText() {

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4

        var fontSize: CGFloat = 18

        while fontSize > 8 {

            let normalFont = UIFont.systemFont(ofSize: fontSize - 2)

            let attributedText = NSMutableAttributedString()

            attributedText.append(NSAttributedString(
                string: "📘 \("What is BODMAS?".localiz())\n\n",
                attributes: [.font: normalFont]
            ))

            let bodmasText = """
    \("B – Brackets () {} []".localiz())
    \("O – Orders (powers like ², ³, √)".localiz())
    \("D – Division (÷)".localiz())
    \("M – Multiplication (×)".localiz())
    \("A – Addition (+)".localiz())
    \("S – Subtraction (-)".localiz())

    """

            attributedText.append(NSAttributedString(
                string: bodmasText,
                attributes: [.font: normalFont]
            ))

            attributedText.append(NSAttributedString(
                string: "📊 \("Order to solve sums:".localiz())\n\n",
                attributes: [.font: normalFont]
            ))

            let stepsText = """
    \("1. Solve Brackets first".localiz())
    \("2. Then solve Orders (powers)".localiz())
    \("3. Then Division and Multiplication (left to right)".localiz())
    \("4. Finally Addition and Subtraction (left to right)".localiz())

    """

            attributedText.append(NSAttributedString(
                string: stepsText,
                attributes: [.font: normalFont]
            ))

            attributedText.append(NSAttributedString(
                string: "⚠️ \("Important to remember:".localiz())\n\n",
                attributes: [.font: normalFont]
            ))

            let importantText = """
    \("• Division and Multiplication have the same priority".localiz())
    \("• Addition and Subtraction have the same priority".localiz())
    \("• Always solve them from LEFT to RIGHT".localiz())
    """

            attributedText.append(NSAttributedString(
                string: importantText,
                attributes: [.font: normalFont]
            ))

            attributedText.addAttribute(
                .paragraphStyle,
                value: paragraphStyle,
                range: NSRange(location: 0, length: attributedText.length)
            )

            let maxSize = CGSize(
                width: bodmasLabel.frame.width,
                height: CGFloat.greatestFiniteMagnitude
            )

            let rect = attributedText.boundingRect(
                with: maxSize,
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                context: nil
            )

            if rect.height <= bodmasLblBGView.frame.height {
                bodmasLabel.attributedText = attributedText
                return
            }

            fontSize -= 1
        }
    }
    
    func stepWithImage(imageName: String, text: String, font: UIFont) -> NSAttributedString {
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)
        
        // image size adjust
        attachment.bounds = CGRect(x: 0, y: -3, width: 20, height: 20)
        
        let imageString = NSAttributedString(attachment: attachment)
        
        let textString = NSAttributedString(
            string: " " + text + "\n",
            attributes: [.font: font]
        )
        
        let fullString = NSMutableAttributedString()
        fullString.append(imageString)
        fullString.append(textString)
        
        return fullString
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func goToResult() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "BodmasResultVC") as! BodmasResultVC
        
        vc.finalScore = score
        vc.totalScore = totalQuestions
        vc.levelNumber = levelNumber
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func handleNumberInput(_ value: String) {
        
        guard !isAnswered else { return }
        
        if userInput.count >= 3 { return }
        
        userInput.append(value)
        
        // Always reset to normal while typing
        resultNu.attributedText = nil
        resultNu.text = userInput
        resultNu.textColor = .black
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {
    }

    @IBAction func btn1(_ sender: UIButton) { handleNumberInput("1") }
    @IBAction func btn2(_ sender: UIButton) { handleNumberInput("2") }
    @IBAction func btn3(_ sender: UIButton) { handleNumberInput("3") }
    @IBAction func btn4(_ sender: UIButton) { handleNumberInput("4") }
    @IBAction func btn5(_ sender: UIButton) { handleNumberInput("5") }
    @IBAction func btn6(_ sender: UIButton) { handleNumberInput("6") }
    @IBAction func btn7(_ sender: UIButton) { handleNumberInput("7") }
    @IBAction func btn8(_ sender: UIButton) { handleNumberInput("8") }
    @IBAction func btn9(_ sender: UIButton) { handleNumberInput("9") }
    @IBAction func btn0(_ sender: UIButton) { handleNumberInput("0") }
    
    @IBAction func btnX(_ sender: UIButton) {
        guard !userInput.isEmpty else { return }
        userInput.removeLast()
        resultNu.text = userInput
    }
    
    
    @IBAction func nextAndSubimtbtn(_ sender: UIButton) {
        
        if !isAnswered {
            
            guard let entered = Int(userInput) else { return }
            isAnswered = true
            
            if entered == correctAnswer {
                
                // ✅ CORRECT
                score += 1
                
                resultNu.attributedText = nil
                resultNu.text = "\(correctAnswer)"
                resultNu.textColor = .systemGreen
                
                rightOrWrongImg.image = UIImage(named: "check mark")
                
            } else {
                
                // ❌ WRONG (same as AdditionSubstraction)
                
                let wrongAttr = NSAttributedString(
                    string: "\(entered)",
                    attributes: [
                        .foregroundColor: UIColor.systemRed,
                        .strikethroughStyle: NSUnderlineStyle.single.rawValue
                    ]
                )
                
                let correctAttr = NSAttributedString(
                    string: "  \(correctAnswer)",
                    attributes: [
                        .foregroundColor: UIColor.systemGreen
                    ]
                )
                
                let attr = NSMutableAttributedString()
                attr.append(wrongAttr)
                attr.append(correctAttr)
                
                resultNu.attributedText = attr
                
                rightOrWrongImg.image = UIImage(named: "close")
            }
            
            scoreLbl.text = "\("Score".localiz()): \(score) / \(currentQuestion)"
            
        } else {
            
            // NEXT QUESTION
            if currentQuestion < totalQuestions {
                currentQuestion += 1
                setupQuestion()
            } else {
                goToResult()
            }
        }
    }
    
    
    
    @IBAction func hideAnUnhideTapBtn(_ sender: UIButton) {
        
        isHiddenView.toggle()
        
        if isHiddenView {
            bodmasHeightConstraint.constant = 0
            bodmasLblBGView.isHidden = true
            hideAnUnhideImg.image = UIImage(named: "show")
        } else {
            bodmasHeightConstraint.constant = 400
            bodmasLblBGView.isHidden = false
            hideAnUnhideImg.image = UIImage(named: "hide")
        }
        
        UIView.animate(withDuration: 0) {
            self.view.layoutIfNeeded()
        }
    }
}
