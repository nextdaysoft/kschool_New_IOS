//
//  PuzzleVC.swift
//  KSchool
//
//  Created by Koshal Singh on 16/03/26.
//

import UIKit

class PuzzleVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedDisplayImage: String?
    var selectedPuzzleImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupForRestBtn()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.showsVerticalScrollIndicator = false
        
        tableView.alwaysBounceVertical = false
        tableView.bounces = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // 🔥 IMPORTANT: force layout update
        tableView.layoutIfNeeded()

        // ✅ FINAL FIX
        if tableView.contentSize.height <= tableView.frame.height {
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
        }
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
    
    func setupForRestBtn() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        
        
        let img = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: config)
        
        restBtn.setImage(img, for: .normal)
        
        restBtn.tintColor = UIColor(
            red: 0.17,
            green: 0.21,
            blue: 0.33,
            alpha: 1
        )
        
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "PuzzleCell", for: indexPath) as! PuzzleCell

        // 🔥 ✅ YAHI ADD KARNA HAI (MAIN IMAGE SET)
        if let imageName = selectedDisplayImage {
            cell.puzzleMainImge.image = UIImage(named: imageName)
        }

        // ❌ REMOVE old hardcoded line (agar hai)
        // cell.puzzleMainImge.image = UIImage(named: "lion_and_cub")

        DispatchQueue.main.async {
            self.createEmptyGrid(cell: cell)
            self.createPuzzlePieces(cell: cell)
        }

        return cell
    }
    
    func createPuzzlePieces(cell: PuzzleCell) {

        // 🔥 ✅ YAHI CHANGE KIYA HAI
        guard let imageName = selectedPuzzleImage,
              let image = UIImage(named: imageName) else { return }

        let rows = 4
        let cols = 4
        let spacing: CGFloat = 1

        let totalWidth = cell.puzzleImgsBGView.frame.width
        let width = (totalWidth - (CGFloat(cols - 1) * spacing)) / CGFloat(cols)
        let height: CGFloat = 65

        let pieceWidth = image.size.width / CGFloat(cols)
        let pieceHeight = image.size.height / CGFloat(rows)

        var pieces: [(img: UIImage, correctIndex: Int)] = []

        for r in 0..<rows {
            for c in 0..<cols {

                let rect = CGRect(
                    x: CGFloat(c) * pieceWidth,
                    y: CGFloat(r) * pieceHeight,
                    width: pieceWidth,
                    height: pieceHeight
                )

                if let cg = image.cgImage?.cropping(to: rect) {
                    let cropped = UIImage(cgImage: cg)
                    pieces.append((cropped, r * cols + c))
                }
            }
        }

        pieces.shuffle()
        cell.puzzleImgsBGView.subviews.forEach { $0.removeFromSuperview() }

        for (i, item) in pieces.enumerated() {

            let row = i / cols
            let col = i % cols

            let x = CGFloat(col) * (width + spacing)
            let y = CGFloat(row) * (height + spacing)

            let pieceView = UIImageView()
            pieceView.image = item.img
            pieceView.contentMode = .scaleToFill

            pieceView.frame = CGRect(x: x, y: y, width: width, height: height)
            pieceView.clipsToBounds = true
            pieceView.isUserInteractionEnabled = true
            pieceView.tag = item.correctIndex

            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            pieceView.addGestureRecognizer(pan)

            cell.puzzleImgsBGView.addSubview(pieceView)
        }
    }
    
    func createEmptyGrid(cell: PuzzleCell) {

        let rows = 4
        let cols = 4
        let spacing: CGFloat = 1

        cell.puzzleBGView.subviews.forEach { $0.removeFromSuperview() }

        let totalWidth = cell.puzzleBGView.frame.width
        let width = (totalWidth - (CGFloat(cols - 1) * spacing)) / CGFloat(cols)

        let height: CGFloat = 65

        for r in 0..<rows {
            for c in 0..<cols {

                let box = UIView()

                box.frame = CGRect(
                    x: CGFloat(c) * (width + spacing),
                    y: CGFloat(r) * (height + spacing),
                    width: width,
                    height: height
                )

                // ✅ PURE BLACK COLOR
                box.backgroundColor = UIColor.black

                // ✅ border optional (white line)
                box.layer.borderWidth = 1
                box.layer.borderColor = UIColor.white.cgColor

                box.tag = r * cols + c

                cell.puzzleBGView.addSubview(box)
            }
        }

        let totalHeight = CGFloat(rows) * height + CGFloat(rows - 1) * spacing
        cell.puzzleBGView.frame.size.height = totalHeight

        cell.puzzleBGView.clipsToBounds = true
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {

        guard let piece = gesture.view as? UIImageView else { return }
        let translation = gesture.translation(in: view)

        switch gesture.state {

        case .began:

            tableView.isScrollEnabled = false

            let dragView = UIImageView(image: piece.image)
            dragView.frame = piece.superview!.convert(piece.frame, to: view)

            dragView.alpha = 0.7
            dragView.layer.shadowColor = UIColor.black.cgColor
            dragView.layer.shadowOpacity = 0.3
            dragView.layer.shadowRadius = 6

            dragView.tag = 999
            view.addSubview(dragView)

        case .changed:

            if let drag = view.viewWithTag(999) {
                drag.center = CGPoint(
                    x: drag.center.x + translation.x,
                    y: drag.center.y + translation.y
                )
            }

            gesture.setTranslation(.zero, in: view)

        case .ended:

            tableView.isScrollEnabled = true

            guard let drag = view.viewWithTag(999) else { return }

            if let cell = tableView.visibleCells.first as? PuzzleCell {

                var closestBox: UIView?
                var minDistance: CGFloat = .greatestFiniteMagnitude

                for box in cell.puzzleBGView.subviews {

                    let boxFrame = box.superview!.convert(box.frame, to: view)
                    let boxCenter = CGPoint(x: boxFrame.midX, y: boxFrame.midY)

                    let distance = hypot(
                        drag.center.x - boxCenter.x,
                        drag.center.y - boxCenter.y
                    )

                    if distance < minDistance {
                        minDistance = distance
                        closestBox = box
                    }
                }

                if let box = closestBox, minDistance < 80 {

                    let targetFrame = cell.puzzleBGView.convert(box.frame, from: box.superview)

                    var existingPiece: UIImageView?

                    for sub in cell.puzzleBGView.subviews {
                        if let img = sub as? UIImageView, img.frame == targetFrame {
                            existingPiece = img
                            break
                        }
                    }

                    let sourceView = piece.superview
                    let originalFrame = piece.frame

                    piece.removeFromSuperview()

                    // 🔥 rearrange top grid
                    if let source = sourceView,
                       source == cell.puzzleImgsBGView {

                        let spacing: CGFloat = 1
                        let totalWidth = source.frame.width
                        let width = (totalWidth - (CGFloat(4 - 1) * spacing)) / CGFloat(4)
                        let height: CGFloat = 60

                        let pieces = source.subviews.compactMap { $0 as? UIImageView }

                        for (i, p) in pieces.enumerated() {

                            let row = i / 4
                            let col = i % 4

                            let x = CGFloat(col) * (width + spacing)
                            let y = CGFloat(row) * (height + spacing)

                            UIView.animate(withDuration: 0.25) {
                                p.frame = CGRect(x: x, y: y, width: width, height: height)
                            }

                            p.accessibilityHint = "\(x),\(y)"
                        }
                    }

                    // ✅ place in BGView
                    piece.frame = targetFrame
                    cell.puzzleBGView.addSubview(piece)

                    UIView.animate(withDuration: 0.25) {
                        piece.frame = targetFrame
                    }

                    // 🔁 swap
                    if let old = existingPiece {

                        old.removeFromSuperview()
                        old.frame = originalFrame
                        sourceView?.addSubview(old)

                        UIView.animate(withDuration: 0.25) {
                            old.frame = originalFrame
                        }
                    }

                    drag.removeFromSuperview()

                    // 🎉 ✅ CHECK PUZZLE COMPLETED (ADDED HERE)
                    var isComplete = true

                    let pieces = cell.puzzleBGView.subviews.compactMap { $0 as? UIImageView }

                    if pieces.count == 16 {

                        for piece in pieces {

                            let correctIndex = piece.tag

                            for box in cell.puzzleBGView.subviews {

                                if piece.frame == box.frame {

                                    if box.tag != correctIndex {
                                        isComplete = false
                                        break
                                    }
                                }
                            }

                            if !isComplete { break }
                        }

                        if isComplete {
                            showCustomToast(
                                message: "Puzzle Completed 🎉",
                                image: UIImage(named: "logo")
                            )
                        }
                    }

                    return
                }
            }

            drag.removeFromSuperview()

        default:
            break
        }
    }
    
    func rearrangePieces(in view: UIView, cols: Int = 4) {

        let spacing: CGFloat = 1
        let totalWidth = view.frame.width
        let width = (totalWidth - (CGFloat(cols - 1) * spacing)) / CGFloat(cols)
        let height: CGFloat = 60

        let pieces = view.subviews.compactMap { $0 as? UIImageView }

        for (i, piece) in pieces.enumerated() {

            let row = i / cols
            let col = i % cols

            let x = CGFloat(col) * (width + spacing)
            let y = CGFloat(row) * (height + spacing)

            UIView.animate(withDuration: 0.25) {
                piece.frame = CGRect(x: x, y: y, width: width, height: height)
            }

            // ✅ update new original position
            piece.accessibilityHint = "\(x),\(y)"
        }
    }
    
    func checkPuzzleCompleted(in cell: PuzzleCell) {

        let pieces = cell.puzzleBGView.subviews.compactMap { $0 as? UIImageView }

        // ✅ total pieces check
        if pieces.count != 16 { return }

        for piece in pieces {

            let correctIndex = piece.tag

            // box index (position)
            for box in cell.puzzleBGView.subviews {

                let targetFrame = box.frame

                if piece.frame == targetFrame {

                    if box.tag != correctIndex {
                        return // ❌ wrong placement
                    }
                }
            }
        }

        // 🎉 ALL CORRECT
        showCustomToast(
            message: "Puzzle Completed 🎉",
            image: UIImage(named: "logo")
        )
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func restTapBtn(_ sender: UIButton) {

        if let cell = tableView.visibleCells.first as? PuzzleCell {

            // ❌ BGView se sab pieces hatao
            cell.puzzleBGView.subviews
                .compactMap { $0 as? UIImageView }
                .forEach { $0.removeFromSuperview() }

            // 🔥 recreate shuffled pieces (MAIN FIX)
            createPuzzlePieces(cell: cell)

            // optional: grid redraw (clean UI)
            createEmptyGrid(cell: cell)
        }

        // ✅ toast
        showCustomToast(
            message: "Puzzle Reset",
            image: UIImage(named: "logo")
        )
    }

}
