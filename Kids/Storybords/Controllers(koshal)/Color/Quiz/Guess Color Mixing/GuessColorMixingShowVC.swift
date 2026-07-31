//
//  GuessColorMixingShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 01/04/26.
//

import UIKit
import AVFoundation

class GuessColorMixingShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
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
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    @IBOutlet weak var scoreBGVIew: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var levelLabel: UILabel!

    
    @IBOutlet weak var color1View: UIView!
    @IBOutlet weak var color2View: UIView!
    
    @IBOutlet weak var colorBGView: UIView!
    
    @IBOutlet weak var color1Label: UILabel!
    @IBOutlet weak var color2Label: UILabel!
    
    var colors: [ColorMixItem] = []
    var correctAnswer: ColorMixItem?
    var options: [ColorMixItem] = []
    
    
    var levelNumber: Int = 1
    var currentQuestionIndex = 0
    var score = 0
    
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

        // BG tap
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

        // Inner views
        [view1, view2, view3, view4].forEach {
            $0?.clipsToBounds = true
        }

        // BG views
        [viewBG1, viewBG2, viewBG3, viewBG4].forEach {
            $0?.layer.cornerRadius = 15
            $0?.layer.borderWidth = 2
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.clipsToBounds = true
        }

        // ✅ TestFlight label fix
        [label1, label2, label3, label4].forEach {

            $0?.isHidden = false
            $0?.alpha = 1

            $0?.textColor = .black
            $0?.backgroundColor = .clear

            $0?.adjustsFontSizeToFitWidth = true
            $0?.minimumScaleFactor = 0.5

            $0?.numberOfLines = 2
            $0?.lineBreakMode = .byWordWrapping

            $0?.layoutIfNeeded()
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

        // Reset borders
        [viewBG1, viewBG2, viewBG3, viewBG4].forEach {
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.borderWidth = 2
            $0?.isUserInteractionEnabled = true
        }

        questionLabel.text = "Question \(currentQuestionIndex + 1)"

        let current = colors[currentQuestionIndex]
        correctAnswer = current

        // Top colors
        color1View.backgroundColor = current.color1
        color2View.backgroundColor = current.color2

        color1Label.text = current.color1Name
        color2Label.text = current.color2Name

        // Options
        var wrong = colors.filter {
            $0.resultName != current.resultName
        }.shuffled()

        options = Array(wrong.prefix(3))
        options.append(current)
        options.shuffle()

        let views = [view1, view2, view3, view4]
        let labels = [label1, label2, label3, label4]

        for i in 0..<4 {

            views[i]?.backgroundColor = options[i].resultColor

            let name = options[i]
                .resultName
                .trimmingCharacters(in: .whitespacesAndNewlines)

            labels[i]?.text = name.isEmpty ? "No Name" : name

            // TestFlight safe
            labels[i]?.isHidden = false
            labels[i]?.alpha = 1
            labels[i]?.textColor = .black
            labels[i]?.numberOfLines = 2
            labels[i]?.adjustsFontSizeToFitWidth = true
            labels[i]?.minimumScaleFactor = 0.5
            labels[i]?.lineBreakMode = .byWordWrapping

            labels[i]?.sizeToFit()
            labels[i]?.layoutIfNeeded()

            print("Option \(i): \(name)")
        }

        view.layoutIfNeeded()

        // Voice
        speak(text: "\(current.color1Name) and \(current.color2Name)")
    }
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let selectedIndex = sender.view?.tag else { return }

        let selected = options[selectedIndex]
        let bgViews = [viewBG1, viewBG2, viewBG3, viewBG4]

        // ✅ CORRECT CHECK (resultName use karo)
        if selected.resultName == correctAnswer?.resultName {

            bgViews[selectedIndex]?.layer.borderWidth = 5
            bgViews[selectedIndex]?.layer.borderColor = UIColor.systemGreen.cgColor
            rightOrWrongImgView.image = UIImage(named: "check mark")

            score += 1

        } else {

            bgViews[selectedIndex]?.layer.borderWidth = 5
            bgViews[selectedIndex]?.layer.borderColor = UIColor.systemRed.cgColor
            rightOrWrongImgView.image = UIImage(named: "close")

            // ✅ SHOW CORRECT ANSWER
            if let correctIndex = options.firstIndex(where: {
                $0.resultName == correctAnswer?.resultName
            }) {
                bgViews[correctIndex]?.layer.borderWidth = 5
                bgViews[correctIndex]?.layer.borderColor = UIColor.systemGreen.cgColor
            }
        }

        scoreLabel.text = "Score: \(score) / \(currentQuestionIndex + 1)"

        // disable taps
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
            withIdentifier: "GuessColorMixingResultVC"
        ) as? GuessColorMixingResultVC {

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
            speak(text: "\(correct.color1Name) and \(correct.color2Name)")
        }
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {

        currentQuestionIndex += 1

        // Jo questions already dikh chuke
        let viewedQuestions = Array(colors.prefix(currentQuestionIndex))

        // Jo remaining hain unko random karo
        var remainingQuestions = Array(colors.dropFirst(currentQuestionIndex))
        remainingQuestions.shuffle()

        // Final order
        colors = viewedQuestions + remainingQuestions

        setupQuestion()
    }
}

