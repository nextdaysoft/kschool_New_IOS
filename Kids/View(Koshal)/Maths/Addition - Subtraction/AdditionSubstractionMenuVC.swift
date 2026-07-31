//
//  AdditionSubstractionMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 14/04/26.
//

import UIKit

class AdditionSubstractionMenuVC: BaseViewController {

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
    
    var results: [QuestionResultsLevel1] = []
    var finalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        scoreBGVIew.layer.cornerRadius = 10
        
        titelLbl.text = screenTitleText
        
        nextBtn.layer.cornerRadius = 10
        nextBtn.backgroundColor = ColorManager.randomColor()
        nextBtn.layer.borderColor = UIColor.black.cgColor
 
        
        
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
            bgViews[i]?.layer.borderWidth = 3

            if result.isCorrect {
                labels[i]?.text = "\(result.correctWord)"
                bgViews[i]?.layer.borderColor = UIColor.systemGreen.cgColor
            } else {
                let wrongWord = capitalizeFirstLetter(result.formedWord)
                let correctWord = capitalizeFirstLetter(result.correctWord)

                labels[i]?.text = "\(wrongWord)"
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

  
    func resultImage(for percentage: Int) -> UIImage? {
        return UIImage(named: "well-done")
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

        let percentage = finalScore * 10

        if screenTitleText == "Addition" {

            UserDefaults.standard.set(true, forKey: "mathsLevel10Completed")
            UserDefaults.standard.set(percentage, forKey: "mathsLevel10Percentage")

        } else {

            UserDefaults.standard.set(true, forKey: "mathsLevel11Completed")
            UserDefaults.standard.set(percentage, forKey: "mathsLevel11Percentage")
        }

        if let mathsVC = navigationController?.viewControllers.first(
            where: { $0 is MathsMenuVC }
        ) as? MathsMenuVC {

            if screenTitleText == "Addition" {
                mathsVC.updateLevel(level: 10, percentage: percentage)
            } else {
                mathsVC.updateLevel(level: 11, percentage: percentage)
            }

            navigationController?.popToViewController(mathsVC, animated: true)
        }
    }
    
    
}
