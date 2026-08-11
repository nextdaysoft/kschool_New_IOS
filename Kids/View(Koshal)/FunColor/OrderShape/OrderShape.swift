//
//  OrderShape.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 22/01/26.
//


import UIKit
import LanguageManager_iOS

class OrderShape: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var jobLbl: UILabel!
    @IBOutlet weak var jobLblView: UIView!
    @IBOutlet weak var mainJobbgView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    // MARK: Variable
    private var shapes: [DraggableShapeView] = []
    private var currentIndex = 0
    let levels: [Int: ShapeLevel] = [
        1: ShapeLevel(shape: .circle, count: 6),
        2: ShapeLevel(shape: .square, count: 6),
        3: ShapeLevel(shape: .triangle, count: 6)
    ]
    
    let shapeColors: [UIColor] = [
        UIColor(red: 0.85, green: 0.2, blue: 0.4, alpha: 1), // dark pink
        UIColor(red: 0.45, green: 0.2, blue: 0.7, alpha: 1), // dark purple
        UIColor(red: 0.9, green: 0.75, blue: 0.1, alpha: 1), // dark yellow
        UIColor(red: 0.9, green: 0.5, blue: 0.1, alpha: 1),  // dark orange
        UIColor(red: 0.1, green: 0.3, blue: 0.85, alpha: 1), // dark blue
        UIColor(red: 0.75, green: 0.15, blue: 0.15, alpha: 1) // dark red
    ]
    
    var selectedLevel: Int = 1
    
    private var currentShapeIndex = 0
    
    private var shapesForCurrentLevel: [ShapeORType] {

        switch selectedLevel {

        case 1:
            return [
                .circle,
                .square,
                .triangle
            ]

        case 2:
            return [
                .square,
                .triangle
            ]

        case 3:
            return [
                .triangle
            ]

        default:
            return []
        }
    }
    
    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    private var didLayoutOnce = false

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard !didLayoutOnce else { return }
        didLayoutOnce = true

        loadLevel()
    }


    // MARK: Function
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
        jobLblView.backgroundColor = ColorManager.randomColor()
        jobLblView.layer.cornerRadius = 6
        jobLblView.isHidden = true
        nextBtn.isHidden = true
        mainJobbgView.backgroundColor = .clear
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white

            jobLblView.backgroundColor = .white
            jobLbl.textColor = .black

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            jobLblView.backgroundColor = ColorManager.randomColor()
            jobLbl.textColor = .white
        }
    }
    
    private func loadLevel() {

        containerView.subviews.forEach { $0.removeFromSuperview() }
        shapes.removeAll()

        jobLblView.isHidden = true
        nextBtn.isHidden = true

        guard currentShapeIndex < shapesForCurrentLevel.count else {
            showSuccess()
            return
        }

        let shapeType = shapesForCurrentLevel[currentShapeIndex]

        let maxSize: CGFloat = 90
        let step: CGFloat = 14
        let padding: CGFloat = 30

        var usedFrames: [CGRect] = []

        for i in 0..<6 {

            let size = maxSize - CGFloat(i) * step

            let shape = DraggableShapeView(
                frame: CGRect(
                    origin: .zero,
                    size: CGSize(width: size, height: size)
                ),
                shape: shapeType,
                sizeIndex: i,
                color: shapeColors[i % shapeColors.count]
            )

            var frame: CGRect = .zero
            var attempts = 0

            repeat {

                attempts += 1

                let maxX = max(
                    padding,
                    containerView.bounds.width - size - padding
                )

                let maxY = max(
                    padding,
                    containerView.bounds.height - size - padding
                )

                let x = CGFloat.random(in: padding...maxX)
                let y = CGFloat.random(in: padding...maxY)

                frame = CGRect(
                    x: x,
                    y: y,
                    width: size,
                    height: size
                )

                if attempts >= 100 {
                    break
                }

            } while usedFrames.contains(where: { $0.intersects(frame) })

            usedFrames.append(frame)

            shape.frame = frame
            shape.originalCenter = shape.center
            shape.delegate = self

            containerView.addSubview(shape)
            shapes.append(shape)
        }

        shapes.sort { $0.sizeIndex < $1.sizeIndex }
    }
    
    
    private func resetShape(_ shape: DraggableShapeView) {
        UIView.animate(withDuration: 0.25) {
            shape.center = shape.originalCenter
        }
    }

    private func showSuccess() {

        let key = "orderShapeLevel\(selectedLevel)Completed"

        UserDefaults.standard.set(true, forKey: key)

        print("Saved:", key)

        jobLbl.text = "Good Job!".localiz()
        jobLblView.isHidden = false
        nextBtn.isHidden = false
    }
    
    private func checkIfAllNested() {

        // Smallest shape will be deepest nested
        let nestedCount = shapes.filter {
            $0.superview is DraggableShapeView
        }.count

        // All except the biggest should be nested
        if nestedCount == shapes.count - 1 {
            showSuccess()
        }
    }

    
    // MARK: Action
    @IBAction func backbtn(sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {

        jobLblView.isHidden = true
        nextBtn.isHidden = true

        currentShapeIndex += 1

        if currentShapeIndex < shapesForCurrentLevel.count {

            loadLevel()

        } else {

            if let vcs = navigationController?.viewControllers,
               let menuVC = vcs.first(where: { $0 is OrderShapeMenuVC }) {

                navigationController?.popToViewController(menuVC, animated: true)
            }
        }
    }
}

enum ShapeORType {
    case circle
    case square
    case triangle
}
struct ShapeLevel {
    let shape: ShapeORType
    let count: Int
}
extension OrderShape: DraggableShapeDelegate {
    
    func didEndDragging(_ draggedShape: DraggableShapeView) {

        guard let target = shapes.first(where: {

            guard $0.sizeIndex == draggedShape.sizeIndex - 1 else {
                return false
            }

            let draggedCenter = draggedShape.superview?.convert(
                draggedShape.center,
                to: containerView
            ) ?? draggedShape.center

            let targetFrame = $0.superview?.convert(
                $0.frame,
                to: containerView
            ) ?? $0.frame

            // Drop area thodi badi kar di
            return targetFrame.insetBy(dx: -10, dy: -10).contains(draggedCenter)

        }) else {

            resetShape(draggedShape)
            return
        }

        let convertedCenter = target.convert(
            draggedShape.center,
            from: draggedShape.superview
        )

        draggedShape.removeFromSuperview()
        target.addSubview(draggedShape)
        draggedShape.center = convertedCenter

        UIView.animate(withDuration: 0.2) {

            draggedShape.center = CGPoint(
                x: target.bounds.midX,
                y: target.bounds.midY
            )
        }

        draggedShape.isUserInteractionEnabled = false

        checkIfAllNested()
    }
}
