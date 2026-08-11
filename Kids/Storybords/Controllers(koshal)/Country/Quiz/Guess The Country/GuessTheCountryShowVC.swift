//
//  GuessTheCountryShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 31/03/26.
//


import UIKit


class GuessTheCountryShowVC: BaseViewController {
    
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    
    @IBOutlet weak var allImages: UIImageView!

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
    var hasAnswered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planets.shuffle()
        
        levelLabel.text = "# Level \(levelNumber)"
    
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
            $0?.backgroundColor = .white   // ✅ important
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.borderWidth = 2
            $0?.isUserInteractionEnabled = true
        }

        questionLabel.text = "Question \(currentQuestionIndex + 1)"

        let currentBird = planets[currentQuestionIndex]
        correctAnswer = currentBird

        // ✅ Show flag
        allImages.image = UIImage(named: currentBird.imageName)

        var wrongOptions = planets.filter { $0.text != currentBird.text }.shuffled()

        options = Array(wrongOptions.prefix(3))
        options.append(currentBird)
        options.shuffle()

        // ✅ Show options in labels
        label1.text = options[0].text
        label2.text = options[1].text
        label3.text = options[2].text
        label4.text = options[3].text
    }
    
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {

        if hasAnswered { return }

        hasAnswered = true
        nextBtn.isHidden = false

        guard let selectedIndex = sender.view?.tag else { return }

        let selectedText = options[selectedIndex].text

        if selectedText == correctAnswer?.text {

            sender.view?.backgroundColor = UIColor.systemGreen
            rightOrWrongImgView.image = UIImage(named: "check mark")

            score += 1

        } else {

            sender.view?.backgroundColor = UIColor.systemRed
            rightOrWrongImgView.image = UIImage(named: "close")

            if let correctIndex = options.firstIndex(where: { $0.text == correctAnswer?.text }) {
                let correctView = [view1, view2, view3, view4][correctIndex]
                correctView?.backgroundColor = UIColor.systemGreen
            }
        }

        // ✅ ALWAYS update score label after answer
        scoreLabel.text = "Score: \(score) / \(currentQuestionIndex + 1)"

        // 🔥 Disable all views after selection
        [view1, view2, view3, view4].forEach {
            $0?.isUserInteractionEnabled = false
        }
    }
    
    func goToResult() {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "GuessTheCountryResultVC"
        ) as? GuessTheCountryResultVC {

            resultVC.levelNumber = self.levelNumber   // 👈 IMPORTANT
            resultVC.finalScore = score
            resultVC.totalScore = currentQuestionIndex
            navigationController?.pushViewController(resultVC, animated: false)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        currentQuestionIndex += 1
        setupQuestion()
    }
}

