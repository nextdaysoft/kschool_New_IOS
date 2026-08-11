//
//  FindMissingValue.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 21/01/26.
//

import UIKit
import LanguageManager_iOS

class FindMissingValue: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!
    @IBOutlet weak var scoreMainView: UIView!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var keyPad: UICollectionView!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var bfafterView: UIView!
    @IBOutlet weak var mppView: UIView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var iconPlus: UILabel!
    
    @IBOutlet weak var firstdigit: UILabel!
    @IBOutlet weak var seconddigit: UILabel!
    @IBOutlet weak var thirddigit: UILabel!
    
    @IBOutlet weak var fourthdigit: UILabel!
    @IBOutlet weak var fifthdigit: UILabel!
    @IBOutlet weak var sixthdigit: UILabel!
    
    @IBOutlet weak var carryView: UIView!
    @IBOutlet weak var carryView2: UIView!
    @IBOutlet weak var carryView3: UIView!
    
    @IBOutlet weak var ansdigit1: UILabel!
    @IBOutlet weak var ansdigit2: UILabel!
    @IBOutlet weak var ansdigit3: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    // MARK: - Properties
    private var keys: [KeypadItem] = []
    private var correctAnswer: Int = 0
    private var score: Int = 0
    private var questionIndex: Int = 1
    private let totalQuestions = 10
    private var isAnswered = false
    private var leftNumber: Int = 0
    private var rightNumber: Int = 0
    private var activeDigit = 0 // 0 = hundreds, 1 = tens, 2 = ones
    private var results: [AddSubResult] = []
    private var mode: AddSubMode = .addition // Set this based on your requirement
    
    // Answer digit labels in order: hundreds, tens, ones
    private var answerDigits: [UILabel] {
        return [ansdigit3, ansdigit2, ansdigit1]
    }
    
    // Input digit labels in order: hundreds, tens, ones for first number
    private var firstNumberDigits: [UILabel] {
        return [firstdigit, seconddigit, thirddigit]
    }
    
    // Input digit labels in order: hundreds, tens, ones for second number
    private var secondNumberDigits: [UILabel] {
        return [fourthdigit, fifthdigit, sixthdigit]
    }
    
    var questionText: String = "Add the numbers"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()

        setupKeys()
        setupCollectionView()
        setupTitleAndQuestion()
        generateQuestion()
        setupAnswerLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    // MARK: - Setup Methods
    private func setup() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        
        resultImage.isHidden = true
        btnNext.isHidden = true
        
        scorelbl.text = "Score : 0 / 0"
        
        keyPad.delegate = self
        keyPad.dataSource = self
        
        carryView.layer.cornerRadius = 6
        carryView2.layer.cornerRadius = 6
        carryView3.layer.cornerRadius = 6
        
        scoreView.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 6
        mppView.layer.cornerRadius = 6
        
        // Setup answer labels
        setupAnswerLabels()
        
        // Set initial active digit
        setActiveDigit(2) // Start with ones place
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
    }
    
    private func setupAnswerLabels() {
        for digit in answerDigits {
            digit.backgroundColor = .white
            digit.layer.cornerRadius = 6
            digit.clipsToBounds = true
            digit.layer.borderWidth = 0
            digit.textColor = .label
            digit.text = ""
            digit.isUserInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(digitTapped(_:)))
            digit.addGestureRecognizer(tap)
        }
    }
    
    private func setupTitleAndQuestion() {
        if mode == .addition {
            lblTitle.text = "Addition"
            lblQuestion.text = "Addition"
            iconPlus.text = "+"
        } else {
            lblTitle.text = "Find The Number"
            lblQuestion.text = "Fill the number"
            iconPlus.text = "-"
        }
    }
    
    private func setupKeys() {
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
    
    private func setupCollectionView() {
        if let layout = keyPad.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 12
            layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            layout.estimatedItemSize = .zero
        }
        keyPad.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Gesture Handlers
    @objc private func digitTapped(_ gesture: UITapGestureRecognizer) {
        guard !isAnswered else { return }
        guard let tappedLabel = gesture.view as? UILabel else { return }
        
        if let index = answerDigits.firstIndex(of: tappedLabel) {
            setActiveDigit(index)
        }
    }
    
    // MARK: - Core Logic
    private func setActiveDigit(_ index: Int) {
        activeDigit = index
        
        let activeColor: UIColor

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {
            activeColor = ColorManager.randomColor()
        } else {
            activeColor = HeaderView.backgroundColor ?? ColorManager.randomColor()
        }
        
        // Reset all answer labels
        for digit in answerDigits {
            digit.backgroundColor = .white
            digit.layer.borderWidth = 0
        }
        
        // Highlight active digit
        if index < answerDigits.count {
            answerDigits[index].backgroundColor = activeColor
        }
    }
    
    private func setDigit(_ value: String) {
        guard !isAnswered else { return }
        guard activeDigit < answerDigits.count else { return }
        
        answerDigits[activeDigit].text = value
        
        // Move to next digit from right to left (ones -> tens -> hundreds)
        if activeDigit > 0 {
            setActiveDigit(activeDigit - 1)
        }
        
        // Show next button if all digits are filled
        if allDigitsFilled() {
            btnNext.isHidden = false
        }
    }
    
    private func clearLastDigit() {
        guard !isAnswered else { return }
        guard activeDigit < answerDigits.count else { return }

        if !(answerDigits[activeDigit].text ?? "").isEmpty {

            answerDigits[activeDigit].text = ""

        } else if activeDigit < answerDigits.count - 1 {

            let newIndex = activeDigit + 1
            setActiveDigit(newIndex)
            answerDigits[newIndex].text = ""
        }

        btnNext.isHidden = true
    }
    
    private func allDigitsFilled() -> Bool {
        for digit in answerDigits {
            if (digit.text ?? "").isEmpty {
                return false
            }
        }
        return true
    }
    
    private func getEnteredAnswer() -> Int {

        let hundreds = Int(ansdigit3.text ?? "") ?? 0
        let tens = Int(ansdigit2.text ?? "") ?? 0
        let ones = Int(ansdigit1.text ?? "") ?? 0

        return hundreds * 100 + tens * 10 + ones
    }
    private func printLabelMapping() {
        print("""
        firstdigit  = \(firstdigit.text ?? "")
        seconddigit = \(seconddigit.text ?? "")
        thirddigit  = \(thirddigit.text ?? "")

        fourthdigit = \(fourthdigit.text ?? "")
        fifthdigit  = \(fifthdigit.text ?? "")
        sixthdigit  = \(sixthdigit.text ?? "")
        """)
    }
    
    private func generateQuestion() {
        isAnswered = false
        keyPad.isUserInteractionEnabled = true
        
        btnNext.isHidden = true
        resultImage.isHidden = true
        
        lblQuestionNumber.text = "Question \(questionIndex)"
        
        if mode == .addition {
            generateAdditionQuestion()
        } else {
            generateSubtractionQuestion()
        }
        
        // Clear answer labels
        for digit in answerDigits {
            digit.attributedText = nil
            digit.text = ""
            digit.textColor = .label
        }
        
        resultImage.isHidden = true
        setActiveDigit(2) // Start with ones place
    }
    
    private func showCarryIndicators() {

        let h1 = Int(firstdigit.text ?? "0") ?? 0
        let t1 = Int(seconddigit.text ?? "0") ?? 0
        let o1 = Int(thirddigit.text ?? "0") ?? 0

        let h2 = Int(fourthdigit.text ?? "0") ?? 0
        let t2 = Int(fifthdigit.text ?? "0") ?? 0
        let o2 = Int(sixthdigit.text ?? "0") ?? 0

        let carryOne = (o1 + o2) / 10
        let carryTwo = (t1 + t2 + carryOne) / 10

        carryView.backgroundColor = .clear
        carryView2.backgroundColor = .clear
        carryView3.backgroundColor = .clear

        if carryOne > 0 {
            carryView3.backgroundColor = .orange
        }

        if carryTwo > 0 {
            carryView2.backgroundColor = .orange
        }
    }
    
    private func generateAdditionQuestion() {

        repeat {

            // Random digits
            let d1 = Int.random(in: 0...9)
            let d2 = Int.random(in: 0...9)
            let d3 = Int.random(in: 0...9)

            let d4 = Int.random(in: 0...9)
            let d5 = Int.random(in: 0...9)
            let d6 = Int.random(in: 0...9)

            // Show on screen
            firstdigit.text = "\(d1)"
            seconddigit.text = "\(d2)"
            thirddigit.text = "\(d3)"

            fourthdigit.text = "\(d4)"
            fifthdigit.text = "\(d5)"
            sixthdigit.text = "\(d6)"

            // ==========================
            // School style addition
            // ==========================

            // Ones column
            let onesSum = d3 + d6
            let answerOne = onesSum % 10
            let carryOne = onesSum / 10

            // Tens column
            let tensSum = d2 + d5 + carryOne
            let answerTen = tensSum % 10
            let carryTwo = tensSum / 10

            // Hundreds column
            let hundredSum = d1 + d4 + carryTwo

            correctAnswer = hundredSum * 100 + answerTen * 10 + answerOne

        } while correctAnswer > 999

        leftNumber =
            (Int(firstdigit.text!)! * 100) +
            (Int(seconddigit.text!)! * 10) +
            Int(thirddigit.text!)!

        rightNumber =
            (Int(fourthdigit.text!)! * 100) +
            (Int(fifthdigit.text!)! * 10) +
            Int(sixthdigit.text!)!

        showCarryIndicators()

        print("""
        \(firstdigit.text!) \(seconddigit.text!) \(thirddigit.text!)
        \(fourthdigit.text!) \(fifthdigit.text!) \(sixthdigit.text!)

        Answer = \(correctAnswer)
        """)
    }
    
    private func generateSubtractionQuestion() {
        repeat {
            let firstHundreds = Int.random(in: 0...9)
            let firstTens = Int.random(in: 0...9)
            let firstOnes = Int.random(in: 0...9)
            
            let secondHundreds = Int.random(in: 0...9)
            let secondTens = Int.random(in: 0...9)
            let secondOnes = Int.random(in: 0...9)
            
            leftNumber = firstHundreds * 100 + firstTens * 10 + firstOnes
            rightNumber = secondHundreds * 100 + secondTens * 10 + secondOnes
        } while leftNumber < rightNumber
        
        correctAnswer = leftNumber - rightNumber
        
        showCarryIndicators(for: correctAnswer)
        
        firstdigit.text = "\(leftNumber / 100)"
        seconddigit.text = "\((leftNumber / 10) % 10)"
        thirddigit.text = "\(leftNumber % 10)"
        
        fourthdigit.text = "\(rightNumber / 100)"
        fifthdigit.text = "\((rightNumber / 10) % 10)"
        sixthdigit.text = "\(rightNumber % 10)"
    }
    
    private func showCarryIndicators(for answer: Int) {
        // Show carry indicators based on the answer digits
        // This is a visual cue - you can customize based on your needs
        let shouldShowCarry1 = false
        let shouldShowCarry2 = false
        let shouldShowCarry3 = false
        
        carryView.backgroundColor = shouldShowCarry1 ? .orange : .clear
        carryView2.backgroundColor = shouldShowCarry2 ? .orange : .clear
        carryView3.backgroundColor = shouldShowCarry3 ? .orange : .clear
    }
    
    private func checkAnswer() {
        isAnswered = true
        keyPad.isUserInteractionEnabled = false
        
        // Remove active selection color after submit
        for digit in answerDigits {
            digit.backgroundColor = .white
        }
        
        let entered = getEnteredAnswer()
        let correctDigits = String(format: "%03d", correctAnswer).compactMap { Int(String($0)) }
        let enteredDigits = answerDigits.compactMap { Int($0.text ?? "") }
        
        // Pad with zeros if needed
        var paddedEntered = enteredDigits
        while paddedEntered.count < 3 {
            paddedEntered.insert(0, at: 0)
        }
        
        if entered == correctAnswer {
            score += 1
            resultImage.image = UIImage(named: "check mark")
            resultImage.tintColor = .systemGreen
            
            for (index, digit) in answerDigits.enumerated() {
                digit.attributedText = nil
                digit.text = "\(correctDigits[index])"
                digit.textColor = .systemGreen
            }
        } else {
            resultImage.image = UIImage(named: "close")
            resultImage.tintColor = .systemRed
            
            for index in 0..<3 {
                let enteredValue = paddedEntered[index]
                let correctValue = correctDigits[index]
                
                if enteredValue == correctValue {
                    answerDigits[index].attributedText = nil
                    answerDigits[index].text = "\(correctValue)"
                    answerDigits[index].textColor = .systemGreen
                } else {
                    let wrong = NSAttributedString(
                        string: "\(enteredValue)",
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
                    
                    answerDigits[index].attributedText = final
                }
            }
        }
        
        let result = AddSubResult(
            leftNumber: leftNumber,
            rightNumber: rightNumber,
            userAnswer: "\(entered)",
            isSign: mode == .addition,
            correctAnswer: "\(correctAnswer)",
            isCorrect: entered == correctAnswer
        )
        
        results.append(result)
        resultImage.isHidden = false
        
        scorelbl.text = "Score : \(score) / \(questionIndex)"
        btnNext.setTitle("Next", for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        if !isAnswered {
            checkAnswer()
            return
        }
        
        questionIndex += 1
        
        if questionIndex > totalQuestions {

            let vc = storyboard?.instantiateViewController(withIdentifier: "MathOperationsResultVC") as! MathOperationsResultVC
            vc.results = results
            vc.score = score
            vc.level = 3
            navigationController?.pushViewController(vc, animated: true)

        } else {

            btnNext.setTitle("Submit", for: .normal)
            generateQuestion()
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("FindMissingValue.pdf")

        view.layoutIfNeeded()

        let hiddenViews: [(UIView, Bool)] = [
            (HeaderView, HeaderView.isHidden),
            (statusView, statusView.isHidden),
            (backBtn, backBtn.isHidden),
            (lblTitle, lblTitle.isHidden),
            (lblQuestionNumber, lblQuestionNumber.isHidden),
            (lblQuestion, lblQuestion.isHidden),
            (scoreView, scoreView.isHidden),
            (scoreMainView, scoreMainView.isHidden),
            (btnNext, btnNext.isHidden),
            (keyPad, keyPad.isHidden),
            (pdfBtn, pdfBtn.isHidden)
        ]

        hiddenViews.forEach { view, _ in
            view.isHidden = true
        }

        view.layoutIfNeeded()

        let captureViews: [UIView] = [
            iconPlus,

            firstdigit,
            seconddigit,
            thirddigit,

            fourthdigit,
            fifthdigit,
            sixthdigit,

            carryView,
            carryView2,
            carryView3,

            ansdigit3,
            ansdigit2,
            ansdigit1,

            lineView
        ]

        guard let first = captureViews.first else {

            hiddenViews.forEach { view, hidden in
                view.isHidden = hidden
            }

            return nil
        }

        var captureRect = first.superview!.convert(first.frame, to: view)

        for v in captureViews.dropFirst() {

            let rect = v.superview!.convert(v.frame, to: view)
            captureRect = captureRect.union(rect)
        }

        captureRect = captureRect.insetBy(dx: -30, dy: -30)

        let renderer = UIGraphicsImageRenderer(size: captureRect.size)

        let image = renderer.image { _ in

            self.view.drawHierarchy(
                in: CGRect(
                    x: -captureRect.origin.x,
                    y: -captureRect.origin.y,
                    width: self.view.bounds.width,
                    height: self.view.bounds.height
                ),
                afterScreenUpdates: true
            )
        }

        hiddenViews.forEach { view, hidden in
            view.isHidden = hidden
        }

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

                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = .center

                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 24),
                    .foregroundColor: UIColor.black,
                    .paragraphStyle: paragraph
                ]

                let title = "Find Missing Value"

                (title as NSString).draw(
                    with: CGRect(
                        x: 20,
                        y: 20,
                        width: pageWidth - 40,
                        height: 40
                    ),
                    options: .usesLineFragmentOrigin,
                    attributes: attributes,
                    context: nil
                )

                let maxWidth = pageWidth - 40
                let maxHeight = pageHeight - 100

                let scale = min(
                    maxWidth / image.size.width,
                    maxHeight / image.size.height
                )

                let drawWidth = image.size.width * scale
                let drawHeight = image.size.height * scale

                image.draw(
                    in: CGRect(
                        x: (pageWidth - drawWidth) / 2,
                        y: 90,
                        width: drawWidth,
                        height: drawHeight
                    )
                )
            }

            return pdfURL

        } catch {

            hiddenViews.forEach { view, hidden in
                view.isHidden = hidden
            }

            view.layoutIfNeeded()

            print(error)
            return nil
        }
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        let wasNextHidden = btnNext.isHidden

        btnNext.isHidden = true
        view.layoutIfNeeded()

        guard let url = createPDF() else {

            btnNext.isHidden = wasNextHidden
            view.layoutIfNeeded()
            return
        }

        btnNext.isHidden = wasNextHidden
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
extension FindMissingValue: UICollectionViewDataSource, UICollectionViewDelegate {

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

        guard collectionView == keyPad else { return }

        let key = keys[indexPath.item].title

        if key == "X" {
            clearLastDigit()
            return
        }

        setDigit(key)
    }

}
extension FindMissingValue: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == keyPad {
            
            let columns: CGFloat = 6   // ✅ 6 columns
            
            let spacing: CGFloat = 8
            let sectionInset: CGFloat = 10
            
            let totalSpacing = (columns - 1) * spacing + sectionInset * 2
            
            let width = (collectionView.bounds.width - totalSpacing) / columns
            
            return CGSize(width: width, height: 35)
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
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView == keyPad ? 8 : 12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView == keyPad ? 8 : 12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView == keyPad {
            return UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
        }

        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
}

