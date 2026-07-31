//
//  FindTheOrderVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 30/12/25.
//

import UIKit
import LanguageManager_iOS

class FindTheOrderVC: BaseViewController {

    enum GameState {
        case idle, revealing, selecting, result
    }

    var gameState: GameState = .idle

    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var rightOrWrongImg: UIImageView!

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UILabel!
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var scoreBGView: UIView!
    
    let allImages = [
        "apple","avocado","banana","carrot","cooking","mango",
        "grapes","lemon","orange","pineapple","strawberry","watermelon"
    ]

    var correctOrder: [String] = []
    var selectedIndexes: [Int] = []

    var round = 1
    let totalRounds = 10
    var score = 0

    var imageViews: [UIImageView] = []
    var containerViews: [UIView] = []

    var revealIndex = 0
    var revealTimer: Timer?

    var positionOrder: [Int] = []
    
    var revealedImages: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        mainBGView.layer.cornerRadius = 10
        scoreBGView.layer.cornerRadius = 10
    
        questionLabel.text = "\("Question".localiz()) \(round)"
        scoreLabel.text = "\("Score".localiz()): \(score) / \(round)"

        
        imageViews = [img1,img2,img3,img4,img5,img6]
        containerViews = [view1,view2,view3,view4,view5,view6]

        containerViews.forEach {
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.backgroundColor = .white
            $0.alpha = 0          // 🔥 START ME HIDE
        }

     
        setupIdleState()
    }

    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        nextBtn.backgroundColor = color
        nextBtn.layer.cornerRadius = 6
    }

       // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
       
    
    // MARK: - IDLE
    func setupIdleState() {
        gameState = .idle
        nextBtn.setTitle("Start".localiz(), for: .normal)
        nextBtn.isHidden = false
        rightOrWrongImg.image = nil

        imageViews.forEach { $0.alpha = 0 }
        containerViews.forEach { $0.alpha = 0 }
        enableButtons(false)
    }

    // MARK: - START ROUND
    func startRound() {
        gameState = .revealing
        selectedIndexes.removeAll()
        rightOrWrongImg.image = nil
        nextBtn.isHidden = true

        enableButtons(false)

        correctOrder = Array(allImages.shuffled().prefix(6))
        positionOrder = Array(0..<6).shuffled()

        revealedImages.removeAll()   // ✅ YAHAN

        for i in 0..<6 {
            let pos = positionOrder[i]
            let imgName = correctOrder[i]

            // ✅ YAHI PE ADD KARNA HAI
            imageViews[pos].image = UIImage(named: imgName)
            imageViews[pos].accessibilityIdentifier = imgName

            imageViews[pos].alpha = 0
            containerViews[pos].backgroundColor = .white
            containerViews[pos].alpha = 0

            revealedImages.append(imgName)
        }

        revealIndex = 0
        startRevealTimer()

        questionLabel.text = "\("Question".localiz()) \(round)"
        scoreLabel.text = "\("Score".localiz()): \(score) / \(round)"
    }

    // MARK: - REVEAL
    func startRevealTimer() {
        revealTimer?.invalidate()
        revealTimer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(showNextImage),
            userInfo: nil,
            repeats: true
        )
    }

    @objc func showNextImage() {
        if revealIndex >= 6 {
            revealTimer?.invalidate()
            gameState = .selecting
            enableButtons(true)
            return
        }

        let pos = positionOrder[revealIndex]

        UIView.animate(withDuration: 0.3) {
            self.containerViews[pos].alpha = 1
            self.imageViews[pos].alpha = 1
        }

        revealIndex += 1
    }

    // MARK: - SELECTION
    func selectImage(index: Int) {
        guard gameState == .selecting else { return }

        // same image dobara select na ho
        if selectedIndexes.contains(where: { positionOrder[$0] == index }) {
            return
        }

        // 🔥 screen index → reveal order index
        if let revealIndex = positionOrder.firstIndex(of: index) {
            selectedIndexes.append(revealIndex)
        }

        let colors: [UIColor] = [
            .systemRed, .systemBlue, .systemGreen,
            .systemOrange, .systemPurple, .systemPink
        ]

        containerViews[index].backgroundColor = colors.randomElement()
        imageViews[index].alpha = 1

        if selectedIndexes.count == 6 {
            showFinalResult()
        }
    }

    // MARK: - RESULT
    func showFinalResult() {
        gameState = .result

        
        let userOrder = selectedIndexes.map { revealedImages[$0] }

        let isCorrect = userOrder == revealedImages

        if isCorrect {
            score += 1
        }


        scoreLabel.text = "\("Score".localiz()): \(score) / \(round)"

        rightOrWrongImg.image = UIImage(
            named: isCorrect ? "check mark" : "close"
        )

        nextBtn.setTitle("Next".localiz(), for: .normal)
        nextBtn.isHidden = false
    }

    func enableButtons(_ enable: Bool) {
        [btn1,btn2,btn3,btn4,btn5,btn6].forEach {
            $0?.isEnabled = enable
        }
    }

    // MARK: - BUTTONS
    @IBAction func btnTap1(_ sender: UIButton) { selectImage(index: 0) }
    @IBAction func btnTap2(_ sender: UIButton) { selectImage(index: 1) }
    @IBAction func btnTap3(_ sender: UIButton) { selectImage(index: 2) }
    @IBAction func btnTap4(_ sender: UIButton) { selectImage(index: 3) }
    @IBAction func btnTap5(_ sender: UIButton) { selectImage(index: 4) }
    @IBAction func btnTap6(_ sender: UIButton) { selectImage(index: 5) }

    @IBAction func nextTapBtn(_ sender: UIButton) {
        if gameState == .idle {
            startRound()

        } else if gameState == .result {
            round += 1

            if round <= totalRounds {
                startRound()
            } else {
                // ✅ GAME OVER → RESULT VC
                let vc = storyboard?.instantiateViewController(
                    withIdentifier: "FindTheOrderResultVC"
                ) as! FindTheOrderResultVC

                vc.finalScore = score
                vc.totalRounds = totalRounds

                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func calculatePercentage() -> Int {
        return Int((Double(score) / Double(totalRounds)) * 100)
    }
}
