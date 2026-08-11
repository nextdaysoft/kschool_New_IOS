//
//  DomesticAndWildAnimal.swift
//  Find Pair
//
//  Created by Koshal Singh on 22/12/25.
//


import UIKit
import ObjectiveC

// MARK: - Animal Type
enum AnimalType {
    case domestic
    case wild
}
enum DropZone {
    case domestic
    case wild
}


// MARK: - UIImageView Extension (Animal Type Store)
private var animalKey: UInt8 = 0

extension UIImageView {
    var animalType: AnimalType? {
        get {
            objc_getAssociatedObject(self, &animalKey) as? AnimalType
        }
        set {
            objc_setAssociatedObject(self, &animalKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

class DomesticAndWildAnimal: BaseViewController {

    @IBOutlet weak var domesticBGView: UIView!
    @IBOutlet weak var wildAnimalBGView: UIView!
    
    @IBOutlet weak var domesticImagesStackView: UIStackView!
    @IBOutlet weak var wildImagesStackView: UIStackView!
    
    @IBOutlet weak var animalsStackView: UIStackView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var domesticBGViewHeight: NSLayoutConstraint!
    @IBOutlet weak var wildAnimalBGViewHeight: NSLayoutConstraint!
   
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    
    var domesticDropInteraction: UIDropInteraction!
    var wildDropInteraction: UIDropInteraction!
    
    private var imageNames: [UIImageView: String] = [:]

    private let totalAnimals = 10
    private var placedAnimals = 0
    
    private var animalItemViews: [UIView] = []
    
    private var originalCenters: [UIView: CGPoint] = [:]
    
    private var dragStartRowStack: UIStackView?
    private var dragStartIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.isHidden = true
      
     
        animalItemViews.forEach {
            originalCenters[$0] = $0.center
        }
        
        setupAnimals()
        setup()
        applyTheme()
        
        domesticBGView.isUserInteractionEnabled = true
        wildAnimalBGView.isUserInteractionEnabled = true
        
        domesticBGView.layer.cornerRadius = 10
        wildAnimalBGView.layer.cornerRadius = 10
        domesticBGView.clipsToBounds = true
        wildAnimalBGView.clipsToBounds = true
        
    
        wildAnimalBGView.layer.borderWidth = 0
        wildAnimalBGView.layer.borderColor = UIColor.lightGray.cgColor

        domesticBGView.layer.borderWidth = 0
        domesticBGView.layer.borderColor = nil

        wildAnimalBGView.layer.borderWidth = 0
        wildAnimalBGView.layer.borderColor = nil
        
    
        domesticDropInteraction = UIDropInteraction(delegate: self)
        wildDropInteraction = UIDropInteraction(delegate: self)

        domesticBGView.addInteraction(domesticDropInteraction)
        wildAnimalBGView.addInteraction(wildDropInteraction)

        addCategoryLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    private func addCategoryLabels() {
        let domesticLabel = UILabel()
        domesticLabel.textColor = .darkGray
        domesticLabel.font = UIFont.boldSystemFont(ofSize: 16)
        domesticLabel.sizeToFit()
        domesticLabel.frame.origin = CGPoint(x: 10, y: 10)
        domesticBGView.addSubview(domesticLabel)
        
        let wildLabel = UILabel()
        wildLabel.textColor = .darkGray
        wildLabel.font = UIFont.boldSystemFont(ofSize: 16)
        wildLabel.sizeToFit()
        wildLabel.frame.origin = CGPoint(x: 10, y: 10)
        wildAnimalBGView.addSubview(wildLabel)
    }
    
    func makeAnimalCell(image: UIImage, type: AnimalType) -> UIView {

        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 12
        container.backgroundColor = .white
        container.isUserInteractionEnabled = true

        let width = (UIScreen.main.bounds.width - 60) / 3
        let height = width * 0.8

        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: width),
            container.heightAnchor.constraint(equalToConstant: height)
        ])

        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = false   // 🔥 IMPORTANT
        imageView.animalType = type

        container.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7)
        ])

        // 🔥 PAN GESTURE (ShadowMatch jaisa)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        container.addGestureRecognizer(pan)

        return container
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {

        guard let draggedView = gesture.view else { return }

        switch gesture.state {

        case .began:

            if let rowStack = draggedView.superview as? UIStackView {
                dragStartRowStack = rowStack
                dragStartIndex = rowStack.arrangedSubviews.firstIndex(of: draggedView)
            }

            // 🔥 rounded corners while dragging
            draggedView.layer.cornerRadius = 12
            draggedView.clipsToBounds = true

            // 🔥 soft blur
            draggedView.addSoftBlur(cornerRadius: 12)

            UIView.animate(withDuration: 0.2) {
                draggedView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            }

        case .changed:
            let translation = gesture.translation(in: view)
            draggedView.center = CGPoint(
                x: draggedView.center.x + translation.x,
                y: draggedView.center.y + translation.y
            )
            gesture.setTranslation(.zero, in: view)

        case .ended:
            handleDrop(for: draggedView)

        default:
            break
        }
    }
    
    func restoreToOriginalPosition(_ view: UIView) {

        guard
            let rowStack = dragStartRowStack,
            let index = dragStartIndex
        else { return }

        // remove from current superview
        view.removeFromSuperview()

        // 🔥 EXACT same position par wapas add
        rowStack.insertArrangedSubview(view, at: index)

        // reset transform (safety)
        view.transform = .identity
    }
    
    func handleDrop(for draggedView: UIView) {

        draggedView.removeSoftBlur()

        UIView.animate(withDuration: 0.2) {
            draggedView.transform = .identity
        }

        // optional: corner radius normal rakho
        draggedView.layer.cornerRadius = 12
        draggedView.clipsToBounds = true

        let draggedFrame = draggedView.superview?
            .convert(draggedView.frame, to: view) ?? draggedView.frame

        let domesticFrame = domesticBGView.convert(domesticBGView.bounds, to: view)
        let wildFrame = wildAnimalBGView.convert(wildAnimalBGView.bounds, to: view)

        if domesticFrame.intersects(draggedFrame) {
            addDraggedView(draggedView, to: domesticImagesStackView)
            removeAnimalView(draggedView)
            placedAnimals += 1
            checkIfGameFinished()
            return
        }

        if wildFrame.intersects(draggedFrame) {
            addDraggedView(draggedView, to: wildImagesStackView)
            removeAnimalView(draggedView)
            placedAnimals += 1
            checkIfGameFinished()
            return
        }

        // ❌ invalid drop → wapas wahi
        restoreToOriginalPosition(draggedView)
    }
    
    func checkIfGameFinished() {
        if placedAnimals == totalAnimals {
            applyFinalBorders()
            nextBtn.isHidden = false   // 🔥 NOW show Next
        }
    }
    
    func applyFinalBorders() {

        // Domestic box
        for case let row as UIStackView in domesticImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView {

                    let isCorrect = imageView.animalType == .domestic
                    applyFinalBorder(to: container, correct: isCorrect)
                }
            }
        }

        // Wild box
        for case let row as UIStackView in wildImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView {

                    let isCorrect = imageView.animalType == .wild
                    applyFinalBorder(to: container, correct: isCorrect)
                }
            }
        }
    }
    
    func applyFinalBorder(to container: UIView, correct: Bool) {

        container.layer.cornerRadius = 12
        container.layer.borderWidth = 3
        container.layer.borderColor = correct
            ? UIColor.systemGreen.cgColor
            : UIColor.systemRed.cgColor
    }
    
    func applyBorder(to imageView: UIImageView, droppedIn zone: DropZone) {

        guard let container = imageView.superview else { return }

        let isCorrect: Bool

        switch zone {
        case .domestic:
            isCorrect = imageView.animalType == .domestic
        case .wild:
            isCorrect = imageView.animalType == .wild
        }

        container.layer.cornerRadius = 12
        container.layer.borderWidth = 3
        container.layer.borderColor = isCorrect
            ? UIColor.systemGreen.cgColor
            : UIColor.systemRed.cgColor
    }
    
    func addDraggedView(_ view: UIView, to stack: UIStackView) {

        view.removeFromSuperview()
        view.translatesAutoresizingMaskIntoConstraints = false

        view.translatesAutoresizingMaskIntoConstraints = false

        addImage(view.subviews.first as! UIImageView, to: stack)
    }
    
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white
            nextBtn.backgroundColor = .white
           

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
            nextBtn.backgroundColor = color
        }
    }
    
    func calculatePercentage() -> Int {
        var correctCount = 0

        // Domestic box
        for case let row as UIStackView in domesticImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView,
                   imageView.animalType == .domestic {
                    correctCount += 1
                }
            }
        }

        // Wild box
        for case let row as UIStackView in wildImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView,
                   imageView.animalType == .wild {
                    correctCount += 1
                }
            }
        }

        return Int((Double(correctCount) / Double(totalAnimals)) * 100)
    }
    
    
       // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextTapBtn(_ sender: UIButton) {

        let percentage = calculatePercentage()
        let resultImage = UIImage(named: "well-done")

        // 🔐 SAVE DOMESTIC vs WILD ANIMAL – SCIENCE LEVEL 1
        UserDefaults.standard.set(true, forKey: "scienceLevel2Completed")
        UserDefaults.standard.set(percentage, forKey: "scienceLevel2Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is ScienceMenuVC }
        ) as? ScienceMenuVC {

            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    
    func setupAnimals() {

        let animals: [(String, AnimalType)] = [
            ("zebra", .wild),
            ("jiraaf", .wild),
            ("horse", .wild),
            ("tiger", .wild),
            ("cat", .domestic),
            ("chicken", .domestic),
            ("cow", .domestic),
            ("lion", .wild),
            ("elephant", .wild),
            ("goat", .domestic)
        ]

        animalItemViews = animals.compactMap {
            if let img = UIImage(named: $0.0) {
                return makeAnimalCell(image: img, type: $0.1)
            } else {
                print("❌ Image NOT FOUND:", $0.0)
                return nil
            }
        }

        print("✅ Total views created:", animalItemViews.count)

        rebuildAnimalsGrid()
    }
    
    func rebuildAnimalsGrid() {

        // Remove old rows
        animalsStackView.arrangedSubviews.forEach {
            animalsStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }

        let columns = 3
        var currentRow: UIStackView?

        for (index, view) in animalItemViews.enumerated() {

            if index % columns == 0 {

                currentRow = UIStackView()
                currentRow!.axis = .horizontal
                currentRow!.spacing = 5
                currentRow!.alignment = .center
                currentRow!.distribution = .fill
                currentRow!.translatesAutoresizingMaskIntoConstraints = false

                animalsStackView.addArrangedSubview(currentRow!)
            }

            // 🔥 IMPORTANT: fixed width view
            view.setContentHuggingPriority(.required, for: .horizontal)
            view.setContentCompressionResistancePriority(.required, for: .horizontal)

            currentRow!.addArrangedSubview(view)
        }

        // 🔥 FINAL STEP: spacer for last row
        if let lastRow = animalsStackView.arrangedSubviews.last as? UIStackView {
            let spacer = UIView()
            spacer.translatesAutoresizingMaskIntoConstraints = false
            spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
            lastRow.addArrangedSubview(spacer)
        }
    }
 
    private func addImage(_ imageView: UIImageView, to parentStack: UIStackView) {

        let container = makeImageContainer(for: imageView)

        if let lastRow = parentStack.arrangedSubviews.last as? UIStackView,
           lastRow.arrangedSubviews.count < 2 {

            lastRow.addArrangedSubview(container)

        } else {

            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.spacing = 12
            rowStack.alignment = .center
            rowStack.distribution = .fillEqually

            rowStack.addArrangedSubview(container)
            parentStack.addArrangedSubview(rowStack)
        }

        updateContainerHeights()
    }
    
    private func updateContainerHeights() {

        func calculateHeight(of stackView: UIStackView) -> CGFloat {

            let rows = stackView.arrangedSubviews.count

            if rows == 0 {
                return 120
            }

            let imageHeight = ((UIScreen.main.bounds.width - 120) / 2) * 0.55
            let spacing = stackView.spacing

            return CGFloat(rows) * imageHeight
                + CGFloat(rows - 1) * spacing
                + 20
        }

        domesticBGViewHeight.constant = max(120, calculateHeight(of: domesticImagesStackView))
        wildAnimalBGViewHeight.constant = max(120, calculateHeight(of: wildImagesStackView))

        containerViewHeight.constant = max(domesticBGViewHeight.constant,
                                           wildAnimalBGViewHeight.constant)

        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func alignLastRowIfNeeded(_ parentStack: UIStackView) {

        guard let lastRow = parentStack.arrangedSubviews.last as? UIStackView else { return }

        // Agar last row me sirf 1 image hai
        if lastRow.arrangedSubviews.count == 1 {

            lastRow.distribution = .fill

            let spacer = UIView()
            spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
            lastRow.addArrangedSubview(spacer)
        }
    }
    
    private func makeImageContainer(for imageView: UIImageView) -> UIView {

        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false

        container.layer.cornerRadius = 12
        container.clipsToBounds = true

        let width = (UIScreen.main.bounds.width - 120) / 2
        let height = width * 0.55

        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: width),
            container.heightAnchor.constraint(equalToConstant: height)
        ])

        container.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.55),
            imageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.55)
        ])

        return container
    }
    
}

// MARK: - Drag Delegate
extension DomesticAndWildAnimal: UIDragInteractionDelegate {

    func dragInteraction(_ interaction: UIDragInteraction,
                         itemsForBeginning session: UIDragSession) -> [UIDragItem] {

        guard let imageView = interaction.view as? UIImageView,
              let image = imageView.image else { return [] }

        let provider = NSItemProvider(object: image)
        let item = UIDragItem(itemProvider: provider)

        item.localObject = imageView
        return [item]
    }
}

// MARK: - Drop Delegate
extension DomesticAndWildAnimal: UIDropInteractionDelegate {

    func dropInteraction(_ interaction: UIDropInteraction,
                         canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self)
    }

    func dropInteraction(_ interaction: UIDropInteraction,
                         sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }

    func dropInteraction(_ interaction: UIDropInteraction,
                         performDrop session: UIDropSession) {

        guard let dropView = interaction.view else { return }

        session.loadObjects(ofClass: UIImage.self) { [weak self] items in
            guard let self = self,
                  let image = items.first as? UIImage,
                  let sourceImageView = session.items.first?.localObject as? UIImageView else { return }

            DispatchQueue.main.async {

                let newImageView = UIImageView(image: image)
                newImageView.translatesAutoresizingMaskIntoConstraints = false
                newImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
                newImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
                newImageView.contentMode = .scaleAspectFit
                newImageView.isUserInteractionEnabled = true
                newImageView.animalType = sourceImageView.animalType
                newImageView.addInteraction(UIDragInteraction(delegate: self))

                if dropView === self.domesticBGView {
                    self.addImage(newImageView, to: self.domesticImagesStackView)
                } else if dropView === self.wildAnimalBGView {
                    self.addImage(newImageView, to: self.wildImagesStackView)
                }

                // 🔥 YAHIN SE REMOVE HOGA (SAHI TARIKA)
                if let container = sourceImageView.superview {
                    self.removeAnimalView(container)
                }

                self.placedAnimals += 1
                if self.placedAnimals == self.totalAnimals {
                    self.checkAllResults()
                }
            }
        }
    }
    
    private func checkAllResults() {

        // Domestic box
        for case let row as UIStackView in domesticImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView {
                    let isCorrect = imageView.animalType == .domestic
                    applyResultStyle(to: imageView, isCorrect: isCorrect)
                }
            }
        }

        // Wild box
        for case let row as UIStackView in wildImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView {
                    let isCorrect = imageView.animalType == .wild
                    applyResultStyle(to: imageView, isCorrect: isCorrect)
                }
            }
        }

        // 🔥 ONLY NOW align last row if needed
        alignLastRowIfNeeded(domesticImagesStackView)
        alignLastRowIfNeeded(wildImagesStackView)
    }
    
    private func applyResultStyle(to imageView: UIImageView, isCorrect: Bool) {

        guard let container = imageView.superview else { return }

        container.layer.cornerRadius = 12
        container.layer.borderWidth = 3
        container.layer.borderColor = isCorrect
            ? UIColor.systemGreen.cgColor
            : UIColor.systemRed.cgColor

        showFeedback(for: imageView, isCorrect: isCorrect)
    }
    
    func removeAnimalView(_ view: UIView) {
        animalItemViews.removeAll { $0 == view }
        rebuildAnimalsGrid()

        updateContainerHeights()
    }
    
    
}

// MARK: - Result Check (ONLY IMAGE BORDER COLOR)
extension DomesticAndWildAnimal {

    func checkResult(imageView: UIImageView, droppedOn view: UIView) {
        let isCorrect: Bool
        
        if view == domesticBGView {
            isCorrect = (imageView.animalType == .domestic)
            print("Dropped in Domestic area - Animal is \(imageView.animalType == .domestic ? "Domestic" : "Wild") - \(isCorrect ? "✓ Correct" : "✗ Wrong")")
        } else if view == wildAnimalBGView {
            isCorrect = (imageView.animalType == .wild)
            print("Dropped in Wild area - Animal is \(imageView.animalType == .wild ? "Wild" : "Domestic") - \(isCorrect ? "✓ Correct" : "✗ Wrong")")
        } else {
            isCorrect = false
        }
     
        imageView.layer.borderWidth = 3
        
        if isCorrect {
            imageView.layer.borderColor = UIColor.systemGreen.cgColor
        } else {
            imageView.layer.borderColor = UIColor.systemRed.cgColor
        }
  
        showFeedback(for: imageView, isCorrect: isCorrect)
    
    }
    
    private func showFeedback(for imageView: UIImageView, isCorrect: Bool) {
        let feedbackLabel = UILabel()
        feedbackLabel.text = isCorrect ? "✓" : "✗"
        feedbackLabel.textColor = isCorrect ? .systemGreen : .systemRed
        feedbackLabel.font = UIFont.boldSystemFont(ofSize: 20)
        feedbackLabel.sizeToFit()
        feedbackLabel.center = CGPoint(x: imageView.bounds.width - 15, y: 15)
        feedbackLabel.tag = 999
        imageView.addSubview(feedbackLabel)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            feedbackLabel.removeFromSuperview()
        }
    }
}

extension UIView {

    func addSoftBlur(cornerRadius: CGFloat = 12) {

        // already blur hai to dobara mat lagao
        if viewWithTag(9999) != nil { return }

        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)

        blurView.frame = bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.alpha = 0.35          // 🔥 blur intensity control
        blurView.tag = 9999

        blurView.layer.cornerRadius = cornerRadius
        blurView.clipsToBounds = true

        addSubview(blurView)
    }

    func removeSoftBlur() {
        viewWithTag(9999)?.removeFromSuperview()
    }
}

