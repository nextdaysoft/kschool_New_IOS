//
//  ThreeLetterWordLevel3VC.swift
//  Kids
//
//  Created by Koshal Singh on 04/02/26.
//

//struct ThreeLetterWordResultLevel3 {
//    let correctWord: String
//    let isCorrect: Bool
//}

import UIKit
import LanguageManager_iOS

class ThreeLetterWordLevel3VC: BaseViewController {

    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
  
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
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
        "jet",
        "wol",
        "ups",
        "zip",
        "dun",
        "key",
        "cox",
        "yaw",
        "qui",
        "wax",
    ]
    
    var hasSavedResult = false
    
    var shuffledWords: [String] = []
    
    var currentIndex = 0
    var correctWord = ""
    var isWordSolved = false
    
    var correctViewsOrder: [UIView] = []
    
    var fixedPath = UIBezierPath()
    var tempPath = UIBezierPath()
    
    var results: [ThreeLetterWordResult] = []
    var score = 0
    var hasPositionedViews = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        setupLineLayer()
   
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
      
        
        scoreLabelBGView.layer.cornerRadius = 10
        
        view1.layer.cornerRadius = 6
        view1.backgroundColor = ColorManager.randomColor()
    
        view2.layer.cornerRadius = 6
        view2.backgroundColor = ColorManager.randomColor()
        
        view3.layer.cornerRadius = 6
        view3.backgroundColor = ColorManager.randomColor()
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

        lineLayer.frame = mainBGView.bounds
    }
    
    func resetGameState() {

        currentIndex = 0
        score = 0
        results.removeAll()
        isWordSolved = false

        // Sirf ek baar shuffle hoga
        shuffledWords = wordsList.shuffled()

        updateScoreLabel()
    }
    
    func loadCurrentWord() {

        guard currentIndex < shuffledWords.count else {
            goToResultScreen()
            return
        }

        hasSavedResult = false       // ✅ NEW

        hardResetState()
        resetViewsColor()

        correctWord = shuffledWords[currentIndex]

        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"

        isWordSolved = false
        giveUpAndNextBtn.setTitle("Give Up".localiz(), for: .normal)

        setupLetters()

        self.view.layoutIfNeeded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.randomizeViewsPosition()
        }

        view1.isHidden = false
        view2.isHidden = false
        view3.isHidden = false

        rightOrWrongImgView.isHidden = true
        giveUpAndNextBtn.isEnabled = true
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

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            giveUpAndNextBtn.backgroundColor = color
            hintBtn.backgroundColor = color
            
            view1.backgroundColor = ColorManager.randomColor()
            view2.backgroundColor = ColorManager.randomColor()
            view3.backgroundColor = ColorManager.randomColor()
        }
    }
    
    func resetViewsColor() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            view1.backgroundColor = .white
            view2.backgroundColor = .white
            view3.backgroundColor = .white

        } else {

            view1.backgroundColor = ColorManager.randomColor()
            view2.backgroundColor = ColorManager.randomColor()
            view3.backgroundColor = ColorManager.randomColor()
        }
    }
    
    func hardResetState() {

        resetLine()

        touchedViews.removeAll()
        lastPoint = nil
        lineLayer.path = nil

        mainBGView.isUserInteractionEnabled = true

        mainBGView.bringSubviewToFront(view1)
        mainBGView.bringSubviewToFront(view2)
        mainBGView.bringSubviewToFront(view3)
    }
    
    func updateScoreLabel() {
        let attempted = currentIndex + 1
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
    }
    
    func setupLineLayer() {
        lineLayer.strokeColor = UIColor.black.cgColor   // ✅ always black
        lineLayer.lineWidth = 2                          // ✅ thinner line
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineCap = .round

        // 👇 line sabse niche
        mainBGView.layer.insertSublayer(lineLayer, at: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isWordSolved else { return }
        guard let touch = touches.first else { return }
        let point = touch.location(in: mainBGView)

        if let view = hitTestView(at: point) {
            touchedViews = [view]
            lastPoint = view.center

            fixedPath = UIBezierPath()
            fixedPath.move(to: view.center)

            tempPath = UIBezierPath()
            tempPath.move(to: view.center)

            lineLayer.path = fixedPath.cgPath
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isWordSolved else { return }
        guard let touch = touches.first,
              let last = lastPoint else { return }

        let point = touch.location(in: mainBGView)

        // 🔹 1. TEMP finger-follow line
        tempPath = fixedPath.copy() as! UIBezierPath
        tempPath.addLine(to: point)
        lineLayer.path = tempPath.cgPath

        // 🔹 2. If new view touched → make it permanent
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

        if touchedViews.count == 3 {

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
            return nil
        }.joined()

        if formedWord == correctWord {

            isWordSolved = true
            score += 1
            updateScoreLabel()

            if !hasSavedResult {

                results.append(
                    ThreeLetterWordResult(
                        questionWord: shuffledWords[currentIndex],
                        isCorrect: true
                    )
                )

                hasSavedResult = true
            }

            giveUpAndNextBtn.setTitle("Next".localiz(), for: .normal)

            rightOrWrongImgView.image = UIImage(named: "check mark")
            rightOrWrongImgView.isHidden = false

            arrangeViewsInRowWithLine()

        } else {

            // ❌ Yaha result save nahi karna

            vibrateViewsFast()
            resetLine()
            touchedViews.removeAll()
            lastPoint = nil

            rightOrWrongImgView.isHidden = true
        }
    }
    
    func arrangeViewsInRow() {

        // 🔑 Correct spelling ke order me views lao (CAT)
        let orderedViews: [UIView] = correctWord.compactMap { char in
            if label1.text == String(char) { return view1 }
            if label2.text == String(char) { return view2 }
            if label3.text == String(char) { return view3 }
            return nil
        }

        let spacing: CGFloat = 10

        // 👈 LEFT padding (screenshot jaisa)
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
                    y: centerY - view.bounds.height / 2,
                    width: view.bounds.width,
                    height: view.bounds.height
                )
                currentX += view.bounds.width + spacing
            }
        }
    }
    
    func arrangeViewsInRowWithLine() {

        // 🔑 CAT order
        let orderedViews: [UIView] = correctWord.compactMap { char in
            if label1.text == String(char) { return view1 }
            if label2.text == String(char) { return view2 }
            if label3.text == String(char) { return view3 }
            return nil
        }

        let spacing: CGFloat = 10
        let startX: CGFloat = 20
        let centerY = mainBGView.bounds.height / 2

        var currentX = startX

        // 👇 1️⃣ animation se pehle line hide
        lineLayer.path = nil

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
                    y: centerY - view.bounds.height / 2,
                    width: view.bounds.width,
                    height: view.bounds.height
                )
                currentX += view.bounds.width + spacing
            }
        } completion: { _ in
            // 👇 2️⃣ animation complete → ab line draw karo
            self.drawFinalLine(between: orderedViews)
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
        let views = [view1, view2, view3]

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 1.0
        animation.values = [-8, 8, -6, 6, -4, 4, 0]

        views.forEach {
            $0?.layer.add(animation, forKey: "vibrate")
        }
    }
 
    func vibrateViewsFast() {
        let views = [view1, view2, view3]

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 0.35          // ⏱ FAST
        animation.values = [-12, 12, -10, 10, -8, 8, 0]

        views.forEach {
            $0?.layer.add(animation, forKey: "fastVibrate")
        }
    }
    
    func setupLetters() {
        let letters = Array(correctWord)   // ["C","A","T"]
        let shuffledLetters = letters.shuffled()

        label1.text = String(shuffledLetters[0])
        label2.text = String(shuffledLetters[1])
        label3.text = String(shuffledLetters[2])
    }
    
    func hitTestView(at point: CGPoint) -> UIView? {
        let views = [view1, view2, view3]
        return views.first { $0?.frame.contains(point) == true } ?? nil
    }
  
    
    func resetLine() {
        fixedPath.removeAllPoints()
        tempPath.removeAllPoints()
        lineLayer.path = nil
        touchedViews.removeAll()
        lastPoint = nil
    }
    
    func resetGame() {
        resetLine()
        setupLetters()
        randomizeViewsPosition()
        rightOrWrongImgView.isHidden = true
        lineLayer.strokeColor = UIColor.black.cgColor

        mainBGView.isUserInteractionEnabled = true
    }
    
    func randomizeViewsPosition() {

        [view1, view2, view3].forEach {
            $0?.translatesAutoresizingMaskIntoConstraints = true
        }

        let views = [view1, view2, view3]

        // ✅ Fixed size use karo
        let boxWidth: CGFloat = 70
        let boxHeight: CGFloat = 35

        let padding: CGFloat = 20

        // ✅ Safe area calculate
        let availableWidth = mainBGView.bounds.width - boxWidth - padding
        let availableHeight = mainBGView.bounds.height - boxHeight - padding

        // ✅ Agar layout ready nahi hai toh return
        guard availableWidth > 40,
              availableHeight > 40 else {
            return
        }

        var usedFrames: [CGRect] = []

        for view in views {

            guard let view = view else { continue }

            var frame: CGRect = .zero
            var foundPosition = false
            var attempts = 0

            // ✅ Infinite loop protection
            while !foundPosition && attempts < 100 {

                attempts += 1

                let randomX = CGFloat.random(
                    in: padding...availableWidth
                )

                let randomY = CGFloat.random(
                    in: padding...availableHeight
                )

                frame = CGRect(
                    x: randomX,
                    y: randomY,
                    width: boxWidth,
                    height: boxHeight
                )

                foundPosition = !usedFrames.contains {
                    $0.intersects(frame.insetBy(dx: -30, dy: -30))
                }
            }

            // ✅ Final frame
            view.frame = frame
            usedFrames.append(frame)
        }

        mainBGView.bringSubviewToFront(view1)
        mainBGView.bringSubviewToFront(view2)
        mainBGView.bringSubviewToFront(view3)
    }
    
    func showFirstLetterHint() {

        let firstChar = String(correctWord.first!)   // "C"

        // ⚠️ Kisi aur view ka color mat badlo
        if label1.text == firstChar {
            view1.backgroundColor = .systemGreen
        } else if label2.text == firstChar {
            view2.backgroundColor = .systemGreen
        } else if label3.text == firstChar {
            view3.backgroundColor = .systemGreen
        }
    }
    
    func showCorrectAnswerWithoutLine() {

        // 🔴 Line completely hata do
        resetLine()

        // 🔑 CAT order me views lao
        let orderedViews: [UIView] = correctWord.compactMap { char in
            if label1.text == String(char) { return view1 }
            if label2.text == String(char) { return view2 }
            if label3.text == String(char) { return view3 }
            return nil
        }

        let spacing: CGFloat = 10
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
                    y: centerY - view.bounds.height / 2,
                    width: view.bounds.width,
                    height: view.bounds.height
                )
                currentX += view.bounds.width + spacing
            }
        }

        // 👇 Interaction band (optional – kids app ke liye better)
        //  mainBGView.isUserInteractionEnabled = false
    }
    
    func goToResultScreen() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "ThreeLetterWordResultLevel3VC"
        ) as? ThreeLetterWordResultLevel3VC {

            resultVC.results = results
            resultVC.finalScore = score

            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    @IBAction func giveUpAndNextTapBtn(_ sender: UIButton) {

        // ✅ Multi tap protection
        sender.isEnabled = false

        // ✅ NEXT BUTTON FLOW
        if isWordSolved {

            currentIndex += 1

            if currentIndex < wordsList.count {

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {

                    self.loadCurrentWord()
                    self.updateScoreLabel()

                    sender.isEnabled = true
                }

            } else {

                self.goToResultScreen()
                sender.isEnabled = true
            }

        }

        // ✅ GIVE UP FLOW
        else {

            isWordSolved = true

            if !hasSavedResult {

                results.append(
                    ThreeLetterWordResult(
                        questionWord: shuffledWords[currentIndex],
                        isCorrect: false
                    )
                )

                hasSavedResult = true
            }

            rightOrWrongImgView.image = UIImage(named: "check mark")
            rightOrWrongImgView.isHidden = false

            showCorrectAnswerWithoutLine()

            giveUpAndNextBtn.setTitle("Next", for: .normal)

            updateScoreLabel()

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
