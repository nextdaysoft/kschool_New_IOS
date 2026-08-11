//
//  AscendingAndDescendingShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 16/04/26.
//

import UIKit
import LanguageManager_iOS

class AscendingAndDescendingShowVC: BaseViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!

    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var titelLbl: UILabel!
    @IBOutlet weak var texLbl: UILabel!
    
    @IBOutlet weak var questionLbl: UILabel!
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreBGView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    var correctOrder: [Int] = []
    var numbers: [Int] = []
    
    var currentQuestionIndex: Int = 0
    var totalQuestions: Int = 10
    var score: Int = 0
    var results: [(numbers: [Int], isCorrect: Bool)] = []
    

    var planetViews: [UIView] = []
    var planetLabels: [UILabel] = []
    
    var currentDraggingIndex: Int?

    var isAscending: Bool = true
    var numberRange: ClosedRange<Int> = 1...100
    
    var levelNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()

        setupNumbers()
        addDragGesture()
        lockViewSize()
        loadNewQuestion()
        
        scoreBGView.layer.cornerRadius = 6
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
        
        if let stackView = view1.superview as? UIStackView {
            stackView.clipsToBounds = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    func setCornerRadius() {
        let views = [view1, view2, view3, view4]
        
        for view in views {
            view?.layer.cornerRadius = 12   // yahan radius adjust kar sakte ho
            view?.layer.masksToBounds = true
        }
    }
    
    func setupNumbers() {

        // 🔥 Use level-wise range
        numbers = Array(numberRange).shuffled().prefix(4).map { $0 }

        // Correct order
        if isAscending {
            correctOrder = numbers.sorted()
        } else {
            correctOrder = numbers.sorted(by: >)
        }

        let shuffled = numbers.shuffled()

        planetViews = [view1, view2, view3, view4]
        planetLabels = [label1, label2, label3, label4]

        for i in 0..<planetLabels.count {
            planetLabels[i].text = "\(shuffled[i])"
            planetViews[i].tag = i
        }
    }
    
    func loadNewQuestion() {

        // 🔥 Use level-wise range
        numbers = Array(numberRange).shuffled().prefix(4).map { $0 }

        if isAscending {
            correctOrder = numbers.sorted()
            titelLbl.text = "Ascending Order".localiz()
            texLbl.text = "Rearrange the numbers in ascending order".localiz()
        } else {
            correctOrder = numbers.sorted(by: >)
            titelLbl.text = "Descending Order".localiz()
            texLbl.text = "Rearrange the numbers in descending order".localiz()
        }

        let shuffled = numbers.shuffled()

        for i in 0..<planetLabels.count {
            planetLabels[i].text = "\(shuffled[i])"
            planetViews[i].tag = i
        }

        // Question + Score
        
        scoreLbl.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex)"
        questionLbl.text = "\("Question".localiz()) \(currentQuestionIndex)"
    }

    
    func lockViewSize() {
        for view in planetViews {
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: view.frame.height),
                view.widthAnchor.constraint(equalToConstant: view.frame.width)
            ])
        }
    }
    
    func addDragGesture() {
        for view in planetViews {
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            view.addGestureRecognizer(pan)
        }
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {

        guard let draggedView = gesture.view,
              let stackView = draggedView.superview as? UIStackView else { return }

        let location = gesture.location(in: stackView)

        switch gesture.state {

        case .began:
            draggedView.layer.zPosition = 10
            stackView.bringSubviewToFront(draggedView)

        case .changed:
            draggedView.center.y = location.y

        case .ended:
            draggedView.layer.zPosition = 0

            // 🔥 Find drop index
            var targetIndex = stackView.arrangedSubviews.count - 1

            for (index, view) in stackView.arrangedSubviews.enumerated() {
                if location.y < view.frame.midY {
                    targetIndex = index
                    break
                }
            }

            // 🔁 Reinsert ONLY ON DROP
            stackView.removeArrangedSubview(draggedView)
            draggedView.removeFromSuperview()
            stackView.insertArrangedSubview(draggedView, at: targetIndex)

            UIView.animate(withDuration: 0.25) {
                stackView.layoutIfNeeded()
            }

        default:
            break
        }
    }
    

    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        submitBtn.layer.cornerRadius = 6
    }

    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white
            submitBtn.backgroundColor = .white

            view1.backgroundColor = .white
            view2.backgroundColor = .white
            view3.backgroundColor = .white
            view4.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
            submitBtn.backgroundColor = color

            view1.backgroundColor = ColorManager.randomColor()
            view2.backgroundColor = ColorManager.randomColor()
            view3.backgroundColor = ColorManager.randomColor()
            view4.backgroundColor = ColorManager.randomColor()
        }
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
 

    @IBAction func submitTapBtn(_ sender: Any) {

        guard let stackView = view1.superview as? UIStackView else { return }

        let currentOrder = stackView.arrangedSubviews.compactMap { view -> Int? in
            let index = view.tag
            return Int(planetLabels[index].text ?? "")
        }

        let isCorrect = currentOrder == correctOrder

        if isCorrect {
            score += 1
        }

        // Save result
        results.append((numbers: numbers, isCorrect: isCorrect))

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "AscendingAndDescendingResultVC"
        ) as! AscendingAndDescendingResultVC

        vc.userOrder = currentOrder.map { "\($0)" }
        vc.correctOrder = correctOrder.map { "\($0)" }

        // 🔥 IMPORTANT data pass
        vc.currentQuestionIndex = currentQuestionIndex
        vc.totalQuestions = totalQuestions
        vc.score = score
        vc.results = results
        vc.isAscending = isAscending
        vc.levelNumber = self.levelNumber 

        vc.viewColors = [
            view1.backgroundColor ?? .white,
            view2.backgroundColor ?? .white,
            view3.backgroundColor ?? .white,
            view4.backgroundColor ?? .white
        ]
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func createPDF() -> URL? {

        let pdfName = isAscending ? "Ascending Order" : "Descending Order"

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("\(pdfName).pdf")

        view.layoutIfNeeded()

        let views: [UIView] = [
            view1,
            view2,
            view3,
            view4
        ]

        guard let first = views.first else { return nil }

        var captureRect = first.superview!.convert(first.frame, to: view)

        for v in views.dropFirst() {
            let rect = v.superview!.convert(v.frame, to: view)
            captureRect = captureRect.union(rect)
        }

        captureRect = captureRect.insetBy(dx: -15, dy: -15)

        let renderer = UIGraphicsImageRenderer(size: captureRect.size)

        let image = renderer.image { _ in

            let hiddenViews: [UIView] = [
                HeaderView,
                statusView,
                backBtn,
                pdfBtn,
                submitBtn,
                titelLbl,
                texLbl,
                questionLbl,
                scoreLbl,
                scoreBGView
            ]

            hiddenViews.forEach { $0.isHidden = true }

            self.view.layoutIfNeeded()

            self.view.drawHierarchy(
                in: CGRect(
                    x: -captureRect.origin.x,
                    y: -captureRect.origin.y,
                    width: self.view.bounds.width,
                    height: self.view.bounds.height
                ),
                afterScreenUpdates: true
            )

            hiddenViews.forEach { $0.isHidden = false }

            self.view.layoutIfNeeded()
        }

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let pdfRenderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                let title = isAscending
                    ? "Rearrange the numbers in ascending order."
                    : "Rearrange the numbers in descending order."

                title.draw(
                    in: CGRect(
                        x: 20,
                        y: 20,
                        width: pageWidth - 40,
                        height: 40
                    ),
                    withAttributes: [
                        .font: UIFont.boldSystemFont(ofSize: 24),
                        .foregroundColor: UIColor.black
                    ]
                )

                let maxWidth = pageWidth - 40
                let maxHeight = pageHeight - 90

                let scale = min(
                    maxWidth / image.size.width,
                    maxHeight / image.size.height
                )

                let drawWidth = image.size.width * scale
                let drawHeight = image.size.height * scale

                image.draw(
                    in: CGRect(
                        x: (pageWidth - drawWidth) / 2,
                        y: 80,
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
