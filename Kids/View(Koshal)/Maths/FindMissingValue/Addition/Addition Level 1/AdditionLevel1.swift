//
//  AdditionLevel1.swift
//  KSchool
//
//  Created by Koshal Singh on 08/06/26.
//
enum AddSubMode {
    case addition
    case subtraction
}

import UIKit

class AdditionLevel1: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnNext: UIButton!
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
   
    @IBOutlet weak var carryView2: UIView!
    @IBOutlet weak var carryView3: UIView!
    
    @IBOutlet weak var ansdigit: UILabel!
    @IBOutlet weak var ansonedigit: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    private var keys: [KeypadItem] = []
    private var correctAnswer: Int = 0
    private var score: Int = 0
    private var questionIndex: Int = 1
    private let totalQuestions = 10
    private var isAnswered = false
    private var leftNumber: Int = 0
    private var rightNumber: Int = 0
    private var activeDigit = 0 // 0 = tens, 1 = ones
    private var results: [AddSubResult] = []
    
    var mode: AddSubMode = .addition
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        setupKeys()
        setupCollectionView()
        
        if mode == .addition {

            lblTitle.text = "Addition"
            lblQuestion.text = "Addition"

        } else {

            lblTitle.text = "Find The Number"
            lblQuestion.text = "Fill the number"
        }
        
        generateQuestion()

        
        ansdigit.isUserInteractionEnabled = true
        ansonedigit.isUserInteractionEnabled = true

        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectFirstDigit))
        ansdigit.addGestureRecognizer(tap1)

        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectSecondDigit))
        ansonedigit.addGestureRecognizer(tap2)

        ansdigit.layer.cornerRadius = 6
        ansdigit.clipsToBounds = true

        ansonedigit.layer.cornerRadius = 6
        ansonedigit.clipsToBounds = true

        setActiveDigit(1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    @objc func selectFirstDigit() {
        setActiveDigit(0)
    }

    @objc func selectSecondDigit() {
        setActiveDigit(1)
    }
    
    func setDigit(_ value: String) {

        guard !isAnswered else { return }

        if activeDigit == 1 {

            // Right side box (ones digit)
            ansonedigit.text = value

            // Auto move left side
            setActiveDigit(0)

        } else {

            // Left side box (tens digit)
            ansdigit.text = value
        }

        if !(ansdigit.text ?? "").isEmpty &&
           !(ansonedigit.text ?? "").isEmpty {

            btnNext.isHidden = false
        }
    }
    
    
    func clearLastDigit() {

        guard !isAnswered else { return }

        if activeDigit == 0 {

            if !(ansdigit.text ?? "").isEmpty {

                ansdigit.text = ""

            } else {

                ansonedigit.text = ""
                setActiveDigit(1)
            }

        } else {

            ansonedigit.text = ""
        }

        btnNext.isHidden = true
    }
    
    func setActiveDigit(_ index: Int) {

        activeDigit = index

        let activeColor: UIColor

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {
            activeColor = ColorManager.randomColor()
        } else {
            activeColor = HeaderView.backgroundColor ?? ColorManager.randomColor()
        }

        // Reset
        ansdigit.backgroundColor = .white
        ansonedigit.backgroundColor = .white

        // ❌ No border
        ansdigit.layer.borderWidth = 0
        ansonedigit.layer.borderWidth = 0

        if index == 0 {

            ansdigit.backgroundColor = activeColor

        } else {

            ansonedigit.backgroundColor = activeColor
        }
    }
    
    func setup() {
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle",
                          withConfiguration: config)

        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762,
                                          green: 0.212508589,
                                          blue: 0.3281655014,
                                          alpha: 1)

        resultImage.isHidden = true
        btnNext.isHidden = true

        scorelbl.text = "Score : 0 / 0"
        
        carryView2.backgroundColor = color
        carryView3.backgroundColor = color
        
        keyPad.delegate = self
        keyPad.dataSource = self
        carryView2.layer.cornerRadius = 6
        carryView3.layer.cornerRadius = 6
        
        scoreView.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 6
        mppView.layer.cornerRadius = 6

        // Answer Labels Styling
        ansdigit.backgroundColor = .white
        ansonedigit.backgroundColor = .white

        ansdigit.layer.cornerRadius = 6
        ansonedigit.layer.cornerRadius = 6

        ansdigit.clipsToBounds = true
        ansonedigit.clipsToBounds = true

        // ❌ Border removed
        ansdigit.layer.borderWidth = 0
        ansonedigit.layer.borderWidth = 0

        ansdigit.textColor = .label
        ansonedigit.textColor = .label
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

        // ✅ इनका रंग हमेशा Random ही रहेगा
        carryView2.backgroundColor = ColorManager.randomColor()
        carryView3.backgroundColor = ColorManager.randomColor()
    }
    
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

    func setupCollectionView() {

        if let layout = keyPad.collectionViewLayout as? UICollectionViewFlowLayout {

            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 12
            layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            layout.estimatedItemSize = .zero
        }

        keyPad.showsHorizontalScrollIndicator = false
    }
    
    func generateQuestion() {

        isAnswered = false
        keyPad.isUserInteractionEnabled = true

        btnNext.isHidden = true
        resultImage.isHidden = true

        lblQuestionNumber.text = "Question \(questionIndex)"

        if mode == .addition {

            // Addition → sirf 1 se 5 tak digits

            let firstTens = Int.random(in: 1...5)
            let firstOnes = Int.random(in: 1...5)

            let secondTens = Int.random(in: 1...5)
            let secondOnes = Int.random(in: 1...5)

            leftNumber = firstTens * 10 + firstOnes
            rightNumber = secondTens * 10 + secondOnes

            correctAnswer = leftNumber + rightNumber

            iconPlus.text = "+"

            firstdigit.text = "\(firstTens)"
            seconddigit.text = "\(firstOnes)"

            thirddigit.text = "\(secondTens)"
            fourthdigit.text = "\(secondOnes)"

        } else {

            // Simple subtraction (No Borrow)

            let topTens = Int.random(in: 2...9)
            let bottomTens = Int.random(in: 1..<(topTens))

            let topOnes = Int.random(in: 0...9)
            let bottomOnes = Int.random(in: 0...topOnes)

            leftNumber = topTens * 10 + topOnes
            rightNumber = bottomTens * 10 + bottomOnes

            correctAnswer = leftNumber - rightNumber

            iconPlus.text = "-"

            firstdigit.text = "\(topTens)"
            seconddigit.text = "\(topOnes)"

            thirddigit.text = "\(bottomTens)"
            fourthdigit.text = "\(bottomOnes)"
        }

        ansdigit.attributedText = nil
        ansonedigit.attributedText = nil

        ansdigit.text = ""
        ansonedigit.text = ""

        ansdigit.textColor = .label
        ansonedigit.textColor = .label

        resultImage.isHidden = true

        setActiveDigit(1)
    }
  
    func getEnteredAnswer() -> Int {

        let tens = Int(ansdigit.text ?? "") ?? 0
        let ones = Int(ansonedigit.text ?? "") ?? 0

        return tens * 10 + ones
    }
    
    
    func checkAnswer() {

        isAnswered = true
        keyPad.isUserInteractionEnabled = false

        // Remove active selection color after submit
        ansdigit.backgroundColor = .white
        ansonedigit.backgroundColor = .white

        let entered = getEnteredAnswer()

        let enteredTens = Int(ansdigit.text ?? "") ?? 0
        let enteredOnes = Int(ansonedigit.text ?? "") ?? 0

        let correctTens = correctAnswer / 10
        let correctOnes = correctAnswer % 10

        if entered == correctAnswer {

            score += 1

            resultImage.image = UIImage(named: "check mark")
            resultImage.tintColor = .systemGreen

            // Remove attributed text
            ansdigit.attributedText = nil
            ansonedigit.attributedText = nil

            // Show correct answer
            ansdigit.text = "\(correctTens)"
            ansonedigit.text = "\(correctOnes)"

            // Green text
            ansdigit.textColor = .systemGreen
            ansonedigit.textColor = .systemGreen

        } else {

            resultImage.image = UIImage(named: "close")
            resultImage.tintColor = .systemRed

            if enteredTens == correctTens {

                ansdigit.attributedText = nil
                ansdigit.text = "\(correctTens)"
                ansdigit.textColor = .systemGreen

            } else {

                let wrong = NSAttributedString(
                    string: "\(enteredTens)",
                    attributes: [
                        .foregroundColor: UIColor.systemRed,
                        .strikethroughStyle: NSUnderlineStyle.single.rawValue
                    ]
                )

                let correct = NSAttributedString(
                    string: " \(correctTens)",
                    attributes: [
                        .foregroundColor: UIColor.systemGreen
                    ]
                )

                let final = NSMutableAttributedString()
                final.append(wrong)
                final.append(correct)

                ansdigit.attributedText = final
            }

            if enteredOnes == correctOnes {

                ansonedigit.attributedText = nil
                ansonedigit.text = "\(correctOnes)"
                ansonedigit.textColor = .systemGreen

            } else {

                let wrong = NSAttributedString(
                    string: "\(enteredOnes)",
                    attributes: [
                        .foregroundColor: UIColor.systemRed,
                        .strikethroughStyle: NSUnderlineStyle.single.rawValue
                    ]
                )

                let correct = NSAttributedString(
                    string: " \(correctOnes)",
                    attributes: [
                        .foregroundColor: UIColor.systemGreen
                    ]
                )

                let final = NSMutableAttributedString()
                final.append(wrong)
                final.append(correct)

                ansonedigit.attributedText = final
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
    
  
    
    // MARK: Actions
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

            let vc = storyboard?.instantiateViewController(
                withIdentifier: "AdditionLevel1ResultVC"
            ) as! AdditionLevel1ResultVC

            vc.results = results
            vc.score = score
            vc.mode = mode
            
            navigationController?.pushViewController(vc, animated: true)

        } else {

            btnNext.setTitle("Submit", for: .normal)
            generateQuestion()
        }
    }
    
    func createPDF() -> URL? {

        let fileName: String

        if mode == .addition {
            fileName = "Addition.pdf"
        } else {
            fileName = "Subtraction.pdf"
        }

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent(fileName)

        view.layoutIfNeeded()

        // Save original hidden state
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

        // Hide unwanted views
        hiddenViews.forEach { view, _ in
            view.isHidden = true
        }

        view.layoutIfNeeded()

        // Capture only question area
        let captureViews: [UIView] = [
            iconPlus,
            firstdigit,
            seconddigit,
            thirddigit,
            fourthdigit,
            carryView2,
            carryView3,
            ansdigit,
            ansonedigit,
            lineView
        ]

        guard let first = captureViews.first else {

            hiddenViews.forEach { view, wasHidden in
                view.isHidden = wasHidden
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

        // Restore original state
        hiddenViews.forEach { view, wasHidden in
            view.isHidden = wasHidden
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

                let title = mode == .addition ? "Addition" : "Subtraction"

                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = .center

                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 24),
                    .foregroundColor: UIColor.black,
                    .paragraphStyle: paragraph
                ]

                (title as NSString).draw(
                    with: CGRect(
                        x: 20,
                        y: 20,
                        width: pageWidth - 40,
                        height: 40
                    ),
                    options: [.usesLineFragmentOrigin],
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

            // Restore state even on error
            hiddenViews.forEach { view, wasHidden in
                view.isHidden = wasHidden
            }

            view.layoutIfNeeded()

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
// MARK: - UICollectionView DataSource & Delegate

extension AdditionLevel1: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        return keys.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "KeypadCell",
            for: indexPath
        ) as! KeypadCell

        cell.configure(item: keys[indexPath.item])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        // Submit ke baad koi input nahi
        guard !isAnswered else { return }

        let key = keys[indexPath.item].title

        if key == "X" {
            clearLastDigit()
            return
        }

        setDigit(key)
    }
}

// MARK: - UICollectionViewFlowLayout

extension AdditionLevel1: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let columns: CGFloat = 6

        let spacing: CGFloat = 8
        let sectionInset: CGFloat = 10

        let totalSpacing = (columns - 1) * spacing + sectionInset * 2

        let width = (collectionView.bounds.width - totalSpacing) / columns

        return CGSize(width: width, height: 35)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(
            top: 8,
            left: 5,
            bottom: 8,
            right: 5
        )
    }
}
