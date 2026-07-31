//
//  MatchShape.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 22/01/26.
//

import UIKit
import LanguageManager_iOS

class MatchShape: BaseViewController,DraggableImageViewDelegate {
    // MARK: Outlet
    @IBOutlet weak var boardView: UIView!
    @IBOutlet var targetImageViews: [UIImageView]!
    @IBOutlet var draggableImageViews: [DraggableImageView]!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var jobLbl: UILabel!
    @IBOutlet weak var jobLblView: UIView!
    @IBOutlet weak var mainJobbgView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    @IBOutlet weak var resetBtn: UIButton!
    
    // MARK: Variable
    private var initialDragPositions: [DraggableImageView: CGPoint] = [:]  // State
    
    private var placedStack: [(drag: DraggableImageView, target: UIImageView)] = []
    
    var levelNumber: Int = 1
    
    let matchLevels: [Int: MatchShapeLevel] = [

        // 🔵 LEVEL 1
        1: MatchShapeLevel(
            backgroundColor: UIColor.systemBlue,
            shapes: [.circle, .star, .square, .triangle]
        ),

        // 🟡 LEVEL 2
        2: MatchShapeLevel(
            backgroundColor: UIColor.systemYellow,
            shapes: [.oval, .heart, .moon, .diamond]
        ),

        // 🔵 LEVEL 3
        3: MatchShapeLevel(
            backgroundColor: UIColor.systemBlue,
            shapes: [.pentagon, .hexagon, .triangle, .cross]
        )
    ]
    private var currentLevel: MatchShapeLevel!
    var selectedLevel: Int = 1
    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
        
        selectedLevel = levelNumber
        
        DispatchQueue.main.async {
             for dragView in self.draggableImageViews {
                 self.initialDragPositions[dragView] = dragView.center
             }
             self.setupLevel()
         }
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    
    // MARK: Function
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
        resetBtn.layer.cornerRadius = 6
//        jobLblView.backgroundColor = ColorManager.randomColor()
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
            nextBtn.setTitleColor(.black, for: .normal)

            resetBtn.backgroundColor = .white
            resetBtn.setTitleColor(.black, for: .normal)

            jobLblView.backgroundColor = .white
            jobLbl.textColor = .black

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            resetBtn.backgroundColor = color
            resetBtn.setTitleColor(.white, for: .normal)

            jobLblView.backgroundColor = ColorManager.randomColor()
            jobLbl.textColor = .white
        }
    }
    
    
    private func setupLevel() {

        jobLblView.isHidden = true
        nextBtn.isHidden = true
        resetBtn.isHidden = true
        placedStack.removeAll()
        
        guard let level = matchLevels[selectedLevel] else { return }
        currentLevel = level

        boardView.backgroundColor = level.backgroundColor
        boardView.layer.cornerRadius = 20

        let shuffled = level.shapes.shuffled()

        // RESET TARGETS
        for target in targetImageViews {
            target.isHidden = false
        }

        // RESET DRAGGABLES
        for dragView in draggableImageViews {
            dragView.transform = .identity
            dragView.isUserInteractionEnabled = true

            if let startPos = initialDragPositions[dragView] {
                dragView.center = startPos
                dragView.originalPosition = startPos
            }
        }

        // TARGET SHAPES (WHITE)
        for (index, shape) in level.shapes.enumerated() {
            let image = UIImage(named: "\(shape.rawValue)_white")?
                .withRenderingMode(.alwaysOriginal)

            targetImageViews[index].image = image
            targetImageViews[index].tag = index
        }

        // DRAGGABLE SHAPES (COLORED)
        for (index, shape) in shuffled.enumerated() {
            let dragView = draggableImageViews[index]

            let image = UIImage(named: "\(shape.rawValue)_white")?
                .withRenderingMode(.alwaysTemplate)

            dragView.image = image
            dragView.tintColor = ColorManager.randomColor()
            dragView.shapeType = shape
            dragView.delegate = self
        }
    }

    private func isDragView(_ dragView: UIView,
                            near target: UIView,
                            threshold: CGFloat = 40) -> Bool {

        let dragCenter = dragView.superview!.convert(dragView.center, to: boardView)
        let targetCenter = target.superview!.convert(target.center, to: boardView)

        let dx = dragCenter.x - targetCenter.x
        let dy = dragCenter.y - targetCenter.y

        return sqrt(dx*dx + dy*dy) < threshold
    }

    func didDrop(_ dragView: DraggableImageView) {

        for target in targetImageViews {

            guard !target.isHidden else { continue }

            if isDragView(dragView, near: target) {

                let correctShape =
                    currentLevel.shapes[target.tag] == dragView.shapeType

                if correctShape {

                    // SAVE FOR UNDO
                    placedStack.append((drag: dragView, target: target))

                    // SNAP INTO PLACE
                    UIView.animate(withDuration: 0.25, animations: {
                        dragView.center = dragView.superview!.convert(
                            target.center,
                            from: target.superview
                        )
                    })

                    target.isHidden = true
                    dragView.isUserInteractionEnabled = false

                    // ✅ SHOW BUTTONS ON FIRST MOVE
                    nextBtn.isHidden = false
                    resetBtn.isHidden = false

                    nextBtn.setTitle("Undo".localiz(), for: .normal)

                    checkCompletion()
                    return
                }
            }
        }

        // ❌ WRONG DROP → RETURN
        UIView.animate(withDuration: 0.25) {
            dragView.center = dragView.originalPosition
        }
    }


    private func checkCompletion() {
        let completed = draggableImageViews.allSatisfy {
            !$0.isUserInteractionEnabled
        }

        if completed {
            print("🎉 LEVEL COMPLETED")

            jobLbl.text = "Good Job!".localiz()
            jobLblView.isHidden = false

            nextBtn.isHidden = false
            nextBtn.setTitle("Next".localiz(), for: .normal)

            resetBtn.isHidden = true

            // ✅ ✅ ADD THIS (MAIN FIX)
            let key = "matchshapeLevel\(levelNumber)Completed"
            UserDefaults.standard.set(true, forKey: key)
            print("Saved:", key)

            self.mainJobbgView.transform = CGAffineTransform(translationX: 0, y: -50)

        } else {
            nextBtn.setTitle("Undo".localiz(), for: .normal)
            resetBtn.isHidden = false

            self.mainJobbgView.transform = .identity
        }
    }

    private func performUndo() {
        guard let last = placedStack.popLast() else { return }

        let dragView = last.drag
        let target = last.target

        // SHOW TARGET AGAIN
        target.isHidden = false

        // ENABLE DRAG AGAIN
        dragView.isUserInteractionEnabled = true

        // MOVE BACK TO ORIGINAL POSITION
        UIView.animate(withDuration: 0.25) {
            dragView.center = dragView.originalPosition
        }

        checkCompletion()
    }
    

    // MARK: Action
    @IBAction func backbtn(sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {

        if nextBtn.title(for: .normal) == "Undo" {
            performUndo()
        } else {
            // 🔁 RESET POSITION BEFORE NEXT LEVEL
            self.mainJobbgView.transform = .identity

            // NEXT LEVEL
            jobLblView.isHidden = true
            nextBtn.isHidden = true

            selectedLevel += 1

            if matchLevels[selectedLevel] != nil {
                setupLevel()
            } else {
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    @IBAction func resetTapBtn(_ sender: UIButton) {

        // CLEAR STACK
        placedStack.removeAll()

        for target in targetImageViews {
            target.isHidden = false
        }

        for dragView in draggableImageViews {
            dragView.isUserInteractionEnabled = true

            UIView.animate(withDuration: 0.25) {
                dragView.center = dragView.originalPosition
            }
        }

        nextBtn.setTitle("Undo".localiz(), for: .normal)
        resetBtn.isHidden = false
        jobLblView.isHidden = true
    }
    
}
enum ShapeType: String {
    case circle
    case star
    case square
    case triangle
    case heart
    case diamond
    case moon
    case oval
    case pentagon
    case hexagon
    case cross
}
struct MatchShapeLevel {
    let backgroundColor: UIColor
    let shapes: [ShapeType]
}

