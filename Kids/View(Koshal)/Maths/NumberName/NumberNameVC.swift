//
//  NumberNameVC.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 16/01/26.
//
import UIKit

struct MatchConnection {
    let left: MatchItemView
    let right: MatchItemView
    let line: CAShapeLayer
}

class NumberNameVC: BaseViewController {

    // MARK: - Outlets
    @IBOutlet var leftItems: [MatchItemView]!
    @IBOutlet var rightItems: [MatchItemView]!
    @IBOutlet weak var drawingView: UIView!   // 🔥 FROM STORYBOARD
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var levellbl: UILabel!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    // MARK: - Match State
    private var startItem: MatchItemView?
    private var currentLine: CAShapeLayer?
    private var didSetupData = false
    private var connections: [MatchConnection] = []
    var selectedLevel: Int = 0
    private var correctPairs: [String: String] = [:]
    private var usedRightItems = Set<ObjectIdentifier>()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestures()
        subButton.isHidden = true
        subButton.setTitle("Submit", for: .normal)
        setup()

    }
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        // let img = UIImage(systemName: "arrow.backward.circle")
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        levellbl.text = "# Level \(selectedLevel)"
        statusView.backgroundColor = color
        HeaderView.backgroundColor = color
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupDataOnce()   // ⚠️ after layout
    }

    // MARK: - Setup Data (After AutoLayout)
    func setupDataOnce() {
        guard !didSetupData else { return }
        didSetupData = true

        let range = numberRangeForLevel(selectedLevel ?? 0)

        // Pick random unique numbers equal to count
        let numbers = Array(range).shuffled().prefix(leftItems.count)
        let numberStrings = numbers.map { "\($0)" }
        let wordStrings = numbers.map { numberToWord($0) }

        // Build correctPairs dynamically
        correctPairs.removeAll()
        for (num, word) in zip(numberStrings, wordStrings) {
            correctPairs[num] = word
        }

        // Shuffle right side
        let shuffledWords = wordStrings.shuffled()

        // Sort views top → bottom
        leftItems.sort { $0.frame.minY < $1.frame.minY }
        rightItems.sort { $0.frame.minY < $1.frame.minY }

        for i in 0..<leftItems.count {

            // LEFT
            leftItems[i].value = numberStrings[i]
            leftItems[i].label.text = numberStrings[i]
            leftItems[i].backgroundColor = ColorManager.randomColor()

            // RIGHT
            rightItems[i].value = shuffledWords[i]
            rightItems[i].label.text = shuffledWords[i]
            rightItems[i].backgroundColor = ColorManager.randomColor()
        }
    }


    // MARK: - Gestures
    func setupGestures() {
        leftItems.forEach { item in
            let pan = UIPanGestureRecognizer(
                target: self,
                action: #selector(handlePan(_:))
            )
            item.addGestureRecognizer(pan)
            item.isUserInteractionEnabled = true
        }
    }

    // MARK: - Pan Handling
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {

        let point = gesture.location(in: drawingView)

        switch gesture.state {

        case .began:
            guard let item = gesture.view as? MatchItemView else { return }
            startItem = item

            let line = CAShapeLayer()
            line.strokeColor = UIColor.black.cgColor
            line.lineWidth = 3
            line.lineCap = .round
            line.fillColor = UIColor.clear.cgColor

            drawingView.layer.addSublayer(line)
            currentLine = line

        case .changed:
            guard let start = startItem,
                  let line = currentLine else { return }

            let path = UIBezierPath()
            path.move(to: start.rightEdge(in: drawingView))
            path.addLine(to: point)
            line.path = path.cgPath
        case .ended:
            guard let start = startItem,
                  let line = currentLine else { return }

            let dropPoint = gesture.location(in: view)

            if let end = rightItem(at: dropPoint) {

                // 🔁 Remove old connection for this LEFT item
                removeExistingConnection(for: start)

                let endID = ObjectIdentifier(end)

                // ❌ Right item already used → reject
                if usedRightItems.contains(endID) {
                    line.removeFromSuperlayer()
                    startItem = nil
                    currentLine = nil
                    return
                }

                // ✅ Accept new match
                drawCurve(
                    line,
                    start: start.rightEdge(in: drawingView),
                    end: end.leftEdge(in: drawingView)
                )

                connections.append(
                    MatchConnection(left: start, right: end, line: line)
                )

                usedRightItems.insert(endID)

                start.isUserInteractionEnabled = true
                end.isUserInteractionEnabled = false

                if connections.count == leftItems.count {
                    subButton.isHidden = false
                    subButton.setTitle("Submit", for: .normal)
                }
            }

            startItem = nil
            currentLine = nil

        default:
            break
        }
    }

    // MARK: - Helpers
    func rightItem(at pointInView: CGPoint) -> MatchItemView? {

        for item in rightItems {
            guard let container = item.superview else { continue }

            // Convert drop point into the item's container space
            let convertedPoint = container.convert(pointInView, from: view)

            if item.frame.contains(convertedPoint) {
                return item
            }
        }
        return nil
    }


    func drawCurve(_ line: CAShapeLayer, start: CGPoint, end: CGPoint) {

        let path = UIBezierPath()
        path.move(to: start)

        path.addCurve(
            to: end,
            controlPoint1: CGPoint(x: start.x + 120, y: start.y),
            controlPoint2: CGPoint(x: end.x - 120, y: end.y)
        )

        line.path = path.cgPath
    }
    func numberRangeForLevel(_ level: Int) -> ClosedRange<Int> {
        switch level {
        case 1, 2:
            return 1...10
        case 3, 4:
            return 11...20
        default:
            return 1...10
        }
    }
    func numberToWord(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: NSNumber(value: number))?.capitalized ?? ""
    }
    func removeExistingConnection(for leftItem: MatchItemView) {

        if let index = connections.firstIndex(where: { $0.left == leftItem }) {

            let oldConnection = connections[index]

            // Remove line
            oldConnection.line.removeFromSuperlayer()

            // Free right item
            let rightID = ObjectIdentifier(oldConnection.right)
            usedRightItems.remove(rightID)

            oldConnection.right.isUserInteractionEnabled = true

            // Remove connection
            connections.remove(at: index)
        }
    }

    // MARK: Actions
    @IBAction func btnSumbitTapped(_ sender: UIButton) {
        if sender.currentTitle == "Next" {
            navigationController?.popViewController(animated: true)
            return
        }
        // CHECK ANSWERS
        for connection in connections {

            let leftValue = connection.left.value
            let rightValue = connection.right.value

            if correctPairs[leftValue] == rightValue {

                connection.line.strokeColor = UIColor.systemGreen.cgColor
                connection.left.backgroundColor = .systemGreen
                connection.right.backgroundColor = .systemGreen

            } else {

                connection.line.strokeColor = UIColor.systemRed.cgColor
                connection.left.backgroundColor = .systemRed
                connection.right.backgroundColor = .systemRed
            }

        }

        sender.setTitle("Next", for: .normal)
        
    }
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: Helper Class
class MatchItemView: UIView {

    @IBOutlet weak var label: UILabel!
    var value: String = ""

    func leftEdge(in container: UIView) -> CGPoint {
        convert(CGPoint(x: 0, y: bounds.midY), to: container)
    }

    func rightEdge(in container: UIView) -> CGPoint {
        convert(CGPoint(x: bounds.maxX, y: bounds.midY), to: container)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true

        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
    }
}
