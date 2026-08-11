//
//  WordMath.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 20/01/26.
//
//struct QuestionResultsLevel1 {
//    let formedWord: String
//    let correctWord: String
//    let isCorrect: Bool
//}

import UIKit
import LanguageManager_iOS
enum ActiveAnswer {
    case first
    case second
    case third
}
enum LevelType {
    case one, two, three, four
}

class WordMath: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!
    @IBOutlet weak var scoreMainView: UIView!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var keyPad: UICollectionView!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var bfafterView: UIView!
    @IBOutlet weak var mppView: UIView!
    @IBOutlet weak var lblAnswer: UILabel!
    @IBOutlet weak var lblans: UILabel!
    @IBOutlet weak var lblans2: UILabel!
    @IBOutlet weak var secondPlus: UILabel!
    @IBOutlet weak var thirdPlus: UILabel!
    @IBOutlet weak var fourthPlus: UILabel!
    @IBOutlet weak var equalLbl: UILabel!
    // question images for level one
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var thirdImg: UIImageView!
    @IBOutlet weak var fourthImg: UIImageView!
    @IBOutlet weak var fifthImg: UIImageView!
    @IBOutlet weak var sixthImg: UIImageView!
    @IBOutlet weak var seventhImg: UIImageView!
    @IBOutlet weak var eighthImg: UIImageView!
    @IBOutlet weak var ninthImg: UIImageView!
    @IBOutlet weak var tenthImg: UIImageView!
    @IBOutlet weak var eleventhImg: UIImageView!
    @IBOutlet weak var twelfthImg: UIImageView!
    @IBOutlet weak var imgLbl: UILabel!
    @IBOutlet weak var imgLbl2: UILabel!
    @IBOutlet weak var imgLbl3: UILabel!
    @IBOutlet weak var ansView: UIView!
    @IBOutlet weak var ansViewv: UIView!
    @IBOutlet weak var ansViewvv: UIView!
    @IBOutlet weak var thcenterPlus: UILabel!
    @IBOutlet weak var thequal: UILabel!
    @IBOutlet weak var mainThirdView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    // MARK: Variable
    private var keys: [KeypadItem] = []
    private var correctAnswer: Int = 0
    private var userInput: String = ""
    private var score: Int = 0
    private var isAnswered = false
    private var questionIndex: Int = 1
    private let totalQuestions = 10
    private var leftNumber: Int = 0
    private var rightNumber: Int = 0
    private var mode: ScreenModes = .keypad
    private var results: [AddSubResult] = []
    private var correctAnswer1: Int = 0
    private var correctAnswer2: Int = 0
    private var correctAnswer3: Int = 0

    private var activeAnswer: ActiveAnswer = .first

    //
    private var currentLevel: LevelType = .one
    private let maxDigits = 2

  //  private var activeAnswer: ActiveAnswer = .first
    private let imageBank: [ImageValueItem] = [
        ImageValueItem(imageName: "BatImg", value: 0),
        ImageValueItem(imageName: "dog", value: 0),
        ImageValueItem(imageName: "cat", value: 0),
        ImageValueItem(imageName: "banana", value: 0),
        ImageValueItem(imageName: "rabbit", value: 0),
        ImageValueItem(imageName: "ice-cream", value: 0),
        ImageValueItem(imageName: "bird", value: 0),
        ImageValueItem(imageName: "elephant", value: 0),
        ImageValueItem(imageName: "babyElephant", value: 0),
        ImageValueItem(imageName: "heart", value: 0),
        ImageValueItem(imageName: "flower", value: 0),
        ImageValueItem(imageName: "nest", value: 0),
        ImageValueItem(imageName: "milk", value: 0),
        ImageValueItem(imageName: "mango", value: 0),
        ImageValueItem(imageName: "monkey", value: 0),
        ImageValueItem(imageName: "butterfly", value: 0),
        ImageValueItem(imageName: "apple", value: 0)
    ]
    var selectedLevel: LevelType = .one
    var questionResults: [WordMathResultItem] = []
    
    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()

        setupKeys()
        setupCollectionView()
        generateQuestion()
        updateAnswerColors()
        setupAnswerSelection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    func showCorrectWrongAnswers() {

        showAnswer(
            label: lblAnswer,
            userValue: Int(lblAnswer.text ?? "") ?? 0,
            correctValue: correctAnswer1
        )

        showAnswer(
            label: lblans,
            userValue: Int(lblans.text ?? "") ?? 0,
            correctValue: correctAnswer2
        )

        if currentLevel == .three || currentLevel == .four {

            showAnswer(
                label: lblans2,
                userValue: Int(lblans2.text ?? "") ?? 0,
                correctValue: correctAnswer3
            )
        }
    }
    
    func showAnswer(label: UILabel,
                    userValue: Int,
                    correctValue: Int) {

        if userValue == correctValue {

            label.attributedText = nil
            label.text = "\(correctValue)"
            label.textColor = .systemGreen

        } else {

            let wrong = NSAttributedString(
                string: "\(userValue)",
                attributes: [
                    .foregroundColor: UIColor.systemRed,
                    .strikethroughStyle: NSUnderlineStyle.single.rawValue
                ]
            )

            let correct = NSAttributedString(
                string: " \(correctValue)",
                attributes: [
                    .foregroundColor: UIColor.systemGreen
                ]
            )

            let final = NSMutableAttributedString()
            final.append(wrong)
            final.append(correct)

            label.attributedText = final
        }
    }
    
    // MARK: Function
    func setupAnswerSelection() {

        lblAnswer.isUserInteractionEnabled = true
        lblans.isUserInteractionEnabled = true
        lblans2.isUserInteractionEnabled = true

        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectFirstAnswer))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectSecondAnswer))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(selectThirdAnswer))

        lblAnswer.addGestureRecognizer(tap1)
        lblans.addGestureRecognizer(tap2)
        lblans2.addGestureRecognizer(tap3)
    }
    
    @objc func selectFirstAnswer() {
        activeAnswer = .first
        updateAnswerColors()
    }

    @objc func selectSecondAnswer() {
        activeAnswer = .second
        updateAnswerColors()
    }

    @objc func selectThirdAnswer() {

        if currentLevel == .three || currentLevel == .four {
            activeAnswer = .third
            updateAnswerColors()
        }
    }
    
    // MARK: CHATGPT
    func setupLevelOne(A: ImageValueItem, B: ImageValueItem) {

        firstImg.image = UIImage(named: A.imageName)
        secondImg.image = UIImage(named: B.imageName)

        thirdImg.image = UIImage(named: B.imageName)
        fourthImg.image = UIImage(named: B.imageName)

        fifthImg.image = UIImage(named: A.imageName)
        sixthImg.image = UIImage(named: B.imageName)

        correctAnswer1 = A.value + B.value
        correctAnswer2 = B.value * 2

        imgLbl.text = "\(A.value)"
        imgLbl2.text = "\(B.value)"

        [firstImg, secondImg, thirdImg, fourthImg, fifthImg, sixthImg]
            .forEach { $0?.isHidden = false }
    }
    func setupLevelTwo(A: ImageValueItem, B: ImageValueItem, C: ImageValueItem) {

        // Row 1
        firstImg.image = UIImage(named: A.imageName)
        secondImg.image = UIImage(named: B.imageName)

        // Row 2
        thirdImg.image = UIImage(named: A.imageName)
        fourthImg.image = UIImage(named: B.imageName)

        // Row 3
        fifthImg.image = UIImage(named: A.imageName)
        sixthImg.image = UIImage(named: C.imageName)

        // Bottom reference
        tenthImg.image = UIImage(named: A.imageName)
        eleventhImg.image = UIImage(named: B.imageName)
        twelfthImg.image = UIImage(named: C.imageName)

        correctAnswer1 = A.value + B.value
        correctAnswer2 = A.value + B.value
        correctAnswer3 = A.value + C.value

        imgLbl.text = "\(A.value)"
        imgLbl2.text = "\(B.value)"
        imgLbl3.text = "\(C.value)"

        [
            firstImg, secondImg,
            thirdImg, fourthImg,
            fifthImg, sixthImg,
            tenthImg, eleventhImg, twelfthImg
        ].forEach { $0?.isHidden = false }
    }

    func setupLevelThree(A: ImageValueItem, B: ImageValueItem, C: ImageValueItem) {

        firstImg.image = UIImage(named: A.imageName)
        secondImg.image = UIImage(named: B.imageName)

        thirdImg.image = UIImage(named: A.imageName)
        fourthImg.image = UIImage(named: C.imageName)

        seventhImg.image = UIImage(named: B.imageName)
        eighthImg.image = UIImage(named: C.imageName)

        fifthImg.image = UIImage(named: A.imageName)
        sixthImg.image = UIImage(named: B.imageName)
        twelfthImg.image = UIImage(named: C.imageName)

        correctAnswer1 = A.value + B.value
        correctAnswer2 = A.value + C.value
        correctAnswer3 = B.value + C.value

        imgLbl.text = "\(A.value)"
        imgLbl2.text = "\(B.value)"
        imgLbl3.text = "\(C.value)"

        [
            firstImg, secondImg,
            thirdImg, fourthImg,
            seventhImg, eighthImg,
            fifthImg, sixthImg, twelfthImg
        ].forEach { $0?.isHidden = false }
    }
    
    func setupLevelFour(A: ImageValueItem, B: ImageValueItem, C: ImageValueItem) {

        firstImg.image = UIImage(named: A.imageName)
        secondImg.image = UIImage(named: B.imageName)
        thirdImg.image = UIImage(named: A.imageName)

        fourthImg.image = UIImage(named: C.imageName)
        fifthImg.image = UIImage(named: B.imageName)
        sixthImg.image = UIImage(named: C.imageName)

        seventhImg.image = UIImage(named: A.imageName)
        eighthImg.image = UIImage(named: C.imageName)
        ninthImg.image = UIImage(named: B.imageName)

        tenthImg.image = UIImage(named: A.imageName)
        eleventhImg.image = UIImage(named: B.imageName)
        twelfthImg.image = UIImage(named: C.imageName)

        correctAnswer1 = A.value + B.value + A.value
        correctAnswer2 = C.value + B.value + C.value
        correctAnswer3 = A.value + C.value + B.value

        imgLbl.text = "\(A.value)"
        imgLbl2.text = "\(B.value)"
        imgLbl3.text = "\(C.value)"

        [
            firstImg, secondImg, thirdImg,
            fourthImg, fifthImg, sixthImg,
            seventhImg, eighthImg, ninthImg,
            tenthImg, eleventhImg, twelfthImg
        ].forEach { $0?.isHidden = false }
    }


    func configureUI(for level: LevelType) {

        // Hide everything first
        [
            secondPlus, thirdPlus, fourthPlus,
            equalLbl, thcenterPlus, thequal,
            mainThirdView
        ].forEach { $0?.isHidden = true }

        ansView.isHidden = true
        ansViewv.isHidden = true
        ansViewvv.isHidden = true

        imgLbl.isHidden = true
        imgLbl2.isHidden = true
        imgLbl3.isHidden = true

        // ---------- LEVEL 1 (IMAGE 1) ----------
        if level == .one {

            // Only 2 rows, 2 answers
            ansView.isHidden = false
            ansViewv.isHidden = false

            // No extra plus or equals
            imgLbl.isHidden = false
            imgLbl2.isHidden = false
        }

        // ---------- LEVEL 2 (IMAGE 2) ----------
        else if level == .two {

            // 3 rows, but ONLY 2 answers
            ansView.isHidden = false
            ansViewv.isHidden = false

            secondPlus.isHidden = false
            thirdPlus.isHidden = false
            equalLbl.isHidden = false

            imgLbl.isHidden = false
            imgLbl2.isHidden = false
            imgLbl3.isHidden = false
        }

        // ---------- LEVEL 3 (IMAGE 3) ----------
        else if level == .three {

            ansView.isHidden = false
            ansViewv.isHidden = false
            ansViewvv.isHidden = false   // try this

            imgLbl.isHidden = false
            imgLbl2.isHidden = false
            imgLbl3.isHidden = false

            mainThirdView.isHidden = false
            thequal.isHidden = false
            thcenterPlus.isHidden = false
        }

        // ---------- LEVEL 4 (FULL) ----------
        else {

            // 3 rows, 3 answers
            ansView.isHidden = false
            ansViewv.isHidden = false
            ansViewvv.isHidden = false

            secondPlus.isHidden = false
            thirdPlus.isHidden = false
            fourthPlus.isHidden = false
            equalLbl.isHidden = false

            thcenterPlus.isHidden = false
            thequal.isHidden = false
            mainThirdView.isHidden = false

            imgLbl.isHidden = false
            imgLbl2.isHidden = false
            imgLbl3.isHidden = false
        }
    }


    //
    func resetUIForAllLevels() {

        // Hide all images
        let images = [
            firstImg, secondImg, thirdImg, fourthImg,
            fifthImg, sixthImg, seventhImg, eighthImg,
            ninthImg, tenthImg, eleventhImg, twelfthImg
        ]
        images.forEach { $0?.isHidden = true }

        // Hide all symbols
        [secondPlus, thirdPlus, fourthPlus, equalLbl].forEach {
            $0?.isHidden = true
        }

        // Hide answer views
        ansView.isHidden = true
        ansViewv.isHidden = true
        ansViewvv.isHidden = true

        // Hide value labels
        imgLbl.isHidden = true
        imgLbl2.isHidden = true
        imgLbl3.isHidden = true
    }
    
    func generateQuestion() {

        // RESET STATE
        isAnswered = false
        btnNext.isHidden = true
        resultImage.isHidden = true

        lblAnswer.attributedText = nil
        lblans.attributedText = nil
        lblans2.attributedText = nil

        lblAnswer.textColor = .label
        lblans.textColor = .label
        lblans2.textColor = .label

        lblAnswer.text = ""
        lblans.text = ""
        lblans2.text = ""

        activeAnswer = .first
        updateAnswerColors()

        resetUIForAllLevels()

      
        lblQuestionNumber.text = "\("Question".localiz()) \(questionIndex)"
        // PICK RANDOM IMAGES
        let shuffled = imageBank.shuffled()

        let imageA = shuffled[0]
        let imageB = shuffled[1]
        let imageC = shuffled[2]

        // RANDOM VALUES (SMALL VALUES)
        let valueA = Int.random(in: 1...5)

        var valueB = Int.random(in: 1...5)
        while valueB == valueA {
            valueB = Int.random(in: 1...5)
        }

        var valueC = Int.random(in: 1...5)
        while valueC == valueA || valueC == valueB {
            valueC = Int.random(in: 1...5)
        }

        currentLevel = selectedLevel

        configureUI(for: currentLevel)

        switch currentLevel {

        case .one:
            setupLevelOne(
                A: ImageValueItem(imageName: imageA.imageName, value: valueA),
                B: ImageValueItem(imageName: imageB.imageName, value: valueB)
            )

        case .two:
            setupLevelTwo(
                A: ImageValueItem(imageName: imageA.imageName, value: valueA),
                B: ImageValueItem(imageName: imageB.imageName, value: valueB),
                C: ImageValueItem(imageName: imageC.imageName, value: valueC)
            )

        case .three:
            setupLevelThree(
                A: ImageValueItem(imageName: imageA.imageName, value: valueA),
                B: ImageValueItem(imageName: imageB.imageName, value: valueB),
                C: ImageValueItem(imageName: imageC.imageName, value: valueC)
            )

        case .four:
            setupLevelFour(
                A: ImageValueItem(imageName: imageA.imageName, value: valueA),
                B: ImageValueItem(imageName: imageB.imageName, value: valueB),
                C: ImageValueItem(imageName: imageC.imageName, value: valueC)
            )
        }
    }
    
    func updateAnswerColors() {

        let activeColor: UIColor

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {
            activeColor = ColorManager.randomColor()
        } else {
            activeColor = HeaderView.backgroundColor ?? ColorManager.randomColor()
        }

        // ✅ RESET ALL
        ansView.backgroundColor = .white
        ansViewv.backgroundColor = .white
        ansViewvv.backgroundColor = .white

        // ✅ ACTIVE ONLY
        switch activeAnswer {

        case .first:
            ansView.backgroundColor = activeColor

        case .second:
            ansViewv.backgroundColor = activeColor

        case .third:
            ansViewvv.backgroundColor = activeColor
        }
    }
    func appendDigit(_ digit: String, to label: UILabel) {
        let text = label.text ?? ""
        if text.count < maxDigits {
            label.text = text + digit
        }
    }

    func checkAnswer() {

        let a1 = Int(lblAnswer.text ?? "")
        let a2 = Int(lblans.text ?? "")
        let a3 = Int(lblans2.text ?? "")

        isAnswered = true
        var isCorrect = false

        switch currentLevel {

        case .one, .two:
            guard let x = a1, let y = a2 else { return }
            isCorrect = (x == correctAnswer1 && y == correctAnswer2)

        case .three:
            guard let x = a1,
                  let y = a2,
                  let z = a3 else { return }

            isCorrect = (x == correctAnswer1 &&
                         y == correctAnswer2 &&
                         z == correctAnswer3)

        case .four:
            guard let x = a1,
                  let y = a2,
                  let z = a3 else { return }

            isCorrect = (x == correctAnswer1 &&
                         y == correctAnswer2 &&
                         z == correctAnswer3)
        }

        // 🔥 ADD HERE
        let q1 = "\(imgLbl.text ?? "0") + \(imgLbl2.text ?? "0") = \(correctAnswer1)"
        let q2 = "\(imgLbl.text ?? "0") + \(imgLbl2.text ?? "0") = \(correctAnswer2)"

        var q3 = ""

        if currentLevel == .three || currentLevel == .four {
            q3 = "\(imgLbl2.text ?? "0") + \(imgLbl3.text ?? "0") = \(correctAnswer3)"
        }

        let result = WordMathResultItem(
            question1: q1,
            question2: q2,
            question3: q3,
            isCorrect: isCorrect
        )

        questionResults.append(result)
        
        updateResult(isCorrect: isCorrect)
        showCorrectWrongAnswers()
    }
    
    func updateResult(isCorrect: Bool) {

        if isCorrect {
            score += 1
            resultImage.image = UIImage(named: "check mark")
            resultImage.tintColor = .systemGreen
        } else {
            resultImage.image = UIImage(named: "close")
            resultImage.tintColor = .systemRed
        }

        scorelbl.text = "\("Score".localiz()): \(score) / \(questionIndex)"
        resultImage.isHidden = false
    }

    func checkSubmitVisibility() {

        let has1 = !(lblAnswer.text?.isEmpty ?? true)
        let has2 = !(lblans.text?.isEmpty ?? true)
        let has3 = !(lblans2.text?.isEmpty ?? true)

        if currentLevel == .three || currentLevel == .four {
            btnNext.isHidden = !(has1 && has2 && has3)
        } else {
            btnNext.isHidden = !(has1 && has2)
        }
    }

    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        mppView.layer.cornerRadius = 6
        resultImage.isHidden = true
        btnNext.isHidden = true
        scorelbl.text = "\("Score".localiz()): \(score) / \(questionIndex)"
        lblQuestionNumber.text = "\("Question".localiz()) \(questionIndex)"
        scoreView.layer.cornerRadius = 6
        keyPad.dataSource = self
        keyPad.delegate = self
        collView.dataSource = self
        collView.delegate = self
        collView.isHidden = true
        ansView.layer.cornerRadius = 6
        ansViewv.layer.cornerRadius = 6
        ansViewvv.layer.cornerRadius = 6
        btnNext.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white
            btnNext.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
            btnNext.backgroundColor = color
        }

        // ✅ इनको WhiteTheme से कभी change नहीं करना
        ansView.backgroundColor = ColorManager.randomColor()
        ansViewv.backgroundColor = ColorManager.randomColor()
        ansViewvv.backgroundColor = ColorManager.randomColor()
    }
    
    
    func addShadow(to view: UIView) {
        view.layer.cornerRadius = 6           // match your design
        view.layer.masksToBounds = false       // ⭐ IMPORTANT
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 8
        // ⭐ Performance optimization
        view.layer.shadowPath = UIBezierPath(
            roundedRect: view.bounds,
            cornerRadius: view.layer.cornerRadius
        ).cgPath
    }
    
    // Set up keys
    func setupKeys() {
        
        keys = [
            KeypadItem(title: "1", color: ColorManager.randomColor()),
            KeypadItem(title: "2", color: ColorManager.randomColor()),
            KeypadItem(title: "3", color: ColorManager.randomColor()),
            KeypadItem(title: "4", color: ColorManager.randomColor()),
            KeypadItem(title: "5", color: ColorManager.randomColor()),
            KeypadItem(title: "6", color: ColorManager.randomColor()),

            KeypadItem(title: "7", color: ColorManager.randomColor()),
            KeypadItem(title: "8", color: ColorManager.randomColor()),
            KeypadItem(title: "9", color: ColorManager.randomColor()),
            KeypadItem(title: "0", color: ColorManager.randomColor()),
            KeypadItem(title: "X", color: .red)
        ]
    }
    // collection Flow layout / Height
    private func setupCollectionView() {
        if let layout = keyPad.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical      // ⭐ IMPORTANT
                layout.minimumLineSpacing = 12
                layout.minimumInteritemSpacing = 12
                layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
                layout.estimatedItemSize = .zero           // ⭐ VERY IMPORTANT
            }
        keyPad.showsHorizontalScrollIndicator = false
        if let layout = collView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical      // ⭐ IMPORTANT
                layout.minimumLineSpacing = 12
                layout.minimumInteritemSpacing = 12
                layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
                layout.estimatedItemSize = .zero           // ⭐ VERY IMPORTANT
            }
        collView.showsHorizontalScrollIndicator = false
    }

    func goToResultScreen() {

        let vc = storyboard?.instantiateViewController(withIdentifier: "WordMathResultVC") as! WordMathResultVC

        vc.results = questionResults
        vc.finalScore = score

        // 👇 pass level info
        switch selectedLevel {
        case .one:
            vc.screenTitleText = "WordMath Level one"
        case .two:
            vc.screenTitleText = "WordMath Level two"
        case .three:
            vc.screenTitleText = "WordMath Level three"
        case .four:
            vc.screenTitleText = "WordMath Level four"
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Action
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {

        // 🔹 STEP 1: SUBMIT ANSWER
        if !isAnswered {

            checkAnswer()   // 👉 this already stores result also

            sender.setTitle("Next", for: .normal)
            return
        }

        // 🔹 STEP 2: MOVE TO NEXT QUESTION
        questionIndex += 1

        // 🔹 STEP 3: IF ALL QUESTIONS DONE → GO TO RESULT
        if questionIndex > totalQuestions {

            goToResultScreen()
            return
        }

        // 🔹 STEP 4: RESET FOR NEXT QUESTION
        sender.setTitle("Submit", for: .normal)
        generateQuestion()
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("WordMath.pdf")

        view.layoutIfNeeded()

        // Hide unwanted views
        let hiddenViews: [UIView] = [
            HeaderView,
            statusView,
            backBtn,
            lblTitle,
            lblQuestionNumber,
            lblQuestion,
            scoreView,
            scoreMainView,
            btnNext,
            keyPad,
            pdfBtn
        ]

        hiddenViews.forEach { $0.isHidden = true }

        view.layoutIfNeeded()

        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)

        let image = renderer.image { _ in
            view.drawHierarchy(
                in: view.bounds,
                afterScreenUpdates: true
            )
        }

        // Show hidden views again
        hiddenViews.forEach { $0.isHidden = false }

        view.layoutIfNeeded()

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

                // ==========================
                // Title
                // ==========================

                let title = "Fill in the boxes. The value of each fruit is given at the bottom."

                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = .center

                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 22),
                    .foregroundColor: UIColor.black,
                    .paragraphStyle: paragraph
                ]

                (title as NSString).draw(
                    with: CGRect(
                        x: 20,
                        y: 20,
                        width: pageWidth - 40,
                        height: 70
                    ),
                    options: [
                        .usesLineFragmentOrigin,
                        .usesFontLeading
                    ],
                    attributes: attributes,
                    context: nil
                )

                // ==========================
                // Image
                // ==========================

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
                        y: 100,
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
    
}
extension WordMath: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        if collectionView == keyPad {
            return keys.count
        }

        // collView
        return results.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // 🔹 KEYPAD COLLECTION VIEW
        if collectionView == keyPad {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "KeypadCell",
                for: indexPath
            ) as! KeypadCell

            cell.configure(item: keys[indexPath.item])
            return cell
        }

        // 🔹 RESULT COLLECTION VIEW
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ResultCell3",
            for: indexPath
        ) as! ResultCell3

        let data = results[indexPath.item]
        cell.configureone(result: data)
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        guard collectionView == keyPad, !isAnswered else { return }

        let key = keys[indexPath.item].title

        // BACKSPACE
        if key == "X" {

            switch activeAnswer {

            case .first:
                lblAnswer.removeLastSafe()

            case .second:
                lblans.removeLastSafe()

            case .third:
                lblans2.removeLastSafe()
            }

            checkSubmitVisibility()
            return
        }

        // INPUT
        switch activeAnswer {

        case .first:
            appendDigit(key, to: lblAnswer)

        case .second:
            appendDigit(key, to: lblans)

        case .third:
            appendDigit(key, to: lblans2)
        }

        checkSubmitVisibility()
    }

}
extension UILabel {
    func removeLastSafe() {
        guard let text = self.text, !text.isEmpty else { return }
        self.text = String(text.dropLast())
    }
}
extension WordMath: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == keyPad {
            
            let columns: CGFloat = 6
            
            let spacing: CGFloat = 8     // 👈 thoda kam gap
            let sectionInset: CGFloat = 10  // 👈 LEFT + RIGHT = 5
            
            let totalSpacing = (columns - 1) * spacing + sectionInset * 2
            
            let width = (collectionView.bounds.width - totalSpacing) / columns
            
            return CGSize(width: width, height: 35) // 👈 height thodi increase
        }

        // Result cells
        let columns: CGFloat = 2
        let spacing: CGFloat = 12
        let sectionInset: CGFloat = 12
        let totalPadding = (columns - 1) * spacing + sectionInset * 2
        let width = (collectionView.bounds.width - totalPadding) / columns
        return CGSize(width: width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView == keyPad {
            return UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5) // 👈 EXACT FIX
        }

        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView == collView ? 12 : 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView == collView ? 12 : 8
    }

}
struct ImageValueItem {
    let imageName: String
    let value: Int
}

struct WordMathResultItem {
    let question1: String
    let question2: String
    let question3: String
    let isCorrect: Bool
}
