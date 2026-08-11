//
//  CompareNo.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 19/01/26.
//

import UIKit
import LanguageManager_iOS

class CompareNo: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblbefore: UILabel!
    @IBOutlet weak var lblafter: UILabel!
    @IBOutlet  weak var centerView: UIView!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!
    @IBOutlet weak var scoreMainView: UIView!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var ansLbl: UILabel!
    @IBOutlet weak var tickView: UIView!
    @IBOutlet weak var keyPad: UICollectionView!
    @IBOutlet weak var bfafterView: UIView!
    @IBOutlet weak var beforeView: UIView!
    @IBOutlet weak var afterView:UIView!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var scoreTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    // MARK: Variable
    private var keys: [KeypadItem] = []
    private var currentNumber: Int = 0
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
    private var results: [CompareResult] = []
    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupKeys()
        generateQuestion()
        setupCollectionView()
        
        bfafterView.layer.cornerRadius = 1
        
    }
    // MARK: Function
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
       // addShadow(to: bfafterView)
        beforeView.layer.cornerRadius = 10
        afterView.layer.cornerRadius = 10
        resultImage.isHidden = true
        tickView.isHidden = true
        //
        btnNext.isHidden = true
        scorelbl.text = "Score : 0 / 0"
        lblQuestionNumber.text = "\("Question".localiz()) \(questionIndex)"
        scoreView.layer.cornerRadius = 10
        
        keyPad.dataSource = self
        keyPad.delegate = self
        statusView.backgroundColor = color
        HeaderView.backgroundColor = color
        collView.dataSource = self
        collView.delegate = self
        collView.isHidden = true
        btnNext.layer.cornerRadius = 6
        btnNext.backgroundColor = color

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
    func setupKeys() {

        keys = [
            KeypadItem(title: ">", color: ColorManager.randomColor()),
            KeypadItem(title: "<", color: ColorManager.randomColor()),
            KeypadItem(title: "=", color: ColorManager.randomColor()),
        ]
    }
    
    func generateQuestion() {

        isAnswered = false

        btnNext.isHidden = true
        resultImage.isHidden = true
        tickView.isHidden = true

        ansLbl.text = "_ _ _"

        // 👇 Previous question ke colors reset
        for i in 0..<keys.count {
            keys[i].color = ColorManager.randomColor()
        }

        keyPad.reloadData()

        leftNumber = Int.random(in: 1...100)
        rightNumber = Int.random(in: 1...100)

        lblbefore.text = "\(leftNumber)"
        lblafter.text = "\(rightNumber)"

        lblQuestionNumber.text = "\("Question".localiz()) \(questionIndex)"

        if leftNumber > rightNumber {
            correctSymbol = ">"
        } else if leftNumber < rightNumber {
            correctSymbol = "<"
        } else {
            correctSymbol = "="
        }
    }
    
    
    
    func showCorrect() {
        resultImage.image = UIImage(named: "check mark")
        resultImage.tintColor = nil // custom image hai to tint remove kar do
        tickView.isHidden = false
        resultImage.isHidden = false
    }

    func showWrong() {
        resultImage.image = UIImage(named: "close")
        resultImage.tintColor = nil
        resultImage.isHidden = false
        tickView.isHidden = false
    }
    
    
    func showResultScreen() {

        mode = .result

        // Hide question UI
        keyPad.isHidden = true
        bfafterView.isHidden = true
        tickView.isHidden = true

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
    func reloadCollectionHeight() {
           DispatchQueue.main.async {
               self.collHeight.constant =
                   self.collView.collectionViewLayout.collectionViewContentSize.height
           }
       }
   
    func goToResultScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "CompareNoMenuVC") as? CompareNoMenuVC {
            
            // ✅ Pass Data
            vc.finalScore = score
            
            // ⚠️ You need to convert CompareResult → QuestionResultsLevel1
            vc.results = results.map {
                QuestionResultsLevel1(
                    formedWord: "\($0.leftNumber) \($0.userAnswer) \($0.rightNumber)",
                    correctWord: "\($0.leftNumber) \($0.correctAnswer) \($0.rightNumber)",
                    isCorrect: $0.isCorrect
                )
            }
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("CompareNumbers.pdf")

        view.layoutIfNeeded()

        let hiddenViews: [(UIView, Bool)] = [
            (HeaderView, HeaderView.isHidden),
            (statusView, statusView.isHidden),
            (backBtn, backBtn.isHidden),
            (lblTitle, lblTitle.isHidden),
            (lblQuestion, lblQuestion.isHidden),
            (lblQuestionNumber, lblQuestionNumber.isHidden),
            (scoreMainView, scoreMainView.isHidden),
            (scoreView, scoreView.isHidden),
            (btnNext, btnNext.isHidden),
            (pdfBtn, pdfBtn.isHidden),
            (tickView, tickView.isHidden),
            (resultImage, resultImage.isHidden),
            (collView, collView.isHidden)
        ]

        hiddenViews.forEach { $0.0.isHidden = true }

        view.layoutIfNeeded()

        let captureViews: [UIView] = [
            bfafterView,
            keyPad
        ]

        guard let first = captureViews.first else { return nil }

        var captureRect = first.superview!.convert(first.frame, to: view)

        for v in captureViews.dropFirst() {
            let rect = v.superview!.convert(v.frame, to: view)
            captureRect = captureRect.union(rect)
        }

        captureRect = captureRect.insetBy(dx: -20, dy: -20)

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

        hiddenViews.forEach {
            $0.0.isHidden = $0.1
        }

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let pdfRenderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                let title = "Choose the correct symbol between the number"

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
                let maxHeight = pageHeight - 100

                let scale = min(
                    maxWidth / image.size.width,
                    maxHeight / image.size.height
                )

                let width = image.size.width * scale
                let height = image.size.height * scale

                image.draw(
                    in: CGRect(
                        x: (pageWidth - width) / 2,
                        y: 80,
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
    
    // MARK: Action
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNextTapped(_ sender: UIButton) {

        questionIndex += 1

        if questionIndex > totalQuestions {
            // ✅ Directly go to result screen VC
            goToResultScreen()
            return
        }

        generateQuestion()
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
// MARK: Extension
extension CompareNo: UICollectionViewDataSource, UICollectionViewDelegate {

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
        cell.configure(result: data)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        guard collectionView == keyPad else { return }

        // 👇 Ek baar answer select ho gaya to dobara selection nahi hoga
        guard !isAnswered else { return }

        let selectedSymbol = keys[indexPath.item].title
        ansLbl.text = selectedSymbol
        isAnswered = true
        btnNext.isHidden = false

        let isCorrect = selectedSymbol == correctSymbol

        if isCorrect {
            score += 1
            showCorrect()
        } else {
            showWrong()
        }

        // COLOR UPDATE
        for i in 0..<keys.count {
            let index = IndexPath(item: i, section: 0)
            if let cell = keyPad.cellForItem(at: index) as? KeypadCell {
                let symbol = keys[i].title

                if symbol == correctSymbol {
                    cell.bgView.backgroundColor = .systemGreen
                } else if symbol == selectedSymbol {
                    cell.bgView.backgroundColor = .systemRed
                }
            }
        }

        results.append(
            CompareResult(
                leftNumber: leftNumber,
                rightNumber: rightNumber,
                userAnswer: selectedSymbol,
                correctAnswer: correctSymbol,
                isCorrect: isCorrect
            )
        )

        scorelbl.text = "Score : \(score) / \(questionIndex)"
    }


}

extension CompareNo: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == keyPad {
            let width = (collectionView.bounds.width - 64) / 3
            return CGSize(width: width, height: 60)
        }

        // Result cells (3-column grid)
        let columns: CGFloat = 3
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
struct CompareResult {
    let leftNumber: Int
    let rightNumber: Int
    let userAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
}
