//
//  ConnectTheVowelsShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 21/03/26.
//

import UIKit
import AudioToolbox
import AVFoundation
import LanguageManager_iOS

class ConnectTheVowelsShowVC: BaseViewController {

    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var gameBGView: UIView!
    @IBOutlet weak var buttonsBGView: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    
    let speechSynth = AVSpeechSynthesizer()
    
    var gridViews: [[GridItemView]] = []
    var currentRow = 7   // monkey start row
    var currentCol = 2   // monkey start col
  
    var isOnWrongCell = false
    var lastValidRow = 7
    var lastValidCol = 2
    
    let vowels: Set<String> = ["A","E","I","O","U"]

    var visitedWrong: Set<String> = [] // wrong cells track
    var themeColor: UIColor = .systemBlue
    
    var goodJobLabel: UILabel!
    var nextButton: UIButton!
    var controlStackView: UIStackView?
    
    var monkeyImageName: String = "monkey"
    var bananaImageName: String = "banana"
    
    var levelSets: [(monkey: String, banana: String)] = []
    
    var currentSetIndex: Int = 0
    
    var levelNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
        applyCurrentSet()
        updateTitle()
        createGrid()
        setupControlButtons()
        setupResultUI()
        
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
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white
            gameBGView.backgroundColor = .white
            themeColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
            gameBGView.backgroundColor = .clear
            themeColor = color
        }

        // Arrow buttons already created हों तो उनका color भी update हो जाए
        if let stack = controlStackView {
            updateControlButtonColors(in: stack)
        }

        // Good Job & Next button update
        if goodJobLabel != nil && nextButton != nil {

            goodJobLabel.backgroundColor = themeColor
            nextButton.backgroundColor = themeColor

            if UserDefaults.standard.bool(forKey: "WhiteTheme") {

                goodJobLabel.textColor = .black
                nextButton.setTitleColor(.black, for: .normal)

            } else {

                goodJobLabel.textColor = .black   // ya .white agar chahiye
                nextButton.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    func updateControlButtonColors(in view: UIView) {

        if let button = view as? UIButton {

            button.backgroundColor = themeColor
            button.tintColor = .black
        }

        view.subviews.forEach {
            updateControlButtonColors(in: $0)
        }
    }
    
    func applyCurrentSet() {
        let currentSet = levelSets[currentSetIndex]
        monkeyImageName = currentSet.monkey
        bananaImageName = currentSet.banana
    }
    
    func updateTitle() {

        let currentSet = levelSets[currentSetIndex]

        let animalKey = currentSet.monkey
        let targetKey = currentSet.banana

        let animal = animalKey.localiz()
        let target = targetKey.localiz()

        let animalEmoji = emojiForAnimal(animalKey)
        let targetEmoji = emojiForTarget(targetKey)

        let format = "Help the %@ reach the %@! %@ %@ The %@ can only step on vowels: A, E, I, O, U.".localiz()

        titelLabel.text = String(
            format: format,
            animal,
            target,
            animalEmoji,
            targetEmoji,
            animal
        )
    }
    
    func emojiForAnimal(_ name: String) -> String {
        switch name {
        case "monkey": return "🐒"
        case "cat": return "🐱"
        case "rabbit": return "🐰"
        case "fish": return "🐟"
        case "bird": return "🐦"
        default: return ""
        }
    }

    func emojiForTarget(_ name: String) -> String {
        switch name {
        case "banana": return "🍌"
        case "milk": return "🥛"
        case "carrot": return "🥕"
        case "pond": return "💧"
        case "nest": return "🪹"
        default: return ""
        }
    }
    
    func setupResultUI() {
        
        // Good Job Label
        goodJobLabel = UILabel()
        goodJobLabel.translatesAutoresizingMaskIntoConstraints = false
        goodJobLabel.text = "Good Job!".localiz()
        goodJobLabel.textAlignment = .center
        goodJobLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        goodJobLabel.isHidden = true
        goodJobLabel.layer.cornerRadius = 10
        goodJobLabel.clipsToBounds = true
        goodJobLabel.backgroundColor = themeColor

        view.addSubview(goodJobLabel)


        // Next Button
        nextButton = UIButton(type: .system)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next".localiz(), for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nextButton.isHidden = true

        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        nextButton.backgroundColor = themeColor
        nextButton.setTitleColor(.black, for: .normal)

        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)

        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            goodJobLabel.topAnchor.constraint(equalTo: gameBGView.bottomAnchor, constant: 20),
            goodJobLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            goodJobLabel.widthAnchor.constraint(equalToConstant: 125), // thoda bada rakho (better look)
            goodJobLabel.heightAnchor.constraint(equalToConstant: 50),
            
            nextButton.centerYAnchor.constraint(equalTo: goodJobLabel.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), // 👈 right side
            
            nextButton.widthAnchor.constraint(equalToConstant: 60), // 👈 readable
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func handleWin() {

        UserDefaults.standard.set(true, forKey: "connectTheVowelsLevel\(levelNumber)Completed")

        controlStackView?.isHidden = true

        goodJobLabel.isHidden = false
        nextButton.isHidden = false

        // Same color as HeaderView / StatusView
        goodJobLabel.backgroundColor = themeColor
        nextButton.backgroundColor = themeColor

        // Text color
        if UserDefaults.standard.bool(forKey: "WhiteTheme") {
            goodJobLabel.textColor = .black
            nextButton.setTitleColor(.black, for: .normal)
        } else {
            goodJobLabel.textColor = .black   // Agar white text chahiye to .white kar sakte ho
            nextButton.setTitleColor(.black, for: .normal)
        }

        // Rounded corners
        goodJobLabel.layer.cornerRadius = 10
        goodJobLabel.clipsToBounds = true

        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true

        // Animation
        goodJobLabel.alpha = 0
        nextButton.alpha = 0

        UIView.animate(withDuration: 0.3) {
            self.goodJobLabel.alpha = 1
            self.nextButton.alpha = 1
        }
    }
    
    func createGrid() {
        
        applyCurrentSet()
        
        gridViews.removeAll()
        gameBGView.subviews.forEach { $0.removeFromSuperview() }
        
        let gridData = generateGrid()
        
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        mainStack.spacing = 0
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        gameBGView.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: gameBGView.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: gameBGView.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: gameBGView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: gameBGView.trailingAnchor)
        ])
        
        for row in gridData {

            var rowViews: [GridItemView] = []
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.distribution = .fillEqually

            for item in row {
                let cell = GridItemView()
                cell.configure(with: item, monkey: monkeyImageName, banana: bananaImageName)
                rowStack.addArrangedSubview(cell)
                rowViews.append(cell)
            }

            gridViews.append(rowViews)
            mainStack.addArrangedSubview(rowStack)
        }
    }
    
    // MARK: - Random Path Generator
    func generatePath(rows: Int, cols: Int) -> [(Int, Int)] {
        
        var path: [(Int, Int)] = []
        var visited: Set<String> = []
        
        // 🐵 start bottom row (random column)
        var current = (rows - 1, Int.random(in: 0..<cols))
        
        path.append(current)
        visited.insert("\(current.0)-\(current.1)")
        
        while current.0 > 0 {
            
            var possibleMoves: [(Int, Int)] = []
            
            let directions = [(0,1),(0,-1),(-1,0)] // 👈 upward bias
            
            for dir in directions {
                let newRow = current.0 + dir.0
                let newCol = current.1 + dir.1
                
                let key = "\(newRow)-\(newCol)"
                
                if newRow >= 0 && newRow < rows &&
                   newCol >= 0 && newCol < cols &&
                   !visited.contains(key) {
                    possibleMoves.append((newRow,newCol))
                }
            }
            
            if let next = possibleMoves.randomElement() {
                current = next
                path.append(current)
                visited.insert("\(current.0)-\(current.1)")
            } else {
                break
            }
        }
        
        return path
    }


    // MARK: - Grid Generator
    func generateGrid() -> [[String]] {
        
        let rows = 8
        let cols = 8
        
        var grid = Array(repeating: Array(repeating: "", count: cols), count: rows)
        
        let path = generatePath(rows: rows, cols: cols)
        
        let vowelsArray = ["A","E","I","O","U"]
        
        // ✅ full valid vowel path (NO BREAK)
        for (index, pos) in path.enumerated() {
            let vowel = vowelsArray[index % vowelsArray.count]
            grid[pos.0][pos.1] = vowel
        }
        
        // 🐵 start
        if let start = path.first {
            grid[start.0][start.1] = "🐵"
            currentRow = start.0
            currentCol = start.1
            lastValidRow = start.0
            lastValidCol = start.1
        }
        
        // 🍌 end (always top row)
        if let end = path.last {
            grid[end.0][end.1] = "🍌"
        }
        
        // 🔥 helper to avoid adjacent vowels
        func hasAdjacentVowel(r: Int, c: Int) -> Bool {
            let dirs = [(0,1),(1,0),(0,-1),(-1,0)]
            
            for d in dirs {
                let nr = r + d.0
                let nc = c + d.1
                
                if nr >= 0 && nr < rows &&
                   nc >= 0 && nc < cols {
                    
                    if vowels.contains(grid[nr][nc]) {
                        return true
                    }
                }
            }
            return false
        }
        
        let consonants = "BCDFGHJKLMNPQRSTVWXYZ"
        
        // 🔥 fill remaining cells
        for r in 0..<rows {
            for c in 0..<cols {
                
                if grid[r][c].isEmpty {
                    
                    // 👇 vowel only if no adjacent vowel
                    if Int.random(in: 0..<100) < 25 && !hasAdjacentVowel(r: r, c: c) {
                        grid[r][c] = vowelsArray.randomElement()!
                    } else {
                        grid[r][c] = String(consonants.randomElement()!)
                    }
                }
            }
        }
        
        return grid
    }
    
    func moveMonkey(to newRow: Int, col newCol: Int) {

        if newRow < 0 || newRow >= gridViews.count ||
           newCol < 0 || newCol >= gridViews[0].count {
            return
        }

        let nextCell = gridViews[newRow][newCol]
        let value = nextCell.value

        // 🎯 banana reached ✅ (YAHI ADD KIYA HAI)
        if nextCell.isBanana {
            nextCell.label.textColor = .systemGreen
            updateMonkeyPosition(newRow: newRow, newCol: newCol)

            print("🎉 WIN")

            handleWin()

            return
        }

        // ❗ agar already wrong cell pe ho
        if isOnWrongCell {
            if newRow == lastValidRow && newCol == lastValidCol {
                updateMonkeyPosition(newRow: newRow, newCol: newCol)
                isOnWrongCell = false
            }
            return
        }

        // ✅ vowel
        if vowels.contains(value) {
            lastValidRow = newRow
            lastValidCol = newCol

            nextCell.label.textColor = .systemGreen
            updateMonkeyPosition(newRow: newRow, newCol: newCol)
        }
        else {
            // ❌ wrong
            nextCell.label.textColor = .systemRed
            updateMonkeyPosition(newRow: newRow, newCol: newCol)

            isOnWrongCell = true
            vibrate()
            speakWrong()
        }
    }
    
    func updateMonkeyPosition(newRow: Int, newCol: Int) {

        let currentCell = gridViews[currentRow][currentCol]
        
        // 🧹 clear previous monkey
        currentCell.imageView.isHidden = true
        currentCell.monkeyOverlay.isHidden = true

        if currentCell.label.textColor != .systemRed {
            currentCell.label.textColor = .systemGreen
        }

        let newCell = gridViews[newRow][newCol]
        
        // 🍌 agar banana hai → overlay monkey
        if newCell.imageView.image == UIImage(named: bananaImageName) {
            newCell.monkeyOverlay.image = UIImage(named: monkeyImageName)
            newCell.monkeyOverlay.isHidden = false
        } else {
            newCell.imageView.image = UIImage(named: monkeyImageName)
            newCell.imageView.isHidden = false
        }

        currentRow = newRow
        currentCol = newCol
    }
    
    func vibrate() {
        for i in 0..<5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.3) {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
        }
    }
    
    func speakWrong() {
        let utterance = AVSpeechUtterance(string: "Wrong move")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        speechSynth.speak(utterance)
    }
    
    func createButton(systemName: String, action: Selector) -> UIButton {

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false

        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        button.setImage(UIImage(systemName: systemName, withConfiguration: config), for: .normal)

        // ✅ same color as header
        button.tintColor = .black
        button.backgroundColor = themeColor

        button.layer.cornerRadius = 30

        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true

        button.addTarget(self, action: action, for: .touchUpInside)

        return button
    }
    
    func setupControlButtons() {

        let up = createButton(systemName: "arrow.up", action: #selector(upTapped))
        let down = createButton(systemName: "arrow.down", action: #selector(downTapped))
        let left = createButton(systemName: "arrow.left", action: #selector(leftTapped))
        let right = createButton(systemName: "arrow.right", action: #selector(rightTapped))

        let middleStack = UIStackView(arrangedSubviews: [left, down, right])
        middleStack.axis = .horizontal
        middleStack.spacing = 20
        middleStack.distribution = .equalSpacing

        let mainStack = UIStackView(arrangedSubviews: [up, middleStack])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.alignment = .center

        // 👇 IMPORTANT
        controlStackView = mainStack

        mainStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsBGView.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: buttonsBGView.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: buttonsBGView.centerYAnchor)
        ])
    }
  
    
    @objc func upTapped() {
        moveMonkey(to: currentRow - 1, col: currentCol)
    }

    @objc func downTapped() {
        moveMonkey(to: currentRow + 1, col: currentCol)
    }

    @objc func leftTapped() {
        moveMonkey(to: currentRow, col: currentCol - 1)
    }

    @objc func rightTapped() {
        moveMonkey(to: currentRow, col: currentCol + 1)
    }
    
    @objc func nextTapped() {
        
        currentSetIndex += 1
        
        if currentSetIndex >= levelSets.count {
            
            print("🎉 ALL COMPLETED")
        
            UserDefaults.standard.set(true, forKey: "connectTheVowelsLevel\(levelNumber)Completed")
    
            navigationController?.popViewController(animated: true)
            
            return
        }
    
        applyCurrentSet()
        updateTitle()
        createGrid()
        
        controlStackView?.isHidden = false
        goodJobLabel.isHidden = true
        nextButton.isHidden = true
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("ConnectTheVowels.pdf")

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try renderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                // Title
                let title = "Connect The Vowels"

                let titleAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 30),
                    .foregroundColor: UIColor.black
                ]

                let titleSize = title.size(withAttributes: titleAttributes)

                title.draw(
                    at: CGPoint(
                        x: (pageWidth - titleSize.width) / 2,
                        y: 30
                    ),
                    withAttributes: titleAttributes
                )

                // Draw only game grid
                let targetWidth: CGFloat = 500
                let scale = targetWidth / gameBGView.bounds.width

                let targetHeight = gameBGView.bounds.height * scale

                let x = (pageWidth - targetWidth) / 2
                let y: CGFloat = 100

                context.cgContext.saveGState()

                context.cgContext.translateBy(x: x, y: y)
                context.cgContext.scaleBy(x: scale, y: scale)

                gameBGView.layer.render(in: context.cgContext)

                context.cgContext.restoreGState()
            }

            return pdfURL

        } catch {

            print(error)
            return nil
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        guard let pdfURL = createPDF() else { return }

        let activityVC = UIActivityViewController(
            activityItems: [pdfURL],
            applicationActivities: nil
        )

        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = sender
        }

        present(activityVC, animated: true)
    }
    
}
