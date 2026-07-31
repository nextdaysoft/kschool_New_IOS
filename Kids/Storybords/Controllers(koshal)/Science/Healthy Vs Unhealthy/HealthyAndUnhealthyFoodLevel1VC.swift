//
//  HealthyAndUnhealthyFoodLevel1VC.swift
//  Kids
//
//  Created by Koshal Singh on 28/01/26.
//

import UIKit
import ObjectiveC

// MARK: - Animal Type
enum FoodType {
    case healthy
    case unhealthy
}

enum FoodZone {
    case healthy
    case unhealthy
}


// MARK: - UIImageView Extension (Animal Type Store)
private var foodsKey: UInt8 = 0

extension UIImageView {
    var foodType: FoodType? {
        get {
            objc_getAssociatedObject(self, &foodsKey) as? FoodType
        }
        set {
            objc_setAssociatedObject(self, &foodsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
class HealthyAndUnhealthyFoodLevel1VC: BaseViewController {

    
    @IBOutlet weak var healthyBGView: UIView!
    @IBOutlet weak var unhealthyBGView: UIView!
    
    @IBOutlet weak var healthyImagesStackView: UIStackView!
    @IBOutlet weak var unhealthyStackView: UIStackView!
    
    @IBOutlet weak var foodStackView: UIStackView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    @IBOutlet weak var healthyBGViewHeight: NSLayoutConstraint!
    @IBOutlet weak var unhealthyBGViewHeight: NSLayoutConstraint!
   
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    
    var healthyDropInteraction: UIDropInteraction!
    var unhealthyDropInteraction: UIDropInteraction!
    
    private var imageNames: [UIImageView: String] = [:]

    private var totalFoods = 0
    private var placedAnimals = 0
    
    private var foodsItemViews: [UIView] = []
    
    private var originalCenters: [UIView: CGPoint] = [:]
    
    private var dragStartRowStack: UIStackView?
    private var dragStartIndex: Int?
    

    private var originalIndexes: [UIView: Int] = [:]
    
    var finalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.isHidden = true
    
        foodsItemViews.forEach {
            originalCenters[$0] = $0.center
        }
        
        setupAnimals()
        setup()
        applyTheme()
        
        healthyBGView.isUserInteractionEnabled = true
        unhealthyBGView.isUserInteractionEnabled = true
        
        healthyBGView.layer.cornerRadius = 10
        unhealthyBGView.layer.cornerRadius = 10
        healthyBGView.clipsToBounds = true
        unhealthyBGView.clipsToBounds = true
        
    
        unhealthyBGView.layer.borderWidth = 0
        unhealthyBGView.layer.borderColor = UIColor.lightGray.cgColor

        healthyBGView.layer.borderWidth = 0
        healthyBGView.layer.borderColor = nil

        unhealthyBGView.layer.borderWidth = 0
        unhealthyBGView.layer.borderColor = nil
        
    
        healthyDropInteraction = UIDropInteraction(delegate: self)
        unhealthyDropInteraction = UIDropInteraction(delegate: self)

        healthyBGView.addInteraction(healthyDropInteraction)
        unhealthyBGView.addInteraction(unhealthyDropInteraction)

        addCategoryLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    func setup(){
        let color = ColorManager.randomColor()
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
            nextBtn.setTitleColor(.black, for: .normal)

            healthyBGView.backgroundColor = .white
            unhealthyBGView.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            healthyBGView.backgroundColor = ColorManager.randomColor()
            unhealthyBGView.backgroundColor = ColorManager.randomColor()
        }
    }
    
    
    private func addCategoryLabels() {

        let healthyLabel = UILabel()
        healthyLabel.text = "Healthy Food"
        healthyLabel.font = .boldSystemFont(ofSize: 16)
        healthyLabel.textColor = .darkGray
        healthyLabel.frame.origin = CGPoint(x: 10, y: 10)
        healthyBGView.addSubview(healthyLabel)

        let unhealthyLabel = UILabel()
        unhealthyLabel.text = "Unhealthy Food"
        unhealthyLabel.font = .boldSystemFont(ofSize: 16)
        unhealthyLabel.textColor = .darkGray
        unhealthyLabel.frame.origin = CGPoint(x: 10, y: 10)
        unhealthyBGView.addSubview(unhealthyLabel)
    }
    
    func makeAnimalCell(image: UIImage, type: FoodType) -> UIView {

        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 12
        container.backgroundColor = .white
        container.isUserInteractionEnabled = true

        // 🔥 SAME SIZE AS DomesticAndWildAnimal
        let width = (UIScreen.main.bounds.width - 60) / 3
        let height = width * 0.8

        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: width),
            container.heightAnchor.constraint(equalToConstant: height)
        ])

        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = false
        imageView.foodType = type

        container.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7)
        ])

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
    

    
    func handleDrop(for draggedView: UIView) {
        draggedView.removeSoftBlur()

        UIView.animate(withDuration: 0.2) {
            draggedView.transform = .identity
        }

        draggedView.layer.cornerRadius = 12
        draggedView.clipsToBounds = true

        let draggedFrame = draggedView.superview?
            .convert(draggedView.frame, to: view) ?? draggedView.frame

        let domesticFrame = healthyBGView.convert(healthyBGView.bounds, to: view)
        let wildFrame = unhealthyBGView.convert(unhealthyBGView.bounds, to: view)

        if domesticFrame.intersects(draggedFrame) {
            addDraggedView(draggedView, to: healthyImagesStackView)
            removeAnimalView(draggedView) // 🔥 यहाँ rebuild हो जाएगा
            placedAnimals += 1
            checkIfGameFinished()
            return
        }

        if wildFrame.intersects(draggedFrame) {
            addDraggedView(draggedView, to: unhealthyStackView)
            removeAnimalView(draggedView) // 🔥 यहाँ rebuild हो जाएगा
            placedAnimals += 1
            checkIfGameFinished()
            return
        }

        // ❌ invalid drop → wapas wahi
        restoreToOriginalPosition(draggedView)
    }
    
    func restoreToOriginalPosition(_ view: UIView) {
        // सबसे पहले view को वापस array में डालें
        if !foodsItemViews.contains(view) {
            // dictionary से original index लें
            if let originalIndex = originalIndexes[view] {
                // index को array के bounds में रखें
                let safeIndex = min(originalIndex, foodsItemViews.count)
                foodsItemViews.insert(view, at: safeIndex)
            } else {
                foodsItemViews.append(view)
            }
        }
        
        // फिर से ग्रिड बनाएं
        rebuildAnimalsGrid()
        
        // reset transform
        UIView.animate(withDuration: 0.3) {
            view.transform = .identity
        }
    }
    
    private func reinsertView(_ view: UIView, at index: Int) {
        // अगर index valid है
        if index >= 0 && index <= foodsItemViews.count {
            foodsItemViews.insert(view, at: index)
            rebuildAnimalsGrid()
        } else {
            foodsItemViews.append(view)
            rebuildAnimalsGrid()
        }
    }
    
    func checkIfGameFinished() {
        if placedAnimals == totalFoods {
            applyFinalBorders()
            nextBtn.isHidden = false   // 🔥 NOW show Next
        }
    }
    
    func applyFinalBorders() {

        // Domestic box
        for case let row as UIStackView in healthyImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView {

                    let isCorrect = imageView.foodType == .healthy
                    applyFinalBorder(to: container, correct: isCorrect)
                }
            }
        }

        // Wild box
        for case let row as UIStackView in unhealthyStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView {

                    let isCorrect = imageView.foodType == .unhealthy
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
    
    func applyBorder(to imageView: UIImageView, droppedIn zone: FoodZone) {

        guard let container = imageView.superview else { return }

        let isCorrect: Bool

        switch zone {
        case .healthy:
            isCorrect = imageView.foodType == .healthy
        case .unhealthy:
            isCorrect = imageView.foodType == .unhealthy
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

        addImage(view.subviews.first as! UIImageView, to: stack)
    }
    
    
    
    func calculatePercentage() -> Int {
        var correctCount = 0

        // Domestic box
        for case let row as UIStackView in healthyImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView,
                   imageView.foodType == .healthy {
                    correctCount += 1
                }
            }
        }

        // Wild box
        for case let row as UIStackView in unhealthyStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView,
                   imageView.foodType == .unhealthy {
                    correctCount += 1
                }
            }
        }

        return Int((Double(correctCount) / Double(totalFoods)) * 100)
    }

       // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu()
    }
    
    func goToMenu() {

        let percentage = calculatePercentage()

        UserDefaults.standard.set(true, forKey: "healthyVsUnhealthyLevel1Completed")
        UserDefaults.standard.set(percentage, forKey: "healthyVsUnhealthyLevel1Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is HealthyVsUnhealthyMenuVC }
        ) as? HealthyVsUnhealthyMenuVC {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    func setupAnimals() {
        let foods: [(String, FoodType)] = [
            ("banana", .healthy),
            ("watermelon", .healthy),
            ("orange", .healthy),
            ("apple", .healthy),
            ("carrot", .healthy),
            ("broccoli", .healthy),
            ("candies", .unhealthy),
            ("cake", .unhealthy),
            ("snack", .unhealthy),
            ("ice-cream", .unhealthy),
            ("burger", .unhealthy),
            ("pizza", .unhealthy)
        ]

        let shuffledFoods = foods.shuffled()
        
        // पहले array को clear करें
        foodsItemViews.removeAll()
        originalCenters.removeAll()
        originalIndexes.removeAll() // 🔥 clear indexes भी
        
        // नए views बनाएं
        for (index, food) in shuffledFoods.enumerated() {
            if let img = UIImage(named: food.0) {
                let view = makeAnimalCell(image: img, type: food.1)
                foodsItemViews.append(view)
                originalIndexes[view] = index // 🔥 index store करें
            }
        }

        totalFoods = foodsItemViews.count
        placedAnimals = 0
        
        // ग्रिड बनाएं
        rebuildAnimalsGrid()
        
        // original centers सेट करें
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            for view in self.foodsItemViews {
                self.originalCenters[view] = view.center
            }
        }
    }
    
    func rebuildAnimalsGrid() {

        foodStackView.arrangedSubviews.forEach {
            foodStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }

        let columns = 3
        var currentRow: UIStackView?

        for (index, view) in foodsItemViews.enumerated() {

            if index % columns == 0 {

                currentRow = UIStackView()
                currentRow!.axis = .horizontal
                currentRow!.spacing = 12
                currentRow!.alignment = .fill
                currentRow!.distribution = .fillEqually   // ✅ FIX
                currentRow!.translatesAutoresizingMaskIntoConstraints = false

                foodStackView.addArrangedSubview(currentRow!)
            }

            currentRow!.addArrangedSubview(view)
        }

        // last row spacer
        if let lastRow = foodStackView.arrangedSubviews.last as? UIStackView {

            while lastRow.arrangedSubviews.count < columns {
                let spacer = UIView()
                lastRow.addArrangedSubview(spacer)
            }
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
            rowStack.alignment = .fill
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

            let width = (UIScreen.main.bounds.width - 60) / 3

            // ✅ Container ki new height
            let imageHeight = width * 0.55

            let spacing = stackView.spacing

            return CGFloat(rows) * imageHeight +
                   CGFloat(max(rows - 1, 0)) * spacing +
                   20
        }

        healthyBGViewHeight.constant = max(120, calculateHeight(of: healthyImagesStackView))
        unhealthyBGViewHeight.constant = max(120, calculateHeight(of: unhealthyStackView))

        containerViewHeight.constant = max(
            healthyBGViewHeight.constant,
            unhealthyBGViewHeight.constant
        )

        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    func removeAnimalView(_ view: UIView) {

        if let index = foodsItemViews.firstIndex(of: view) {
            foodsItemViews.remove(at: index)
        }

        if let rowStack = view.superview as? UIStackView {
            rowStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        rebuildAnimalsGrid()

        updateContainerHeights()
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

        // ✅ Sirf container ki height kam ki hai
        let width = (UIScreen.main.bounds.width - 60) / 3
        let height = width * 0.55

        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: width),
            container.heightAnchor.constraint(equalToConstant: height)
        ])

        container.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),

            // ✅ Image ki size same rakhi hai
            imageView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7)
        ])

        return container
    }
    
}

// MARK: - Drag Delegate
extension HealthyAndUnhealthyFoodLevel1VC: UIDragInteractionDelegate {

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
extension HealthyAndUnhealthyFoodLevel1VC: UIDropInteractionDelegate {

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

                if dropView === self.healthyBGView {
                    self.addImage(newImageView, to: self.healthyImagesStackView)
                } else if dropView === self.unhealthyBGView {
                    self.addImage(newImageView, to: self.unhealthyStackView)
                }

                // 🔥 YAHIN SE REMOVE HOGA (SAHI TARIKA)
                if let container = sourceImageView.superview {
                    self.removeAnimalView(container)
                }

                self.placedAnimals += 1
                if self.placedAnimals == self.totalFoods {
                    self.checkAllResults()
                }
            }
        }
    }
    
    private func checkAllResults() {

        // Domestic box
        for case let row as UIStackView in healthyImagesStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView {
                    let isCorrect = imageView.foodType == .healthy
                    applyResultStyle(to: imageView, isCorrect: isCorrect)
                }
            }
        }

        // Wild box
        for case let row as UIStackView in unhealthyStackView.arrangedSubviews {
            for case let container as UIView in row.arrangedSubviews {
                if let imageView = container.subviews.first as? UIImageView {
                    let isCorrect = imageView.foodType == .unhealthy
                    applyResultStyle(to: imageView, isCorrect: isCorrect)
                }
            }
        }

        // 🔥 ONLY NOW align last row if needed
        alignLastRowIfNeeded(healthyImagesStackView)
        alignLastRowIfNeeded(unhealthyStackView)
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
    
    
}

// MARK: - Result Check (ONLY IMAGE BORDER COLOR)
extension HealthyAndUnhealthyFoodLevel1VC {

    func checkResult(imageView: UIImageView, droppedOn view: UIView) {
        let isCorrect: Bool
        
        if view == healthyBGView {
            isCorrect = (imageView.foodType == .healthy)
            print("Dropped in healthy area - Food is \(imageView.foodType == .healthy ? "healthy" : "unhealthy") - \(isCorrect ? "✓ Correct" : "✗ Wrong")")
        } else if view == unhealthyBGView {
            isCorrect = (imageView.foodType == .unhealthy)
            print("Dropped in unhealthy area - Food is \(imageView.foodType == .unhealthy ? "unhealthy" : "healthy") - \(isCorrect ? "✓ Correct" : "✗ Wrong")")
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
