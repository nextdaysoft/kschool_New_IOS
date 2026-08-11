//
//  IsAmAreResultVC.swift
//  Kids
//
//  Created by Koshal Singh on 05/02/26.
//

import UIKit
import LanguageManager_iOS

class IsAmAreResultVC: BaseViewController {

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
    
    var results: [IsAmAreResult] = []
    var finalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()

        scoreBGVIew.layer.cornerRadius = 6
   
        scoreLabel.text = "\("Score".localiz()): \(finalScore) / 10"
        
        let labels = [
            label1, label2, label3, label4, label5,
            label6, label7, label8, label9, label10
        ]

        let bgViews = [
            labelBGView1, labelBGView2, labelBGView3,
            labelBGView4, labelBGView5, labelBGView6,
            labelBGView7, labelBGView8, labelBGView9,
            labelBGView10
        ]

        for i in 0..<results.count {

            let result = results[i]

            bgViews[i]?.layer.cornerRadius = 15
            bgViews[i]?.layer.borderWidth = 3

           
            if result.isCorrect {
                // Correct answer
                labels[i]?.text = result.correctSentence
                bgViews[i]?.layer.borderColor = UIColor.systemGreen.cgColor
            } else {
                // Wrong answer → show only selected sentence
                labels[i]?.text = result.selectedSentence
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
           
            scoreBGVIew.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            
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

        // 🔐 SAVE CONFUSING WORDS – LEVEL 1
        UserDefaults.standard.set(true, forKey: "isAmAreLevel4Completed")
        UserDefaults.standard.set(percentage, forKey: "isAmAreLevel4Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is GrammarMenuVC }
        ) as? GrammarMenuVC {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }

    
}
