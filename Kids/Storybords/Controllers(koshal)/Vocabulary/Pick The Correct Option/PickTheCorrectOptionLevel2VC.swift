//
//  PickTheCorrectOptionLevel2VC.swift
//  Kids
//
//  Created by Koshal Singh on 30/01/26.
//

import UIKit
import LanguageManager_iOS

class PickTheCorrectOptionLevel2VC: BaseViewController {

    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    @IBOutlet weak var allImgs: UIImageView!
    @IBOutlet weak var allNameLalel: UILabel!
    @IBOutlet weak var nama1Btn: UIButton!
    @IBOutlet weak var nama2Btn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    var questions: [PickQuestion] = [

        PickQuestion(
            imageName: "boyWithBinoculars",
            sentence: "We see with our eyes".localiz(),
            option1: "eyes".localiz(),
            option2: "ears".localiz(),
            correctAnswer: "eyes".localiz()
        ),

        PickQuestion(
            imageName: "EatingApple",
            sentence: "Apples and bananas are fruits".localiz(),
            option1: "Fruits".localiz(),
            option2: "Toys".localiz(),
            correctAnswer: "Fruits".localiz()
        ),

        PickQuestion(
            imageName: "teacher 1",
            sentence: "The teacher is in the classroom".localiz(),
            option1: "classroom".localiz(),
            option2: "kitchen".localiz(),
            correctAnswer: "classroom".localiz()
        ),

        PickQuestion(
            imageName: "dog",
            sentence: "A dog has four legs.".localiz(),
            option1: "Four".localiz(),
            option2: "Two".localiz(),
            correctAnswer: "Four".localiz()
        ),

        PickQuestion(
            imageName: "goingToSchool",
            sentence: "What do we carry to school?".localiz(),
            option1: "Bag".localiz(),
            option2: "Toys".localiz(),
            correctAnswer: "are".localiz()
        ),

        PickQuestion(
            imageName: "thinkingFace",
            sentence: "The opposite of 'big' is small".localiz(),
            option1: "tall".localiz(),
            option2: "Small".localiz(),
            correctAnswer: "Small".localiz()
        ),

        PickQuestion(
            imageName: "playingFootball",
            sentence: "What shape is a football?".localiz(),
            option1: "Oval".localiz(),
            option2: "Round".localiz(),
            correctAnswer: "Round".localiz()
        ),

        PickQuestion(
            imageName: "rain",
            sentence: "We use an umbrella when it rains".localiz(),
            option1: "rains".localiz(),
            option2: "snows".localiz(),
            correctAnswer: "rains".localiz()
        ),

        PickQuestion(
            imageName: "bed",
            sentence: "We sleep on a bed".localiz(),
            option1: "Table".localiz(),
            option2: "Bed".localiz(),
            correctAnswer: "bed".localiz()
        ),

        PickQuestion(
            imageName: "babyCrying",
            sentence: "The baby is crying".localiz(),
            option1: "crying".localiz(),
            option2: "sleeping".localiz(),
            correctAnswer: "crying".localiz()
        )
    ]
    
    
    var currentIndex = 0
    var score = 0
    var selectedAnswer: String?
    var hasAnswered = false
    var defaultOptionBGColor: UIColor?
    var defaultOptionTextColor: UIColor?
    var results: [PickOptionResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // QUESTIONS SHUFFLE
        questions.shuffle()

        setup()
        applyTheme()

        imgBGView.layer.cornerRadius = 10

        nama1Btn.layer.cornerRadius = 10
        nama2Btn.layer.cornerRadius = 10

        scoreLabelBGView.layer.cornerRadius = 10

        defaultOptionBGColor = nama1Btn.backgroundColor
        defaultOptionTextColor = nama1Btn.titleColor(for: .normal)

        nextBtn.isHidden = true

        loadQuestion()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    func setup() {

        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)

        let img = UIImage(
            systemName: "arrow.backward.circle",
            withConfiguration: config
        )

        backBtn.setImage(img, for: .normal)

        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)

        nextBtn.layer.cornerRadius = 6

    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white

            defaultOptionBGColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()

            defaultOptionBGColor = nama1Btn.backgroundColor
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Load Question
    func loadQuestion() {

        let q = questions[currentIndex]

        allImgs.image = UIImage(named: q.imageName)

        allNameLalel.text = sentenceWithBlanks(
            sentence: q.sentence,
            answer: q.correctAnswer
        )

        // OPTIONS SHUFFLE
        let options = [q.option1, q.option2].shuffled()

        nama1Btn.setTitle(options[0], for: .normal)
        nama2Btn.setTitle(options[1], for: .normal)

        rightOrWrongImgView.image = nil
        hasAnswered = false

        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"

        resetOptionButtons()

        nextBtn.isHidden = true
    }
    
    func sentenceWithBlanks(sentence: String, answer: String) -> String {

        let words = answer.split(separator: " ")
        let blank = words.map { _ in "_ _ _" }.joined(separator: " ")

        let pattern = "\\b\(NSRegularExpression.escapedPattern(for: answer))\\b"

        if let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive]) {
            let range = NSRange(sentence.startIndex..., in: sentence)
            return regex.stringByReplacingMatches(
                in: sentence,
                options: [],
                range: range,
                withTemplate: blank
            )
        }

        return sentence
    }
    
    func handleAnswer(_ selected: String) {

        if hasAnswered { return }
        hasAnswered = true

        let q = questions[currentIndex]

        // 🔹 Blank wali jagah selected word bharo
        let selectedSentence = q.sentence.replacingOccurrences(
            of: q.correctAnswer,
            with: selected
        )

        allNameLalel.text = selectedSentence

        let isCorrect = (selected == q.correctAnswer)

        let result = PickOptionResult(
            fullSentence: selectedSentence,
            isCorrect: isCorrect
        )
        results.append(result)

        resetOptionButtons()

        let tappedButton = (nama1Btn.title(for: .normal) == selected) ? nama1Btn! : nama2Btn!
        let otherButton  = (tappedButton == nama1Btn) ? nama2Btn! : nama1Btn!

        if isCorrect {

            tappedButton.backgroundColor = .systemGreen
            rightOrWrongImgView.image = UIImage(named: "check mark")
            score += 1

        } else {

            tappedButton.backgroundColor = .systemRed
            rightOrWrongImgView.image = UIImage(named: "close")

            if otherButton.title(for: .normal) == q.correctAnswer {
                otherButton.backgroundColor = .systemGreen
            }
        }

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        
        nextBtn.isHidden = false
    }
    
    
    func resetOptionButtons() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white

        } else {

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()
        }
    }
    
    // MARK: - Option Buttons
    @IBAction func option1Tap(_ sender: UIButton) {
        if let text = sender.title(for: .normal) {
            handleAnswer(text)
        }
    }

    @IBAction func option2Tap(_ sender: UIButton) {
        if let text = sender.title(for: .normal) {
            handleAnswer(text)
        }
    }

    // MARK: - Submit / Next
    @IBAction func nextTapBtn(_ sender: UIButton) {

        guard hasAnswered else { return }

        currentIndex += 1

        if currentIndex < questions.count {
            loadQuestion()
        } else {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "PickTheCorrectOptionResultLevel2VC"
            ) as! PickTheCorrectOptionResultLevel2VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("Pick The Correct Option.pdf")

        view.layoutIfNeeded()

        // MARK: Capture imgBGView + Option Buttons
        var captureRect = imgBGView.superview!.convert(imgBGView.frame, to: view)

        captureRect = captureRect.union(
            nama1Btn.superview!.convert(nama1Btn.frame, to: view)
        )

        captureRect = captureRect.union(
            nama2Btn.superview!.convert(nama2Btn.frame, to: view)
        )

        captureRect = captureRect.insetBy(dx: -10, dy: -10)

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

        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842)

        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pageRect)

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                // Title
                let title = "Pick The Correct Option"
                let titleAttr: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 24)
                ]

                let titleSize = title.size(withAttributes: titleAttr)

                title.draw(
                    at: CGPoint(
                        x: (pageRect.width - titleSize.width) / 2,
                        y: 20
                    ),
                    withAttributes: titleAttr
                )

                // Subtitle
                let subtitle = ""
                let subtitleAttr: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 18)
                ]

                let subtitleSize = subtitle.size(withAttributes: subtitleAttr)

                subtitle.draw(
                    at: CGPoint(
                        x: (pageRect.width - subtitleSize.width) / 2,
                        y: 55
                    ),
                    withAttributes: subtitleAttr
                )

                let top: CGFloat = 100

                let scale = min(
                    (pageRect.width - 40) / image.size.width,
                    (pageRect.height - top - 20) / image.size.height
                )

                let width = image.size.width * scale
                let height = image.size.height * scale

                image.draw(
                    in: CGRect(
                        x: (pageRect.width - width) / 2,
                        y: top,
                        width: width,
                        height: height
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

        guard let pdfURL = createPDF() else { return }

        let activityVC = UIActivityViewController(
            activityItems: [pdfURL],
            applicationActivities: nil
        )

        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = sender
        }

        present(activityVC, animated: true)
    }
    
    
}
