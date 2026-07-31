//
//  TblView.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 16/12/25.
//

import UIKit

class TablesVC: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var scrlView: UIScrollView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var ststusView: UIView!
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var speakAndPlayBtn: UIButton!
    @IBOutlet weak var undoBtn: UIButton!
    
    // MARK: Variable
    var tableItems: [TableItem] = []
    var answers: [Int] = []
    var currentTable: Int = 2
    var table = ""
    var userAnswers: [Int: Int] = [:]

    var answerHistory: [(index: Int, value: Int)] = []
    
    var isSpeakingActive = false
    
    var draggingView:UIView?
    var originalCenter:CGPoint = .zero
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrlView.isScrollEnabled = false
        tblView.isScrollEnabled = false
        collView.isScrollEnabled = false
        
        setupCollectionView()
        let img = UIImage(systemName: "chevron.left")
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
       // lblTitle.text = table
        setup()
        applyTheme()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
        setupData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        isSpeakingActive = false   // ✅ stop loop
        TextToSpeechManager.shared.stopSpeaking()
    }
  
    
    // MARK: Function
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        // let img = UIImage(systemName: "arrow.backward.circle")
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        //levellbl.text = "# Level \(selectedLevel)"
        tblView.separatorStyle = .none        // ❌ remove separators
        tblView.sectionHeaderHeight = 0
        tblView.sectionFooterHeight = 0
        tblView.contentInset = .zero
        tblView.layoutMargins = .zero
        tblView.preservesSuperviewLayoutMargins = false
        resetBtn.layer.cornerRadius = 6
        speakAndPlayBtn.layer.cornerRadius = 6
        undoBtn.layer.cornerRadius = 6
    }
        private func setupData() {
            tableItems = (1...10).map {
            TableItem(table: currentTable, multiplier: $0)
            }
            answers = tableItems.map { $0.answer }.shuffled()
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            ststusView.backgroundColor = .white

            resetBtn.backgroundColor = .white
            resetBtn.setTitleColor(.black, for: .normal)

            speakAndPlayBtn.backgroundColor = .white
            speakAndPlayBtn.setTitleColor(.black, for: .normal)

            undoBtn.backgroundColor = .white
            undoBtn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            ststusView.backgroundColor = color

            resetBtn.backgroundColor = color
            resetBtn.setTitleColor(.white, for: .normal)

            speakAndPlayBtn.backgroundColor = color
            speakAndPlayBtn.setTitleColor(.white, for: .normal)

            undoBtn.backgroundColor = color
            undoBtn.setTitleColor(.white, for: .normal)
        }
    }
    
    func handleDrag(
        gesture: UIPanGestureRecognizer,
        cell: AnswerCell
    ){

        let location = gesture.location(in: view)

        switch gesture.state {

        case .began:

            draggingView =
            cell.snapshotView(
                afterScreenUpdates: true
            )

            guard let drag = draggingView
            else { return }

            drag.frame =
            cell.convert(
                cell.bounds,
                to: view
            )

            originalCenter =
            drag.center

            view.addSubview(drag)

            cell.isHidden = true

            // ✅ no size increase
            UIView.animate(
                withDuration: 0.15
            ){
                drag.transform = .identity
                drag.alpha = 0.95
            }

        case .changed:

            draggingView?.center = location

        case .ended:

            guard let drag = draggingView else { return }

            var dropped = false

            for visible in tblView.visibleCells {

                guard let tcell = visible as? TbleCell else { continue }

                let frame = tcell.lblanswer.convert(
                    tcell.lblanswer.bounds,
                    to: view
                )

                if frame.contains(location) {

                    guard let text = cell.lbl.text,
                          let value = Int(text),
                          let row = tblView.indexPath(for: tcell)?.row
                    else { return }

                    // ✅ Agar is row me pehle se answer hai to use niche bhejo
                    if let oldValue = userAnswers[row] {

                        answers.append(oldValue)

                        if let oldIndex = answerHistory.firstIndex(where: { $0.index == row }) {
                            answerHistory.remove(at: oldIndex)
                        }
                    }

                    // ✅ Naya answer set
                    tcell.lblanswer.text = text

                    userAnswers[row] = value
                    answerHistory.append((index: row, value: value))

                    // ✅ Bottom se dragged value remove
                    if let index = answers.firstIndex(of: value) {
                        answers.remove(at: index)
                    }

                    collView.reloadData()

                    // ✅ Table complete
                    if isTableCompleted() {
                        checkFullTableAnswers()
                        speakCompletedTable()
                        undoBtn.setTitle("Next", for: .normal)
                    }

                    dropped = true

                    UIView.animate(withDuration: 0.2) {

                        drag.center = CGPoint(
                            x: frame.midX,
                            y: frame.midY
                        )

                    } completion: { _ in

                        drag.transform = .identity
                        drag.alpha = 1
                        drag.removeFromSuperview()
                        cell.isHidden = false
                    }

                    break
                }
            }

            if !dropped {

                UIView.animate(withDuration: 0.3) {

                    drag.center = self.originalCenter
                    drag.transform = .identity
                    drag.alpha = 1

                } completion: { _ in

                    drag.removeFromSuperview()
                    cell.isHidden = false
                }
            }

            draggingView = nil

        default:
            break
        }
    }
    
    private func setupCollectionView() {
        
        collView.dataSource = self
        collView.delegate = self

        // ✅ Drag enable
//        collView.dragInteractionEnabled = true
//        collView.dragDelegate = self
//
//        // ✅ Smooth lifting while dragging
//        collView.reorderingCadence = .fast

        if let layout = collView.collectionViewLayout as? UICollectionViewFlowLayout {

            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 12

            layout.sectionInset = UIEdgeInsets(
                top: 8,
                left: 16,
                bottom: 8,
                right: 16
            )

            layout.estimatedItemSize = .zero
        }

        collView.showsHorizontalScrollIndicator = false
    }
    func isTableCompleted() -> Bool {
        return userAnswers.count == tableItems.count
    }
    func checkFullTableAnswers() {
        
        for (index, item) in tableItems.enumerated() {

            guard let cell = tblView.cellForRow(
                at: IndexPath(row: index, section: 0)
            ) as? TbleCell else { continue }

            let userValue = userAnswers[index] ?? -1
            let correctValue = item.answer

            if userValue == correctValue {
                // ✅ CORRECT
                cell.answerview.backgroundColor = .systemGreen
                cell.lblanswer.textColor = .black
                cell.lblanswer.text = "\(userValue)"
                cell.correctAnswerlbl.text = ""

            } else {
                // ❌ WRONG
                cell.answerview.backgroundColor = .systemRed
                cell.lblanswer.textColor = .black
                cell.lblanswer.text = "\(userValue) ✗"

                cell.correctAnswerlbl.text =
                    "\(correctValue)✓"
                cell.correctAnswerlbl.textColor = .systemGreen
                cell.correctAnswerlbl.isHidden = false
            }
        }
    }
    
    private func speakCompletedTable() {

        let numbersInWords = [
            1: "one", 2: "two", 3: "three", 4: "four", 5: "five",
            6: "six", 7: "seven", 8: "eight", 9: "nine", 10: "ten"
        ]

        let sentences = tableItems.map { item -> String in
            let word = numbersInWords[item.multiplier] ?? "\(item.multiplier)"
            return "\(currentTable) \(word) ja \(item.answer)"
        }

        speakSequentially(sentences)
    }
    
    private func speakSequentially(
        _ texts: [String],
        index: Int = 0
    ) {
        guard isSpeakingActive else { return } // ✅ STOP control
        guard index < texts.count else { return }

        TextToSpeechManager.shared.speak(texts[index])

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.speakSequentially(texts, index: index + 1)
        }
    }

    // MARK: Action
    @IBAction func backBtnTapped(_ sender: Any) {

        isSpeakingActive = false
        TextToSpeechManager.shared.stopSpeaking()

        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetTapBtn(_ sender: UIButton) {

        // ✅ STOP SPEAKING
        isSpeakingActive = false
        TextToSpeechManager.shared.stopSpeaking()

        // ✅ CLEAR DATA
        userAnswers.removeAll()
        answerHistory.removeAll()

        // ✅ RELOAD NEW ANSWERS
        setupData()

        // ✅ RESET TABLE CELLS UI
        for visibleCell in tblView.visibleCells {

            guard let cell = visibleCell as? TbleCell else { continue }

            cell.lblanswer.text = ""
            cell.lblanswer.textColor = .black

            cell.correctAnswerlbl.text = ""
            cell.correctAnswerlbl.isHidden = true

            if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                cell.answerview.backgroundColor = .white
            } else {
                cell.answerview.backgroundColor = ColorManager.randomColor()
            }
        }

        // ✅ RELOAD UI
        tblView.reloadData()
        collView.reloadData()

        // ✅ RESET BUTTON TITLE
        undoBtn.setTitle("Undo", for: .normal)
    }
    
    
    @IBAction func speakAndPlayTapBtn(_ sender: UIButton) {

        isSpeakingActive = true // ✅ start speaking

        TextToSpeechManager.shared.speak("Play")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.speakCompletedTable()
        }
    }
    
    @IBAction func undoTapBtn(_ sender: UIButton) {

        // ✅ If completed → act as NEXT
        if isTableCompleted() {
            saveTableProgress()
            goToMenu()
            return
        }

        // ❌ Normal undo
        guard let last = answerHistory.popLast() else { return }

        userAnswers.removeValue(forKey: last.index)
        answers.append(last.value)

        tblView.reloadRows(at: [IndexPath(row: last.index, section: 0)], with: .none)
        collView.reloadData()
    }
    
    func goToMenu() {

        if let menuVC = navigationController?.viewControllers.first(where: { $0 is TablesMenuVC }) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    func saveTableProgress() {

        var correctCount = 0

        for (index, item) in tableItems.enumerated() {
            let userValue = userAnswers[index] ?? -1
            if userValue == item.answer {
                correctCount += 1
            }
        }

        let percentage = Int((Double(correctCount) / Double(tableItems.count)) * 100)

        var levelData = UserDefaults.standard.dictionary(forKey: "tablesLevelData") as? [String: Int] ?? [:]

        levelData["\(currentTable)"] = percentage

        UserDefaults.standard.set(levelData, forKey: "tablesLevelData")

        // ✅ mark completed
        UserDefaults.standard.set(true, forKey: "tablesLevel\(currentTable)Completed")
    }
}
// MARK: Extension
extension TablesVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableItems.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "TbleCell", for: indexPath)as! TbleCell
        let row = indexPath.row

        cell.onAnswerDropped = { [weak self] value in
            guard let self = self else { return }

            // ✅ Agar is row me pehle se koi answer hai to usko niche wapas bhejo
            if let oldValue = self.userAnswers[row] {

                self.answers.append(oldValue)

                if let historyIndex = self.answerHistory.firstIndex(where: { $0.index == row }) {
                    self.answerHistory.remove(at: historyIndex)
                }
            }

            // ✅ Naya answer save karo
            self.userAnswers[row] = value
            self.answerHistory.append((index: row, value: value))

            // ✅ Bottom collection se remove karo
            if let index = self.answers.firstIndex(of: value) {
                self.answers.remove(at: index)
            }

            self.collView.reloadData()

            // ✅ Agar sab fill ho gaye to check karo
            if self.isTableCompleted() {
                self.checkFullTableAnswers()
                self.speakCompletedTable()
                self.undoBtn.setTitle("Next", for: .normal)
            }
        }
        cell.configure(item: tableItems[indexPath.row])
        return cell
    }
    
}
extension TbleCell: UIDropInteractionDelegate {

    func dropInteraction(
        _ interaction: UIDropInteraction,
        canHandle session: UIDropSession
    ) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }
    // ⭐ REQUIRED ON iOS 16+
    func dropInteraction(
        _ interaction: UIDropInteraction,
        sessionDidUpdate session: UIDropSession
    ) -> UIDropProposal {
        UIDropProposal(operation: .copy)
    }

    func dropInteraction(
        _ interaction: UIDropInteraction,
        performDrop session: UIDropSession
    ) {

        session.loadObjects(ofClass: NSString.self) { items in
            guard let text = items.first as? String,
                  let value = Int(text) else { return }

            self.lblanswer.text = text
            self.onAnswerDropped?(value)

        }
    }
}

extension TablesVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        answers.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CollCell",
            for: indexPath
        ) as! AnswerCell

        cell.configure(value: answers[indexPath.item])

        // 👇 direct touch drag callback
        cell.panHandler = { [weak self] gesture, dragCell in
            self?.handleDrag(
                gesture: gesture,
                cell: dragCell
            )
        }

        return cell
    }
}

extension TablesVC: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let totalSpacing: CGFloat = 16 * 2 + 12 * 4
        // left + right + gaps between 5 items

        let width = (collectionView.frame.width - totalSpacing) / 5

        return CGSize(width: width, height: 40)
    }
}

extension UIView {
    func shake() {
        let anim = CAKeyframeAnimation(keyPath: "transform.translation.x")
        anim.values = [-8, 8, -6, 6, -4, 4, 0]
        anim.duration = 0.4
        layer.add(anim, forKey: "shake")
    }
}
struct TableItem {
    let table: Int
    let multiplier: Int
    var answer: Int {
        table * multiplier
    }
}


