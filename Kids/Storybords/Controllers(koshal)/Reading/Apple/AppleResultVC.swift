//
//  ReadingCornerResultVC.swift
//  Kids
//
//  Created by Koshal Singh on 06/02/26.
//

import UIKit
import LanguageManager_iOS

class AppleResultVC: BaseViewController {

    @IBOutlet weak var labelBGView1: UIView!
    @IBOutlet weak var labelBGView2: UIView!
    @IBOutlet weak var labelBGView3: UIView!
    @IBOutlet weak var labelBGView4: UIView!
    @IBOutlet weak var labelBGView5: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!

    
    @IBOutlet weak var scoreBGVIew: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var results: [AppleResult] = []
    var finalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()

        scoreBGVIew.layer.cornerRadius = 10
      
        scoreLabel.text = "\("Score".localiz()): \(finalScore) / 5"
        
        let labels = [
            label1, label2, label3, label4, label5
        ]

        let bgViews = [
            labelBGView1, labelBGView2, labelBGView3,
            labelBGView4, labelBGView5
        ]

        for i in 0..<results.count {

            let result = results[i]

            bgViews[i]?.layer.cornerRadius = 15
            bgViews[i]?.layer.borderWidth = 3
            labels[i]?.numberOfLines = 0

            if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                bgViews[i]?.backgroundColor = .white
            } else {
                bgViews[i]?.backgroundColor = ColorManager.randomColor()
            }
            
            if result.isCorrect {

                // Correct case
                labels[i]?.text = "\(result.sentence)\n✅ \(result.correctAnswer)"
                bgViews[i]?.layer.borderColor = UIColor.systemGreen.cgColor

            } else {

                // Wrong case
                labels[i]?.text = "\(result.sentence)\n❌ \(result.selectedAnswer)   ✅ \(result.correctAnswer)"
                bgViews[i]?.layer.borderColor = UIColor.systemRed.cgColor
            }
        }
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

            scoreBGVIew.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            scoreBGVIew.backgroundColor = color
        }
    }
    
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu()
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {
        goToMenu()
    }
    
    func goToMenu() {

        let percentage = finalScore * 10
        
        UserDefaults.standard.set(true, forKey: "readingLevel1Completed")
        UserDefaults.standard.set(percentage, forKey: "readingLevel1Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is ReadingMenuVC }
        ) as? ReadingMenuVC {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    

    
}
