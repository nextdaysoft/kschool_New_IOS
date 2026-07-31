//
//  CountVC.swift
//  New
//
//  Created by Koshal Singh on 20/04/26.
//


struct CountResult {
    var questionNumber: Int
    var firstValue: Int      // 👈 add
    var secondValue: Int     // 👈 add
    var userAnswer: Int
    var correctAnswer: Int
    var isCorrect: Bool
}

import UIKit
import LanguageManager_iOS

class CountVC: BaseViewController {

    @IBOutlet weak var pdfBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!

    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var totalLblBGView: UIView!

    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreLblBGView: UIView!
    @IBOutlet weak var rightOrWrongImg: UIImageView!
    
   
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
        
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
    
    
    @IBOutlet weak var imgName: UILabel!
    
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
    
    var results: [CountResult] = []
    
    var operationType: String = "+"   // "+" or "-"
    
    let items: [(image: UIImage, name: String)] = [
        (UIImage(named: "carrot")!, "Count the Carrot".localiz()),
        (UIImage(named: "rabbit")!, "Count the Rabbit".localiz()),
        (UIImage(named: "nest")!, "Count the Nest".localiz()),
        (UIImage(named: "milk")!, "Count the Milk".localiz()),
        (UIImage(named: "elephant")!, "Count the Elephant".localiz()),
        (UIImage(named: "dog")!, "Count the Dog".localiz()),
        (UIImage(named: "cat")!, "Count the Cat".localiz()),
        (UIImage(named: "bone")!, "Count the Bone".localiz()),
        (UIImage(named: "monkey")!, "Count the Monkey".localiz()),
        (UIImage(named: "banana")!, "Count the Banana".localiz())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        generateQuestion()
        
        questionLbl.text = "\("Question".localiz()) \(currentQuestion)"
        
        activeField = 0
        
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
        
        totalLblBGView.backgroundColor = .white
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
        
        totalLbl.text = ""
        totalLbl.textColor = .black
        
        activeField = 2
        
        isAnswered = false
        nextAndSubimtTapbtn.isHidden = true
        rightOrWrongImg.image = nil
        
        let firstCount = Int.random(in: 1...9)
        let secondCount = Int.random(in: 1...9)
        
        if operationType == "+" {
            firstCorrect = firstCount
            secondCorrect = secondCount
            correctAnswer = firstCount + secondCount
        } else {
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
        
        firstView.subviews.forEach { $0.removeFromSuperview() }
        secondView.subviews.forEach { $0.removeFromSuperview() }
        
        let item = items.randomElement()!
        let image = item.image

        // 👉 NAME SHOW
        imgName.text = item.name
        
        // FIRST VIEW
        // FIRST VIEW
        DispatchQueue.main.async {
            
            let size: CGFloat = 30
            let spacing: CGFloat = 10
            
            let columns = Int(self.firstView.bounds.width / (size + spacing))
            let rows = Int(self.firstView.bounds.height / (size + spacing))
            
            var positions: [CGPoint] = []
            
            for row in 0..<rows {
                for col in 0..<columns {
                    
                    let x = CGFloat(col) * (size + spacing)
                    let y = CGFloat(row) * (size + spacing)
                    
                    positions.append(CGPoint(x: x, y: y))
                }
            }
            
            positions.shuffle()
            
            for i in 0..<min(self.firstCorrect, positions.count) {
                
                let point = positions[i]
                
                let imgView = UIImageView(
                    frame: CGRect(
                        x: point.x,
                        y: point.y,
                        width: size,
                        height: size
                    )
                )
                
                imgView.image = image
                imgView.contentMode = .scaleAspectFit
                
                self.firstView.addSubview(imgView)
            }
        }

        // SECOND VIEW
        DispatchQueue.main.async {
            
            let size: CGFloat = 30
            let spacing: CGFloat = 10
            
            let columns = Int(self.secondView.bounds.width / (size + spacing))
            let rows = Int(self.secondView.bounds.height / (size + spacing))
            
            var positions: [CGPoint] = []
            
            for row in 0..<rows {
                for col in 0..<columns {
                    
                    let x = CGFloat(col) * (size + spacing)
                    let y = CGFloat(row) * (size + spacing)
                    
                    positions.append(CGPoint(x: x, y: y))
                }
            }
            
            positions.shuffle()
            
            for i in 0..<min(self.secondCorrect, positions.count) {
                
                let point = positions[i]
                
                let imgView = UIImageView(
                    frame: CGRect(
                        x: point.x,
                        y: point.y,
                        width: size,
                        height: size
                    )
                )
                
                imgView.image = image
                imgView.contentMode = .scaleAspectFit
                
                self.secondView.addSubview(imgView)
            }
        }
    }
    
    
    
    func appendNumber(_ number: String) {
        
        if isAnswered { return }
        
        if (totalLbl.text ?? "").count < 2 {
            totalLbl.text = (totalLbl.text ?? "") + number
        }
        
        checkAllFieldsFilled()
    }
    
  
//    func updateSelectionUI() {
//        
//        let selectedColor = UIColor.systemBlue.withAlphaComponent(0.2)
//        
//        totalLblBGView.backgroundColor = selectedColor
//    }
    
    func checkAllFieldsFilled() {
        if totalLbl.text != "" {
            nextAndSubimtTapbtn.isHidden = false
        }
    }

   
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    @objc func selectTotal() {
//        if !isAnswered {
//            updateSelectionUI()
//        }
//    }
    
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
        
        totalLbl.text = String((totalLbl.text ?? "").dropLast())
        
        checkAllFieldsFilled()
    }
    
    
    @IBAction func nextAndSubimtbtn(_ sender: UIButton) {
        
        if !isAnswered {
            
            let total = Int(totalLbl.text ?? "0") ?? 0
            
            if total == correctAnswer {
                
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
            
            scoreLbl.text = "\("Score".localiz()): \(score) / \(currentQuestion)"
            
            isAnswered = true
            nextAndSubimtTapbtn.setTitle("Next".localiz(), for: .normal)
            
        } else {
            
            currentQuestion += 1
            
            if currentQuestion <= totalQuestions {
                
                // ✅ Question number update
                questionLbl.text = "\("Question".localiz()) \(currentQuestion)"
                
                generateQuestion()
                nextAndSubimtTapbtn.setTitle("Submit".localiz(), for: .normal)
                
            } else {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                if let vc = storyboard.instantiateViewController(withIdentifier: "CountResultVC") as? CountResultVC {
                    
                    vc.finalScore = score
                    vc.levelNumber = 3
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
}
