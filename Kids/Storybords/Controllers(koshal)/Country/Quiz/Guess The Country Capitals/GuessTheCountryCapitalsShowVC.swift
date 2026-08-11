//
//  GuessTheCountryCapitalsShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 31/03/26.
//

import UIKit
import AVFoundation

class GuessTheCountryCapitalsShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var repeatBtn: UIButton!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    
    @IBOutlet weak var allImages: UIImageView!
    @IBOutlet weak var allNameslabel: UILabel!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
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
        scoreBGVIew.layer.cornerRadius = 6
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
            $0?.isUserInteractionEnabled = true
        }

        questionLabel.text = "Question \(currentQuestionIndex + 1)"

        let currentBird = planets[currentQuestionIndex]
        correctAnswer = currentBird

        // ✅ Show flag
        allImages.image = UIImage(named: currentBird.imageName)

        // ✅ Split country name
        let parts = currentBird.text.components(separatedBy: "capital is")

        let country = parts.first?
            .replacingOccurrences(of: "’s", with: "")
            .trimmingCharacters(in: .whitespaces) ?? ""

        allNameslabel.text = "\(country)'s capital is ?"

        // ✅ Options
        var wrongOptions = planets.filter { $0.text != currentBird.text }.shuffled()

        options = Array(wrongOptions.prefix(3))
        options.append(currentBird)
        options.shuffle()

        label1.text = options[0].text.components(separatedBy: "capital is").last?.trimmingCharacters(in: .whitespaces)
        label2.text = options[1].text.components(separatedBy: "capital is").last?.trimmingCharacters(in: .whitespaces)
        label3.text = options[2].text.components(separatedBy: "capital is").last?.trimmingCharacters(in: .whitespaces)
        label4.text = options[3].text.components(separatedBy: "capital is").last?.trimmingCharacters(in: .whitespaces)

        // 🔊 Only question speak (no answer)
        speak(text: "\(country)'s capital is ?")
    }
    
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let selectedIndex = sender.view?.tag else { return }

        // ✅ Get selected capital
        let selectedCapital = options[selectedIndex].text
            .components(separatedBy: "capital is")
            .last?
            .trimmingCharacters(in: .whitespaces)

        // ✅ Get correct capital
        let correctCapital = correctAnswer?.text
            .components(separatedBy: "capital is")
            .last?
            .trimmingCharacters(in: .whitespaces)

        if selectedCapital == correctCapital {

            sender.view?.backgroundColor = UIColor.systemGreen
            rightOrWrongImgView.image = UIImage(named: "check mark")

            score += 1

        } else {

            sender.view?.backgroundColor = UIColor.systemRed
            rightOrWrongImgView.image = UIImage(named: "close")

            if let correctIndex = options.firstIndex(where: {
                $0.text.components(separatedBy: "capital is").last?.trimmingCharacters(in: .whitespaces) == correctCapital
            }) {
                let correctView = [view1, view2, view3, view4][correctIndex]
                correctView?.backgroundColor = UIColor.systemGreen
            }
        }

        scoreLabel.text = "Score: \(score) / \(currentQuestionIndex + 1)"

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
            withIdentifier: "GuessTheCountryCapitalsResultVC"
        ) as? GuessTheCountryCapitalsResultVC {

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

