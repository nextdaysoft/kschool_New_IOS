//
//  PickTheCorrectSpellingLevel6VC.swift
//  Kids
//
//  Created by Koshal Singh on 31/01/26.
//

import UIKit
import LanguageManager_iOS

class PickTheCorrectSpellingLevel6VC: BaseViewController {

   
    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!

    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var btn1BGViiew: UIView!
    @IBOutlet weak var btn2BGViiew: UIView!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    // MARK: - Data
    var questions = [
        ("soffa", "sofa", "sofa"),
        ("table", "tabel", "table"),
        ("plate", "platt", "plate"),
        ("dor", "door", "door"),
        ("chair", "chare", "chair"),
        ("lamp", "lamp", "lamp"),
        ("fan", "fann", "fan"),
        ("window", "windoe", "window"),
        ("kup", "cup", "cup"),
        ("bedd", "bed", "bed"),
    ]
    
    let bgColors: [UIColor] = [
        .systemBlue,
        .systemPurple,
        .systemTeal,
        .systemOrange,
        .systemPink,
        .systemIndigo,
        .systemGreen,
        .systemRed,
        .brown,
        .cyan
    ]

    var currentIndex = 0
    var score = 0
    var correctAnswer = ""
    var results: [PickSpellingResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        
        questions.shuffle()

        imgBGView.layer.cornerRadius = 10
        btn1BGViiew.layer.cornerRadius = 10
        btn2BGViiew.layer.cornerRadius = 10

        option1Btn.layer.cornerRadius = 10
        option2Btn.layer.cornerRadius = 10

        scoreLabelBGView.layer.cornerRadius = 10

        // iOS 15+ ke liye
        if #available(iOS 15.0, *) {
            option1Btn.configuration = nil
            option2Btn.configuration = nil
        }

        setupUI()
        loadQuestion()
        animateButtons()
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

            option1Btn.backgroundColor = .white
            option2Btn.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            
            option1Btn.backgroundColor = ColorManager.randomColor()
            option2Btn.backgroundColor = ColorManager.randomColor()

           
        }
    }
    
    // MARK: - Load Question
    func loadQuestion() {

        let data = questions[currentIndex]

        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        correctAnswer = data.2

        option1Btn.setTitle(data.0, for: .normal)
        option2Btn.setTitle(data.1, for: .normal)

        resetButtons()
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup
    func setupUI() {
        nextBtn.isHidden = true
        rightOrWrongImgView.isHidden = true
        scoreLabel.text = "Score: 1 / 10"
    }

    func checkAnswer(selected: UIButton) {

        option1Btn.isUserInteractionEnabled = false
        option2Btn.isUserInteractionEnabled = false

        rightOrWrongImgView.isHidden = false
        nextBtn.isHidden = false

        let selectedText = selected.title(for: .normal) ?? ""
        let isCorrect = (selectedText == correctAnswer)

        let result = PickSpellingResult(
            selectedWord: selectedText,
            correctWord: correctAnswer,
            isCorrect: isCorrect
        )

        results.append(result)

        if isCorrect {

            score += 1
            rightOrWrongImgView.image = UIImage(named: "check mark")

            selected.backgroundColor = .systemGreen

        } else {

            rightOrWrongImgView.image = UIImage(named: "close")

            selected.backgroundColor = .systemRed

            let correctButton = (option1Btn.title(for: .normal) == correctAnswer)
                ? option1Btn
                : option2Btn

            correctButton?.backgroundColor = .systemGreen
        }

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
    }
    
    // MARK: - Reset
    func resetButtons() {

        option1Btn.backgroundColor = ColorManager.randomColor()
        option2Btn.backgroundColor = ColorManager.randomColor()

        option1Btn.isUserInteractionEnabled = true
        option2Btn.isUserInteractionEnabled = true

        nextBtn.isHidden = true
        rightOrWrongImgView.isHidden = true
    }
    
    // MARK: - Animation
    func animateButtons() {

        // Right side ke bahar se start
        btn1BGViiew.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        btn2BGViiew.transform = CGAffineTransform(translationX: view.frame.width, y: 0)

        UIView.animate(
            withDuration: 1.2,              // ⏳ slow
            delay: 0,
            usingSpringWithDamping: 0.95,   // 🧈 very smooth
            initialSpringVelocity: 0.2,     // 🐢 slow movement
            options: [.curveEaseOut]
        ) {
            self.btn1BGViiew.transform = .identity
            self.btn2BGViiew.transform = .identity
        }
    }
    
    // MARK: - Button Actions
    @IBAction func option1Tap(_ sender: UIButton) {
        checkAnswer(selected: sender)
    }

    @IBAction func option2Tap(_ sender: UIButton) {
        checkAnswer(selected: sender)
    }
    
    // MARK: - Next Button
    @IBAction func nextTapBtn(_ sender: UIButton) {
        currentIndex += 1

        if currentIndex < questions.count {
            loadQuestion()
            animateButtons()
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "PickTheCorrectSpellingResultLevel6VC"
            ) as! PickTheCorrectSpellingResultLevel6VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("Pick The Correct Spelling.pdf")

        view.layoutIfNeeded()

        // Sirf imgBGView ka screenshot
        let renderer = UIGraphicsImageRenderer(size: imgBGView.bounds.size)

        let image = renderer.image { _ in
            imgBGView.drawHierarchy(in: imgBGView.bounds, afterScreenUpdates: true)
        }

        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842)

        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pageRect)

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                // Title
                let title = "Pick The Correct Spelling"
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

                // imgBGView
                let top: CGFloat = 100

                let scale = min(
                    (pageRect.width - 40) / image.size.width,
                    (pageRect.height - top - 20) / image.size.height
                )

                let width = image.size.width * scale
                let height = image.size.height * scale

                image.draw(in: CGRect(
                    x: (pageRect.width - width) / 2,
                    y: top,
                    width: width,
                    height: height
                ))
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
