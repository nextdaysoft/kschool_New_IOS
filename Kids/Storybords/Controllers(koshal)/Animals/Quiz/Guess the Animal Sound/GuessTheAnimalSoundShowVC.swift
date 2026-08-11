//
//  GuessTheAnimalSoundShowVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit
import AVFoundation

class GuessTheAnimalSoundShowVC: BaseViewController, AVSpeechSynthesizerDelegate {
    
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
    

    var birds: [BirdQuestions] = []
    var levelNumber: Int = 1
    
    var currentQuestionIndex = 0
    var score = 0
    var correctAnswer: BirdQuestions?
    var options: [BirdQuestions] = []
    
    var isAudioCompleted = false
    var speechSynthesizer = AVSpeechSynthesizer()
    var hasAnswered = false
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birds.shuffle()
        
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
        nextBtn.layer.cornerRadius = 6
        nextBtn.backgroundColor = color
        scoreBGVIew.layer.cornerRadius = 6
    }
    
    func setupQuestion() {

        if currentQuestionIndex >= birds.count {
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

        let currentBird = birds[currentQuestionIndex]
        correctAnswer = currentBird

        var wrongOptions = birds.filter { $0.name != currentBird.name }.shuffled()

        options = Array(wrongOptions.prefix(3))
        options.append(currentBird)
        options.shuffle()

        img1.image = UIImage(named: options[0].imageName)
        img2.image = UIImage(named: options[1].imageName)
        img3.image = UIImage(named: options[2].imageName)
        img4.image = UIImage(named: options[3].imageName)

        playAnimalSound(for: currentBird.name)
    }
    
    func playAnimalSound(for animalName: String) {
        
        let currentAnimal = animalName.lowercased()
        var soundFileName = "animal_\(currentAnimal)"
        
        // Special case (agar needed ho)
        if currentAnimal == "parrot" {
            soundFileName = "animal_parrots"
        }

        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "aac") else {
            print("Sound file not found:", soundFileName)
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Audio error:", error.localizedDescription)
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

        } else {

            sender.view?.backgroundColor = .systemRed
            rightOrWrongImgView.image = UIImage(named: "close")

            if let correctIndex = options.firstIndex(where: { $0.name == correctAnswer?.name }) {
                let correctView = [view1, view2, view3, view4][correctIndex]
                correctView?.backgroundColor = .systemGreen
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
            withIdentifier: "GuessTheAnimalSoundResultVC"
        ) as? GuessTheAnimalSoundResultVC {

            resultVC.levelNumber = self.levelNumber   // 👈 IMPORTANT
            resultVC.finalScore = score
            navigationController?.pushViewController(resultVC, animated: false)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func repeatTapBtn(_ sender: UIButton) {
        if let correct = correctAnswer {
            playAnimalSound(for: correct.name)
        }
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        currentQuestionIndex += 1
        setupQuestion()
    }
}

