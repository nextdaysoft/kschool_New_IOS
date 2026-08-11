//
//  FourLetterWordLevel2VC.swift
//  Kids
//
//  Created by Koshal Singh on 04/02/26.
//

import UIKit
import LanguageManager_iOS

class FourLetterWordLevel2VC: BaseViewController {
    
    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
  
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var giveUpAndNextBtn: UIButton!
    @IBOutlet weak var hintBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    var lineLayer = CAShapeLayer()
    var linePath = UIBezierPath()

    var touchedViews: [UIView] = []
    var lastPoint: CGPoint?
    
    let wordsList = [
        "lion",
        "frog",
        "face",
        "hand",
        "park",
        "stop",
        "ship",
        "snai",
        "moon",
        "bird",
        
    ]

    var shuffledWords: [String] = []
    
    var currentIndex = 0
    var correctWord = ""
    var isWordSolved = false
    
    var correctViewsOrder: [UIView] = []
    
    var fixedPath = UIBezierPath()
    var tempPath = UIBezierPath()
    
    var results: [FourLetterWordResultLevel1] = []
    var score = 0
    
    // ✅ Width: 80, Height: 40 (आपका requirement)
    let viewSize = CGSize(width: 70, height: 35)
    
    // ✅ Pre-defined positions to avoid overlap
    let predefinedPositions: [CGPoint] = [
        CGPoint(x: 40, y: 100),    // Top-left
        CGPoint(x: 40, y: 200),    // Middle-left
        CGPoint(x: 40, y: 300),    // Bottom-left
        CGPoint(x: 200, y: 100),   // Top-right
        CGPoint(x: 200, y: 200),   // Middle-right
        CGPoint(x: 200, y: 300),   // Bottom-right
        CGPoint(x: 120, y: 150),   // Center-top
        CGPoint(x: 120, y: 250)    // Center-bottom
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        setupLineLayer()
        
        // ✅ पहले से ही views की size set करें
        view1.frame.size = viewSize
        view2.frame.size = viewSize
        view3.frame.size = viewSize
        view4.frame.size = viewSize
        
        // ✅ Labels के font size को adjust करें (height कम है इसलिए font भी कम)
        label1.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label2.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label3.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label4.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        // ✅ Text को center align करें
        label1.textAlignment = .center
        label2.textAlignment = .center
        label3.textAlignment = .center
        label4.textAlignment = .center
        
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
      
        scoreLabelBGView.layer.cornerRadius = 10
        
        view1.layer.cornerRadius = 6
        view2.layer.cornerRadius = 6
        view3.layer.cornerRadius = 6
        view4.layer.cornerRadius = 6
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()

        if currentIndex == 0 {
            resetGameState()
            loadCurrentWord()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // ✅ Ensure line layer follows the bounds
        lineLayer.frame = mainBGView.bounds
    }
    
    func resetGameState() {
        currentIndex = 0
        score = 0
        results.removeAll()
        isWordSolved = false

        // ✅ Shuffle words
        shuffledWords = wordsList.shuffled()

        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true

        updateScoreLabel()

        lineLayer.removeFromSuperlayer()
        setupLineLayer()
    }
    
    func loadCurrentWord() {
        guard currentIndex < wordsList.count else {
            goToResultScreen()
            return
        }

        view1.isHidden = false
        view2.isHidden = false
        view3.isHidden = false
        view4.isHidden = false
        
        hardResetState()
        
        correctWord = shuffledWords[currentIndex]
        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        
        isWordSolved = false
        giveUpAndNextBtn.setTitle("Give Up".localiz(), for: .normal)
        giveUpAndNextBtn.isEnabled = true
        
        setupLetters()
        resetViewsColor()
        
        // ✅ Ensure layout is updated before positioning
        self.view.layoutIfNeeded()
        
        // ✅ Give a small delay to ensure bounds are calculated
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.randomizeViewsPosition()
        }
        
        rightOrWrongImgView.isHidden = true
        setLetterInteraction(true)
    }
    
    func hardResetState() {
        resetLine()
        touchedViews.removeAll()
        lastPoint = nil
        lineLayer.path = nil
        
        mainBGView.isUserInteractionEnabled = true
        setLetterInteraction(true)
        
        mainBGView.bringSubviewToFront(view1)
        mainBGView.bringSubviewToFront(view2)
        mainBGView.bringSubviewToFront(view3)
        mainBGView.bringSubviewToFront(view4)
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        giveUpAndNextBtn.layer.cornerRadius = 6
        hintBtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            giveUpAndNextBtn.backgroundColor = .white
            hintBtn.backgroundColor = .white

            view1.backgroundColor = .white
            view2.backgroundColor = .white
            view3.backgroundColor = .white
            view4.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            giveUpAndNextBtn.backgroundColor = color
            hintBtn.backgroundColor = color

            view1.backgroundColor = ColorManager.randomColor()
            view2.backgroundColor = ColorManager.randomColor()
            view3.backgroundColor = ColorManager.randomColor()
            view4.backgroundColor = ColorManager.randomColor()
        }
    }
    
    func resetViewsColor() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            view1.backgroundColor = .white
            view2.backgroundColor = .white
            view3.backgroundColor = .white
            view4.backgroundColor = .white

        } else {

            view1.backgroundColor = ColorManager.randomColor()
            view2.backgroundColor = ColorManager.randomColor()
            view3.backgroundColor = ColorManager.randomColor()
            view4.backgroundColor = ColorManager.randomColor()
        }
    }
    
    
    func updateScoreLabel() {
        let attempted = currentIndex + 1
        scoreLabel.text = "\("Score".localiz()): \(score) / \(attempted)"
    }
    
    func setupLineLayer() {
        lineLayer.strokeColor = UIColor.black.cgColor
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineCap = .round
        
        mainBGView.layer.insertSublayer(lineLayer, at: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isWordSolved,
              let touch = touches.first else {
            super.touchesBegan(touches, with: event)
            return
        }

        let point = touch.location(in: mainBGView)

        guard let view = hitTestView(at: point) else {
            super.touchesBegan(touches, with: event)
            return
        }

        touchedViews = [view]
        lastPoint = view.center

        fixedPath = UIBezierPath()
        fixedPath.move(to: view.center)

        tempPath = UIBezierPath()
        tempPath.move(to: view.center)

        lineLayer.path = fixedPath.cgPath
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isWordSolved,
              let touch = touches.first,
              let last = lastPoint else {
            super.touchesMoved(touches, with: event)
            return
        }

        let point = touch.location(in: mainBGView)

        tempPath = fixedPath.copy() as! UIBezierPath
        tempPath.addLine(to: point)
        lineLayer.path = tempPath.cgPath

        if let view = hitTestView(at: point),
           !touchedViews.contains(view) {

            touchedViews.append(view)
            fixedPath.addLine(to: view.center)
            lastPoint = view.center

            lineLayer.path = fixedPath.cgPath
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isWordSolved else {
            super.touchesEnded(touches, with: event)
            return
        }

        if touchedViews.count == 4 {
            lineLayer.path = fixedPath.cgPath
            checkResult()
        } else {
            resetLine()
        }
    }
    
    func checkResult() {
        let formedWord = touchedViews.compactMap { view -> String? in
            if view == view1 { return label1.text }
            if view == view2 { return label2.text }
            if view == view3 { return label3.text }
            if view == view4 { return label4.text }
            return nil
        }.joined()

        if formedWord == correctWord {
            isWordSolved = true
            score += 1
            updateScoreLabel()

            results.append(
                FourLetterWordResultLevel1(
                    correctWord: correctWord,
                    isCorrect: true
                )
            )

            giveUpAndNextBtn.setTitle("Next".localiz(), for: .normal)

            rightOrWrongImgView.image = UIImage(named: "check mark")
            rightOrWrongImgView.isHidden = false

            arrangeViewsInRowWithLine()
            setLetterInteraction(false)

        } else {
            results.append(
                FourLetterWordResultLevel1(
                    correctWord: correctWord,
                    isCorrect: false
                )
            )

            vibrateViewsFast()

            resetLine()
            touchedViews.removeAll()
            lastPoint = nil
            lineLayer.path = nil

            rightOrWrongImgView.isHidden = true
        }
    }
    
    func arrangeViewsInRow() {
        let orderedViews: [UIView] = correctWord.compactMap { char in
            if label1.text == String(char) { return view1 }
            if label2.text == String(char) { return view2 }
            if label3.text == String(char) { return view3 }
            if label4.text == String(char) { return view4 }
            return nil
        }

        let spacing: CGFloat = 8
        let startX: CGFloat = 20
        let centerY = mainBGView.bounds.height / 2

        var currentX = startX

        UIView.animate(
            withDuration: 0.35,
            delay: 0,
            usingSpringWithDamping: 0.85,
            initialSpringVelocity: 0.6,
            options: [.curveEaseOut]
        ) {
            for view in orderedViews {
                view.frame = CGRect(
                    x: currentX,
                    y: centerY - self.viewSize.height / 2,
                    width: self.viewSize.width,
                    height: self.viewSize.height
                )
                currentX += self.viewSize.width + spacing
            }
        }
    }
    
    func drawFinalLine(between views: [UIView]) {
        fixedPath.removeAllPoints()

        guard let first = views.first else { return }
        fixedPath.move(to: first.center)

        for view in views.dropFirst() {
            fixedPath.addLine(to: view.center)
        }

        lineLayer.path = fixedPath.cgPath
    }
    
    func vibrateViews() {
        let views = [view1, view2, view3, view4]

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 1.0
        animation.values = [-8, 8, -6, 6, -4, 4, 0]

        views.forEach {
            $0?.layer.add(animation, forKey: "vibrate")
        }
    }
 
    func vibrateViewsFast() {
        let views = [view1, view2, view3, view4]

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 0.35
        animation.values = [-12, 12, -10, 10, -8, 8, 0]

        views.forEach {
            $0?.layer.add(animation, forKey: "fastVibrate")
        }
    }
    
    func setupLetters() {
        let letters = Array(correctWord)
        let shuffled = letters.shuffled()

        label1.text = String(shuffled[0])
        label2.text = String(shuffled[1])
        label3.text = String(shuffled[2])
        label4.text = String(shuffled[3])
    }
    
    func hitTestView(at point: CGPoint) -> UIView? {
        let views = [view1, view2, view3, view4]
        return views.first { $0?.frame.contains(point) == true } ?? nil
    }
  
    func resetLine() {
        fixedPath.removeAllPoints()
        tempPath.removeAllPoints()
        lineLayer.path = nil
        touchedViews.removeAll()
        lastPoint = nil
    }
    
    func randomizeViewsPosition() {
        // ✅ Disable AutoLayout
        [view1, view2, view3, view4].forEach {
            $0?.translatesAutoresizingMaskIntoConstraints = true
        }

        let views = [view1, view2, view3, view4]
        
        // ✅ Get actual bounds (not zero)
        let containerBounds = mainBGView.bounds
        guard containerBounds.width > 0 && containerBounds.height > 0 else {
            print("⚠️ Container bounds are zero, using default positions")
            setDefaultPositions()
            return
        }
        
        print("Container bounds: \(containerBounds)")
        
        // ✅ Pre-calculate available area
        let padding: CGFloat = 20
        let availableWidth = containerBounds.width - (2 * padding) - viewSize.width
        let availableHeight = containerBounds.height - (2 * padding) - viewSize.height
        
        guard availableWidth > 0 && availableHeight > 0 else {
            print("⚠️ Available area too small, using default positions")
            setDefaultPositions()
            return
        }
        
        // ✅ Create a grid system
        let gridColumns = 3
        let gridRows = 3
        
        // Calculate grid cell size
        let cellWidth = availableWidth / CGFloat(gridColumns - 1)
        let cellHeight = availableHeight / CGFloat(gridRows - 1)
        
        // Generate grid positions
        var gridPositions: [CGPoint] = []
        for row in 0..<gridRows {
            for col in 0..<gridColumns {
                let x = padding + (CGFloat(col) * cellWidth)
                let y = padding + (CGFloat(row) * cellHeight)
                gridPositions.append(CGPoint(x: x, y: y))
            }
        }
        
        // ✅ Shuffle positions and assign to views
        let shuffledPositions = gridPositions.shuffled()
        
        for (index, view) in views.enumerated() {
            guard let view = view, index < shuffledPositions.count else { continue }
            
            let position = shuffledPositions[index]
            view.frame = CGRect(
                x: position.x,
                y: position.y,
                width: viewSize.width,
                height: viewSize.height
            )
        }
        
        // ✅ Verify no overlap
        verifyNoOverlap()
        
        mainBGView.bringSubviewToFront(view1)
        mainBGView.bringSubviewToFront(view2)
        mainBGView.bringSubviewToFront(view3)
        mainBGView.bringSubviewToFront(view4)
    }
    
    func setDefaultPositions() {
        // ✅ Fallback positions that never overlap
        let positions = [
            CGPoint(x: 30, y: 100),
            CGPoint(x: 30, y: 200),
            CGPoint(x: 30, y: 300),
            CGPoint(x: 150, y: 150)
        ]
        
        view1.frame = CGRect(origin: positions[0], size: viewSize)
        view2.frame = CGRect(origin: positions[1], size: viewSize)
        view3.frame = CGRect(origin: positions[2], size: viewSize)
        view4.frame = CGRect(origin: positions[3], size: viewSize)
    }
    
    func verifyNoOverlap() {
        let frames = [view1.frame, view2.frame, view3.frame, view4.frame]
        
        for i in 0..<frames.count {
            for j in (i+1)..<frames.count {
                if frames[i].intersects(frames[j]) {
                    print("⚠️ OVERLAP DETECTED: View\(i+1) and View\(j+1)")
                    print("View\(i+1): \(frames[i])")
                    print("View\(j+1): \(frames[j])")
                }
            }
        }
    }
    
    func showFirstLetterHint() {
        let firstChar = String(correctWord.first!)

        if label1.text == firstChar {
            view1.backgroundColor = .systemGreen
        } else if label2.text == firstChar {
            view2.backgroundColor = .systemGreen
        } else if label3.text == firstChar {
            view3.backgroundColor = .systemGreen
        } else if label4.text == firstChar {
            view4.backgroundColor = .systemGreen
        }
    }
    
    func showCorrectAnswerWithoutLine() {
        resetLine()

        let orderedViews = getOrderedViewsForCorrectWord()
        guard orderedViews.count == 4 else { return }

        let spacing: CGFloat = 8
        let startX: CGFloat = 20
        let centerY = mainBGView.bounds.height / 2

        var currentX = startX

        orderedViews.forEach { $0.translatesAutoresizingMaskIntoConstraints = true }

        UIView.animate(
            withDuration: 0.35,
            delay: 0,
            usingSpringWithDamping: 0.85,
            initialSpringVelocity: 0.6,
            options: [.curveEaseOut]
        ) {
            for view in orderedViews {
                view.frame = CGRect(
                    x: currentX,
                    y: centerY - self.viewSize.height / 2,
                    width: self.viewSize.width,
                    height: self.viewSize.height
                )
                currentX += self.viewSize.width + spacing
            }
        }
    }
    
    func goToResultScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "FourLetterWordResultLevel2VC"
        ) as? FourLetterWordResultLevel2VC {

            resultVC.results = results
            resultVC.finalScore = score

            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    func getOrderedViewsForCorrectWord() -> [UIView] {
        let viewLabelPairs: [(UIView, UILabel)] = [
            (view1, label1),
            (view2, label2),
            (view3, label3),
            (view4, label4)
        ]

        var remainingPairs = viewLabelPairs
        var orderedViews: [UIView] = []

        for char in correctWord {
            if let index = remainingPairs.firstIndex(where: {
                $0.1.text == String(char)
            }) {
                orderedViews.append(remainingPairs[index].0)
                remainingPairs.remove(at: index)
            }
        }

        return orderedViews
    }
    
    func arrangeViewsInRowWithLine() {
        let orderedViews = getOrderedViewsForCorrectWord()
        guard orderedViews.count == 4 else { return }

        let spacing: CGFloat = 8
        let startX: CGFloat = 20
        let centerY = mainBGView.bounds.height / 2

        var currentX = startX

        lineLayer.path = nil
        
        orderedViews.forEach { $0.translatesAutoresizingMaskIntoConstraints = true }

        UIView.animate(
            withDuration: 0.35,
            delay: 0,
            usingSpringWithDamping: 0.85,
            initialSpringVelocity: 0.6,
            options: [.curveEaseOut]
        ) {
            for view in orderedViews {
                view.frame = CGRect(
                    x: currentX,
                    y: centerY - self.viewSize.height / 2,
                    width: self.viewSize.width,
                    height: self.viewSize.height
                )
                currentX += self.viewSize.width + spacing
            }
        } completion: { _ in
            self.drawFinalLine(between: orderedViews)
        }
    }
    
    func setLetterInteraction(_ enabled: Bool) {
        view1.isUserInteractionEnabled = enabled
        view2.isUserInteractionEnabled = enabled
        view3.isUserInteractionEnabled = enabled
        view4.isUserInteractionEnabled = enabled
    }
    
    @IBAction func giveUpAndNextTapBtn(_ sender: UIButton) {
        sender.isEnabled = false

        if isWordSolved {
            currentIndex += 1
            
            if currentIndex < wordsList.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.loadCurrentWord()
                    self.updateScoreLabel()
                    sender.isEnabled = true
                }
            } else {
                goToResultScreen()
                sender.isEnabled = true
            }
        }
        else {
            isWordSolved = true

            results.append(
                FourLetterWordResultLevel1(
                    correctWord: correctWord,
                    isCorrect: false
                )
            )

            rightOrWrongImgView.image = UIImage(named: "check mark")
            rightOrWrongImgView.isHidden = false

            showCorrectAnswerWithoutLine()

            giveUpAndNextBtn.setTitle("Next".localiz(), for: .normal)
            updateScoreLabel()

            setLetterInteraction(false)
            
            sender.isEnabled = true
        }
    }
    
    @IBAction func hintTapBtn(_ sender: UIButton) {
        showFirstLetterHint()
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("Three Letter Word.pdf")

        view.layoutIfNeeded()

        // Sirf mainBGView ka screenshot
        let renderer = UIGraphicsImageRenderer(size: mainBGView.bounds.size)

        let image = renderer.image { _ in
            mainBGView.drawHierarchy(in: mainBGView.bounds, afterScreenUpdates: true)
        }

        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842)

        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pageRect)

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                // Title
                let title = "Join the Letter Blocks to Create a Fun Word!"

                let titleStyle = NSMutableParagraphStyle()
                titleStyle.alignment = .center

                let titleAttr: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 24),
                    .paragraphStyle: titleStyle
                ]

                let titleRect = CGRect(
                    x: 20,
                    y: 20,
                    width: pageRect.width - 40,
                    height: 70
                )

                title.draw(in: titleRect, withAttributes: titleAttr)

                // Screenshot
                let top: CGFloat = 110

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
