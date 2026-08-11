//
//  PlanentOrderMatchVC.swift
//  Kids
//
//  Created by Koshal Singh on 23/02/26.
//

import LanguageManager_iOS
struct PlanentPair {
    let first: String
    let last: String
}

import UIKit

class PlanentOrderMatchVC: BaseViewController {
    
    // MARK: - FirstN Label BG Views
    @IBOutlet weak var firstNLabelBGView1: UIView!
    @IBOutlet weak var firstNLabelBGView2: UIView!
    @IBOutlet weak var firstNLabelBGView3: UIView!
    @IBOutlet weak var firstNLabelBGView4: UIView!
    @IBOutlet weak var firstNLabelBGView5: UIView!
    @IBOutlet weak var firstNLabelBGView6: UIView!
    @IBOutlet weak var firstNLabelBGView7: UIView!
    @IBOutlet weak var firstNLabelBGView8: UIView!
    
    // MARK: - firstN Labels
    @IBOutlet weak var firstNameLabel1: UILabel!
    @IBOutlet weak var firstNameLabel2: UILabel!
    @IBOutlet weak var firstNameLabel3: UILabel!
    @IBOutlet weak var firstNameLabel4: UILabel!
    @IBOutlet weak var firstNameLabel5: UILabel!
    @IBOutlet weak var firstNameLabel6: UILabel!
    @IBOutlet weak var firstNameLabel7: UILabel!
    @IBOutlet weak var firstNameLabel8: UILabel!
    
    // MARK: - LastN Label BG Views
    @IBOutlet weak var lastNLabelBGView1: UIView!
    @IBOutlet weak var lastNLabelBGView2: UIView!
    @IBOutlet weak var lastNLabelBGView3: UIView!
    @IBOutlet weak var lastNLabelBGView4: UIView!
    @IBOutlet weak var lastNLabelBGView5: UIView!
    @IBOutlet weak var lastNLabelBGView6: UIView!
    @IBOutlet weak var lastNLabelBGView7: UIView!
    @IBOutlet weak var lastNLabelBGView8: UIView!
    
    
    // MARK: - LastN Labels
    @IBOutlet weak var lastNameLabel1: UILabel!
    @IBOutlet weak var lastNameLabel2: UILabel!
    @IBOutlet weak var lastNameLabel3: UILabel!
    @IBOutlet weak var lastNameLabel4: UILabel!
    @IBOutlet weak var lastNameLabel5: UILabel!
    @IBOutlet weak var lastNameLabel6: UILabel!
    @IBOutlet weak var lastNameLabel7: UILabel!
    @IBOutlet weak var lastNameLabel8: UILabel!
    
    
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
        "1": "Mercury".localiz(),
        "2": "Venus".localiz(),
        "3": "Earth".localiz(),
        "4": "Mars".localiz(),
        "5": "Jupiter".localiz(),
        "6": "Saturn".localiz(),
        "7": "Uranus".localiz(),
        "8": "Neptune".localiz()
    ]

    let wordPairs: [PlanentPair] = [
        PlanentPair(first: "1", last: "Mercury".localiz()),
        PlanentPair(first: "2", last: "Venus".localiz()),
        PlanentPair(first: "3", last: "Earth".localiz()),
        PlanentPair(first: "4", last: "Mars".localiz()),
        PlanentPair(first: "5", last: "Jupiter".localiz()),
        PlanentPair(first: "6", last: "Saturn".localiz()),
        PlanentPair(first: "7", last: "Uranus".localiz()),
        PlanentPair(first: "8", last: "Neptune".localiz())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        submitAndNextTapBtn.isHidden = true
        
        firstNLabelBGView1.layer.cornerRadius = 10
        firstNLabelBGView1.backgroundColor = ColorManager.randomColor()
        firstNLabelBGView1.layer.borderColor = UIColor.black.cgColor
      
        
        firstNLabelBGView2.layer.cornerRadius = 10
        firstNLabelBGView2.backgroundColor = ColorManager.randomColor()
        firstNLabelBGView2.layer.borderColor = UIColor.black.cgColor
     
        
        firstNLabelBGView3.layer.cornerRadius = 10
        firstNLabelBGView3.backgroundColor = ColorManager.randomColor()
        firstNLabelBGView3.layer.borderColor = UIColor.black.cgColor
  
        
        firstNLabelBGView4.layer.cornerRadius = 10
        firstNLabelBGView4.backgroundColor = ColorManager.randomColor()
        firstNLabelBGView4.layer.borderColor = UIColor.black.cgColor
      
        
        firstNLabelBGView5.layer.cornerRadius = 10
        firstNLabelBGView5.backgroundColor = ColorManager.randomColor()
        firstNLabelBGView5.layer.borderColor = UIColor.black.cgColor
       
        
        firstNLabelBGView6.layer.cornerRadius = 10
        firstNLabelBGView6.backgroundColor = ColorManager.randomColor()
        firstNLabelBGView6.layer.borderColor = UIColor.black.cgColor
        
        
        firstNLabelBGView7.layer.cornerRadius = 10
        firstNLabelBGView7.backgroundColor = ColorManager.randomColor()
        firstNLabelBGView7.layer.borderColor = UIColor.black.cgColor
  
        
        firstNLabelBGView8.layer.cornerRadius = 10
        firstNLabelBGView8.backgroundColor = ColorManager.randomColor()
        firstNLabelBGView8.layer.borderColor = UIColor.black.cgColor
        
        
        
        
        lastNLabelBGView1.layer.cornerRadius = 10
        lastNLabelBGView1.backgroundColor = ColorManager.randomColor()
        lastNLabelBGView1.layer.borderColor = UIColor.black.cgColor

        
        lastNLabelBGView2.layer.cornerRadius = 10
        lastNLabelBGView2.backgroundColor = ColorManager.randomColor()
        lastNLabelBGView2.layer.borderColor = UIColor.black.cgColor

        
        lastNLabelBGView3.layer.cornerRadius = 10
        lastNLabelBGView3.backgroundColor = ColorManager.randomColor()
        lastNLabelBGView3.layer.borderColor = UIColor.black.cgColor
      
        
        lastNLabelBGView4.layer.cornerRadius = 10
        lastNLabelBGView4.backgroundColor = ColorManager.randomColor()
        lastNLabelBGView4.layer.borderColor = UIColor.black.cgColor
     
        
        lastNLabelBGView5.layer.cornerRadius = 10
        lastNLabelBGView5.backgroundColor = ColorManager.randomColor()
        lastNLabelBGView5.layer.borderColor = UIColor.black.cgColor
    
        
        lastNLabelBGView6.layer.cornerRadius = 10
        lastNLabelBGView6.backgroundColor = ColorManager.randomColor()
        lastNLabelBGView6.layer.borderColor = UIColor.black.cgColor
        
        
        lastNLabelBGView7.layer.cornerRadius = 10
        lastNLabelBGView7.backgroundColor = ColorManager.randomColor()
        lastNLabelBGView7.layer.borderColor = UIColor.black.cgColor
       
        
        lastNLabelBGView8.layer.cornerRadius = 10
        lastNLabelBGView8.backgroundColor = ColorManager.randomColor()
        lastNLabelBGView8.layer.borderColor = UIColor.black.cgColor

        firstLabels = [
            firstNameLabel1,
            firstNameLabel2,
            firstNameLabel3,
            firstNameLabel4,
            firstNameLabel5,
            firstNameLabel6,
            firstNameLabel7,
            firstNameLabel8
        ]
        
        lastLabels = [
            lastNameLabel1,
            lastNameLabel2,
            lastNameLabel3,
            lastNameLabel4,
            lastNameLabel5,
            lastNameLabel6,
            lastNameLabel7,
            lastNameLabel8,
        ]
        
        let firstBGViews = [
            firstNLabelBGView1,
            firstNLabelBGView2,
            firstNLabelBGView3,
            firstNLabelBGView4,
            firstNLabelBGView5,
            firstNLabelBGView6,
            firstNLabelBGView7,
            firstNLabelBGView8,
        ]
        
        let lastBGViews = [
            lastNLabelBGView1,
            lastNLabelBGView2,
            lastNLabelBGView3,
            lastNLabelBGView4,
            lastNLabelBGView5,
            lastNLabelBGView6,
            lastNLabelBGView7,
            lastNLabelBGView8,
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
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        submitAndNextTapBtn.layer.cornerRadius = 6
        submitAndNextTapBtn.backgroundColor = color
    }

    func adjustLastWordWidths() {

        let lastLabels: [UILabel?] = [
            lastNameLabel1,
            lastNameLabel2,
            lastNameLabel3,
            lastNameLabel4,
            lastNameLabel5,
            lastNameLabel6,
            lastNameLabel7,
            lastNameLabel8,
        ]

        let lastBGViews: [UIView?] = [
            lastNLabelBGView1,
            lastNLabelBGView2,
            lastNLabelBGView3,
            lastNLabelBGView4,
            lastNLabelBGView5,
            lastNLabelBGView6,
            lastNLabelBGView7,
            lastNLabelBGView8,
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
            lastNLabelBGView5,
            lastNLabelBGView6,
            lastNLabelBGView7,
            lastNLabelBGView8,
        ]

        let lastTextLabels: [UILabel] = [
            lastNameLabel1,
            lastNameLabel2,
            lastNameLabel3,
            lastNameLabel4,
            lastNameLabel5,
            lastNameLabel6,
            lastNameLabel7,
            lastNameLabel8,
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
            return UIImage(named: "done")
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
            
            UserDefaults.standard.set(true, forKey: "solarSystemLevel7Completed")

            if let menuVC = navigationController?.viewControllers.first(
                where: { $0 is SolarSystemMenuVC }
            ) as? SolarSystemMenuVC {

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
