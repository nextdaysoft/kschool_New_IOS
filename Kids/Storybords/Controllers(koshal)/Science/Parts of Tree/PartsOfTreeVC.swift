//
//  PartsOfTreeVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/01/26.
//

import UIKit
import LanguageManager_iOS

class PartsOfTreeVC: BaseViewController {

    @IBOutlet weak var fruitView: UIView!
    @IBOutlet weak var leafView: UIView!
    @IBOutlet weak var flowerView: UIView!
    @IBOutlet weak var branchView: UIView!
    @IBOutlet weak var trunkView: UIView!
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var rootHairsView: UIView!


    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
   
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var showAnswerBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    
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
     
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        view5.layer.cornerRadius = 10
        view6.layer.cornerRadius = 10
        view7.layer.cornerRadius = 10

        updateNextUndoButtonTitle()
        
        
        setupView(fruitView)
        setupView(leafView)
        setupView(flowerView)
        setupView(branchView)
        setupView(trunkView)
        setupView(rootView)
        setupView(rootHairsView)
        
        
        
        setupView2(view1)
        setupView2(view2)
        setupView2(view3)
        setupView2(view4)
        setupView2(view5)
        setupView2(view6)
        setupView2(view7)
        
        let draggableLabels = [
            label1,
            label2,
            label3,
            label4,
            label5,
            label6,
            label7
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
            label5: view5,
            label6: view6,
            label7: view7
        ]
        
        allTargetViews = [
            fruitView,
            leafView,
            flowerView,
            branchView,
            trunkView,
            rootView,
            rootHairsView
        ]

        for target in allTargetViews {
            originalBackgroundColors[target] = target.backgroundColor
        }
        
        let gameLabelTag = 1001

        label1.tag = gameLabelTag
        label2.tag = gameLabelTag
        label3.tag = gameLabelTag
        label4.tag = gameLabelTag
        label5.tag = gameLabelTag
        label6.tag = gameLabelTag
        label7.tag = gameLabelTag
        
        correctMapping = [
            fruitView: "Fruit".localiz(),
            leafView: "Leaf".localiz(),
            flowerView: "Flower".localiz(),
            branchView: "Branch".localiz(),
            trunkView: "Trunk".localiz(),
            rootView: "Root".localiz(),
            rootHairsView: "Root Hairs".localiz()
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
            "Fruit".localiz(),
            "Leaf".localiz(),
            "Flower".localiz(),
            "Branch".localiz(),
            "Trunk".localiz(),
            "Root".localiz(),
            "Root Hairs".localiz()
        ]

        let shuffledParts = parts.shuffled()

        let labels = [label1, label2, label3, label4, label5, label6, label7]

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
            view1,
            view2,
            view3,
            view4,
            view5,
            view6,
            view7
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
            view1: fruitView,
            view2: leafView,
            view3: flowerView,
            view4: branchView,
            view5: trunkView,
            view6: rootView,
            view7: rootHairsView
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
            view1: fruitView,
            view2: leafView,
            view3: flowerView,
            view4: branchView,
            view5: trunkView,
            view6: rootView,
            view7: rootHairsView
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
        case view5:
            return label5
        case view6:
            return label6
        case view7:
            return label7
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
            (view5, label5),
            (view6, label6),
            (view7, label7)
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

            UserDefaults.standard.set(true, forKey: "scienceLevel10Completed")
            UserDefaults.standard.set(percentage, forKey: "scienceLevel10Percentage")

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

        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
        view5.isHidden = true
        view6.isHidden = true
        view7.isHidden = true
        
        
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

