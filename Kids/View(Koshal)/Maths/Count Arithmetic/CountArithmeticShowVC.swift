//
//  CountArithmeticShowVC.swift
//  New
//
//  Created by Koshal Singh on 18/04/26.
//

import UIKit
import LanguageManager_iOS

class CountArithmeticShowVC: BaseViewController {

    @IBOutlet weak var pdfBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!

    @IBOutlet weak var firtLblBGView: UIView!
    @IBOutlet weak var secondLblBGView: UIView!
    @IBOutlet weak var totalLblBGView: UIView!
    
    
    @IBOutlet weak var firtLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreLblBGView: UIView!
    @IBOutlet weak var rightOrWrongImg: UIImageView!
    
   
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    
    @IBOutlet weak var centarLbl: UILabel!
    
    @IBOutlet weak var simbelLbl: UILabel!
    
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
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var nextAndSubimtTapbtn: UIButton!
    
    @IBOutlet weak var titelLbl: UILabel!
    
    
    
    var isHiddenView = false
    
    var correctAnswer: Int = 0
    var firstCorrect: Int = 0
    var secondCorrect: Int = 0
    
    var userInput: String = ""
    var isAnswered = false
    var score = 0
    
    var levelNumber: Int = 1
    var totalQuestions = 10
    var currentQuestion = 1
    
    var activeField: Int = 0 // 0 = tens, 1 = ones, 2 = total
    var currentColor: UIColor = .white
    
    var results: [CountArithmeticResult] = []
    
    var operationType: String = "+"   // "+" or "-"
    
    let images: [UIImage] = [
        UIImage(named: "apple")!,
        UIImage(named: "rabbit")!,
        UIImage(named: "nest")!,
        UIImage(named: "milk")!,
        UIImage(named: "elephant")!,
        UIImage(named: "dog")!,
        UIImage(named: "cat")!,
        UIImage(named: "bone")!,
        UIImage(named: "bird")!,
        UIImage(named: "banana")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        generateQuestion()
        setupOperationUI()
        
        questionLbl.text = "\("Question".localiz()) \(currentQuestion)"
        
        activeField = 0   // 👈 default tens selected
        updateFieldColors()
        
        firtLblBGView.layer.cornerRadius = 10
        secondLblBGView.layer.cornerRadius = 10
        totalLblBGView.layer.cornerRadius = 10
        
        firstView.layer.cornerRadius = 10
        secondView.layer.cornerRadius = 10
        scoreLblBGView.layer.cornerRadius = 10
      
        btn1.layer.cornerRadius = 10
        btn1.backgroundColor = ColorManager.randomColor()
        
        btn2.layer.cornerRadius = 10
        btn2.backgroundColor = ColorManager.randomColor()
        
        btn3.layer.cornerRadius = 10
        btn3.backgroundColor = ColorManager.randomColor()
        
        btn4.layer.cornerRadius = 10
        btn4.backgroundColor = ColorManager.randomColor()
        
        btn5.layer.cornerRadius = 10
        btn5.backgroundColor = ColorManager.randomColor()
        
        btn6.layer.cornerRadius = 10
        btn6.backgroundColor = ColorManager.randomColor()
        
        btn7.layer.cornerRadius = 10
        btn7.backgroundColor = ColorManager.randomColor()
        
        btn8.layer.cornerRadius = 10
        btn8.backgroundColor = ColorManager.randomColor()
        
        btn9.layer.cornerRadius = 10
        btn9.backgroundColor = ColorManager.randomColor()
        
        btn0.layer.cornerRadius = 10
        btn0.backgroundColor = ColorManager.randomColor()
        
        btnX.layer.cornerRadius = 10
        
        firtLbl.isUserInteractionEnabled = true
        secondLbl.isUserInteractionEnabled = true
        totalLbl.isUserInteractionEnabled = true

        firtLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectTens)))
        secondLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectOnes)))
        totalLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectTotal)))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(scoreViewTapped))
        scoreLblBGView.addGestureRecognizer(tap)
        scoreLblBGView.isUserInteractionEnabled = true
        
       
        totalLblBGView.backgroundColor = .white
    }
    
//    func updateSelectionUI() {
//        
//        let selectedColor = UIColor.systemBlue.withAlphaComponent(0.2)
//        
//        firtLblBGView.backgroundColor = activeField == 0 ? selectedColor : .clear
//        secondLblBGView.backgroundColor = activeField == 1 ? selectedColor : .clear
//        totalLblBGView.backgroundColor = activeField == 2 ? selectedColor : .clear
//    }
    
    func setupOperationUI() {
        
        if operationType == "+" {
            
            centarLbl.text = "+"
            simbelLbl.text = "+"
            titelLbl.text = "Add and Fill".localiz()
            
        } else {
            
            centarLbl.text = "-"
            simbelLbl.text = "-"
            titelLbl.text = "Minus and Fill".localiz()
        }
    }
    
    @objc func scoreViewTapped() {
        
        let randomColor = ColorManager.randomColor()
        
        // Option 1: Border highlight (BEST 🔥)
        scoreLblBGView.layer.borderWidth = 3
        scoreLblBGView.layer.borderColor = randomColor.cgColor
        
        // Optional animation (smooth feel)
        UIView.animate(withDuration: 0.3) {
            self.scoreLblBGView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.scoreLblBGView.transform = .identity
            }
        }
    }
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        nextAndSubimtTapbtn.layer.cornerRadius = 6
        nextAndSubimtTapbtn.backgroundColor = color
    }
 
    func generateQuestion() {
        
        currentColor = HeaderView.backgroundColor ?? ColorManager.randomColor()
        
        // RESET LABELS
        firtLbl.text = ""
        secondLbl.text = ""
        totalLbl.text = ""
        
        firtLbl.textColor = .black
        secondLbl.textColor = .black
        totalLbl.textColor = .black
        
        activeField = 0
        updateFieldColors()
        
        isAnswered = false
        nextAndSubimtTapbtn.isHidden = true
        rightOrWrongImg.image = nil
        
        // 🔥 RANDOM COUNTS
        let firstCount = Int.random(in: 1...9)
        let secondCount = Int.random(in: 1...9)
        
        // 🔥 OPERATION BASED
        if operationType == "+" {
            
            firstCorrect = firstCount
            secondCorrect = secondCount
            correctAnswer = firstCount + secondCount
            
        } else {
            
            // minus me negative avoid
            if firstCount >= secondCount {
                firstCorrect = firstCount
                secondCorrect = secondCount
                correctAnswer = firstCount - secondCount
            } else {
                firstCorrect = secondCount
                secondCorrect = firstCount
                correctAnswer = secondCount - firstCount
            }
        }
        
        // CLEAR OLD
        firstView.subviews.forEach { $0.removeFromSuperview() }
        secondView.subviews.forEach { $0.removeFromSuperview() }
        
        // RANDOM IMAGE
        let image = images.randomElement()!
        
        // 🔥 FIRST VIEW RANDOM
        DispatchQueue.main.async {
            
            let size: CGFloat = 30
            let maxWidth = self.firstView.bounds.width - size
            let maxHeight = self.firstView.bounds.height - size
            
            var usedFrames: [CGRect] = []
            
            for _ in 0..<self.firstCorrect {
                
                var frame: CGRect
                
                repeat {
                    let x = CGFloat.random(in: 0...maxWidth)
                    let y = CGFloat.random(in: 0...maxHeight)
                    frame = CGRect(x: x, y: y, width: size, height: size)
                } while usedFrames.contains(where: { $0.intersects(frame) })
                
                usedFrames.append(frame)
                
                let imgView = UIImageView(frame: frame)
                imgView.image = image
                imgView.contentMode = .scaleAspectFit
                
                self.firstView.addSubview(imgView)
            }
        }
        
        // 🔥 SECOND VIEW RANDOM
        DispatchQueue.main.async {
            
            let size: CGFloat = 30
            let maxWidth = self.secondView.bounds.width - size
            let maxHeight = self.secondView.bounds.height - size
            
            var usedFrames: [CGRect] = []
            
            for _ in 0..<self.secondCorrect {
                
                var frame: CGRect
                
                repeat {
                    let x = CGFloat.random(in: 0...maxWidth)
                    let y = CGFloat.random(in: 0...maxHeight)
                    frame = CGRect(x: x, y: y, width: size, height: size)
                } while usedFrames.contains(where: { $0.intersects(frame) })
                
                usedFrames.append(frame)
                
                let imgView = UIImageView(frame: frame)
                imgView.image = image
                imgView.contentMode = .scaleAspectFit
                
                self.secondView.addSubview(imgView)
            }
        }
    }
    
    
    
    func updateFieldColors() {
        
        // sabko white karo
        firtLblBGView.backgroundColor = .white
        secondLblBGView.backgroundColor = .white
        totalLblBGView.backgroundColor = .white
        
        // ACTIVE FIELD highlight
        switch activeField {
        case 0:
            firtLblBGView.backgroundColor = currentColor
            
        case 1:
            secondLblBGView.backgroundColor = currentColor
            
        case 2:
            totalLblBGView.backgroundColor = currentColor
            
        default:
            break
        }
    }
    
    func appendNumber(_ number: String) {
        
        if isAnswered { return }
        
        switch activeField {
            
        case 0:
            if (firtLbl.text ?? "").count < 2 {
                firtLbl.text = (firtLbl.text ?? "") + number
                if (firtLbl.text ?? "").count == 1 {
                    activeField = 1
                }
            }
            
        case 1:
            if (secondLbl.text ?? "").count < 2 {
                secondLbl.text = (secondLbl.text ?? "") + number
                if (secondLbl.text ?? "").count == 1 {
                    activeField = 2
                }
            }
            
        case 2:
            if (totalLbl.text ?? "").count < 2 {
                totalLbl.text = (totalLbl.text ?? "") + number
            }
            
        default:
            break
        }
        
        updateFieldColors()
        checkAllFieldsFilled()
    }

    
    func checkAllFieldsFilled() {
        if firtLbl.text != "" && secondLbl.text != "" && totalLbl.text != "" {
            nextAndSubimtTapbtn.isHidden = false
        }
    }

    func applyHighlight() {
        
        let randomColor = ColorManager.randomColor()
        
        [firtLblBGView, secondLblBGView, totalLblBGView].forEach {
            $0?.layer.borderWidth = 0
        }
        
        switch activeField {
            
        case 0:
            firtLblBGView.layer.borderColor = randomColor.cgColor
            
        case 1:
            secondLblBGView.layer.borderColor = randomColor.cgColor
            
        case 2:
            totalLblBGView.layer.borderColor = randomColor.cgColor
            
        default:
            break
        }
    }
   
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectTens() {
        if !isAnswered {
            activeField = 0
            updateFieldColors() // 👈 CORRECT
        }
    }

    @objc func selectOnes() {
        if !isAnswered {
            activeField = 1
            updateFieldColors()
        }
    }

    @objc func selectTotal() {
        if !isAnswered {
            activeField = 2
            updateFieldColors()
        }
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {
    }

    @IBAction func btn1(_ sender: UIButton) { appendNumber("1") }
    @IBAction func btn2(_ sender: UIButton) { appendNumber("2") }
    @IBAction func btn3(_ sender: UIButton) { appendNumber("3") }
    @IBAction func btn4(_ sender: UIButton) { appendNumber("4") }
    @IBAction func btn5(_ sender: UIButton) { appendNumber("5") }
    @IBAction func btn6(_ sender: UIButton) { appendNumber("6") }
    @IBAction func btn7(_ sender: UIButton) { appendNumber("7") }
    @IBAction func btn8(_ sender: UIButton) { appendNumber("8") }
    @IBAction func btn9(_ sender: UIButton) { appendNumber("9") }
    @IBAction func btn0(_ sender: UIButton) { appendNumber("0") }
    
    @IBAction func btnX(_ sender: UIButton) {
        
        if isAnswered { return }
        
        switch activeField {
            
        case 0:
            firtLbl.text = String((firtLbl.text ?? "").dropLast())
            
        case 1:
            if (secondLbl.text ?? "").isEmpty {
                activeField = 0
            } else {
                secondLbl.text = String((secondLbl.text ?? "").dropLast())
            }
            
        case 2:
            if (totalLbl.text ?? "").isEmpty {
                activeField = 1
            } else {
                totalLbl.text = String((totalLbl.text ?? "").dropLast())
            }
            
        default:
            break
        }
        
        updateFieldColors()
        checkAllFieldsFilled()
    }
    
    
    @IBAction func nextAndSubimtbtn(_ sender: UIButton) {
        
        if !isAnswered {
            
            let first = Int(firtLbl.text ?? "0") ?? 0
            let second = Int(secondLbl.text ?? "0") ?? 0
            let total = Int(totalLbl.text ?? "0") ?? 0
            
            // 🔥 OPERATION BASED CALCULATION
            let calculated = (operationType == "+") ? (first + second) : (first - second)
            
            // ✅ FIRST CHECK
            if first == firstCorrect {
                firtLbl.attributedText = nil
                firtLbl.text = "\(firstCorrect)"
                firtLbl.textColor = .systemGreen
            } else {
                let wrong = NSAttributedString(
                    string: "\(first)",
                    attributes: [
                        .foregroundColor: UIColor.systemRed,
                        .strikethroughStyle: NSUnderlineStyle.single.rawValue
                    ]
                )
                
                let correct = NSAttributedString(
                    string: " \(firstCorrect)",
                    attributes: [.foregroundColor: UIColor.systemGreen]
                )
                
                let attr = NSMutableAttributedString()
                attr.append(wrong)
                attr.append(correct)
                firtLbl.attributedText = attr
            }
            
            // ✅ SECOND CHECK
            if second == secondCorrect {
                secondLbl.attributedText = nil
                secondLbl.text = "\(secondCorrect)"
                secondLbl.textColor = .systemGreen
            } else {
                let wrong = NSAttributedString(
                    string: "\(second)",
                    attributes: [
                        .foregroundColor: UIColor.systemRed,
                        .strikethroughStyle: NSUnderlineStyle.single.rawValue
                    ]
                )
                
                let correct = NSAttributedString(
                    string: " \(secondCorrect)",
                    attributes: [.foregroundColor: UIColor.systemGreen]
                )
                
                let attr = NSMutableAttributedString()
                attr.append(wrong)
                attr.append(correct)
                secondLbl.attributedText = attr
            }
            
            // ✅ TOTAL CHECK
            let isCorrectAnswer = (calculated == correctAnswer && total == correctAnswer)
            
            if isCorrectAnswer {
                
                totalLbl.attributedText = nil
                totalLbl.text = "\(correctAnswer)"
                totalLbl.textColor = .systemGreen
                
                rightOrWrongImg.image = UIImage(named: "check mark")
                score += 1
                
            } else {
                
                let wrongAttr = NSAttributedString(
                    string: "\(total)",
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
                
                let finalAttr = NSMutableAttributedString()
                finalAttr.append(wrongAttr)
                finalAttr.append(correctAttr)
                
                totalLbl.attributedText = finalAttr
                
                rightOrWrongImg.image = UIImage(named: "close")
            }
            
            // ✅ SAVE RESULT
            let result = CountArithmeticResult(
                questionNumber: currentQuestion,
                firstValue: firstCorrect,
                secondValue: secondCorrect,
                userAnswer: total,
                correctAnswer: correctAnswer,
                isCorrect: isCorrectAnswer
            )
            
            results.append(result)
            
            scoreLbl.text = "Score: \(score) / \(currentQuestion)"
            
            isAnswered = true
            nextAndSubimtTapbtn.setTitle("Next", for: .normal)
            
        } else {
            
            currentQuestion += 1

            if currentQuestion <= totalQuestions {

                questionLbl.text = "\("Question".localiz()) \(currentQuestion)"

                generateQuestion()
                nextAndSubimtTapbtn.setTitle("Submit".localiz(), for: .normal)

            } else {

                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                if let vc = storyboard.instantiateViewController(withIdentifier: "CountArithmeticResultVC") as? CountArithmeticResultVC {

                    vc.finalScore = score
                    vc.results = results
                    vc.screenTitleText = operationType == "+" ? "Add and Fill" : "Minus and Fill"
                    vc.levelNumber = levelNumber
                    vc.operationType = self.operationType

                    navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
}
