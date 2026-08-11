//
//  CalculateMoneyVC.swift
//  New
//
//  Created by Koshal Singh on 18/04/26.
//

import LanguageManager_iOS
struct CalculateMoneyResult {
    var questionNumber: Int
    var correctAnswer: Int
    var isCorrect: Bool
    var questionText: String
}

import UIKit

class CalculateMoneyVC: BaseViewController {
    
    @IBOutlet weak var pdfBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var firstNu: UILabel!
    @IBOutlet weak var firstsimbel: UILabel!
    
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var secondNu: UILabel!
    @IBOutlet weak var secondsimbel: UILabel!
    
    @IBOutlet weak var thirdImg: UIImageView!
    @IBOutlet weak var thirdNu: UILabel!
    @IBOutlet weak var thirdsimbel: UILabel!
    @IBOutlet weak var thirdScondSimbel: UILabel!
    
    @IBOutlet weak var firsLblBGView: UIView!
    @IBOutlet weak var secondBGView: UIView!
    @IBOutlet weak var thirdLblBGView: UIView!
    
    @IBOutlet weak var firsLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var thirdLbl: UILabel!
    
    
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var totalLblBGView: UIView!
    
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreLblBGView: UIView!
    @IBOutlet weak var rightOrWrongImg: UIImageView!
    
    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var mainBGViewHeight: NSLayoutConstraint!
    
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
    @IBOutlet weak var levelLbl: UILabel!
    
    @IBOutlet weak var nextAndSubimtTapbtn: UIButton!
    
    
    @IBOutlet weak var firstBGWidth: NSLayoutConstraint!
    @IBOutlet weak var secondBGWidth: NSLayoutConstraint!
    @IBOutlet weak var thirdBGWidth: NSLayoutConstraint!
    @IBOutlet weak var totalBGWidth: NSLayoutConstraint!
    
    var results: [CalculateMoneyResult] = []
    
    // ✅ NEW VARIABLES
    var values: [Int] = []
    var counts: [Int] = []
    // ✅ नया
    var userAnswers: [String] = ["", "", "", ""]
    
    var currentQuestion = 1
    var totalQuestions = 10
    var score = 0
    var isAnswered = false
    var activeField = 0
    
    var levelNumber: Int = 1
    var currentColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        generateQuestion()
     
        levelLbl.text = "# \("Level".localiz()) \(levelNumber)"
        scoreLbl.text = "\("Score".localiz()): \(score) / \(currentQuestion)"
        questionLbl.text = "\("Question".localiz()) \(currentQuestion)"
        
        firsLblBGView.layer.cornerRadius = 10
        secondBGView.layer.cornerRadius = 10
        thirdLblBGView.layer.cornerRadius = 10
        
        scoreLblBGView.layer.cornerRadius = 10
        totalLblBGView.layer.cornerRadius = 10
        
        activeField = 0

        activeField = 0
        updateFieldColors()
        
        
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

        
        firsLbl.isUserInteractionEnabled = true
        secondLbl.isUserInteractionEnabled = true
        thirdLbl.isUserInteractionEnabled = true

        firsLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectFirst)))
        secondLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectSecond)))
        thirdLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectThird)))
        totalLbl.isUserInteractionEnabled = true
        totalLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectTotal)))
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
        nextAndSubimtTapbtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        let buttons = [
            btn1,
            btn2,
            btn3,
            btn4,
            btn5,
            btn6,
            btn7,
            btn8,
            btn9,
            btn0
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextAndSubimtTapbtn.backgroundColor = .white

            buttons.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextAndSubimtTapbtn.backgroundColor = color

            buttons.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }
    }
 
    
    // ✅ GENERATE QUESTION
    func generateQuestion() {
        
        currentColor = ColorManager.randomColor()
        
        isAnswered = false
        nextAndSubimtTapbtn.setTitle("Submit", for: .normal)
        nextAndSubimtTapbtn.isHidden = true
        rightOrWrongImg.image = nil
        
        questionLbl.text = "\("Question".localiz()) \(currentQuestion)"
        
        userAnswers = ["", "", "", ""]
        
        // 🔥 ADD THIS (START FROM FIRST FIELD)
        activeField = 0
        updateFieldColors()
        
        // ✅ RESET COLORS
        firsLbl.textColor = .black
        secondLbl.textColor = .black
        thirdLbl.textColor = .black
        totalLbl.textColor = .black

        firsLbl.attributedText = nil
        secondLbl.attributedText = nil
        thirdLbl.attributedText = nil
        totalLbl.attributedText = nil
        
        // ✅ LEVEL BASED VALUES
        let allValues: [Int]
        
        switch levelNumber {
        case 1:
            allValues = [1, 2]
        case 2:
            allValues = [1, 2, 5]
        case 3:
            allValues = [2, 5, 10]
        case 4:
            allValues = [5, 10, 20]
        case 5:
            allValues = [10, 20, 50]
        case 6:
            allValues = [20, 50, 100]
        default:
            allValues = [1, 2]
        }
        
        values = allValues.shuffled()
        
        let numberOfItems = (levelNumber == 1) ? 2 : 3
        values = Array(values.prefix(numberOfItems))
        
        counts = values.map { _ in Int.random(in: 1...5) }
        
        // ✅ reset UI
        firsLbl.text = ""
        secondLbl.text = ""
        thirdLbl.text = ""
        totalLbl.text = ""
        
        updateUI()
    }
    
    
    // ✅ UPDATE UI
    func updateUI() {
        
        firstImg.image = getImage(for: values[0])
        secondImg.image = getImage(for: values[1])
        
        // ✅ SHOW RANDOM COUNT (1–5)
        firstNu.text = "\(counts[0])"
        secondNu.text = "\(counts[1])"
        
        let isThirdVisible = values.count == 3
        
        thirdImg.isHidden = !isThirdVisible
        thirdNu.isHidden = !isThirdVisible
        thirdLblBGView.isHidden = !isThirdVisible
        thirdLbl.isHidden = !isThirdVisible
        
        thirdsimbel.isHidden = !isThirdVisible
        thirdScondSimbel.isHidden = !isThirdVisible
        
        if isThirdVisible {
            
            thirdImg.image = getImage(for: values[2])
            
            // ✅ SHOW COUNT
            thirdNu.text = "\(counts[2])"
            
            mainBGViewHeight.constant = 350
            
        } else {
            mainBGViewHeight.constant = 260
        }
        
        self.view.layoutIfNeeded()
    }
    
    
    // ✅ IMAGE MAPPING
    func getImage(for value: Int) -> UIImage? {
        switch value {
        case 1: return UIImage(named: "ic_one_rupee")
        case 2: return UIImage(named: "ic_two_rupee")
        case 5: return UIImage(named: "ic_five_rupee")
        case 10: return UIImage(named: "ic_ten_rupee")
        case 20: return UIImage(named: "ic_twenty_rupee")
        case 50: return UIImage(named: "ic_fifty_rupee")
        case 100: return UIImage(named: "ic_hundread_rupee")
        default: return nil
        }
    }
    
    func checkAllFilled() {
        
        if values.count == 2 {
            if userAnswers[0] != "" && userAnswers[1] != "" && userAnswers[3] != "" {
                nextAndSubimtTapbtn.isHidden = false
            }
        } else {
            if userAnswers[0] != "" && userAnswers[1] != "" && userAnswers[2] != "" && userAnswers[3] != "" {
                nextAndSubimtTapbtn.isHidden = false
            }
        }
    }
    
    func getLabel(_ index: Int) -> UILabel {
        switch index {
        case 0: return firsLbl
        case 1: return secondLbl
        case 2: return thirdLbl
        default: return UILabel()
        }
    }
    
    @objc func selectFirst() {
        if !isAnswered {
            activeField = 0
            updateFieldColors()
        }
    }

    @objc func selectSecond() {
        if !isAnswered {
            activeField = 1
            updateFieldColors()
        }
    }

    @objc func selectThird() {
        if !isAnswered {
            activeField = 2
            updateFieldColors()
        }
    }
    
    @objc func selectTotal() {
        if !isAnswered {
            activeField = 3
            updateFieldColors()
        }
    }
    
    func appendNumber(_ number: String) {
        
        if isAnswered { return }
        
        // ✅ Level based max length
        let maxLength = (levelNumber <= 3) ? 2 : 3
        
        if userAnswers[activeField].count < maxLength {
            userAnswers[activeField] += number
        }
        
        updateAnswerLabels()
        
        // ✅ Dynamic width update
     //   updateDynamicWidths()
        
        updateFieldColors()
        checkAllFilled()
    }

    
    func updateFieldColors() {
        
        // RESET ALL
        firsLblBGView.backgroundColor = .white
        secondBGView.backgroundColor = .white
        thirdLblBGView.backgroundColor = .white
        totalLblBGView.backgroundColor = .white
        
        // APPLY ACTIVE COLOR
        switch activeField {
            
        case 0:
            firsLblBGView.backgroundColor = currentColor
            
        case 1:
            secondBGView.backgroundColor = currentColor
            
        case 2:
            // 🔥 ONLY IF VISIBLE
            if values.count == 3 {
                thirdLblBGView.backgroundColor = currentColor
            }
            
        case 3:
            totalLblBGView.backgroundColor = currentColor
            
        default:
            break
        }
    }
    
    func updateAnswerLabels() {
        firsLbl.text = userAnswers[0]
        secondLbl.text = userAnswers[1]
        
        if values.count == 3 {
            thirdLbl.text = userAnswers[2]
        }
        
        totalLbl.text = userAnswers[3]   // ✅ ADD
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("CalculateMoney.pdf")

        view.layoutIfNeeded()

        // Sirf required views capture honge
        let captureViews: [UIView] = [
            firstImg,
            firstNu,
            firstsimbel,

            secondImg,
            secondNu,
            secondsimbel,

            thirdImg,
            thirdNu,
            thirdsimbel,
            thirdScondSimbel,

            firsLblBGView,
            secondBGView,
            thirdLblBGView,
            totalLblBGView,      // ✅ Added

            firsLbl,
            secondLbl,
            thirdLbl,
            totalLbl             // ✅ Added
        ]

        guard let firstView = captureViews.first else { return nil }

        var captureRect = firstView.superview!.convert(firstView.frame, to: view)

        for item in captureViews.dropFirst() {

            // Hidden third view automatically skip
            guard !item.isHidden else { continue }

            let rect = item.superview!.convert(item.frame, to: view)
            captureRect = captureRect.union(rect)
        }

        captureRect = captureRect.insetBy(dx: -20, dy: -20)

        let renderer = UIGraphicsImageRenderer(size: captureRect.size)

        let image = renderer.image { _ in

            view.drawHierarchy(
                in: CGRect(
                    x: -captureRect.origin.x,
                    y: -captureRect.origin.y,
                    width: view.bounds.width,
                    height: view.bounds.height
                ),
                afterScreenUpdates: true
            )
        }

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let pdfRenderer = UIGraphicsPDFRenderer(
            bounds: CGRect(
                x: 0,
                y: 0,
                width: pageWidth,
                height: pageHeight
            )
        )

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                let title = "Fill in the boxes and calculate the total money"

                title.draw(
                    in: CGRect(
                        x: 20,
                        y: 20,
                        width: pageWidth - 40,
                        height: 60
                    ),
                    withAttributes: [
                        .font: UIFont.boldSystemFont(ofSize: 22),
                        .foregroundColor: UIColor.black
                    ]
                )

                let maxWidth = pageWidth - 40
                let maxHeight = pageHeight - 120

                let scale = min(
                    maxWidth / image.size.width,
                    maxHeight / image.size.height
                )

                let drawWidth = image.size.width * scale
                let drawHeight = image.size.height * scale

                image.draw(
                    in: CGRect(
                        x: (pageWidth - drawWidth) / 2,
                        y: 95,
                        width: drawWidth,
                        height: drawHeight
                    )
                )
            }

            return pdfURL

        } catch {

            print(error)
            return nil
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        guard let url = createPDF() else { return }

        let activityVC = UIActivityViewController(
            activityItems: [url],
            applicationActivities: nil
        )

        if let pop = activityVC.popoverPresentationController {
            pop.sourceView = sender
        }

        present(activityVC, animated: true)
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
        
        if !userAnswers[activeField].isEmpty {
            userAnswers[activeField].removeLast()
        } else {
            if activeField > 0 {
                activeField -= 1
            }
        }
        
        updateAnswerLabels()
        updateFieldColors()
        checkAllFilled()
    }
    
    
    @IBAction func nextAndSubimtbtn(_ sender: UIButton) {
        
        if !isAnswered {
            
            var total = 0
            
            for i in 0..<values.count {
                
                let user = Int(userAnswers[i]) ?? 0
                let correct = values[i] * counts[i]
                
                total += correct
                
                if user == correct {
                    getLabel(i).textColor = .systemGreen
                } else {
                    
                    let wrong = NSAttributedString(
                        string: "\(user)",
                        attributes: [
                            .foregroundColor: UIColor.systemRed,
                            .strikethroughStyle: NSUnderlineStyle.single.rawValue
                        ])
                    
                    let correctText = NSAttributedString(
                        string: " \(correct)",
                        attributes: [.foregroundColor: UIColor.systemGreen])
                    
                    let attr = NSMutableAttributedString()
                    attr.append(wrong)
                    attr.append(correctText)
                    
                    getLabel(i).attributedText = attr
                }
            }
            
            // 🔥 TOTAL CHECK
            let userTotal = Int(userAnswers[3]) ?? 0
            
            if userTotal == total {
                
                totalLbl.attributedText = nil
                totalLbl.text = "\(total)"
                totalLbl.textColor = .systemGreen
                
            } else {
                
                let wrong = NSAttributedString(
                    string: "\(userTotal)",
                    attributes: [
                        .foregroundColor: UIColor.systemRed,
                        .strikethroughStyle: NSUnderlineStyle.single.rawValue
                    ])
                
                let correctText = NSAttributedString(
                    string: " \(total)",
                    attributes: [.foregroundColor: UIColor.systemGreen])
                
                let attr = NSMutableAttributedString()
                attr.append(wrong)
                attr.append(correctText)
                
                totalLbl.attributedText = attr
            }
            
            // 🔥 RESULT STORE (IMPORTANT)
            let questionText = values.enumerated().map {
                "\(values[$0.offset]) × \(counts[$0.offset])"
            }.joined(separator: " + ")

            let fullQuestion = "\(questionText) = \(userTotal)"

            let questionResult = CalculateMoneyResult(
                questionNumber: currentQuestion,
                correctAnswer: total,
                isCorrect: userTotal == total,
                questionText: fullQuestion
            )
            
            results.append(questionResult)
            
            // 🔥 SCORE CHECK
            if userTotal == total {
                rightOrWrongImg.image = UIImage(named: "check mark")
                score += 1
            } else {
                rightOrWrongImg.image = UIImage(named: "close")
            }
            
            scoreLbl.text = "\("Score".localiz()): \(score) / \(currentQuestion)"

            isAnswered = true

            // ✅ Reset all selected background colors
            firsLblBGView.backgroundColor = .white
            secondBGView.backgroundColor = .white
            thirdLblBGView.backgroundColor = .white
            totalLblBGView.backgroundColor = .white

            nextAndSubimtTapbtn.setTitle("Next", for: .normal)
            
        } else {
            
            currentQuestion += 1
            
            if currentQuestion <= totalQuestions {
                generateQuestion()
                
            } else {
                
                // 🔥 RESULT SCREEN OPEN
                let vc = storyboard?.instantiateViewController(withIdentifier: "CalculateMoneyResultVC") as! CalculateMoneyResultVC
                
                vc.finalScore = score
                vc.levelNumber = levelNumber
                vc.screenTitleText = "You have completed this activity."
                vc.results = results   // 🔥 PASS DATA
                
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
  
}
