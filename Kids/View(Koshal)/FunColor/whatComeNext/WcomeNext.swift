//
//  WcomeNext.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 23/01/26.
//

import UIKit
import LanguageManager_iOS

class WhatComeNextJD: BaseViewController {
    // MARK: OutLet
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var questionShape1: UIImageView!
    @IBOutlet weak var questionShape2: UIImageView!
    @IBOutlet weak var questionShape3: UIImageView!
    @IBOutlet weak var questionShape4: UIImageView!
    @IBOutlet weak var optionShape1: UIImageView!
    @IBOutlet weak var optionShape2: UIImageView!
    @IBOutlet weak var optionShape3: UIImageView!
    @IBOutlet weak var correctTick: UIImageView!
    @IBOutlet weak var OptionView1: UIView!
    @IBOutlet weak var OptionView2: UIView!
    @IBOutlet weak var OptionView3: UIView!
    @IBOutlet weak var QuestionView: UIView!
    @IBOutlet var optionButtons: [UIButton]!
    // MARK: Variable
    private var currentIndex = 0
    private var score = 0
    private var totalQuestions = 2
    private var isAnswerSubmitted = false
    private var questions: [WQuestion] = [

        // Question 1 → 2 shapes + ?
        WQuestion(
            sequence: ["triangle", "square"],
            options: ["circle", "pentagon", "hexagon", "square"],
            correct: "pentagon"
        ),

        // Question 2 → 3 shapes + ?
        WQuestion(
            sequence: ["triangle", "square", "pentagon"],
            options: ["circle", "hexagon", "square", "pentagon"],
            correct: "hexagon"
        )
    ]


    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        loadQuestion()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    
    // MARK: Function
    private func loadQuestion() {
           let question = questions[currentIndex]
        //   let tintColor = ColorManager.randomColor()

           isAnswerSubmitted = false
           nextBtn.isHidden = true
           correctTick.isHidden = true

           // QUESTION SHAPES
           let questionViews = [
               questionShape1,
               questionShape2,
               questionShape3,
               questionShape4
           ]

           questionViews.forEach {
               $0?.isHidden = true
               $0?.tintColor = ColorManager.randomColor()
               $0?.contentMode = .scaleAspectFit
           }

           // Fill sequence
           for (i, shape) in question.sequence.enumerated() {
               questionViews[i]?.isHidden = false
               questionViews[i]?.image = UIImage(systemName: shape)?
                   .withRenderingMode(.alwaysTemplate)
           }

           // Show question mark
           let qmIndex = question.sequence.count
           questionViews[qmIndex]?.isHidden = false
           questionViews[qmIndex]?.image = UIImage(named: "questionMarkNew")

           // OPTION IMAGES (UIImageViews)
           let optionImageViews = [
               optionShape1,
               optionShape2,
               optionShape3
           ]

           for (i, imgView) in optionImageViews.enumerated() {
               imgView?.isHidden = false
               imgView?.tintColor = ColorManager.randomColor()
               imgView?.contentMode = .scaleAspectFit
               imgView?.image = UIImage(systemName: question.options[i])?
                   .withRenderingMode(.alwaysTemplate)
           }

           // OPTION BUTTONS (tap only)
           for (i, btn) in optionButtons.enumerated() {
               btn.tag = i
               btn.setTitle(nil, for: .normal)
               btn.setImage(nil, for: .normal)
               btn.isEnabled = true
           }

           updateScore()
       }


    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 10
        nextBtn.isHidden = true
        scoreView.layer.cornerRadius = 10
        OptionView1.layer.cornerRadius = 12
        OptionView2.layer.cornerRadius = 12
        OptionView3.layer.cornerRadius = 12
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white
            nextBtn.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
        }
    }
    
    func addShadow(to view: UIView) {
        view.layer.cornerRadius = 10           // match your design
        view.layer.masksToBounds = false       // ⭐ IMPORTANT
        view.layer.shadowColor = ColorManager.randomColor().cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 8
        // ⭐ Performance optimization
        view.layer.shadowPath = UIBezierPath(
            roundedRect: view.bounds,
            cornerRadius: view.layer.cornerRadius
        ).cgPath
    }
    private func updateScore() {

        scorelbl.text = "\("Score".localiz()) : \(score) / \(currentIndex)"
    }
    
    // MARK: Action
    @IBAction func optionTapped(_ sender: UIButton) {
        guard !isAnswerSubmitted else { return }

           let question = questions[currentIndex]
           let selected = question.options[sender.tag]

          if selected == question.correct {
            score += 1
            correctTick.image = UIImage(named: "check mark")
          } else {
            correctTick.image = UIImage(named: "close")
          }
            optionButtons.forEach { $0.isEnabled = false } // ⭐
           correctTick.isHidden = false
           isAnswerSubmitted = true
           nextBtn.isHidden = false
           updateScore()
    }

    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func submitTapped(_ sender: UIButton) {
        guard isAnswerSubmitted else { return }

        currentIndex += 1

        if currentIndex < questions.count {

            loadQuestion()

        } else {

            // ✅ GAME FINISHED

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            if let vc = storyboard.instantiateViewController(
                withIdentifier: "WhatComeNextResultVC"
            ) as? WhatComeNextResultVC {

                vc.finalScore = score

                vc.receivedPercentage = (score * 100) / totalQuestions

                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
struct WQuestion {
    let sequence: [String]
    let options: [String]
    let correct: String
}
