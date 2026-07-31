//
//  DirectionsVC.swift
//  New
//
//  Created by Koshal Singh on 09/04/26.
//

import UIKit
import CoreLocation

class DirectionsVC: BaseViewController, CLLocationManagerDelegate {

    @IBOutlet weak var eastView: UIView!
    @IBOutlet weak var northView: UIView!
    @IBOutlet weak var southView: UIView!
    @IBOutlet weak var westView: UIView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!

    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var showAnswerBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var compassImage: UIImageView!
    @IBOutlet weak var pdfBtn: UIButton!
    
    var originalPositions: [UIView: CGPoint] = [:]
    var filledTargets: Set<UIView> = []
    var draggingShadowView: UIView?
    var currentDraggedView: UIView?
    var currentDraggedLabel: UILabel?
    var allTargetViews: [UIView] = []
    var labelSourceMap: [UILabel: UIView] = [:]
 
    var placedStack: [(target: UIView, label: UILabel)] = []
    var currentlyHighlightedTarget: UIView?
    
    var correctCount: Int = 0
    var usedShowAnswer: Bool = false
    
    var correctMapping: [UIView: String] = [:]
    var originalBackgroundColors: [UIView: UIColor] = [:]
    
    var correctBeforeShowAnswer: Int = 0
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupRandomLabels()
        setup()
        
        locationManager.delegate = self
           locationManager.requestWhenInUseAuthorization()

           if CLLocationManager.headingAvailable() {
               locationManager.startUpdatingHeading()
           }
        
        resetBtn.layer.cornerRadius = 10
        resetBtn.backgroundColor = ColorManager.randomColor()
        resetBtn.layer.borderColor = UIColor.black.cgColor
        
        
        showAnswerBtn.layer.cornerRadius = 10
        showAnswerBtn.backgroundColor = ColorManager.randomColor()
        showAnswerBtn.layer.borderColor = UIColor.black.cgColor
        
        
        nextBtn.layer.cornerRadius = 10
        nextBtn.backgroundColor = ColorManager.randomColor()
        nextBtn.layer.borderColor = UIColor.black.cgColor
       
        
        view1.layer.cornerRadius = 10
        view1.backgroundColor = ColorManager.randomColor()
        view1.layer.borderColor = UIColor.black.cgColor
       

        view2.layer.cornerRadius = 10
        view2.backgroundColor = ColorManager.randomColor()
        view2.layer.borderColor = UIColor.black.cgColor
        
        
        view3.layer.cornerRadius = 10
        view3.backgroundColor = ColorManager.randomColor()
        view3.layer.borderColor = UIColor.black.cgColor
    
        
        view4.layer.cornerRadius = 10
        view4.backgroundColor = ColorManager.randomColor()
        view4.layer.borderColor = UIColor.black.cgColor
    

        
        updateNextUndoButtonTitle()
        
        
        setupView(eastView)
        setupView(northView)
        setupView(southView)
        setupView(westView)
        
        setupView2(view1)
        setupView2(view2)
        setupView2(view3)
        setupView2(view4)
        
        let draggableLabels = [
            label1,
            label2,
            label3,
            label4,
        ]

        draggableLabels.forEach { label in
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handleLabelPan(_:)))
            label?.addGestureRecognizer(pan)
            label?.isUserInteractionEnabled = true
        }

          
        labelSourceMap = [
            label1: view1,
            label2: view2,
            label3: view3,
            label4: view4,
        ]
        
        allTargetViews = [
            eastView,
            northView,
            southView,
            westView
        ]
        
        for target in allTargetViews {
            originalBackgroundColors[target] = target.backgroundColor
        }
        
        let gameLabelTag = 1001

        label1.tag = gameLabelTag
        label2.tag = gameLabelTag
        label3.tag = gameLabelTag
        label4.tag = gameLabelTag
     
        correctMapping = [
            eastView: "East",
            northView: "North",
            southView: "South",
            westView: "West",
        ]
       
        
        nextBtn.isHidden = false
        nextBtn.setTitle("Undo", for: .normal)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {

        let heading = newHeading.magneticHeading // 0 - 360 degree

        let radians = CGFloat(heading * .pi / 180)

        UIView.animate(withDuration: 0.3) {
            self.compassImage.transform = CGAffineTransform(rotationAngle: -radians)
        }
    }
    
    func setupRandomLabels() {

        let parts = ["East", "North", "South", "West"]
        let shuffledParts = parts.shuffled()

        let labels = [label1, label2, label3, label4]

        for (index, label) in labels.enumerated() {
            label?.text = shuffledParts[index]
        }
    }
    
    func validateAnswers() {

        correctCount = 0

        for (targetView, correctText) in correctMapping {

            let placedLabel = targetView.subviews.first { $0 is UILabel } as? UILabel

            if placedLabel?.text == correctText {
                correctCount += 1
                applyCorrectStyle(to: targetView)
            } else {
                applyWrongStyle(to: targetView)
            }
        }
    }
    
    func calculateCorrectCount() -> Int {
        var count = 0

        for (targetView, correctText) in correctMapping {
            let placedLabel = targetView.subviews.first { $0 is UILabel } as? UILabel
            if placedLabel?.text == correctText {
                count += 1
            }
        }
        return count
    }
    
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
    }

       // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func allLabelsPlaced() -> Bool {
        return correctMapping.keys.allSatisfy { target in
            target.subviews.contains(where: { $0 is UILabel })
        }
    }

    
    func updateShowAnswerVisibility() {
        showAnswerBtn.isHidden = false
    }
    
    func applyCorrectStyle(to view: UIView) {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGreen.cgColor
        view.layer.shadowColor = UIColor.systemGreen.cgColor
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = .zero
    }

    func applyWrongStyle(to view: UIView) {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemRed.cgColor
        view.layer.shadowColor = UIColor.systemRed.cgColor
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = .zero
    }
    
    func highlightTarget(_ view: UIView) {
        UIView.animate(withDuration: 0.15) {
            view.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.2)
        }
    }

    func removeHighlight(from view: UIView) {
        UIView.animate(withDuration: 0.15) {
            view.backgroundColor = self.originalBackgroundColors[view]
        }
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let draggedView = gesture.view else { return }
        let location = gesture.location(in: view)

        switch gesture.state {

        case .began:
            currentDraggedView = draggedView

            // 🔥 Identify label inside dragged view
            currentDraggedLabel = draggedView.subviews.first { $0 is UILabel } as? UILabel

            let shadow = draggedView.snapshotView(afterScreenUpdates: true)!
            shadow.center = draggedView.center
            shadow.alpha = 0.7
            shadow.layer.shadowColor = UIColor.black.cgColor
            shadow.layer.shadowOpacity = 0.3
            shadow.layer.shadowRadius = 6

            view.addSubview(shadow)
            draggingShadowView = shadow

        case .changed:
            draggingShadowView?.center = location

        case .ended:
            guard let shadow = draggingShadowView,
                  let label = currentDraggedLabel else { return }

            handleFreeDrop(label: label, shadow: shadow)

            draggingShadowView = nil
            currentDraggedLabel = nil
            currentDraggedView = nil

        default:
            break
        }
    }
    
    @objc func handleLabelPan(_ gesture: UIPanGestureRecognizer) {
        guard let label = gesture.view as? UILabel,
              let sourceView = labelSourceMap[label] else { return }

        let location = gesture.location(in: view)

        switch gesture.state {

        case .began:
            currentDraggedLabel = label

            let shadow = sourceView.snapshotView(afterScreenUpdates: true)!
            shadow.center = sourceView.convert(sourceView.center, to: view)
            shadow.alpha = 0.75
            shadow.layer.shadowColor = UIColor.black.cgColor
            shadow.layer.shadowOpacity = 0.3
            shadow.layer.shadowRadius = 6

            view.addSubview(shadow)
            draggingShadowView = shadow

        case .changed:
            draggingShadowView?.center = location

            var foundTarget: UIView?

            for target in allTargetViews {

                // 🔥 convert target frame from scrollView to main view
                let targetFrame = target.superview?.convert(target.frame, to: view) ?? target.frame

                if let shadow = draggingShadowView,
                   shadow.frame.intersects(targetFrame) {

                    if target.subviews.contains(where: { $0.tag == 1001 }) {
                        continue
                    }

                    foundTarget = target
                    break
                }
            }

            if let previous = currentlyHighlightedTarget,
               previous != foundTarget {
                removeHighlight(from: previous)
            }

            if let newTarget = foundTarget,
               currentlyHighlightedTarget != newTarget {
                highlightTarget(newTarget)
                currentlyHighlightedTarget = newTarget
            }

            if foundTarget == nil,
               let previous = currentlyHighlightedTarget {
                removeHighlight(from: previous)
                currentlyHighlightedTarget = nil
            }

        case .ended:
            guard let shadow = draggingShadowView,
                  let draggedLabel = currentDraggedLabel else { return }

            let dropped = handleFreeDropWithResult(label: draggedLabel, shadow: shadow)

            if dropped {
                sourceView.isHidden = true
            }

            if dropped && allLabelsPlaced() {
                validateAnswers()
            }

            draggingShadowView = nil
            currentDraggedLabel = nil

        default:
            break
        }
    }
    
    func handleFreeDropWithResult(label: UILabel, shadow: UIView) -> Bool {

        for target in allTargetViews {

            let targetFrame = target.superview?.convert(target.frame, to: view) ?? target.frame

            // 🔥 FIXED DROP DETECTION
            if targetFrame.contains(shadow.center) {

                if target.subviews.contains(where: { $0.tag == 1001 }) {

                    if let highlighted = currentlyHighlightedTarget {
                        removeHighlight(from: highlighted)
                        currentlyHighlightedTarget = nil
                    }

                    shadow.removeFromSuperview()
                    return false
                }

                addLabelToCenter(label, in: target, lockInteraction: true)

                updateNextUndoButtonTitle()
                updateShowAnswerVisibility()
                placedStack.append((target: target, label: label))

                if let highlighted = currentlyHighlightedTarget {
                    removeHighlight(from: highlighted)
                    currentlyHighlightedTarget = nil
                }

                shadow.removeFromSuperview()
                return true
            }
        }

        shadow.removeFromSuperview()
        return false
    }
    
    
    func undoLastPlacement() {

        guard let last = placedStack.popLast() else { return }

        let targetView = last.target
        let label = last.label

        label.removeFromSuperview()

        if let sourceView = labelSourceMap[label] {
            sourceView.isHidden = false
            addLabelToCenter(label, in: sourceView, lockInteraction: false)
        }

        targetView.layer.borderWidth = 0.5
        targetView.layer.borderColor = UIColor.lightGray.cgColor
        targetView.layer.shadowOpacity = 0

        updateNextUndoButtonTitle()
        updateShowAnswerVisibility()

        if let highlighted = currentlyHighlightedTarget {
            removeHighlight(from: highlighted)
            currentlyHighlightedTarget = nil
        }
    }
    
    func updateNextUndoButtonTitle() {
        if allLabelsPlaced() {
            nextBtn.setTitle("Next", for: .normal)
        } else {
            nextBtn.setTitle("Undo", for: .normal)
        }
    }
    
    func handleFreeDrop(label: UILabel, shadow: UIView) {

        for target in allTargetViews {

            if shadow.frame.intersects(target.frame) {
                
                if target.subviews.contains(where: { $0.tag == 1001 }) {
                    shadow.removeFromSuperview()
                    return
                }

                addLabelToCenter(label, in: target, lockInteraction: true) // 🔒

                shadow.removeFromSuperview()
                return
            }
        }

        shadow.removeFromSuperview()
    }
    
    func checkDrop(_ draggedView: UIView) {

        let targets: [UIView: UIView] = [
            view1: eastView,
            view2: northView,
            view3: southView,
            view4: westView,
        ]

        guard let target = targets[draggedView] else { return }

        if filledTargets.contains(target) {
            resetPosition(draggedView)
            return
        }

        if draggedView.frame.intersects(target.frame) {

            UIView.animate(withDuration: 0.25) {
                draggedView.center = target.center
            }

            filledTargets.insert(target)
            draggedView.isUserInteractionEnabled = false

        } else {
            resetPosition(draggedView)
        }
    }
    func checkDropWithShadow(_ originalView: UIView, _ shadowView: UIView) {

        let targets: [UIView: UIView] = [
            view1: eastView,
            view2: northView,
            view3: southView,
            view4: westView,
        ]

        guard let target = targets[originalView] else {
            shadowView.removeFromSuperview()
            return
        }

        if filledTargets.contains(target) {
            shadowView.removeFromSuperview()
            return
        }

        if shadowView.frame.intersects(target.frame) {

            UIView.animate(withDuration: 0.25, animations: {
                originalView.center = target.center
            }) { _ in

                if let label = self.labelForDraggedView(originalView) {
                    label.removeFromSuperview()
                    label.frame = target.bounds
                    label.textAlignment = .center
                    target.addSubview(label)
                }

                originalView.isUserInteractionEnabled = false
                self.filledTargets.insert(target)
                shadowView.removeFromSuperview()
            }

        } else {
            shadowView.removeFromSuperview()
        }
    }
    
    func addLabelToCenter(
        _ label: UILabel,
        in target: UIView,
        lockInteraction: Bool
    ) {
        label.removeFromSuperview()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail

        label.isUserInteractionEnabled = !lockInteraction

        target.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: target.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: target.trailingAnchor, constant: -5),
            label.centerYAnchor.constraint(equalTo: target.centerYAnchor)
        ])
    }
    
    func resetPosition(_ view: UIView) {
        UIView.animate(withDuration: 0.25) {
            view.center = self.originalPositions[view] ?? view.center
        }
    }
    
       private func setupView(_ view: UIView) {
           view.layer.cornerRadius = 15
           view.layer.borderWidth = 0.5
           view.layer.borderColor = UIColor.lightGray.cgColor
           view.clipsToBounds = true
       }
    
        private func setupView2(_ view: UIView) {
            view.layer.cornerRadius = 15
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.cgColor
            view.clipsToBounds = true
        }
    func labelForDraggedView(_ draggedView: UIView) -> UILabel? {
        switch draggedView {
        case view1:
            return label1
        case view2:
            return label2
        case view3:
            return label3
        case view4:
            return label4
        default:
            return nil
        }
    }
    func clearAllTargetLabels() {
        for target in allTargetViews {
            target.subviews
                .filter { $0 is UILabel }
                .forEach { $0.removeFromSuperview() }
        }
    }
    
    func resetAnswerStyles() {
        for target in correctMapping.keys {
            target.layer.borderWidth = 0.5
            target.layer.borderColor = UIColor.lightGray.cgColor
            target.layer.shadowOpacity = 0
            target.layer.shadowRadius = 0
            target.layer.shadowColor = nil
        }
    }
    func applyGreenStyleToAllTargets() {
        for target in allTargetViews {
            target.layer.borderWidth = 2
            target.layer.borderColor = UIColor.systemGreen.cgColor
            target.layer.shadowColor = UIColor.systemGreen.cgColor
            target.layer.shadowRadius = 6
            target.layer.shadowOpacity = 0.8
            target.layer.shadowOffset = .zero
        }
    }

    func resultImage(for percentage: Int) -> UIImage? {
        return UIImage(named: "well-done")
    }
    
    @IBAction func resetTapBtn(_ sender: UIButton) {

        clearAllTargetLabels()
        
        resetAnswerStyles()

        let mapping: [(UIView, UILabel)] = [
            (view1, label1),
            (view2, label2),
            (view3, label3),
            (view4, label4),
        ]

        mapping.forEach { (sourceView, label) in
            sourceView.isHidden = false
            addLabelToCenter(label, in: sourceView, lockInteraction: false)
        }

        placedStack.removeAll()
        updateNextUndoButtonTitle()
        updateShowAnswerVisibility()

        nextBtn.isHidden = false   // ⭐ ADD
        nextBtn.setTitle("Undo", for: .normal) // ⭐ ADD

        currentlyHighlightedTarget = nil
        correctCount = 0
        usedShowAnswer = false
    }
    
    func createDirectionsPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("Directions.pdf")

        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842)

        let renderer = UIGraphicsPDFRenderer(bounds: pageRect)

        do {

            try renderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                // Title
                let title = "Directions"

                let titleAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 30),
                    .foregroundColor: UIColor.black
                ]

                let titleSize = title.size(withAttributes: titleAttributes)

                title.draw(
                    at: CGPoint(
                        x: (pageRect.width - titleSize.width) / 2,
                        y: 30
                    ),
                    withAttributes: titleAttributes
                )

                let sourceViews = [view1!, view2!, view3!, view4!]

                var yPosition: CGFloat = 120

                for sourceView in sourceViews {

                    let boxRect = CGRect(
                        x: 40,
                        y: yPosition,
                        width: pageRect.width - 80,
                        height: 120
                    )

                    let path = UIBezierPath(
                        roundedRect: boxRect,
                        cornerRadius: 15
                    )

                    (sourceView.backgroundColor ?? .lightGray).setFill()
                    path.fill()

                    UIColor.black.setStroke()
                    path.lineWidth = 2
                    path.stroke()

                    if let label = sourceView.subviews.compactMap({ $0 as? UILabel }).first {

                        let text = label.text ?? ""

                        let attributes: [NSAttributedString.Key: Any] = [
                            .font: UIFont.boldSystemFont(ofSize: 28),
                            .foregroundColor: UIColor.black
                        ]

                        let textSize = text.size(withAttributes: attributes)

                        text.draw(
                            at: CGPoint(
                                x: boxRect.midX - textSize.width / 2,
                                y: boxRect.midY - textSize.height / 2
                            ),
                            withAttributes: attributes
                        )
                    }

                    yPosition += 150
                }
            }

            return pdfURL

        } catch {

            print("PDF Error:", error)
            return nil
        }
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        guard let pdfURL = createDirectionsPDF() else { return }

        let activityVC = UIActivityViewController(
            activityItems: [pdfURL],
            applicationActivities: nil
        )

        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = sender
        }

        present(activityVC, animated: true)
    }
    
    @IBAction func nextAndUndoTapBtn(_ sender: UIButton) {

        if !allLabelsPlaced() {
            undoLastPlacement()
            return
        }

        // ✅ Direct back
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showAnswerTapBtn(_ sender: UIButton) {

        // ⭐ Save correct answers before showing solution
        correctBeforeShowAnswer = calculateCorrectCount()
        usedShowAnswer = true

        if let highlighted = currentlyHighlightedTarget {
            removeHighlight(from: highlighted)
            currentlyHighlightedTarget = nil
        }

        let labelsAlreadyPlaced = allLabelsPlaced()

        clearAllTargetLabels()

        for (targetView, correctText) in correctMapping {

            let label = UILabel()
            label.text = correctText
            label.tag = 1001

            addLabelToCenter(label, in: targetView, lockInteraction: true)
        }

        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true

        if labelsAlreadyPlaced {

            applyGreenStyleToAllTargets()

            nextBtn.isHidden = false
            nextBtn.setTitle("Next", for: .normal)

        } else {

            nextBtn.isHidden = true
            showAnswerBtn.isHidden = true
        }
    }
    
}

