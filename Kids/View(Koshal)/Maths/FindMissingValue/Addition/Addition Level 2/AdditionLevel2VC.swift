//
//  AdditionLevel2VC.swift
//  KSchool
//
//  Created by Koshal Singh on 09/06/26.
//
struct AdditionLevel2ResultModel {

    let leftNumber: Int
    let rightNumber: Int
    let userAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
    let isThreeDigitAnswer: Bool
}

import UIKit

class AdditionLevel2VC: BaseViewController {

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
    @IBOutlet weak var carryView4: UIView!
    
    @IBOutlet weak var ansdigit: UILabel!
    @IBOutlet weak var ansonedigit: UILabel!
    @IBOutlet weak var ansdigit4: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var lineViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    private var keys: [KeypadItem] = []
    private var correctAnswer: Int = 0
    private var score: Int = 0
    private var questionIndex: Int = 1
    private let totalQuestions = 10
    private var isAnswered = false
    private var leftNumber: Int = 0
    private var rightNumber: Int = 0

    private var results: [AdditionLevel2ResultModel] = []

    private var activeDigit = 2
    private var isThreeDigitAnswer = false
    
    var questionText: String = "Add the numbers"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()

        setupKeys()
        setupCollectionView()

        lblQuestion.text = questionText   // 👈 Add this
        
        generateQuestion()

        ansdigit.isUserInteractionEnabled = true
        ansonedigit.isUserInteractionEnabled = true
        ansdigit4.isUserInteractionEnabled = true

        ansdigit.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(selectFirstDigit)
            )
        )

        ansonedigit.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(selectSecondDigit)
            )
        )

        ansdigit4.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(selectThirdDigit)
            )
        )
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

    @objc func selectThirdDigit() {
        setActiveDigit(2)
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

            layout.sectionInset = UIEdgeInsets(
                top: 8,
                left: 16,
                bottom: 8,
                right: 16
            )

            layout.estimatedItemSize = .zero
        }

        keyPad.showsHorizontalScrollIndicator = false
    }
    
    func setup() {

        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)

        let img = UIImage(
            systemName: "arrow.backward.circle",
            withConfiguration: config
        )

        backBtn.setImage(img, for: .normal)

        backBtn.tintColor = #colorLiteral(
            red: 0.1718951762,
            green: 0.212508589,
            blue: 0.3281655014,
            alpha: 1
        )

        resultImage.isHidden = true
        btnNext.isHidden = true

        scorelbl.text = "Score : 0 / 0"

        keyPad.delegate = self
        keyPad.dataSource = self

        scoreView.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 6
        mppView.layer.cornerRadius = 6

        carryView2.layer.cornerRadius = 6
        carryView3.layer.cornerRadius = 6
        carryView4.layer.cornerRadius = 6

        ansdigit.layer.cornerRadius = 6
        ansonedigit.layer.cornerRadius = 6
        ansdigit4.layer.cornerRadius = 6

        ansdigit.clipsToBounds = true
        ansonedigit.clipsToBounds = true
        ansdigit4.clipsToBounds = true

        ansdigit.backgroundColor = .white
        ansonedigit.backgroundColor = .white
        ansdigit4.backgroundColor = .white

        ansdigit.layer.borderWidth = 0
        ansonedigit.layer.borderWidth = 0
        ansdigit4.layer.borderWidth = 0

        ansdigit.textColor = .label
        ansonedigit.textColor = .label
        ansdigit4.textColor = .label
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

        // ✅ इनका color हमेशा Random ही रहेगा
        carryView2.backgroundColor = ColorManager.randomColor()
        carryView3.backgroundColor = ColorManager.randomColor()
        carryView4.backgroundColor = ColorManager.randomColor()
    }
    
    func checkAnswer() {

        isAnswered = true
        keyPad.isUserInteractionEnabled = false

        ansdigit.backgroundColor = .white
        ansonedigit.backgroundColor = .white
        ansdigit4.backgroundColor = .white

        let entered = getEnteredAnswer()

        let enteredHundreds = Int(ansdigit4.text ?? "") ?? 0
        let enteredTens = Int(ansdigit.text ?? "") ?? 0
        let enteredOnes = Int(ansonedigit.text ?? "") ?? 0

        let correctHundreds = correctAnswer / 100
        let correctTens = (correctAnswer / 10) % 10
        let correctOnes = correctAnswer % 10

        if entered == correctAnswer {

            score += 1

            resultImage.image = UIImage(named: "check mark")
            resultImage.tintColor = .systemGreen

            ansdigit4.attributedText = nil
            ansdigit.attributedText = nil
            ansonedigit.attributedText = nil

            if isThreeDigitAnswer {

                ansdigit4.text = "\(correctHundreds)"
                ansdigit4.textColor = .systemGreen

                ansdigit.text = "\(correctTens)"
                ansdigit.textColor = .systemGreen

                ansonedigit.text = "\(correctOnes)"
                ansonedigit.textColor = .systemGreen

            } else {

                ansdigit.text = "\(correctTens)"
                ansdigit.textColor = .systemGreen

                ansonedigit.text = "\(correctOnes)"
                ansonedigit.textColor = .systemGreen
            }

        } else {

            resultImage.image = UIImage(named: "close")
            resultImage.tintColor = .systemRed

            // MARK: Hundreds Digit

            if isThreeDigitAnswer {

                if enteredHundreds == correctHundreds {

                    ansdigit4.attributedText = nil
                    ansdigit4.text = "\(correctHundreds)"
                    ansdigit4.textColor = .systemGreen

                } else {

                    let wrong = NSAttributedString(
                        string: "\(enteredHundreds)",
                        attributes: [
                            .foregroundColor: UIColor.systemRed,
                            .strikethroughStyle: NSUnderlineStyle.single.rawValue
                        ]
                    )

                    let correct = NSAttributedString(
                        string: " \(correctHundreds)",
                        attributes: [
                            .foregroundColor: UIColor.systemGreen
                        ]
                    )

                    let final = NSMutableAttributedString()
                    final.append(wrong)
                    final.append(correct)

                    ansdigit4.attributedText = final
                }
            }

            // MARK: Tens Digit

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

            // MARK: Ones Digit

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

        let result = AdditionLevel2ResultModel(
            leftNumber: leftNumber,
            rightNumber: rightNumber,
            userAnswer: "\(entered)",
            correctAnswer: "\(correctAnswer)",
            isCorrect: entered == correctAnswer,
            isThreeDigitAnswer: isThreeDigitAnswer
        )

        results.append(result)

        resultImage.isHidden = false

        scorelbl.text = "Score : \(score) / \(questionIndex)"

        btnNext.setTitle("Next", for: .normal)
    }
    
    
    func generateQuestion() {

        isAnswered = false
        keyPad.isUserInteractionEnabled = true

        btnNext.isHidden = true
        btnNext.setTitle("Submit", for: .normal)

        resultImage.isHidden = true

        lblQuestionNumber.text = "Question \(questionIndex)"

        let firstTens = Int.random(in: 1...9)
        let firstOnes = Int.random(in: 1...9)

        let secondTens = Int.random(in: 1...9)
        let secondOnes = Int.random(in: 1...9)

        leftNumber = firstTens * 10 + firstOnes
        rightNumber = secondTens * 10 + secondOnes

        correctAnswer = leftNumber + rightNumber

        firstdigit.text = "\(firstTens)"
        seconddigit.text = "\(firstOnes)"

        thirddigit.text = "\(secondTens)"
        fourthdigit.text = "\(secondOnes)"

        ansdigit.text = ""
        ansonedigit.text = ""
        ansdigit4.text = ""

        ansdigit.attributedText = nil
        ansonedigit.attributedText = nil
        ansdigit4.attributedText = nil

        ansdigit.textColor = .label
        ansonedigit.textColor = .label
        ansdigit4.textColor = .label

        if correctAnswer >= 100 {

            isThreeDigitAnswer = true

            ansdigit4.isHidden = false
            carryView4.isHidden = false

            lineViewWidthConstraint.constant = 120

        } else {

            isThreeDigitAnswer = false

            ansdigit4.isHidden = true
            carryView4.isHidden = true

            lineViewWidthConstraint.constant = 80
        }

        // Hamesha right side se start
        setActiveDigit(1)

        view.layoutIfNeeded()
    }
    
    func setActiveDigit(_ index: Int) {

        activeDigit = index

        let activeColor: UIColor

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {
            activeColor = ColorManager.randomColor()
        } else {
            activeColor = HeaderView.backgroundColor ?? ColorManager.randomColor()
        }

        ansdigit.backgroundColor = .white
        ansonedigit.backgroundColor = .white
        ansdigit4.backgroundColor = .white

        switch index {

        case 2:
            ansdigit4.backgroundColor = activeColor

        case 1:
            ansonedigit.backgroundColor = activeColor

        default:
            ansdigit.backgroundColor = activeColor
        }
    }
    
    func setDigit(_ value: String) {

        guard !isAnswered else { return }

        if isThreeDigitAnswer {

            if activeDigit == 1 {

                ansonedigit.text = value
                setActiveDigit(0)

            } else if activeDigit == 0 {

                ansdigit.text = value
                setActiveDigit(2)

            } else {

                ansdigit4.text = value
            }

            if !(ansdigit4.text ?? "").isEmpty &&
                !(ansdigit.text ?? "").isEmpty &&
                !(ansonedigit.text ?? "").isEmpty {

                btnNext.isHidden = false
            }

        } else {

            if activeDigit == 1 {

                ansonedigit.text = value
                setActiveDigit(0)

            } else {

                ansdigit.text = value
            }

            if !(ansdigit.text ?? "").isEmpty &&
                !(ansonedigit.text ?? "").isEmpty {

                btnNext.isHidden = false
            }
        }
    }
    
    func getEnteredAnswer() -> Int {

        if isThreeDigitAnswer {

            let hundreds = Int(ansdigit4.text ?? "") ?? 0
            let tens = Int(ansdigit.text ?? "") ?? 0
            let ones = Int(ansonedigit.text ?? "") ?? 0

            return hundreds * 100 + tens * 10 + ones

        } else {

            let tens = Int(ansdigit.text ?? "") ?? 0
            let ones = Int(ansonedigit.text ?? "") ?? 0

            return tens * 10 + ones
        }
    }
    
    func clearLastDigit() {

        guard !isAnswered else { return }

        if isThreeDigitAnswer {

            if activeDigit == 0 {

                if !(ansdigit.text ?? "").isEmpty {

                    ansdigit.text = ""

                } else {

                    ansonedigit.text = ""
                    setActiveDigit(1)
                }

            } else if activeDigit == 1 {

                if !(ansonedigit.text ?? "").isEmpty {

                    ansonedigit.text = ""

                } else {

                    ansdigit4.text = ""
                    setActiveDigit(2)
                }

            } else {

                ansdigit4.text = ""
            }

        } else {

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
        }

        btnNext.isHidden = true
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
                withIdentifier: "AdditionLevel2ResultVC"
            ) as! AdditionLevel2ResultVC

            vc.results = results
            vc.score = score

            navigationController?.pushViewController(
                vc,
                animated: true
            )

        } else {

            btnNext.setTitle("Submit", for: .normal)
            generateQuestion()
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("Addition.pdf")

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
            carryView2,
            carryView3,
            carryView4,
            ansdigit4,
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

                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = .center

                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 24),
                    .foregroundColor: UIColor.black,
                    .paragraphStyle: paragraph
                ]

                ("Addition" as NSString).draw(
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

            hiddenViews.forEach { view, wasHidden in
                view.isHidden = wasHidden
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
extension AdditionLevel2VC: UICollectionViewDataSource, UICollectionViewDelegate {

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

        guard !isAnswered else { return }

        let key = keys[indexPath.item].title

        if key == "X" {

            clearLastDigit()
            return
        }

        setDigit(key)
    }
}
extension AdditionLevel2VC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let columns: CGFloat = 6

        let spacing: CGFloat = 8
        let sectionInset: CGFloat = 10

        let totalSpacing =
        (columns - 1) * spacing + sectionInset * 2

        let width =
        (collectionView.bounds.width - totalSpacing) / columns

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
