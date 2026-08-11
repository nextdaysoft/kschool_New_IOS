//
//  PickTheCorrectOptionVC.swift
//  Find Pair
//

import UIKit
import LanguageManager_iOS

struct PickQuestion {
    let imageName: String
    let sentence: String
    let option1: String
    let option2: String
    let correctAnswer: String
}

struct PickOptionResult {
    let fullSentence: String
    let isCorrect: Bool
}

class PickTheCorrectOptionLevel1VC: BaseViewController {

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
        PickQuestion(imageName: "cow", sentence: "A cow gives us".localiz(), option1: "Milk".localiz(), option2: "Juice".localiz(), correctAnswer: "Milk".localiz()),
        
        PickQuestion(imageName: "drink-water", sentence: "We drink".localiz(), option1: "Water".localiz(), option2: "Sand".localiz(), correctAnswer: "Water".localiz()),
        
        PickQuestion(imageName: "bird", sentence: "Bird can".localiz(), option1: "Fly".localiz(), option2: "Swim".localiz(), correctAnswer: "Fly".localiz()),
        
        PickQuestion(imageName: "cat", sentence: "A cat says".localiz(), option1: "Meow".localiz(), option2: "Moo".localiz(), correctAnswer: "Meow".localiz()),
        
        PickQuestion(imageName: "sun", sentence: "The sun is".localiz(), option1: "Cold".localiz(), option2: "Hot".localiz(), correctAnswer: "Hot".localiz()),
        
        PickQuestion(imageName: "grass", sentence: "The grass is".localiz(), option1: "Green".localiz(), option2: "Blue".localiz(), correctAnswer: "Green".localiz()),
        
        PickQuestion(imageName: "clown-fish", sentence: "Fish can".localiz(), option1: "Fly".localiz(), option2: "Swim".localiz(), correctAnswer: "Swim".localiz()),
        
        PickQuestion(imageName: "clouds", sentence: "The sky is".localiz(), option1: "Blue".localiz(), option2: "Green".localiz(), correctAnswer: "Blue".localiz()),
        
        PickQuestion(imageName: "eatSpoon", sentence: "We eat with a".localiz(), option1: "Spoon".localiz(), option2: "Pencil".localiz(), correctAnswer: "Spoon".localiz()),
        
        PickQuestion(imageName: "writting", sentence: "We write with a".localiz(), option1: "Pencil".localiz(), option2: "Spoon".localiz(), correctAnswer: "Pencil".localiz())
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

        // QUESTION SHUFFLE
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

    func resetOptionButtons() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            [nama1Btn, nama2Btn].forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let colors = [
                ColorManager.randomColor(),
                ColorManager.randomColor()
            ]

            let buttons = [nama1Btn, nama2Btn]

            for (button, color) in zip(buttons, colors) {
                button?.backgroundColor = color
            }
        }
    }
    
    
    // MARK: - Load Question
    func loadQuestion() {

        let q = questions[currentIndex]

        allImgs.image = UIImage(named: q.imageName)
        allNameLalel.text = "\(q.sentence) _ _ _."

        // OPTION SHUFFLE
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

    func handleAnswer(_ selected: String) {

        if hasAnswered { return }

        hasAnswered = true

        let q = questions[currentIndex]

        allNameLalel.text = "\(q.sentence) \(selected)."

        let isCorrect = (selected == q.correctAnswer)

        let fullSentence = "\(q.sentence) \(selected)."

        let result = PickOptionResult(
            fullSentence: fullSentence,
            isCorrect: isCorrect
        )

        results.append(result)

        resetOptionButtons()

        let tappedButton = (nama1Btn.title(for: .normal) == selected)
            ? nama1Btn!
            : nama2Btn!

        let otherButton = (tappedButton == nama1Btn)
            ? nama2Btn!
            : nama1Btn!

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
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

    // MARK: - Next
    @IBAction func nextTapBtn(_ sender: UIButton) {

        guard hasAnswered else { return }

        currentIndex += 1

        if currentIndex < questions.count {

            loadQuestion()

        } else {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let vc = storyboard.instantiateViewController(
                withIdentifier: "PickTheCorrectOptionResultLevel1VC"
            ) as! PickTheCorrectOptionResultLevel1VC

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
