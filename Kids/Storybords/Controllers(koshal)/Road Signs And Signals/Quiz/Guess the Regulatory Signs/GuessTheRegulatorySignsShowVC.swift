//
//  GuessTheRegulatorySignsShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 04/04/26.
//

import UIKit
import AVFoundation

class GuessTheRegulatorySignsShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var repeatBtn: UIButton!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var scoreBGVIew: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var gussNameLabel: UILabel!
    @IBOutlet weak var gussNameLabelBgView: UIView!

    var planets: [LearnPlanetsItem] = []
    var levelNumber: Int = 1
    
    var currentQuestionIndex = 0
    var score = 0
    var correctAnswer: LearnPlanetsItem?
    var options: [LearnPlanetsItem] = []
    
    var isAudioCompleted = false
    var speechSynthesizer = AVSpeechSynthesizer()
    var hasAnswered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planets.shuffle()
        
        levelLabel.text = "# Level \(levelNumber)"
        
        speechSynthesizer.delegate = self
        setupQuestion()
        nextBtn.isHidden = true
        
        setup()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
        scoreBGVIew.layer.cornerRadius = 10
        gussNameLabelBgView.layer.cornerRadius = 10
        
        view1.addGestureRecognizer(tap1)
        view2.addGestureRecognizer(tap2)
        view3.addGestureRecognizer(tap3)
        view4.addGestureRecognizer(tap4)

        view1.tag = 0
        view2.tag = 1
        view3.tag = 2
        view4.tag = 3
        
        [view1, view2, view3, view4].forEach {
            $0?.layer.borderWidth = 2
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 10
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

        if currentQuestionIndex >= planets.count {
            goToResult()
            return
        }

        hasAnswered = false
        nextBtn.isHidden = true
        rightOrWrongImgView.image = nil

        [view1, view2, view3, view4].forEach {
            $0?.backgroundColor = .white
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.borderWidth = 2
            $0?.isUserInteractionEnabled = true
        }

        questionLabel.text = "Question \(currentQuestionIndex + 1)"

        let currentBird = planets[currentQuestionIndex]
        correctAnswer = currentBird

        // ✅ yaha set karo label
        gussNameLabel.text = currentBird.text

        var wrongOptions = planets.filter { $0.text != currentBird.text }.shuffled()

        options = Array(wrongOptions.prefix(3))
        options.append(currentBird)
        options.shuffle()

        img1.image = UIImage(named: options[0].imageName)
        img2.image = UIImage(named: options[1].imageName)
        img3.image = UIImage(named: options[2].imageName)
        img4.image = UIImage(named: options[3].imageName)

        speak(text: currentBird.text)
    }
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let selectedIndex = sender.view?.tag else { return }

        let selectedPlanet = options[selectedIndex]

        if selectedPlanet.text == correctAnswer?.text {

            sender.view?.layer.borderWidth = 5
            sender.view?.layer.borderColor = UIColor.systemGreen.cgColor
            sender.view?.backgroundColor = .white   // ✅ no full color

            rightOrWrongImgView.image = UIImage(named: "check mark")
            score += 1

        } else {

            sender.view?.layer.borderWidth = 5
            sender.view?.layer.borderColor = UIColor.systemRed.cgColor
            sender.view?.backgroundColor = .white   // ✅ no full color

            rightOrWrongImgView.image = UIImage(named: "close")

            if let correctIndex = options.firstIndex(where: { $0.text == correctAnswer?.text }) {
                let correctView = [view1, view2, view3, view4][correctIndex]
                correctView?.layer.borderWidth = 5
                correctView?.layer.borderColor = UIColor.systemGreen.cgColor
                correctView?.backgroundColor = .white
            }
        }

        // ✅ ALWAYS update score label after answer
        scoreLabel.text = "Score: \(score) / \(currentQuestionIndex + 1)"

        // 🔥 Disable all views after selection
        [view1, view2, view3, view4].forEach {
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
            withIdentifier: "GuessTheRegulatorySignsResultVC"
        ) as? GuessTheRegulatorySignsResultVC {

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
            speak(text: "\(correct.text)")
        }
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        currentQuestionIndex += 1
        setupQuestion()
    }
}

