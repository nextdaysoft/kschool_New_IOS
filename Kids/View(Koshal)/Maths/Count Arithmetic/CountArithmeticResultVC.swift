//
//  CountArithmeticResultVC.swift
//  New
//
//  Created by Koshal Singh on 18/04/26.
//

struct CountArithmeticResult {
    var questionNumber: Int
    var firstValue: Int      // 👈 add
    var secondValue: Int     // 👈 add
    var userAnswer: Int
    var correctAnswer: Int
    var isCorrect: Bool
}

import UIKit

class CountArithmeticResultVC: BaseViewController {

    @IBOutlet weak var labelBGView1: UIView!
    @IBOutlet weak var labelBGView2: UIView!
    @IBOutlet weak var labelBGView3: UIView!
    @IBOutlet weak var labelBGView4: UIView!
    @IBOutlet weak var labelBGView5: UIView!
    @IBOutlet weak var labelBGView6: UIView!
    @IBOutlet weak var labelBGView7: UIView!
    @IBOutlet weak var labelBGView8: UIView!
    @IBOutlet weak var labelBGView9: UIView!
    @IBOutlet weak var labelBGView10: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    
    
    @IBOutlet weak var scoreBGVIew: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var titelLbl: UILabel!
    
    var screenTitleText: String = ""
    
    var operationType: String = "+"
    
    var results: [CountArithmeticResult] = []
    var finalScore: Int = 0
    var levelNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        scoreBGVIew.layer.cornerRadius = 10
        
        titelLbl.text = screenTitleText
        
        nextBtn.layer.cornerRadius = 10
        nextBtn.backgroundColor = ColorManager.randomColor()
        
        let labels = [label1, label2, label3, label4, label5,
                      label6, label7, label8, label9, label10]

        let bgViews = [labelBGView1, labelBGView2, labelBGView3,
                       labelBGView4, labelBGView5, labelBGView6,
                       labelBGView7, labelBGView8, labelBGView9,
                       labelBGView10]

        scoreLabel.text = "Score: \(finalScore) / 10"

        for i in 0..<results.count {

            let result = results[i]

            bgViews[i]?.layer.cornerRadius = 15
            bgViews[i]?.layer.borderWidth = 2

            // ✅ Screenshot jaisa format
            if result.isCorrect {
                labels[i]?.text = "\(result.firstValue) \(operationType) \(result.secondValue) = \(result.correctAnswer)"
            } else {
                labels[i]?.text = "\(result.firstValue) \(operationType) \(result.secondValue) = \(result.userAnswer)"
            }

            if result.isCorrect {
                bgViews[i]?.layer.borderColor = UIColor.systemGreen.cgColor
            } else {
                bgViews[i]?.layer.borderColor = UIColor.systemRed.cgColor
            }
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
    }
    
    func capitalizeFirstLetter(_ text: String) -> String {
        guard let first = text.first else { return text }
        return String(first).uppercased() + text.dropFirst()
    }
    
    func calculatePercentage() -> Int {
        return finalScore * 10
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu()
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {
        goToMenu()
    }
    
    func goToMenu() {

        let percentage = Int((Double(finalScore) / 10.0) * 100)

        // ✅ Correct dynamic keys
        let completedKey = "countArithmeticLevel\(levelNumber)Completed"
        let percentageKey = "countArithmeticLevel\(levelNumber)Percentage"
        
        // ✅ Save data
        UserDefaults.standard.set(true, forKey: completedKey)
        UserDefaults.standard.set(percentage, forKey: percentageKey)
        
        UserDefaults.standard.synchronize()
        
        // ✅ Back to Menu Screen
        if let menuVC = navigationController?.viewControllers.first(where: { $0 is CountArithmeticMenuVC }) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    
}
