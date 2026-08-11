//
//  CatVC.swift
//  Kids
//
//  Created by Koshal Singh on 06/02/26.
//

import LanguageManager_iOS
struct CatQuestion {
    let storyTitle: String
    let storyText: String
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let correctAnswer: String
}

struct CatResult {
    let sentence: String
    let selectedAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
}

import UIKit

class CatVC: BaseViewController {

    @IBOutlet weak var topBGView: UIView!
    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    @IBOutlet weak var allNameLalel: UILabel!
    @IBOutlet weak var nama1Btn: UIButton!
    @IBOutlet weak var nama2Btn: UIButton!
    @IBOutlet weak var nama3Btn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    var questions: [CatQuestion] = [

        CatQuestion(
            storyTitle: "Cat".localiz(),
            storyText: """
            This is a cat.
            The cat is yellow.
            It likes to drink milk.
            The cat sleeps on the mat.
            """.localiz(),
            question: "What does the cat like?".localiz(),
            option1: "Milk".localiz(),
            option2: "Water".localiz(),
            option3: "Juice".localiz(),
            correctAnswer: "Milk".localiz()
        ),

        CatQuestion(
            storyTitle: "Cat".localiz(),
            storyText: """
            This is a cat.
            The cat is yellow.
            It likes to drink milk.
            The cat sleeps on the mat.
            """.localiz(),
            question: "What color is the cat?".localiz(),
            option1: "Brown".localiz(),
            option2: "Black".localiz(),
            option3: "Yellow".localiz(),
            correctAnswer: "Yellow".localiz()
        ),

        CatQuestion(
            storyTitle: "Cat".localiz(),
            storyText: """
            This is a cat.
            The cat is yellow.
            It likes to drink milk.
            The cat sleeps on the mat.
            """.localiz(),
            question: "Is the cat yellow or black?".localiz(),
            option1: "Yellow".localiz(),
            option2: "Gray".localiz(),
            option3: "Black".localiz(),
            correctAnswer: "Yellow".localiz()
        ),

        CatQuestion(
            storyTitle: "Cat".localiz(),
            storyText: """
            This is a cat.
            The cat is yellow.
            It likes to drink milk.
            The cat sleeps on the mat.
            """.localiz(),
            question: "Where does the cat sleep?".localiz(),
            option1: "On the bed".localiz(),
            option2: "On the mat".localiz(),
            option3: "On the tree".localiz(),
            correctAnswer: "On the mat".localiz()
        ),

        CatQuestion(
            storyTitle: "Cat".localiz(),
            storyText: """
            This is a cat.
            The cat is yellow.
            It likes to drink milk.
            The cat sleeps on the mat.
            """.localiz(),
            question: "What animal is in the story?".localiz(),
            option1: "Fish".localiz(),
            option2: "Cat".localiz(),
            option3: "Dog".localiz(),
            correctAnswer: "Cat".localiz()
        )
    ]
    
    var currentIndex = 0
    var score = 0
    var hasAnswered = false
    var results: [CatResult] = []

    var defaultBGColor: UIColor?
    var defaultTextColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        
        scoreLabelBGView.layer.cornerRadius = 10
        imgBGView.layer.cornerRadius = 10
        topBGView.layer.cornerRadius = 10
     
        nama1Btn.layer.cornerRadius = 10
        nama2Btn.layer.cornerRadius = 10
        nama3Btn.layer.cornerRadius = 10

        defaultTextColor = nama1Btn.titleColor(for: .normal)

        nextBtn.isHidden = true
        loadQuestion()
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

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
        }
    }
    
    func resetButtons() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            nama1Btn.backgroundColor = .white
            nama2Btn.backgroundColor = .white
            nama3Btn.backgroundColor = .white

        } else {

            nama1Btn.backgroundColor = ColorManager.randomColor()
            nama2Btn.backgroundColor = ColorManager.randomColor()
            nama3Btn.backgroundColor = ColorManager.randomColor()
        }

        // ✅ Text hamesha black
        nama1Btn.setTitleColor(.black, for: .normal)
        nama2Btn.setTitleColor(.black, for: .normal)
        nama3Btn.setTitleColor(.black, for: .normal)

        defaultBGColor = nama1Btn.backgroundColor
        defaultTextColor = .black
    }

    
    func loadQuestion() {
        let q = questions[currentIndex]

        
        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        
        allNameLalel.text = q.question

        let options = [q.option1, q.option2, q.option3].shuffled()

        nama1Btn.setTitle(options[0], for: .normal)
        nama2Btn.setTitle(options[1], for: .normal)
        nama3Btn.setTitle(options[2], for: .normal)

        resetButtons()

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"

        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil
    }
    
    
    func handleAnswer(_ selected: String) {

        if hasAnswered { return }
        hasAnswered = true

        let q = questions[currentIndex]
        let isCorrect = (selected == q.correctAnswer)

        results.append(
            CatResult(
                sentence: q.question,   // ← yaha change karo
                selectedAnswer: selected,
                correctAnswer: q.correctAnswer,
                isCorrect: isCorrect
            )
        )

        let buttons = [nama1Btn, nama2Btn, nama3Btn]

        if isCorrect {
            score += 1
            rightOrWrongImgView.image = UIImage(named: "check mark")
        } else {
            rightOrWrongImgView.image = UIImage(named: "close")
        }

        for btn in buttons {
            if btn?.title(for: .normal) == selected {
                btn?.backgroundColor = isCorrect ? .systemGreen : .systemRed
                btn?.setTitleColor(.black, for: .normal)
            }

            if !isCorrect && btn?.title(for: .normal) == q.correctAnswer {
                btn?.backgroundColor = .systemGreen
                btn?.setTitleColor(.black, for: .normal)
            }
        }

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        
        nextBtn.isHidden = false
    }

    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("Cat Reading.pdf")

        let hiddenViews = [
            HeaderView,
            statusView,
            scoreLabelBGView,
            nextBtn
        ]

        hiddenViews.forEach { $0?.isHidden = true }

        view.layoutIfNeeded()

        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)

        let image = renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }

        hiddenViews.forEach { $0?.isHidden = false }

        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842)

        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pageRect)

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                let scale = min(
                    pageRect.width / image.size.width,
                    pageRect.height / image.size.height
                )

                let width = image.size.width * scale
                let height = image.size.height * scale

                let rect = CGRect(
                    x: (pageRect.width - width) / 2,
                    y: (pageRect.height - height) / 2,
                    width: width,
                    height: height
                )

                image.draw(in: rect)
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
    
    @IBAction func option3Tap(_ sender: UIButton) {
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
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "CatResultVC"
            ) as! CatResultVC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
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

