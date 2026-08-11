//
//  MatchTheSeasonVC.swift
//  KSchool
//
//  Created by Koshal Singh on 07/04/26.
//

import UIKit

class MatchTheSeasonVC: BaseViewController {

    // MARK: - Label BG Views
    @IBOutlet weak var labelBGView1: UIView!
    @IBOutlet weak var labelBGView2: UIView!
    @IBOutlet weak var labelBGView3: UIView!
    @IBOutlet weak var labelBGView4: UIView!
    @IBOutlet weak var labelBGView5: UIView!

    // MARK: - Labels
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!

    // MARK: - Image BG Views
    @IBOutlet weak var imgBGView1: UIView!
    @IBOutlet weak var imgBGView2: UIView!
    @IBOutlet weak var imgBGView3: UIView!
    @IBOutlet weak var imgBGView4: UIView!
    @IBOutlet weak var imgBGView5: UIView!

    // MARK: - Images
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!

    // MARK: - Button
    @IBOutlet weak var submitAndNextTapBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    // MARK: - Variables
    var startView: UIView?
    var currentLineLayer: CAShapeLayer?

    var letterLabels: [UILabel] = []
    var imageImageViews: [UIImageView] = []

    var letterToLine: [UILabel: CAShapeLayer] = [:]
    var imageToLine: [UIImageView: CAShapeLayer] = [:]
    var userMatches: [UILabel: UIImageView] = [:]

//    var correctMatchTagMap: [String: Int] = [
//        "Autumn": 1,
//        "Winter": 2,
//        "Summer": 3,
//        "Spring": 4,
//        "Rainy": 5
//    ]
    
    var isSubmitted = false

    var correctMatchImageNameMap: [String: String] = [
        "Autumn": "leaf-fall",
        "Winter": "snowman",
        "Spring": "spring",
        "Summer": "ice-cream",
        "Rainy": "umbrella"
    ]

    let imageData: [(letter: String, imageName: String)] = [
        ("Autumn", "leaf-fall"),
        ("Winter","snowman"),
        ("Spring", "spring"),
        ("Summer", "ice-cream"),
        ("Rainy", "umbrella")
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        submitAndNextTapBtn.isHidden = true
        
        letterLabels = [label1, label2, label3, label4, label5]
        imageImageViews = [img1, img2, img3, img5, img6]

        setupLabels()
        setupCorners()
        setupImagesRandomly()
        
        for label in letterLabels {
            label.isUserInteractionEnabled = true
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            label.addGestureRecognizer(pan)
        }

        labelBGView1.layer.cornerRadius = 10
        labelBGView1.backgroundColor = ColorManager.randomColor()
        labelBGView1.layer.borderColor = UIColor.black.cgColor
        

        labelBGView2.layer.cornerRadius = 10
        labelBGView2.backgroundColor = ColorManager.randomColor()
        labelBGView2.layer.borderColor = UIColor.black.cgColor
        

        labelBGView3.layer.cornerRadius = 10
        labelBGView3.backgroundColor = ColorManager.randomColor()
        labelBGView3.layer.borderColor = UIColor.black.cgColor
        

        labelBGView4.layer.cornerRadius = 10
        labelBGView4.backgroundColor = ColorManager.randomColor()
        labelBGView4.layer.borderColor = UIColor.black.cgColor
        

        labelBGView5.layer.cornerRadius = 10
        labelBGView5.backgroundColor = ColorManager.randomColor()
        labelBGView5.layer.borderColor = UIColor.black.cgColor
      
    
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

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setupImagesRandomly() {

        let shuffledImages = imageData.shuffled()

        for (index, imageView) in imageImageViews.enumerated() {

            let imageName = shuffledImages[index].imageName

            imageView.image = UIImage(named: imageName)

            
            imageView.accessibilityIdentifier = imageName

            imageView.contentMode = .scaleAspectFit
        }
    }
    
    func calculatePercentage() -> Int {
        var correctCount = 0

        for (label, imageView) in userMatches {
            let letter = label.text ?? ""

            guard
                let correctImageName = correctMatchImageNameMap[letter],
                let currentImageName = imageView.accessibilityIdentifier
            else { continue }

            if correctImageName == currentImageName {
                correctCount += 1
            }
        }

        let total = letterLabels.count
        return Int((Double(correctCount) / Double(total)) * 100)
    }
    
    // MARK: - Setup Methods
    func setupLabels() {
        let seasons = ["Autumn", "Winter", "Spring", "Summer", "Rainy"].shuffled()
        for (index, label) in letterLabels.enumerated() {
            label.text = seasons[index]
        }
    }

    func setupCorners() {
        let labelBGs = [labelBGView1, labelBGView2, labelBGView3, labelBGView4, labelBGView5]
        labelBGs.forEach { $0?.layer.cornerRadius = 10 }
    }

    // MARK: - Pan Gesture
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        if isSubmitted { return }
        guard let touchedLabel = gesture.view as? UILabel else { return }
        let point = gesture.location(in: self.view)

        switch gesture.state {

        case .began:
            startView = touchedLabel

            let line = CAShapeLayer()
            line.strokeColor = UIColor.lightGray.cgColor
            line.lineWidth = 2
            line.fillColor = UIColor.clear.cgColor
            line.lineCap = .round
            line.lineJoin = .round

            let startPoint = fixedRightCenterPoint(of: touchedLabel)
            let path = UIBezierPath()
            path.move(to: startPoint)
            path.addLine(to: startPoint)

            line.path = path.cgPath
            view.layer.addSublayer(line)
            currentLineLayer = line

        case .changed:
            guard let line = currentLineLayer,
                  let startView = startView else { return }

            let start = fixedRightCenterPoint(of: startView)
            let end = point

            let path = UIBezierPath()
            path.move(to: start)
            path.addCurve(to: end,
                          controlPoint1: CGPoint(x: start.x + 60, y: start.y),
                          controlPoint2: CGPoint(x: end.x - 60, y: end.y))

            line.path = path.cgPath

        case .ended:
            guard let line = currentLineLayer,
                  let startLabel = startView as? UILabel else { return }

            if let targetImage = imageImageViews.first(where: {
                let frame = $0.superview?.convert($0.frame, to: self.view) ?? .zero
                return frame.contains(point)
            }) {

                letterToLine[startLabel]?.removeFromSuperlayer()
                imageToLine[targetImage]?.removeFromSuperlayer()

                let start = fixedRightCenterPoint(of: startLabel)
                let end = fixedLeftCenterPoint(of: targetImage)

                let path = UIBezierPath()
                path.move(to: start)
                path.addCurve(to: end,
                              controlPoint1: CGPoint(x: start.x + 60, y: start.y),
                              controlPoint2: CGPoint(x: end.x - 60, y: end.y))

                line.path = path.cgPath
                line.strokeColor = UIColor.black.cgColor

                if let oldImage = userMatches[startLabel] {
                    imageToLine[oldImage]?.removeFromSuperlayer()
                    imageToLine[oldImage] = nil
                }

                if let oldLabel = userMatches.first(where: { $0.value == targetImage })?.key {
                    letterToLine[oldLabel]?.removeFromSuperlayer()
                    letterToLine[oldLabel] = nil
                    userMatches.removeValue(forKey: oldLabel)
                }

                letterToLine[startLabel] = line
                imageToLine[targetImage] = line
                userMatches[startLabel] = targetImage

                checkIfAllConnected()
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

    // MARK: - Button Action
    @IBAction func submitAndNextTapBtn(_ sender: UIButton) {

        if isSubmitted {

            let percentage = calculatePercentage()

            // 🔐 SAVE MATCH IMAGE WITH LETTER – LEVEL 1
            UserDefaults.standard.set(true, forKey: "seasonsLevel2Completed")
            UserDefaults.standard.set(percentage, forKey: "seasonsLevel2Percentage")

            if let menuVC = navigationController?.viewControllers.first(
                where: { $0 is SeasonsMenuVC }
            ) as? SeasonsMenuVC {

                navigationController?.popToViewController(menuVC, animated: true)
            }
            return
        }

        // 🔽 ye aapka existing checking / coloring logic rahega
        for (label, imageView) in userMatches {
            let letter = label.text ?? ""

            guard
                let correctImageName = correctMatchImageNameMap[letter],
                let currentImageName = imageView.accessibilityIdentifier
            else { continue }

            let line = letterToLine[label]

            if currentImageName == correctImageName {
                line?.strokeColor = UIColor.systemGreen.cgColor
                label.superview?.backgroundColor = UIColor.systemGreen
            } else {
                line?.strokeColor = UIColor.systemRed.cgColor
                label.superview?.backgroundColor = UIColor.systemRed
            }
        }

        isSubmitted = true
        sender.setTitle("NEXT", for: .normal)
    }

    func resultImage(for percentage: Int) -> UIImage? {
        return UIImage(named: "done")
    }
    
    
    // MARK: - Line Points
    func fixedRightCenterPoint(of view: UIView) -> CGPoint {
        let point = CGPoint(x: view.frame.maxX, y: view.frame.midY)
        return view.superview?.convert(point, to: self.view) ?? .zero
    }

    func fixedLeftCenterPoint(of view: UIView) -> CGPoint {
        let point = CGPoint(x: view.frame.minX, y: view.frame.midY)
        return view.superview?.convert(point, to: self.view) ?? .zero
    }
    
    func checkIfAllConnected() {
        print("Connected:", userMatches.count)
        submitAndNextTapBtn.isHidden = userMatches.count < letterLabels.count
    }
}
