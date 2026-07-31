//
//  MatchTheWordLevel3VC.swift
//  Kids
//
//  Created by Koshal Singh on 04/02/26.
//

import UIKit
import LanguageManager_iOS

class MatchTheWordLevel3VC: BaseViewController {

    // MARK: - FirstN Label BG Views
    @IBOutlet weak var firstNLabelBGView1: UIView!
    @IBOutlet weak var firstNLabelBGView2: UIView!
    @IBOutlet weak var firstNLabelBGView3: UIView!
    @IBOutlet weak var firstNLabelBGView4: UIView!
    @IBOutlet weak var firstNLabelBGView5: UIView!
    
    // MARK: - firstN Labels
    @IBOutlet weak var firstNameLabel1: UILabel!
    @IBOutlet weak var firstNameLabel2: UILabel!
    @IBOutlet weak var firstNameLabel3: UILabel!
    @IBOutlet weak var firstNameLabel4: UILabel!
    @IBOutlet weak var firstNameLabel5: UILabel!
    
    // MARK: - LastN Label BG Views
    @IBOutlet weak var lastNLabelBGView1: UIView!
    @IBOutlet weak var lastNLabelBGView2: UIView!
    @IBOutlet weak var lastNLabelBGView3: UIView!
    @IBOutlet weak var lastNLabelBGView4: UIView!
    @IBOutlet weak var lastNLabelBGView5: UIView!
    
    
    // MARK: - LastN Labels
    @IBOutlet weak var lastNameLabel1: UILabel!
    @IBOutlet weak var lastNameLabel2: UILabel!
    @IBOutlet weak var lastNameLabel3: UILabel!
    @IBOutlet weak var lastNameLabel4: UILabel!
    @IBOutlet weak var lastNameLabel5: UILabel!
    
    
    @IBOutlet weak var submitAndNextTapBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    // MARK: - Variables (SAME AS MatchImageWithLetterVC)
    var startView: UIView?
    var currentLineLayer: CAShapeLayer?
    
    var firstLabels: [UILabel] = []
    var lastLabels: [UILabel] = []
    
    var firstToLine: [UILabel: CAShapeLayer] = [:]
    var lastToLine: [UILabel: CAShapeLayer] = [:]
    var userMatches: [UILabel: UILabel] = [:]
    
    var isSubmitted = false
    var firstLabelToBG: [UILabel: UIView] = [:]
    var lastLabelToBG: [UILabel: UIView] = [:]
    
    var correctWordMap: [String: String] = [
        "Pick".localiz(): "the lid".localiz(),
        "Turn".localiz(): "around".localiz(),
        "Hold".localiz(): "your bag".localiz(),
        "Throw".localiz(): "the toy".localiz(),
        "Close".localiz(): "the ball".localiz()
    ]

    let wordPairs: [WordPair] = [
        WordPair(first: "Pick".localiz(), last: "the lid".localiz()),
        WordPair(first: "Turn".localiz(), last: "around".localiz()),
        WordPair(first: "Hold".localiz(), last: "your bag".localiz()),
        WordPair(first: "Throw".localiz(), last: "the toy".localiz()),
        WordPair(first: "Close".localiz(), last: "the ball".localiz())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
        submitAndNextTapBtn.isHidden = true
        submitAndNextTapBtn.layer.cornerRadius = 6
        
        
        firstNLabelBGView1.layer.cornerRadius = 6
        firstNLabelBGView2.layer.cornerRadius = 6
        firstNLabelBGView3.layer.cornerRadius = 6
        firstNLabelBGView4.layer.cornerRadius = 6
        firstNLabelBGView5.layer.cornerRadius = 6
       
        
        lastNLabelBGView1.layer.cornerRadius = 6
        lastNLabelBGView2.layer.cornerRadius = 6
        lastNLabelBGView3.layer.cornerRadius = 6
        lastNLabelBGView4.layer.cornerRadius = 6
        lastNLabelBGView5.layer.cornerRadius = 6
        
        firstLabels = [
            firstNameLabel1,
            firstNameLabel2,
            firstNameLabel3,
            firstNameLabel4,
            firstNameLabel5
        ]
        
        lastLabels = [
            lastNameLabel1,
            lastNameLabel2,
            lastNameLabel3,
            lastNameLabel4,
            lastNameLabel5
        ]
        
        let firstBGViews = [
            firstNLabelBGView1,
            firstNLabelBGView2,
            firstNLabelBGView3,
            firstNLabelBGView4,
            firstNLabelBGView5
        ]
        
        let lastBGViews = [
            lastNLabelBGView1,
            lastNLabelBGView2,
            lastNLabelBGView3,
            lastNLabelBGView4,
            lastNLabelBGView5
        ]
        
        for label in firstLabels {
            label.isUserInteractionEnabled = true
            let pan = UIPanGestureRecognizer(
                target: self,
                action: #selector(handlePan(_:))
            )
            label.addGestureRecognizer(pan)
        }
        for (label, bg) in zip(firstLabels, firstBGViews) {
            firstLabelToBG[label] = bg
        }
        
        for (label, bg) in zip(lastLabels, lastBGViews) {
            lastLabelToBG[label] = bg
        }
        
        setupWordsRandomly()
        adjustLastWordWidths()
        setupCorners()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        submitAndNextTapBtn.layer.cornerRadius = 6
    }

    func applyTheme() {

        let firstBGViews = [
            firstNLabelBGView1,
            firstNLabelBGView2,
            firstNLabelBGView3,
            firstNLabelBGView4,
            firstNLabelBGView5
        ]

        let lastBGViews = [
            lastNLabelBGView1,
            lastNLabelBGView2,
            lastNLabelBGView3,
            lastNLabelBGView4,
            lastNLabelBGView5
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            submitAndNextTapBtn.backgroundColor = .white
            submitAndNextTapBtn.setTitleColor(.black, for: .normal)

            firstBGViews.forEach {
                $0?.backgroundColor = .white
            }

            lastBGViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            submitAndNextTapBtn.backgroundColor = color
            submitAndNextTapBtn.setTitleColor(.white, for: .normal)

            firstBGViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }

            lastBGViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }
    }
    
    func adjustLastWordWidths() {

        let lastLabels: [UILabel?] = [
            lastNameLabel1,
            lastNameLabel2,
            lastNameLabel3,
            lastNameLabel4,
            lastNameLabel5
        ]

        let lastBGViews: [UIView?] = [
            lastNLabelBGView1,
            lastNLabelBGView2,
            lastNLabelBGView3,
            lastNLabelBGView4,
            lastNLabelBGView5
        ]

        for (labelOpt, bgViewOpt) in zip(lastLabels, lastBGViews) {

            guard let label = labelOpt,
                  let bgView = bgViewOpt else { continue }

            label.numberOfLines = 1
            label.lineBreakMode = .byWordWrapping

            label.setContentHuggingPriority(.required, for: .horizontal)
            label.setContentCompressionResistancePriority(.required, for: .horizontal)

            bgView.setContentHuggingPriority(.required, for: .horizontal)
            bgView.setContentCompressionResistancePriority(.required, for: .horizontal)
        }

        // 🔥 THIS IS IMPORTANT
        view.layoutIfNeeded()
    }
 
    func calculatePercentage() -> Int {
        var correctCount = 0

        for (firstLabel, lastLabel) in userMatches {

            let firstID = firstLabel.accessibilityIdentifier ?? ""
            let expectedID = correctWordMap[firstID] ?? ""
            let actualID = lastLabelToBG[lastLabel]?.accessibilityIdentifier ?? ""

            if expectedID == actualID {
                correctCount += 1
            }
        }

        let total = firstLabels.count
        return Int((Double(correctCount) / Double(total)) * 100)
    }
    
    func setupCorners() {
        let views = [firstNLabelBGView1, firstNLabelBGView2, firstNLabelBGView3, firstNLabelBGView4, firstNLabelBGView5,lastNLabelBGView1,lastNLabelBGView2,lastNLabelBGView3,lastNLabelBGView4,lastNLabelBGView5]
        views.forEach { $0?.layer.cornerRadius = 10 }
    }
    
    func setupWordsRandomly() {

        let shuffledFirst = wordPairs.shuffled()
        let shuffledLast  = wordPairs.shuffled()

        // First side
        for (index, label) in firstLabels.enumerated() {
            let pair = shuffledFirst[index]
            label.text = pair.first
            label.accessibilityIdentifier = pair.first
        }

        let lastBGViews: [UIView] = [
            lastNLabelBGView1,
            lastNLabelBGView2,
            lastNLabelBGView3,
            lastNLabelBGView4,
            lastNLabelBGView5
        ]

        let lastTextLabels: [UILabel] = [
            lastNameLabel1,
            lastNameLabel2,
            lastNameLabel3,
            lastNameLabel4,
            lastNameLabel5
        ]

        // Last side
        for (index, bgView) in lastBGViews.enumerated() {
            let pair = shuffledLast[index]
            bgView.accessibilityIdentifier = pair.last
            lastTextLabels[index].text = pair.last
        }
    }

    
    // MARK: - Pan Gesture (SAME LOGIC)
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {

        if isSubmitted { return }
        guard let touchedLabel = gesture.view as? UILabel else { return }
        let point = gesture.location(in: view)

        switch gesture.state {

        case .began:
            startView = touchedLabel

            let line = CAShapeLayer()
            line.strokeColor = UIColor.lightGray.cgColor
            line.lineWidth = 2
            line.fillColor = UIColor.clear.cgColor
            line.lineCap = .round

            let start = fixedRightCenter(of: touchedLabel)
            let path = UIBezierPath()
            path.move(to: start)
            path.addLine(to: start)

            line.path = path.cgPath

            // 🔥 IMPORTANT CHANGE
            view.layer.insertSublayer(line, at: 0)

            currentLineLayer = line

        case .changed:
            guard let line = currentLineLayer,
                  let startView = startView else { return }

            let start = fixedRightCenter(of: startView)
            let end = point

            let path = UIBezierPath()
            path.move(to: start)
            path.addCurve(
                to: end,
                controlPoint1: CGPoint(x: start.x + 60, y: start.y),
                controlPoint2: CGPoint(x: end.x - 60, y: end.y)
            )
            line.path = path.cgPath

        case .ended:
            guard let line = currentLineLayer,
                  let startLabel = startView as? UILabel else { return }

            if let targetLabel = lastLabels.first(where: {
                let frame = $0.superview?.convert($0.frame, to: view) ?? .zero
                return frame.contains(point)
            }) {

                firstToLine[startLabel]?.removeFromSuperlayer()
                lastToLine[targetLabel]?.removeFromSuperlayer()

                let start = fixedRightCenter(of: startLabel)
                let end = fixedLeftCenter(of: targetLabel)

                let path = UIBezierPath()
                path.move(to: start)
                path.addCurve(
                    to: end,
                    controlPoint1: CGPoint(x: start.x + 60, y: start.y),
                    controlPoint2: CGPoint(x: end.x - 60, y: end.y)
                )

                line.path = path.cgPath
                line.strokeColor = UIColor.black.cgColor

                if let oldLast = userMatches[startLabel] {
                    lastToLine[oldLast]?.removeFromSuperlayer()
                }

                if let oldFirst = userMatches.first(where: { $0.value == targetLabel })?.key {
                    firstToLine[oldFirst]?.removeFromSuperlayer()
                    userMatches.removeValue(forKey: oldFirst)
                }

                firstToLine[startLabel] = line
                lastToLine[targetLabel] = line
                userMatches[startLabel] = targetLabel

                checkIfAllConnected()
            } else {
                line.removeFromSuperlayer()
            }

            currentLineLayer = nil
            startView = nil

        default:
            break
        }
    }
    func resultImage(for percentage: Int) -> UIImage? {
        if percentage == 100 {
            return UIImage(named: "well-done")
        } else {
            return UIImage(named: "try-again")
        }
    }
    
    // MARK: - Helpers
    func checkIfAllConnected() {
        submitAndNextTapBtn.isHidden = userMatches.count < firstLabels.count
    }

    func fixedRightCenter(of view: UIView) -> CGPoint {
        let p = CGPoint(x: view.frame.maxX, y: view.frame.midY)
        return view.superview?.convert(p, to: self.view) ?? .zero
    }

    func fixedLeftCenter(of view: UIView) -> CGPoint {
        let p = CGPoint(x: view.frame.minX, y: view.frame.midY)
        return view.superview?.convert(p, to: self.view) ?? .zero
    }
    

    // MARK: - Submit / Next
    @IBAction func submitAndNextTapBtn(_ sender: UIButton) {

        if isSubmitted {

            let percentage = calculatePercentage()

            // 🔐 SAVE MATCH THE WORD – LEVEL 1
            UserDefaults.standard.set(true, forKey: "matchTheWordLevel3Completed")
            UserDefaults.standard.set(percentage, forKey: "matchTheWordLevel3Percentage")

            if let menuVC = navigationController?.viewControllers.first(
                where: { $0 is MatchTheWordMenuVC }
            ) as? MatchTheWordMenuVC {

                navigationController?.popToViewController(menuVC, animated: true)
            }

            return
        }

        // 🔽 Existing submit logic (coloring etc.)
        for (firstLabel, lastLabel) in userMatches {
            let firstID = firstLabel.accessibilityIdentifier ?? ""
            let expectedID = correctWordMap[firstID] ?? ""

            let firstBG = firstLabelToBG[firstLabel]
            let lastBG  = lastLabelToBG[lastLabel]
            let line    = firstToLine[firstLabel]

            let actualID = lastLabelToBG[lastLabel]?.accessibilityIdentifier ?? ""

            if expectedID == actualID {
                line?.strokeColor = UIColor.systemGreen.cgColor
                firstBG?.backgroundColor = .systemGreen
                lastBG?.backgroundColor  = .systemGreen
            } else {
                line?.strokeColor = UIColor.systemRed.cgColor
                firstBG?.backgroundColor = .systemRed
                lastBG?.backgroundColor  = .systemRed
            }
        }

        isSubmitted = true
        sender.setTitle("NEXT", for: .normal)
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
