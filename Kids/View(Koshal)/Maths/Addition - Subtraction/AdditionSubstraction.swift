//
//  AdditionSubstraction.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 19/01/26.
//
struct PDFQuestion {
    let left: Int
    let right: Int
    let isPlus: Bool
}

import UIKit
import LanguageManager_iOS

class AdditionSubstraction: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblleft: UILabel!
    @IBOutlet weak var lblright: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    @IBOutlet weak var centerlbl: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!
    @IBOutlet weak var scoreMainView: UIView!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var keyPad: UICollectionView!
    @IBOutlet weak var bfafterView: UIView!
    @IBOutlet weak var mppView: UIView!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var scoreViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
     
    // MARK: Variable
    private var keys: [KeypadItem] = []
    var isPlus = false // true → after, false → before
    var screenTitle = ""
    private var correctAnswer: Int = 0
    private var userInput: String = ""
    private var score: Int = 0
    private var isAnswered = false
    private var questionIndex: Int = 1
    private let totalQuestions = 10
    private var leftNumber: Int = 0
    private var rightNumber: Int = 0
    private var correctSymbol: String = ""
    private var mode: ScreenModes = .keypad
    private var results: [AddSubResult] = []
    private var originalScoreTopConstant: CGFloat = 0

    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
        setupKeys()
        setupCollectionView()
        generateQuestion()
        originalScoreTopConstant = scoreViewTopConstraint.constant
        btnNext.layer.cornerRadius = 6
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    // MARK: Function
    // set up ui
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        lblTitle.text = screenTitle
        lblQuestion.text = isPlus
        ? "Add the number".localiz()
        : "Subtract the number".localiz()
        //addShadow(to: bfafterView)
        mppView.layer.cornerRadius = 10
        resultImage.isHidden = true
        //
        btnNext.isHidden = true
        scorelbl.text = "\("Score".localiz()): \(score) / \(questionIndex)"
        lblQuestionNumber.text = "\("Question".localiz()) \(questionIndex)"
        scoreView.layer.cornerRadius = 6

        //
        keyPad.dataSource = self
        keyPad.delegate = self
        collView.dataSource = self
        collView.delegate = self

        collView.isHidden = true
    }
    func addShadow(to view: UIView) {
        view.layer.cornerRadius = 10           // match your design
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
            KeypadItem(title: "X", color: .systemRed)
        ]
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

        setupKeys()
        keyPad.reloadData()
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
//    func reloadCollectionHeight() {
//           DispatchQueue.main.async {
//               self.collHeight.constant =
//                   self.collView.collectionViewLayout.collectionViewContentSize.height
//           }
//       }
    func reloadCollectionHeight() {

        DispatchQueue.main.async {

            // Force layout before reading size
            self.collView.layoutIfNeeded()

            let collectionHeight =
                self.collView.collectionViewLayout.collectionViewContentSize.height

            // Update collection height
            self.collHeight.constant = collectionHeight

            // ✅ Move scoreView BELOW collectionView
            self.scoreViewTopConstraint.constant = // Check it 
                self.originalScoreTopConstant + 110

            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }

    // Function core
    func generateQuestion() {

        isAnswered = false
        userInput = ""
        lblAnswer.text = ""
        lblAnswer.textColor = .black
        lblAnswer.attributedText = nil
        btnNext.isHidden = true
        resultImage.isHidden = true
        resetScoreViewPosition()

        leftNumber = Int.random(in: 1...100)
        rightNumber = Int.random(in: 1...100)

        scoreViewTopConstraint.constant = originalScoreTopConstant
        collHeight.constant = 0

        // SUBTRACTION: avoid negative answers
        if !isPlus && rightNumber > leftNumber {
            swap(&leftNumber, &rightNumber)
        }

        lblleft.text = "\(leftNumber)"
        lblright.text = "\(rightNumber)"

        if isPlus {
            centerlbl.text = "+"
            correctAnswer = leftNumber + rightNumber
        } else {
            centerlbl.text = "−"
            correctAnswer = leftNumber - rightNumber
        }

        lblQuestionNumber.text = "\("Question".localiz()) \(questionIndex)"
    }
    
    
    func checkAnswer() {
        guard let entered = Int(userInput) else { return }

        isAnswered = true
        let isCorrect = entered == correctAnswer

        if isCorrect {
            score += 1
            showCorrect()
        } else {
            showWrong(userAnswer: entered)
        }

        // STORE RESULT
        results.append(
            AddSubResult(
                leftNumber: leftNumber,
                rightNumber: rightNumber,
                userAnswer: "\(entered)",
                isSign: isPlus,
                correctAnswer: "\(correctAnswer)",
                isCorrect: isCorrect
            )
        )

        scorelbl.text = "\("Score".localiz()): \(score) / \(questionIndex)"
    }

    func showCorrect() {
        lblAnswer.attributedText = nil
        lblAnswer.text = "\(correctAnswer)"
        lblAnswer.textColor = .systemGreen

        resultImage.image = UIImage(named: "check mark")
        resultImage.tintColor = .systemGreen
        resultImage.isHidden = false
    }
    func showWrong(userAnswer: Int) {

        let wrongAttr = NSAttributedString(
            string: "\(userAnswer)",
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

        let attr = NSMutableAttributedString()
        attr.append(wrongAttr)
        attr.append(correctAttr)

        lblAnswer.attributedText = attr

        resultImage.image = UIImage(named: "close")
        resultImage.tintColor = .systemRed
        resultImage.isHidden = false
    }
    
    func showResultScreen() {

        mode = .result

        // Hide question UI
        keyPad.isHidden = true
        bfafterView.isHidden = true
        resultImage.isHidden = true
        // Show results
        collView.isHidden = false
        collView.reloadData()
        reloadCollectionHeight()
        lblQuestion.text = "You have completed this activity."
        lblQuestionNumber.isHidden = true
        btnNext.setTitle("Finish", for: .normal)
        btnNext.isHidden = false
        view.layoutIfNeeded()

    }
    func resetScoreViewPosition() {
        scoreViewTopConstraint.constant = originalScoreTopConstant

        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    func goToResultScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(withIdentifier: "AdditionSubstractionMenuVC") as? AdditionSubstractionMenuVC {

            // ✅ Score pass
            vc.finalScore = score

            // ✅ Title pass
            vc.screenTitleText = isPlus ? "Addition" : "Subtraction"

            // ✅ Results pass (IMPORTANT)
            vc.results = results.map {
                QuestionResultsLevel1(
                    formedWord: "\($0.leftNumber) \($0.isSign ? "+" : "-") \($0.rightNumber) = \($0.userAnswer)",
                    correctWord: "\($0.leftNumber) \($0.isSign ? "+" : "-") \($0.rightNumber) = \($0.correctAnswer)",
                    isCorrect: $0.isCorrect
                )
            }

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("\(isPlus ? "Addition" : "Subtraction").pdf")

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try renderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                let title = isPlus ? "Addition" : "Subtraction"

                title.draw(
                    in: CGRect(x: 20, y: 20, width: pageWidth - 40, height: 35),
                    withAttributes: [
                        .font: UIFont.boldSystemFont(ofSize: 24),
                        .foregroundColor: UIColor.black
                    ]
                )

                var y: CGFloat = 90

                for _ in 0..<10 {

                    var left = Int.random(in: 1...100)
                    var right = Int.random(in: 1...100)

                    // subtraction me negative answer na aaye
                    if !isPlus && right > left {
                        swap(&left, &right)
                    }

                    let sign = isPlus ? "+" : "-"

                    let text = "\(left)   \(sign)   \(right)   =   ______"

                    (text as NSString).draw(
                        at: CGPoint(x: 110, y: y),
                        withAttributes: [
                            .font: UIFont.systemFont(ofSize: 28)
                        ]
                    )

                    y += 60

                    if y > 760 {
                        context.beginPage()
                        y = 60
                    }
                }
            }

            return pdfURL

        } catch {
            print(error)
            return nil
        }
    }
    
    
    // MARK: Action
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        if sender.currentTitle == "Finish" {
            navigationController?.popViewController(animated: true)
            return
        }
        // SUBMIT
            if !isAnswered {
                checkAnswer()
                btnNext.setTitle("Next", for: .normal)
                return
            }

            // NEXT QUESTION
            questionIndex += 1

        if questionIndex > totalQuestions {
            goToResultScreen()   // ✅ direct navigation
        } else {
            btnNext.setTitle("Submit", for: .normal)
            generateQuestion()
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
// MARK: Extension
extension AdditionSubstraction: UICollectionViewDataSource, UICollectionViewDelegate {

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
            guard !userInput.isEmpty else { return }
            userInput.removeLast()
            lblAnswer.text = userInput
            btnNext.isHidden = userInput.isEmpty
            return
        }

        // ❌ LIMIT EXCEEDED (SHOW TOAST)
        if userInput.count >= 4 {
            showCustomToast(
                message: "Maximum 4 digits allowed",
                image: UIImage(named: "logo")   // ✅ YOUR LOGO
            )
            return
        }

        // ✅ ADD DIGIT
        userInput.append(key)
        lblAnswer.text = userInput
        btnNext.isHidden = false
    }
}
extension AdditionSubstraction: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == keyPad {
            let width = (collectionView.bounds.width - 64) / 3
            return CGSize(width: width, height: 40)
        }

        // Result cells (3-column grid)
        let columns: CGFloat = 2
        let spacing: CGFloat = 12
        let sectionInset: CGFloat = 12
        let totalPadding = (columns - 1) * spacing + sectionInset * 2
        let width = (collectionView.bounds.width - totalPadding) / columns
        return CGSize(width: width, height: 75)
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

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == collView {
            return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        }
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}
struct AddSubResult {
    let leftNumber: Int
    let rightNumber: Int
    let userAnswer: String
    let isSign: Bool   // true = + , false = -
    let correctAnswer: String
    let isCorrect: Bool
}
