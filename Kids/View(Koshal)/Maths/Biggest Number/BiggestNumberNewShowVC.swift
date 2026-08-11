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
    
    @IBOutlet weak var pdfBtn: UIButton!
    
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
        
        scoreBGVIew.layer.cornerRadius = 6
        
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
            nextBtn.backgroundColor = .white

            view1.backgroundColor = .white
            view2.backgroundColor = .white
            view3.backgroundColor = .white
            view4.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
            nextBtn.backgroundColor = color

            view1.backgroundColor = ColorManager.randomColor()
            view2.backgroundColor = ColorManager.randomColor()
            view3.backgroundColor = ColorManager.randomColor()
            view4.backgroundColor = ColorManager.randomColor()
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
            $0?.isUserInteractionEnabled = true

            if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                $0?.backgroundColor = .white
            } else {
                $0?.backgroundColor = ColorManager.randomColor()
            }
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

    func createPDF() -> URL? {

        let pdfName = isBiggestMode ? "Biggest Number" : "Smallest Number"

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("\(pdfName).pdf")

        view.layoutIfNeeded()

        let views: [UIView] = [
            view1,
            view2,
            view3,
            view4
        ]

        guard let first = views.first else { return nil }

        var captureRect = first.superview!.convert(first.frame, to: view)

        for v in views.dropFirst() {
            let rect = v.superview!.convert(v.frame, to: view)
            captureRect = captureRect.union(rect)
        }

        captureRect = captureRect.insetBy(dx: -15, dy: -15)

        let renderer = UIGraphicsImageRenderer(size: captureRect.size)

        let image = renderer.image { _ in

            let hiddenViews: [UIView] = [
                HeaderView,
                statusView,
                backBtn,
                pdfBtn,
                scoreBGVIew,
                nextBtn,
                rightOrWrongImgView,
                titelLbl,
                texLbl,
                LevelLbl,
                questionIndexLabel
            ]

            hiddenViews.forEach { $0.isHidden = true }

            self.view.layoutIfNeeded()

            self.view.drawHierarchy(
                in: CGRect(
                    x: -captureRect.origin.x,
                    y: -captureRect.origin.y,
                    width: self.view.bounds.width,
                    height: self.view.bounds.height
                ),
                afterScreenUpdates: true
            )

            hiddenViews.forEach { $0.isHidden = false }

            self.view.layoutIfNeeded()
        }

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let pdfRenderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                let title = isBiggestMode
                    ? "Select the Biggest Number."
                    : "Select the Smallest Number."

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

        // ✅ Save current state
        let wasNextHidden = nextBtn.isHidden

        // ✅ Hide Next button before taking screenshot
        nextBtn.isHidden = true
        view.layoutIfNeeded()

        guard let url = createPDF() else {

            nextBtn.isHidden = wasNextHidden
            view.layoutIfNeeded()
            return
        }

        // ✅ Restore original state
        nextBtn.isHidden = wasNextHidden
        view.layoutIfNeeded()

        let activityVC = UIActivityViewController(
            activityItems: [url],
            applicationActivities: nil
        )

        if let pop = activityVC.popoverPresentationController {
            pop.sourceView = sender
        }

        present(activityVC, animated: true)
    }
    
}

