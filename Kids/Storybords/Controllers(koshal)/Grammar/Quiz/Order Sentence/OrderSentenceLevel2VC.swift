//
//  OrderSentenceLevel2VC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//


import UIKit
import LanguageManager_iOS

class OrderSentenceLevel2VC: BaseViewController {

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
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var repeatBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var lineLayer = CAShapeLayer()
    var linePath = UIBezierPath()

    var touchedViews: [UIView] = []
    var lastPoint: CGPoint?
    
    // Updated to triples with 3 words each
    let sentenceTriples: [(String, String, String)] = [
        ("Wash".localiz(), "your".localiz(), "hands".localiz()),
        ("Sit".localiz(), "on".localiz(), "chair".localiz()),
        ("Play".localiz(), "with".localiz(), "toys".localiz()),
        ("Open".localiz(), "the".localiz(), "door".localiz()),
        ("Drink".localiz(), "some".localiz(), "water".localiz()),
        ("Close".localiz(), "the".localiz(), "window".localiz()),
        ("Brush".localiz(), "your".localiz(), "teeth".localiz()),
        ("Read".localiz(), "the".localiz(), "book".localiz()),
        ("Eat".localiz(), "your".localiz(), "food".localiz()),
        ("Turn".localiz(), "off".localiz(), "lights".localiz())
    ]

    var currentIndex = 0
    var correctSentence: (String, String, String) = ("", "", "")
    var isWordSolved = false
    
    var correctViewsOrder: [UIView] = []
    
    var fixedPath = UIBezierPath()
    var tempPath = UIBezierPath()
    
    var results: [OrderSentenceResult] = []
    var score = 0
    
    // ✅ Width: 80, Height: 40 (आपका requirement)
    let viewSize = CGSize(width: 80, height: 40)
    
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
        
        nextBtn.isHidden = true
        repeatBtn.isHidden = true
        
        // ✅ पहले से ही views की size set करें
        view1.frame.size = viewSize
        view2.frame.size = viewSize
        view3.frame.size = viewSize
        
        // ✅ Labels के font size को adjust करें (height कम है इसलिए font भी कम)
        label1.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label2.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label3.font = UIFont.systemFont(ofSize: 18, weight: .regular)
      
        // ✅ Text को center align करें
        label1.textAlignment = .center
        label2.textAlignment = .center
        label3.textAlignment = .center
        
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        
        scoreLabelBGView.layer.cornerRadius = 6
        
       
        view1.layer.cornerRadius = 6
        view2.layer.cornerRadius = 6
        view3.layer.cornerRadius = 6
       
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
        
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        
        updateScoreLabel()
        
        lineLayer.removeFromSuperlayer()
        setupLineLayer()
    }
    
    func loadCurrentWord() {
        guard currentIndex < sentenceTriples.count else {
            goToResultScreen()
            return
        }

        view1.isHidden = false
        view2.isHidden = false
        view3.isHidden = false

        hardResetState()

        correctSentence = sentenceTriples[currentIndex]
        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"

        isWordSolved = false
        nextBtn.setTitle("Next".localiz(), for: .normal)
        nextBtn.isEnabled = true
        nextBtn.isHidden = true
        repeatBtn.isHidden = true
        
        setupLetters()
        resetViewsColor()

        self.view.layoutIfNeeded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.randomizeViewsPosition()
        }

        rightOrWrongImgView.isHidden = true
        setLetterInteraction(true)
    }
    
    func setupLetters() {
        let words = [correctSentence.0, correctSentence.1, correctSentence.2].shuffled()

        label1.text = words[0]
        label2.text = words[1]
        label3.text = words[2]
    }

    func arrangeViewsInRow() {
        // ✅ Use user touched order instead of correct order
        let orderedViews = touchedViews

        let spacing: CGFloat = 10
        let startX: CGFloat = 20
        let centerY = mainBGView.bounds.height / 2

        var currentX = startX

        // Line temporarily hide
        lineLayer.path = nil

        UIView.animate(withDuration: 0.3, animations: {
            for view in orderedViews {
                view.frame = CGRect(
                    x: currentX,
                    y: centerY - self.viewSize.height / 2,
                    width: self.viewSize.width,
                    height: self.viewSize.height
                )
                currentX += self.viewSize.width + spacing
            }
        }, completion: { _ in
            // Redraw line in same order
            self.drawFinalLine(between: orderedViews)
        })
    }
    
    func viewForWord(_ word: String) -> UIView? {
        if label1.text == word { return view1 }
        if label2.text == word { return view2 }
        if label3.text == word { return view3 }
        return nil
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
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        repeatBtn.layer.cornerRadius = 6
        nextBtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

            repeatBtn.backgroundColor = .white
            repeatBtn.setTitleColor(.black, for: .normal)

            scoreLabelBGView.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            repeatBtn.backgroundColor = color
            repeatBtn.setTitleColor(.white, for: .normal)

            scoreLabelBGView.backgroundColor = color
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
        guard !isWordSolved else { return }

        if touchedViews.count == 3 {
            lineLayer.path = fixedPath.cgPath
            checkResult()
        } else {
            resetLine()
        }
    }
    
    func checkResult() {
        let formedSentence = touchedViews.compactMap { view -> String? in
            if view == view1 { return label1.text }
            if view == view2 { return label2.text }
            if view == view3 { return label3.text }
            return nil
        }

        let isCorrect =
            formedSentence.count == 3 &&
            formedSentence[0] == correctSentence.0 &&
            formedSentence[1] == correctSentence.1 &&
            formedSentence[2] == correctSentence.2

        isWordSolved = true

        if isCorrect {
            score += 1
            updateScoreLabel()

            results.append(
                OrderSentenceResult(
                    correctWord: "\(correctSentence.0) \(correctSentence.1) \(correctSentence.2)",
                    isCorrect: true
                )
            )

            repeatBtn.isHidden = true
            rightOrWrongImgView.image = UIImage(named: "check mark")

        } else {
            results.append(
                OrderSentenceResult(
                    correctWord: "\(correctSentence.0) \(correctSentence.1) \(correctSentence.2)",
                    isCorrect: false
                )
            )

            repeatBtn.isHidden = false
            rightOrWrongImgView.image = UIImage(named: "close")
        }

        rightOrWrongImgView.isHidden = false
        arrangeViewsInRow()
        setLetterInteraction(false)
        
        nextBtn.isHidden = false
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
        animation.duration = 0.35
        animation.values = [-12, 12, -10, 10, -8, 8, 0]

        views.forEach {
            $0?.layer.add(animation, forKey: "fastVibrate")
        }
    }
    
    
    func setSpacedText(_ label: UILabel, text: String, spacing: CGFloat = 3) {
        let attributed = NSMutableAttributedString(string: text)
        attributed.addAttribute(.kern, value: spacing, range: NSRange(location: 0, length: text.count))
        label.attributedText = attributed
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
    
    func randomizeViewsPosition() {
        // ✅ Disable AutoLayout
        [view1, view2, view3].forEach {
            $0?.translatesAutoresizingMaskIntoConstraints = true
        }

        let views = [view1, view2, view3]
        
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
    }
    
    func setDefaultPositions() {
        // ✅ Fallback positions that never overlap
        let positions = [
            CGPoint(x: 30, y: 100),
            CGPoint(x: 30, y: 200),
            CGPoint(x: 30, y: 300),
            CGPoint(x: 150, y: 150),
            CGPoint(x: 150, y: 250)
        ]
        
        view1.frame = CGRect(origin: positions[0], size: viewSize)
        view2.frame = CGRect(origin: positions[1], size: viewSize)
        view3.frame = CGRect(origin: positions[2], size: viewSize)
    }
    
    func verifyNoOverlap() {
        let frames = [view1.frame, view2.frame, view3.frame]
        
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
    
    func goToResultScreen() {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "OrderSentenceResultLevel2VC"
        ) as? OrderSentenceResultLevel2VC {

            resultVC.results = results
            resultVC.finalScore = score

            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    func setLetterInteraction(_ enabled: Bool) {
        view1.isUserInteractionEnabled = enabled
        view2.isUserInteractionEnabled = enabled
        view3.isUserInteractionEnabled = enabled
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        currentIndex += 1

        if currentIndex < sentenceTriples.count {
            loadCurrentWord()
            updateScoreLabel()
        } else {
            goToResultScreen()
        }
    }
    
    @IBAction func repeatTapBtn(_ sender: UIButton) {
        repeatBtn.isHidden = true
        rightOrWrongImgView.isHidden = true
        loadCurrentWord()
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
