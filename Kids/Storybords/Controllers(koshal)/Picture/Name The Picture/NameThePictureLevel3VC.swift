//
//  NameThePictureLevel3VC.swift
//  Kids
//
//  Created by Koshal Singh on 21/01/26.
//

import UIKit
import LanguageManager_iOS

class NameThePictureLevel3VC: BaseViewController {
    
    @IBOutlet weak var dropView1: UIView!
    @IBOutlet weak var dropView2: UIView!
    @IBOutlet weak var dropView3: UIView!
    @IBOutlet weak var dropView4: UIView!
    @IBOutlet weak var dropView5: UIView!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!

    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var undoAndNextBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    var allTargetViews: [UIView] = []
    var labelSourceMap: [UILabel: UIView] = [:]
    var draggingShadowView: UIView?
    var currentDraggedLabel: UILabel?
    var correctMapping: [UIView: String] = [:]
    
    var placedStack: [(target: UIView, label: UILabel)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
     
        view1.layer.cornerRadius = 6
        view2.layer.cornerRadius = 6
        view3.layer.cornerRadius = 6
        view4.layer.cornerRadius = 6
        view5.layer.cornerRadius = 6
        
        setupView(dropView1)
        setupView(dropView2)
        setupView(dropView3)
        setupView(dropView4)
        setupView(dropView5)

        setupView2(view1)
        setupView2(view2)
        setupView2(view3)
        setupView2(view4)
        setupView2(view5)

        allTargetViews = [
            dropView1,
            dropView2,
            dropView3,
            dropView4,
            dropView5
        ]

        correctMapping = [
            dropView1: "Tree".localiz(),
            dropView2: "Flower".localiz(),
            dropView3: "Bird".localiz(),
            dropView4: "Star".localiz(),
            dropView5: "Cloud".localiz()
        ]
        
        let labels = [label1, label2, label3, label4, label5]
        let sources = [view1, view2, view3, view4, view5]

        for (label, source) in zip(labels, sources) {
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handleLabelPan(_:)))
            label?.addGestureRecognizer(pan)
            label?.isUserInteractionEnabled = true
            label?.tag = 1001
            labelSourceMap[label!] = source
        }
        
        updateUndoNextAndResetUI()
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
        resetBtn.layer.cornerRadius = 6
        undoAndNextBtn.layer.cornerRadius = 6
    }

    func applyTheme() {

        let sourceViews = [
            view1,
            view2,
            view3,
            view4,
            view5
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white
            resetBtn.backgroundColor = .white
            undoAndNextBtn.backgroundColor = .white

            sourceViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
            resetBtn.backgroundColor = color
            undoAndNextBtn.backgroundColor = color

            sourceViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
    func allTargetsFilled() -> Bool {
        return allTargetViews.allSatisfy { target in
            target.subviews.contains(where: { $0 is UILabel })
        }
    }
    
    func validateAnswers() {

        for target in allTargetViews {

            guard
                let label = target.subviews.first(where: { $0 is UILabel }) as? UILabel,
                let correctText = correctMapping[target]
            else { continue }

            if label.text == correctText {
                applyCorrectStyle(to: target)
            } else {
                applyWrongStyle(to: target)
            }
        }
    }
    
    func applyCorrectStyle(to view: UIView) {
        view.backgroundColor = UIColor.systemGreen.withAlphaComponent(1)
    }

    func applyWrongStyle(to view: UIView) {
        view.backgroundColor = UIColor.systemRed.withAlphaComponent(1)
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
            shadow.layer.shadowOpacity = 0.3
            shadow.layer.shadowRadius = 6

            view.addSubview(shadow)
            draggingShadowView = shadow

        case .changed:
            draggingShadowView?.center = location

        case .ended:
            guard let shadow = draggingShadowView,
                  let draggedLabel = currentDraggedLabel else { return }

            let dropped = handleDrop(label: draggedLabel, shadow: shadow)

            if dropped {
                sourceView.isHidden = true
            }
            
            if dropped && allTargetsFilled() {
                validateAnswers()
            }
            
            updateUndoNextAndResetUI()
            
            shadow.removeFromSuperview()
            draggingShadowView = nil
            currentDraggedLabel = nil

        default:
            break
        }
    }

    // MARK: - Drop Logic (ANY label → ANY image)
    func handleDrop(label: UILabel, shadow: UIView) -> Bool {

        for target in allTargetViews {

            if target.subviews.contains(where: { $0.tag == 1001 }) {
                continue
            }

            if shadow.frame.intersects(target.frame) {
                addLabelToCenter(label, in: target)
                placedStack.append((target: target, label: label))
                return true
            }
        }
        return false
    }

    // MARK: - Center Label
    func addLabelToCenter(_ label: UILabel, in target: UIView) {

        label.removeFromSuperview()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        // 🔒 LOCK label once placed in target
        if allTargetViews.contains(target) {
            label.isUserInteractionEnabled = false
        }

        target.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: target.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: target.centerYAnchor)
        ])
    }
    
    func undoLastPlacement() {

        guard let last = placedStack.popLast() else { return }

        let target = last.target
        let label = last.label

        label.removeFromSuperview()

        if let sourceView = labelSourceMap[label] {
            sourceView.isHidden = false
            addLabelToCenter(label, in: sourceView)
        }

     
        target.backgroundColor = .clear
        updateUndoNextAndResetUI()
    }
    
    func calculatePercentage() -> Int {

        var correctCount = 0

        for target in allTargetViews {

            guard
                let label = target.subviews.first(where: { $0 is UILabel }) as? UILabel,
                let correctText = correctMapping[target]
            else { continue }

            if label.text == correctText {
                correctCount += 1
            }
        }

        return correctCount * 20
    }

    func updateUndoNextAndResetUI() {

        if allTargetsFilled() {
            undoAndNextBtn.setTitle("Next".localiz(), for: .normal)
            resetBtn.isHidden = true
        } else {
            undoAndNextBtn.setTitle("Undo".localiz(), for: .normal)
            resetBtn.isHidden = false
        }
    }
    
    // MARK: - Reset
    @IBAction func resetTapBtn(_ sender: UIButton) {

        let mapping: [(UIView, UILabel)] = [
            (view1, label1),
            (view2, label2),
            (view3, label3),
            (view4, label4),
            (view5, label5)
        ]

        for (source, label) in mapping {
            source.isHidden = false
            addLabelToCenter(label, in: source)
        }
        for target in allTargetViews {
            target.subviews
                .filter { $0 is UILabel }
                .forEach { $0.removeFromSuperview() }
        }
        
        for target in allTargetViews {
            target.backgroundColor = .clear
        }
        
        placedStack.removeAll()
        updateUndoNextAndResetUI()
    }

    @IBAction func undoAndNextapBtn(_ sender: UIButton) {

        if !allTargetsFilled() {
            undoLastPlacement()
            return
        }

        let percentage = calculatePercentage()
        let image = resultImage(for: percentage)

        UserDefaults.standard.set(true, forKey: "nameThePictureLevel3Completed")
        UserDefaults.standard.set(percentage, forKey: "nameThePictureLevel3Percentage")
        
        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is NameThePictureMenuVC }
        ) as? NameThePictureMenuVC {

            menuVC.receivedPercentage3 = percentage
            menuVC.receivedImage3 = UIImage(named: "well-done")
        }

        navigationController?.popViewController(animated: true)
    }

    func resultImage(for percentage: Int) -> UIImage? {
        return UIImage(named: "well-done")
    }
    
    // MARK: - UI Helpers
    private func setupView(_ view: UIView) {
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.clipsToBounds = true
    }

    private func setupView2(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
    }
}
