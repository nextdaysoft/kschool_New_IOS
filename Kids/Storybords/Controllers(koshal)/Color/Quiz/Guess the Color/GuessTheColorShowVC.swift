//
//  GuessTheColorShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 31/03/26.
//

import UIKit
import AVFoundation

class GuessTheColorShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var repeatBtn: UIButton!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    
    @IBOutlet weak var scoreBGVIew: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var levelLabel: UILabel!

    var colors: [LearnColorItem] = []
    var levelNumber: Int = 1
    
    var currentQuestionIndex = 0
    var score = 0
    var correctAnswer: LearnColorItem?
    var options: [LearnColorItem] = []
    
    var isAudioCompleted = false
    var speechSynthesizer = AVSpeechSynthesizer()
    var hasAnswered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelLabel.text = "# Level \(levelNumber)"
        
        colors.shuffle()
        
        speechSynthesizer.delegate = self
        setupQuestion()
        nextBtn.isHidden = true
        
        setup()
        
        // MARK: Tap for inner views
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))

        view1.addGestureRecognizer(tap1)
        view2.addGestureRecognizer(tap2)
        view3.addGestureRecognizer(tap3)
        view4.addGestureRecognizer(tap4)

        view1.tag = 0
        view2.tag = 1
        view3.tag = 2
        view4.tag = 3

        // BG tap bhi kaam kare
        let tapBG1 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tapBG2 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tapBG3 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tapBG4 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))

        viewBG1.addGestureRecognizer(tapBG1)
        viewBG2.addGestureRecognizer(tapBG2)
        viewBG3.addGestureRecognizer(tapBG3)
        viewBG4.addGestureRecognizer(tapBG4)

        viewBG1.tag = 0
        viewBG2.tag = 1
        viewBG3.tag = 2
        viewBG4.tag = 3

        scoreBGVIew.layer.cornerRadius = 10

        // Inner views (white box)
        [view1, view2, view3, view4].forEach {
//            $0?.layer.cornerRadius = 10
            $0?.clipsToBounds = true
        }

        // BG views (color + border)
        [viewBG1, viewBG2, viewBG3, viewBG4].forEach {
            $0?.layer.cornerRadius = 15
            $0?.layer.borderWidth = 2
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.clipsToBounds = true
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
        nextBtn.layer.cornerRadius = 6
        nextBtn.backgroundColor = color
    }
    
    func setupQuestion() {

        if currentQuestionIndex >= colors.count {
            goToResult()
            return
        }

        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil

        // Reset
        [viewBG1, viewBG2, viewBG3, viewBG4].forEach {
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.borderWidth = 2
            $0?.isUserInteractionEnabled = true
        }

        questionLabel.text = "Question \(currentQuestionIndex + 1)"

        let currentColor = colors[currentQuestionIndex]
        correctAnswer = currentColor
        
        var wrongOptions = colors.filter { $0.name != currentColor.name }.shuffled()

        options = Array(wrongOptions.prefix(3))
        options.append(currentColor)
        options.shuffle()

        // ✅ COLOR INNER VIEWS PE (IMPORTANT 🔥)
        let innerViews = [view1, view2, view3, view4]
        for i in 0..<4 {
            innerViews[i]?.backgroundColor = options[i].color
        }

        speak(text: currentColor.name)
    }
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let selectedIndex = sender.view?.tag else { return }

        let selectedColor = options[selectedIndex]
        let bgViews = [viewBG1, viewBG2, viewBG3, viewBG4]

        if selectedColor.name == correctAnswer?.name {

            // ✅ BORDER BG PE
            bgViews[selectedIndex]?.layer.borderWidth = 5
            bgViews[selectedIndex]?.layer.borderColor = UIColor.systemGreen.cgColor
            rightOrWrongImgView.image = UIImage(named: "check mark")

            score += 1

        } else {

            bgViews[selectedIndex]?.layer.borderWidth = 5
            bgViews[selectedIndex]?.layer.borderColor = UIColor.systemRed.cgColor
            rightOrWrongImgView.image = UIImage(named: "close")

            if let correctIndex = options.firstIndex(where: { $0.name == correctAnswer?.name }) {
                bgViews[correctIndex]?.layer.borderWidth = 5
                bgViews[correctIndex]?.layer.borderColor = UIColor.systemGreen.cgColor
            }
        }

        scoreLabel.text = "Score: \(score) / \(currentQuestionIndex + 1)"

        // disable
        [viewBG1, viewBG2, viewBG3, viewBG4].forEach {
            $0?.isUserInteractionEnabled = false
        }
    }
    
    func speak(text: String) {
        isAudioCompleted = false

        speechSynthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.45
        speechSynthesizer.speak(utterance)
    }
    
    func goToResult() {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "GuessTheColorResultVC"
        ) as? GuessTheColorResultVC {

            resultVC.levelNumber = self.levelNumber   // 👈 IMPORTANT
            resultVC.finalScore = score
            resultVC.totalScore = currentQuestionIndex
            navigationController?.pushViewController(resultVC, animated: false)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func repeatTapBtn(_ sender: UIButton) {
        if let correct = correctAnswer {
            speak(text: "\(correct.name)")
        }
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {

        currentQuestionIndex += 1

        // Jo questions already dikh gaye
        let viewedColors = Array(colors.prefix(currentQuestionIndex))

        // Remaining colors ko fir random karo
        var remainingColors = Array(colors.dropFirst(currentQuestionIndex))
        remainingColors.shuffle()

        // Final sequence
        colors = viewedColors + remainingColors

        setupQuestion()
    }
}

