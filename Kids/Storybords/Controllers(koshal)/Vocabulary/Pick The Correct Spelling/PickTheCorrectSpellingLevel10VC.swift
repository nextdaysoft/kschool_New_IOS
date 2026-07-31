//
//  PickTheCorrectSpellingLevel10VC.swift
//  Kids
//
//  Created by Koshal Singh on 31/01/26.
//

import UIKit
import LanguageManager_iOS

class PickTheCorrectSpellingLevel10VC: BaseViewController {

    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!

    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var btn1BGViiew: UIView!
    @IBOutlet weak var btn2BGViiew: UIView!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    // MARK: - Data
    var questions = [
        ("walk", "wlk", "walk"),
        ("singg", "sing", "sing"),
        ("read", "reed", "read"),
        ("stend", "stand", "stand"),
        ("clap", "klap", "clap"),
        ("sit", "siet", "sit"),
        ("jump", "jum", "jump"),
        ("write", "writ", "write"),
        ("danc", "dance", "dance"),
        ("ran", "run", "run")
    ]
    
    let bgColors: [UIColor] = [
        .systemBlue,
        .systemPurple,
        .systemTeal,
        .systemOrange,
        .systemPink,
        .systemIndigo,
        .systemGreen,
        .systemRed,
        .brown,
        .cyan
    ]

    var currentIndex = 0
    var score = 0
    var correctAnswer = ""
    var results: [PickSpellingResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        
        questions.shuffle()

        imgBGView.layer.cornerRadius = 10
        btn1BGViiew.layer.cornerRadius = 10
        btn2BGViiew.layer.cornerRadius = 10

        option1Btn.layer.cornerRadius = 10
        option2Btn.layer.cornerRadius = 10

        scoreLabelBGView.layer.cornerRadius = 10

        // iOS 15+ ke liye
        if #available(iOS 15.0, *) {
            option1Btn.configuration = nil
            option2Btn.configuration = nil
        }

        setupUI()
        loadQuestion()
        animateButtons()
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
        nextBtn.layer.cornerRadius = 6
    }

    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

            scoreLabelBGView.backgroundColor = .white
            imgBGView.backgroundColor = .white

            option1Btn.backgroundColor = .white
            option2Btn.backgroundColor = .white

            option1Btn.setTitleColor(.black, for: .normal)
            option2Btn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            scoreLabelBGView.backgroundColor = color
            imgBGView.backgroundColor = .white

            option1Btn.backgroundColor = ColorManager.randomColor()
            option2Btn.backgroundColor = ColorManager.randomColor()

            option1Btn.setTitleColor(.white, for: .normal)
            option2Btn.setTitleColor(.white, for: .normal)
        }
    }
    
    // MARK: - Load Question
    func loadQuestion() {

        let data = questions[currentIndex]

        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        correctAnswer = data.2

        option1Btn.setTitle(data.0, for: .normal)
        option2Btn.setTitle(data.1, for: .normal)

        resetButtons()
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup
    func setupUI() {
        nextBtn.isHidden = true
        rightOrWrongImgView.isHidden = true
        scoreLabel.text = "Score: 1 / 10"
    }

    func checkAnswer(selected: UIButton) {

        option1Btn.isUserInteractionEnabled = false
        option2Btn.isUserInteractionEnabled = false

        rightOrWrongImgView.isHidden = false
        nextBtn.isHidden = false

        let selectedText = selected.title(for: .normal) ?? ""
        let isCorrect = (selectedText == correctAnswer)

        let result = PickSpellingResult(
            selectedWord: selectedText,
            correctWord: correctAnswer,
            isCorrect: isCorrect
        )

        results.append(result)

        if isCorrect {

            score += 1
            rightOrWrongImgView.image = UIImage(named: "check mark")

            selected.backgroundColor = .systemGreen

        } else {

            rightOrWrongImgView.image = UIImage(named: "close")

            selected.backgroundColor = .systemRed

            let correctButton = (option1Btn.title(for: .normal) == correctAnswer)
                ? option1Btn
                : option2Btn

            correctButton?.backgroundColor = .systemGreen
        }

        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
    }
    
    // MARK: - Reset
    func resetButtons() {

        option1Btn.backgroundColor = ColorManager.randomColor()
        option2Btn.backgroundColor = ColorManager.randomColor()

        option1Btn.isUserInteractionEnabled = true
        option2Btn.isUserInteractionEnabled = true

        nextBtn.isHidden = true
        rightOrWrongImgView.isHidden = true
    }

    // MARK: - Animation
    func animateButtons() {

        // Right side ke bahar se start
        btn1BGViiew.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        btn2BGViiew.transform = CGAffineTransform(translationX: view.frame.width, y: 0)

        UIView.animate(
            withDuration: 1.2,              // ⏳ slow
            delay: 0,
            usingSpringWithDamping: 0.95,   // 🧈 very smooth
            initialSpringVelocity: 0.2,     // 🐢 slow movement
            options: [.curveEaseOut]
        ) {
            self.btn1BGViiew.transform = .identity
            self.btn2BGViiew.transform = .identity
        }
    }
    
    // MARK: - Button Actions
    @IBAction func option1Tap(_ sender: UIButton) {
        checkAnswer(selected: sender)
    }

    @IBAction func option2Tap(_ sender: UIButton) {
        checkAnswer(selected: sender)
    }
    
    // MARK: - Next Button
    @IBAction func nextTapBtn(_ sender: UIButton) {
        currentIndex += 1

        if currentIndex < questions.count {
            loadQuestion()
            animateButtons()
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "PickTheCorrectSpellingResultLevel10VC"
            ) as! PickTheCorrectSpellingResultLevel10VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
