//
//  PartsOfComputerVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 23/12/25.
//

import UIKit
import LanguageManager_iOS

class PartsOfComputerVC: BaseViewController {

    @IBOutlet weak var cpuBGView: UIView!
    @IBOutlet weak var printerBGView: UIView!
    @IBOutlet weak var monitorBGView: UIView!
    @IBOutlet weak var keyboardBGView: UIView!
    @IBOutlet weak var mouseBGView: UIView!
    
    @IBOutlet weak var monitorLineView: UIView!
    
    @IBOutlet weak var printerBGView2: UIView!
    @IBOutlet weak var monitorBGView2: UIView!
    @IBOutlet weak var cpuBGView2: UIView!
    @IBOutlet weak var mouseBGView2: UIView!
    @IBOutlet weak var keyboardBGView2: UIView!
   
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var showAnswerBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    @IBOutlet weak var printerLabel: UILabel!
    @IBOutlet weak var monitorLabel: UILabel!
    @IBOutlet weak var cpuLabel: UILabel!
    @IBOutlet weak var mouseLabel: UILabel!
    @IBOutlet weak var keyboardLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupRandomLabels()
        
        setup()
        applyTheme()
        
        printerBGView2.layer.cornerRadius = 10

        monitorBGView2.layer.cornerRadius = 10

        cpuBGView2.layer.cornerRadius = 10
    
        mouseBGView2.layer.cornerRadius = 10

        keyboardBGView2.layer.cornerRadius = 10
        
        updateNextUndoButtonTitle()
        
        
        setupView(cpuBGView)
        setupView(printerBGView)
        setupView(monitorBGView)
        setupView(keyboardBGView)
        setupView(mouseBGView)
        monitorLineView.transform = CGAffineTransform(rotationAngle: +0.35)
        
        setupView2(printerBGView2)
        setupView2(monitorBGView2)
        setupView2(cpuBGView2)
        setupView2(mouseBGView2)
        setupView2(mouseBGView2)
        setupView2(keyboardBGView2)
        
        let draggableLabels = [
            cpuLabel,
            printerLabel,
            monitorLabel,
            mouseLabel,
            keyboardLabel
        ]

        draggableLabels.forEach { label in
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handleLabelPan(_:)))
            label?.addGestureRecognizer(pan)
            label?.isUserInteractionEnabled = true
        }

          
        labelSourceMap = [
            cpuLabel: cpuBGView2,
            printerLabel: printerBGView2,
            monitorLabel: monitorBGView2,
            mouseLabel: mouseBGView2,
            keyboardLabel: keyboardBGView2
        ]
        
        allTargetViews = [
            cpuBGView,
            printerBGView,
            monitorBGView,
            mouseBGView,
            keyboardBGView
        ]

        for target in allTargetViews {
            originalBackgroundColors[target] = target.backgroundColor
        }
        
        let gameLabelTag = 1001

        cpuLabel.tag = gameLabelTag
        printerLabel.tag = gameLabelTag
        monitorLabel.tag = gameLabelTag
        mouseLabel.tag = gameLabelTag
        keyboardLabel.tag = gameLabelTag
     
        correctMapping = [
            monitorBGView: "Monitor".localiz(),
            printerBGView: "Printer".localiz(),
            cpuBGView: "CPU".localiz(),
            keyboardBGView: "Keyboard".localiz(),
            mouseBGView: "Mouse".localiz(),
        ]

        nextBtn.isHidden = false
        nextBtn.setTitle("Undo".localiz(), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    
    func setupRandomLabels() {

        let parts = [
            "Monitor".localiz(),
            "Printer".localiz(),
            "CPU".localiz(),
            "Keyboard".localiz(),
            "Mouse".localiz()
        ]

        let shuffledParts = parts.shuffled()

        let labels = [
            monitorLabel,
            printerLabel,
            cpuLabel,
            keyboardLabel,
            mouseLabel
        ]

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
        nextBtn.layer.cornerRadius = 6
        resetBtn.layer.cornerRadius = 6
        showAnswerBtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        let sourceViews = [
            printerBGView2,
            monitorBGView2,
            cpuBGView2,
            mouseBGView2,
            keyboardBGView2
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            resetBtn.backgroundColor = .white
            showAnswerBtn.backgroundColor = .white

            nextBtn.setTitleColor(.black, for: .normal)
            resetBtn.setTitleColor(.black, for: .normal)
            showAnswerBtn.setTitleColor(.black, for: .normal)

            sourceViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            resetBtn.backgroundColor = color
            showAnswerBtn.backgroundColor = color

            nextBtn.setTitleColor(.white, for: .normal)
            resetBtn.setTitleColor(.white, for: .normal)
            showAnswerBtn.setTitleColor(.white, for: .normal)

            sourceViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }
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
            cpuBGView2: cpuBGView,
            printerBGView2: printerBGView,
            monitorBGView2: monitorBGView,
            mouseBGView2: mouseBGView,
            keyboardBGView2: keyboardBGView
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
            cpuBGView2: cpuBGView,
            printerBGView2: printerBGView,
            monitorBGView2: monitorBGView,
            mouseBGView2: mouseBGView,
            keyboardBGView2: keyboardBGView
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
        case cpuBGView2:
            return cpuLabel
        case printerBGView2:
            return printerLabel
        case monitorBGView2:
            return monitorLabel
        case mouseBGView2:
            return mouseLabel
        case keyboardBGView2:
            return keyboardLabel
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
            (cpuBGView2, cpuLabel),
            (printerBGView2, printerLabel),
            (monitorBGView2, monitorLabel),
            (mouseBGView2, mouseLabel),
            (keyboardBGView2, keyboardLabel)
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
    
    
    @IBAction func nextAndUndoTapBtn(_ sender: UIButton) {

        if !allLabelsPlaced() {
            undoLastPlacement()
            return
        }

        let percentage: Int
        let total = correctMapping.count

        if usedShowAnswer {
            percentage = (correctBeforeShowAnswer * 100) / total
        } else {
            let correct = calculateCorrectCount()
            percentage = (correct * 100) / total
        }

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is ScienceMenuVC }
        ) as? ScienceMenuVC {

            UserDefaults.standard.set(true, forKey: "scienceLevel3Completed")
            UserDefaults.standard.set(percentage, forKey: "scienceLevel3Percentage")

            navigationController?.popToViewController(menuVC, animated: true)
        }
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

        cpuBGView2.isHidden = true
        printerBGView2.isHidden = true
        monitorBGView2.isHidden = true
        mouseBGView2.isHidden = true
        keyboardBGView2.isHidden = true

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

