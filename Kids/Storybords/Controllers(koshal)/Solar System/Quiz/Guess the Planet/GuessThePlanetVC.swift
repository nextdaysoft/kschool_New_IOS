//
//  GuessThePlanetVC.swift
//  Kids
//
//  Created by Koshal Singh on 23/02/26.
//

import LanguageManager_iOS
struct PlanetQuestion {
    let name: String
    let imageName: String
}


import UIKit
import AVFoundation

class GuessThePlanetVC: BaseViewController, AVSpeechSynthesizerDelegate {

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
    
    
    var planets: [PlanetQuestion] = [
        PlanetQuestion(name: "MercuryN".localiz(), imageName: "MercuryN"),
        PlanetQuestion(name: "VenusN".localiz(), imageName: "VenusN"),
        PlanetQuestion(name: "EarthN".localiz(), imageName: "EarthN"),
        PlanetQuestion(name: "MarsN".localiz(), imageName: "MarsN"),
        PlanetQuestion(name: "JupiterN".localiz(), imageName: "JupiterN"),
        PlanetQuestion(name: "SaturnN".localiz(), imageName: "SaturnN"),
        PlanetQuestion(name: "UranusN".localiz(), imageName: "UranusN"),
        PlanetQuestion(name: "NeptuneN".localiz(), imageName: "NeptuneN")
    ]

    var currentQuestionIndex = 0
    var score = 0
    var correctAnswer: PlanetQuestion?
    var options: [PlanetQuestion] = []
    
    var isAudioCompleted = false
    var speechSynthesizer = AVSpeechSynthesizer()
    var hasAnswered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechSynthesizer.delegate = self
        setupQuestion()
        nextBtn.isHidden = true
        
        setup()
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex + 1)"
        
        planets.shuffle()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))

        
        nextBtn.layer.cornerRadius = 10
        nextBtn.backgroundColor = ColorManager.randomColor()
        nextBtn.layer.borderColor = UIColor.black.cgColor
     
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
        scoreBGVIew.layer.cornerRadius = 10
        
        view1.addGestureRecognizer(tap1)
        view2.addGestureRecognizer(tap2)
        view3.addGestureRecognizer(tap3)
        view4.addGestureRecognizer(tap4)

        view1.tag = 0
        view2.tag = 1
        view3.tag = 2
        view4.tag = 3
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
    
    func setupQuestion() {
        
        if currentQuestionIndex >= 8 {
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

        questionLabel.text = "Question \(currentQuestionIndex + 1)" .localiz()
        
        correctAnswer = planets.shuffled().first

        options = planets.shuffled().prefix(4).map { $0 }
        
        if let correct = correctAnswer,
           !options.contains(where: { $0.name == correct.name }) {
            options[0] = correct
        }

        options.shuffle()

        img1.image = UIImage(named: options[0].imageName)
        img2.image = UIImage(named: options[1].imageName)
        img3.image = UIImage(named: options[2].imageName)
        img4.image = UIImage(named: options[3].imageName)

   
        if let correct = correctAnswer {
            speak(text: "\(correct.name)")
        }
    }
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let selectedIndex = sender.view?.tag else { return }

        let selectedPlanet = options[selectedIndex]

        if selectedPlanet.name == correctAnswer?.name {

            sender.view?.backgroundColor = .systemGreen
            rightOrWrongImgView.image = UIImage(named: "check mark")

            score += 1
            
            scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestionIndex + 1)"
            
        } else {

            sender.view?.backgroundColor = .systemRed
            rightOrWrongImgView.image = UIImage(named: "close")

            if let correctIndex = options.firstIndex(where: { $0.name == correctAnswer?.name }) {
                let correctView = [view1, view2, view3, view4][correctIndex]
                correctView?.backgroundColor = .systemGreen
            }
        }

        // 🔥 Disable all views after selection
        [view1, view2, view3, view4].forEach {
            $0?.isUserInteractionEnabled = false
        }
    }
    
    func speak(text: String) {

        isAudioCompleted = false

        speechSynthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(string: text)

        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"

        switch selectedLanguage {

        case "zhHans":
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")

        case "hi":
            utterance.voice = AVSpeechSynthesisVoice(language: "hi-IN")

        case "fr":
            utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")

        case "es":
            utterance.voice = AVSpeechSynthesisVoice(language: "es-ES")

        case "de":
            utterance.voice = AVSpeechSynthesisVoice(language: "de-DE")

        case "ar":
            utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")

        default:
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        }

        utterance.rate = 0.45

        speechSynthesizer.speak(utterance)
    }
    
    func goToResult() {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "GuessThePlanetResultVC"
        ) as? GuessThePlanetResultVC {

            resultVC.finalScore = score
            navigationController?.pushViewController(resultVC, animated: true)
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
        setupQuestion()
    }
}
