//
//  FindValueVC.swift
//  New
//
//  Created by Koshal Singh on 17/04/26.
//
import LanguageManager_iOS
struct FindValueResult {
    var questionNumber: Int
    var userAnswer: Int
    var correctAnswer: Int
    var isCorrect: Bool
}

import UIKit

class FindValueVC: BaseViewController {
    
    @IBOutlet weak var pdfBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var firstNu: UILabel!
    
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var secondNu: UILabel!
    
    @IBOutlet weak var tensLblBGView: UIView!
    @IBOutlet weak var oneLblBGView: UIView!
    @IBOutlet weak var totalLblBGView: UIView!
    
    
    @IBOutlet weak var tensLbl: UILabel!
    @IBOutlet weak var oneLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!

    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var showimgBGView: UIView!
    
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreLblBGView: UIView!
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
    
    @IBOutlet weak var questionLbl: UILabel!
    
    @IBOutlet weak var nextAndSubimtTapbtn: UIButton!
    
    var isHiddenView = false
    
    var correctAnswer: Int = 0
    var userInput: String = ""
    var isAnswered = false
    var score = 0
    
    var levelNumber: Int = 1
    var totalQuestions = 10
    var currentQuestion = 1
    
    var activeField: Int = 0 // 0 = tens, 1 = ones, 2 = total
    var currentColor: UIColor = .white
    
    var results: [FindValueResult] = []
    
    let images: [UIImage] = [
        UIImage(named: "elephant")!,
        UIImage(named: "heart")!,
        UIImage(named: "butterfly")!,
        UIImage(named: "bone")!,
        UIImage(named: "batAndBall")!,
        UIImage(named: "bird")!,
        UIImage(named: "cat")!,
        UIImage(named: "babyElephant")!,
        UIImage(named: "flower")!,
        UIImage(named: "ice-cream")!,
        UIImage(named: "mango")!,
        UIImage(named: "monkey")!,
        UIImage(named: "nest")!,
        UIImage(named: "rabbit")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        generateQuestion()
        
        scoreLbl.text = "\("Score".localiz()): \(score) / \(currentQuestion)"
        activeField = 0   // 👈 default tens selected
        updateFieldColors()
        
        scoreLblBGView.layer.cornerRadius = 6
        imgBGView.layer.cornerRadius = 10
        showimgBGView.layer.cornerRadius = 10
        
        tensLblBGView.layer.cornerRadius = 10
        oneLblBGView.layer.cornerRadius = 10
        totalLblBGView.layer.cornerRadius = 10
        
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
        
        tensLbl.isUserInteractionEnabled = true
        oneLbl.isUserInteractionEnabled = true
        totalLbl.isUserInteractionEnabled = true
        
        tensLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectTens)))
        oneLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectOnes)))
        totalLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectTotal)))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(scoreViewTapped))
        scoreLblBGView.addGestureRecognizer(tap)
        scoreLblBGView.isUserInteractionEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
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

            imgBGView.backgroundColor = .white
            showimgBGView.backgroundColor = .white

            nextAndSubimtTapbtn.backgroundColor = .white

            buttons.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            imgBGView.backgroundColor = .white
            showimgBGView.backgroundColor = .white

            nextAndSubimtTapbtn.backgroundColor = color

            buttons.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }
    }
    
    func generateQuestion() {
        
        questionLbl.text = "\("Question".localiz()) \(currentQuestion)"
        
        currentColor = ColorManager.randomColor()
        
        imgBGView.subviews.forEach { $0.removeFromSuperview() }
        
        tensLbl.text = ""
        oneLbl.text = ""
        totalLbl.text = ""

        activeField = 0
        updateFieldColors()
        
        tensLblBGView.backgroundColor = .white
        oneLblBGView.backgroundColor = .white
        totalLblBGView.backgroundColor = .white
        
        isAnswered = false
        nextAndSubimtTapbtn.isHidden = true
        rightOrWrongImg.image = nil
        
        // 🔥 pick 2 different random images
        let shuffledImages = images.shuffled()
        let tensImage = shuffledImages[0]
        let onesImage = shuffledImages[1]
        
        // 🔥 random counts
        let tensCount = Int.random(in: 1...5)
        let onesCount = Int.random(in: 1...9)
        
        let totalCount = (tensCount * 10) + onesCount
        correctAnswer = totalCount
        
        // 🔥 set top info
        firstImg.image = tensImage
        firstNu.text = "10"
        
        secondImg.image = onesImage
        secondNu.text = "1"
        
        // 🔥 create mixed images
        var allImages: [UIImage] = []
        
        for _ in 0..<tensCount { allImages.append(tensImage) }
        for _ in 0..<onesCount { allImages.append(onesImage) }
        
        allImages.shuffle()
        
        // 🔥 IMPORTANT: wait for layout
        DispatchQueue.main.async {
            
            let size: CGFloat = 30   // 👈 CHANGE HERE
            let maxWidth = self.imgBGView.bounds.width - size
            let maxHeight = self.imgBGView.bounds.height - size
            
            var usedFrames: [CGRect] = []
            
            for img in allImages {
                
                var frame: CGRect
                
                repeat {
                    let randomX = CGFloat.random(in: 0...maxWidth)
                    let randomY = CGFloat.random(in: 0...maxHeight)
                    
                    frame = CGRect(x: randomX, y: randomY, width: size, height: size)
                    
                } while usedFrames.contains(where: { $0.intersects(frame) })
                
                usedFrames.append(frame)
                
                let imgView = UIImageView(frame: frame)
                imgView.image = img
                imgView.contentMode = .scaleAspectFit
                
                self.imgBGView.addSubview(imgView)
            }
        }
    }
    
    func updateFieldColors() {
        
        // sabko white karo
        tensLblBGView.backgroundColor = .white
        oneLblBGView.backgroundColor = .white
        totalLblBGView.backgroundColor = .white
        
        // 👇 ACTIVE FIELD pe hamesha color
        switch activeField {
        case 0:
            tensLblBGView.backgroundColor = currentColor
            
        case 1:
            oneLblBGView.backgroundColor = currentColor
            
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
            if (tensLbl.text ?? "").count < 2 {
                tensLbl.text = (tensLbl.text ?? "") + number
                
                // 👇 1 digit pe hi move
                if (tensLbl.text ?? "").count == 1 {
                    activeField = 1
                }
            }
            
        case 1:
            if (oneLbl.text ?? "").count < 2 {
                oneLbl.text = (oneLbl.text ?? "") + number
                
                if (oneLbl.text ?? "").count == 1 {
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
        if tensLbl.text != "" && oneLbl.text != "" && totalLbl.text != "" {
            nextAndSubimtTapbtn.isHidden = false
        }
    }

    func applyHighlight() {
        
        let randomColor = ColorManager.randomColor()
        
        // sabka reset (white background safe रहेगा)
        [tensLblBGView, oneLblBGView, totalLblBGView].forEach {
            $0?.layer.borderWidth = 0
        }
        
        // selected pe color border
        switch activeField {
            
        case 0:
            tensLblBGView.layer.borderColor = randomColor.cgColor
            
        case 1:
            oneLblBGView.layer.borderColor = randomColor.cgColor
            
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
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("FindValue.pdf")

        view.layoutIfNeeded()

        // ✅ Sirf worksheet views capture honge
        let views: [UIView] = [
            showimgBGView,
            imgBGView,
            tensLblBGView,
            oneLblBGView,
            totalLblBGView
        ]

        guard let first = views.first else { return nil }

        var captureRect = first.superview!.convert(first.frame, to: view)

        for v in views.dropFirst() {
            let rect = v.superview!.convert(v.frame, to: view)
            captureRect = captureRect.union(rect)
        }

        captureRect = captureRect.insetBy(dx: -10, dy: -10)

        let renderer = UIGraphicsImageRenderer(size: captureRect.size)

        let image = renderer.image { _ in

            // ❌ Hide unwanted views
            let hiddenViews: [UIView] = [
                HeaderView,
                statusView,
                backBtn,
                pdfBtn,
                scoreLblBGView,
                nextAndSubimtTapbtn,
                btn0,
                btn1,
                btn2,
                btn3,
                btn4,
                btn5,
                btn6,
                btn7,
                btn8,
                btn9,
                btnX,
                questionLbl
            ]

            hiddenViews.forEach { $0.isHidden = true }

            view.drawHierarchy(
                in: CGRect(
                    x: -captureRect.origin.x,
                    y: -captureRect.origin.y,
                    width: view.bounds.width,
                    height: view.bounds.height
                ),
                afterScreenUpdates: true
            )

            // ✅ Restore
            hiddenViews.forEach { $0.isHidden = false }
        }

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let pdfRenderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                let title = "Find the total value based on the below info."

                title.draw(
                    in: CGRect(
                        x: 20,
                        y: 20,
                        width: pageWidth - 40,
                        height: 35
                    ),
                    withAttributes: [
                        .font: UIFont.boldSystemFont(ofSize: 24),
                        .foregroundColor: UIColor.black
                    ]
                )

                let maxWidth = pageWidth - 40
                let maxHeight = pageHeight - 90

                let scale = min(
                    maxWidth / image.size.width,
                    maxHeight / image.size.height
                )

                let drawWidth = image.size.width * scale
                let drawHeight = image.size.height * scale

                image.draw(
                    in: CGRect(
                        x: (pageWidth - drawWidth) / 2,
                        y: 70,
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
        
        switch activeField {
            
        case 0:
            tensLbl.text = String((tensLbl.text ?? "").dropLast())
            
        case 1:
            if (oneLbl.text ?? "").isEmpty {
                activeField = 0 // 👈 पीछे जाओ
            } else {
                oneLbl.text = String((oneLbl.text ?? "").dropLast())
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
            
            let tens = Int(tensLbl.text ?? "0") ?? 0
            let ones = Int(oneLbl.text ?? "0") ?? 0
            let total = Int(totalLbl.text ?? "0") ?? 0
            
            let correctTens = correctAnswer / 10
            let correctOnes = correctAnswer % 10
            
            let calculated = tens * 10 + ones
            
            // ✅ CHECK TENS
            if tens == correctTens {
                tensLbl.attributedText = nil
                tensLbl.text = "\(correctTens)"
                tensLbl.textColor = .systemGreen
            } else {
                let wrong = NSAttributedString(
                    string: "\(tens)",
                    attributes: [
                        .foregroundColor: UIColor.systemRed,
                        .strikethroughStyle: NSUnderlineStyle.single.rawValue
                    ]
                )
                
                let correct = NSAttributedString(
                    string: " \(correctTens)",
                    attributes: [.foregroundColor: UIColor.systemGreen]
                )
                
                let attr = NSMutableAttributedString()
                attr.append(wrong)
                attr.append(correct)
                tensLbl.attributedText = attr
            }
            
            // ✅ CHECK ONES
            if ones == correctOnes {
                oneLbl.attributedText = nil
                oneLbl.text = "\(correctOnes)"
                oneLbl.textColor = .systemGreen
            } else {
                let wrong = NSAttributedString(
                    string: "\(ones)",
                    attributes: [
                        .foregroundColor: UIColor.systemRed,
                        .strikethroughStyle: NSUnderlineStyle.single.rawValue
                    ]
                )
                
                let correct = NSAttributedString(
                    string: " \(correctOnes)",
                    attributes: [.foregroundColor: UIColor.systemGreen]
                )
                
                let attr = NSMutableAttributedString()
                attr.append(wrong)
                attr.append(correct)
                oneLbl.attributedText = attr
            }
            
            // ✅ CHECK TOTAL
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
            
            // ✅ 🔥 RESULT SAVE (IMPORTANT)
            let result = FindValueResult(
                questionNumber: currentQuestion,
                userAnswer: total,
                correctAnswer: correctAnswer,
                isCorrect: isCorrectAnswer
            )
            
            results.append(result)
            
            // ✅ score update
            scoreLbl.text = "\("Score".localiz()): \(score) / \(currentQuestion)"
            
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

                if let vc = storyboard.instantiateViewController(withIdentifier: "FindValueResultVC") as? FindValueResultVC {

                    vc.finalScore = score
                    vc.results = results
                    vc.screenTitleText = "Find Value"
                    vc.levelNumber = 12

                    navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
}
