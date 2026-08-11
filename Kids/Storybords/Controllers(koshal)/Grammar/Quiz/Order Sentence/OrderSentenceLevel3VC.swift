//
//  OrderSentenceLevel3VC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//

//
//  OrderSentenceLevel2VC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//

import UIKit
import LanguageManager_iOS

class OrderSentenceLevel3VC: BaseViewController {

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
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var repeatBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var lineLayer = CAShapeLayer()
    var linePath = UIBezierPath()

    var touchedViews: [UIView] = []
    var lastPoint: CGPoint?
    
    // Updated to quads with 4 words each
    let sentenceQuads: [(String, String, String, String)] = [
        ("Eat".localiz(), "your".localiz(), "tasty".localiz(), "lunch".localiz()),
        ("Stand".localiz(), "up".localiz(), "and".localiz(), "stretch".localiz()),
        ("Sit".localiz(), "on".localiz(), "your".localiz(), "chair".localiz()),
        ("Drink".localiz(), "some".localiz(), "fresh".localiz(), "water".localiz()),
        ("Open".localiz(), "your".localiz(), "blue".localiz(), "book".localiz()),
        ("Brush".localiz(), "your".localiz(), "tiny".localiz(), "teeth".localiz()),
        ("Read".localiz(), "the".localiz(), "big".localiz(), "story".localiz()),
        ("Play".localiz(), "with".localiz(), "your".localiz(), "toys".localiz()),
        ("Wash".localiz(), "your".localiz(), "little".localiz(), "hands".localiz()),
        ("Put".localiz(), "on".localiz(), "your".localiz(), "shoes".localiz())
    ]

    var currentIndex = 0
    var correctSentence: (String, String, String, String) = ("", "", "", "")
    var isWordSolved = false
    
    var correctViewsOrder: [UIView] = []
    
    var fixedPath = UIBezierPath()
    var tempPath = UIBezierPath()
    
    var results: [OrderSentenceResult] = []
    var score = 0
    
    // ✅ Width: 80, Height: 40 (आपका requirement)
    let viewSize = CGSize(width: 80, height: 40)
    
    // ✅ More positions for 4 views
    let predefinedPositions: [CGPoint] = [
        CGPoint(x: 30, y: 80),     // Top-left
        CGPoint(x: 30, y: 180),    // Middle-left top
        CGPoint(x: 30, y: 280),    // Middle-left bottom
        CGPoint(x: 30, y: 380),    // Bottom-left
        CGPoint(x: 180, y: 80),    // Top-right
        CGPoint(x: 180, y: 180),   // Middle-right top
        CGPoint(x: 180, y: 280),   // Middle-right bottom
        CGPoint(x: 180, y: 380),   // Bottom-right
        CGPoint(x: 105, y: 130),   // Center-top left
        CGPoint(x: 105, y: 230),   // Center-top right
        CGPoint(x: 105, y: 330)    // Center-bottom
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
        view4.frame.size = viewSize
        
        // ✅ Labels के font size को adjust करें (height कम है इसलिए font भी कम)
        label1.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label2.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label3.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label4.font = UIFont.systemFont(ofSize: 16, weight: .regular)
      
        // ✅ Text को center align करें
        label1.textAlignment = .center
        label2.textAlignment = .center
        label3.textAlignment = .center
        label4.textAlignment = .center
        
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
        
        scoreLabelBGView.layer.cornerRadius = 6
        
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
        
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
        
        updateScoreLabel()
        
        lineLayer.removeFromSuperlayer()
        setupLineLayer()
    }
    
    func loadCurrentWord() {
        guard currentIndex < sentenceQuads.count else {
            goToResultScreen()
            return
        }

        view1.isHidden = false
        view2.isHidden = false
        view3.isHidden = false
        view4.isHidden = false

        hardResetState()

        correctSentence = sentenceQuads[currentIndex]
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
        let words = [correctSentence.0, correctSentence.1, correctSentence.2, correctSentence.3].shuffled()

        label1.text = words[0]
        label2.text = words[1]
        label3.text = words[2]
        label4.text = words[3]
    }

    func arrangeViewsInRow() {
        // ✅ Use user touched order instead of correct order
        let orderedViews = touchedViews

        let spacing: CGFloat = 8 // Reduced spacing for 4 views
        let startX: CGFloat = 10
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
        if label4.text == word { return view4 }
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
        mainBGView.bringSubviewToFront(view4)
    }
    
    func setup(){
        let color = ColorManager.randomColor()
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
           
            repeatBtn.backgroundColor = .white
            
            scoreLabelBGView.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            
            repeatBtn.backgroundColor = color
            
            scoreLabelBGView.backgroundColor = color
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
        guard !isWordSolved else { return }

        if touchedViews.count == 4 {
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
            if view == view4 { return label4.text }
            return nil
        }

        let isCorrect =
            formedSentence.count == 4 &&
            formedSentence[0] == correctSentence.0 &&
            formedSentence[1] == correctSentence.1 &&
            formedSentence[2] == correctSentence.2 &&
            formedSentence[3] == correctSentence.3

        isWordSolved = true

        if isCorrect {
            score += 1
            updateScoreLabel()

            results.append(
                OrderSentenceResult(
                    correctWord: "\(correctSentence.0) \(correctSentence.1) \(correctSentence.2) \(correctSentence.3)",
                    isCorrect: true
                )
            )

            repeatBtn.isHidden = true
            rightOrWrongImgView.image = UIImage(named: "check mark")

        } else {
            results.append(
                OrderSentenceResult(
                    correctWord: "\(correctSentence.0) \(correctSentence.1) \(correctSentence.2) \(correctSentence.3)",
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
    
    func setSpacedText(_ label: UILabel, text: String, spacing: CGFloat = 3) {
        let attributed = NSMutableAttributedString(string: text)
        attributed.addAttribute(.kern, value: spacing, range: NSRange(location: 0, length: text.count))
        label.attributedText = attributed
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
        let gridColumns = 4
        let gridRows = 4
        
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
            CGPoint(x: 30, y: 80),
            CGPoint(x: 30, y: 180),
            CGPoint(x: 30, y: 280),
            CGPoint(x: 30, y: 380),
            CGPoint(x: 150, y: 130),
            CGPoint(x: 150, y: 230),
            CGPoint(x: 150, y: 330)
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
    
    func goToResultScreen() {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "OrderSentenceResultLevel3VC"
        ) as? OrderSentenceResultLevel3VC {

            resultVC.results = results
            resultVC.finalScore = score

            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    func setLetterInteraction(_ enabled: Bool) {
        view1.isUserInteractionEnabled = enabled
        view2.isUserInteractionEnabled = enabled
        view3.isUserInteractionEnabled = enabled
        view4.isUserInteractionEnabled = enabled
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        currentIndex += 1

        if currentIndex < sentenceQuads.count {
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
