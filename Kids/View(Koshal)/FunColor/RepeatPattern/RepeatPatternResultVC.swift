//
//  RepeatPatternResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 13/05/26.
//

import UIKit
import SDWebImage

class RepeatPatternResultVC: BaseViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    var finalScore: Int = 0

    var results: [CountResult] = []
    var levelNumber: Int = 1
    var screenTitleText: String = ""
    var operationType: String = "+"
    
    var receivedLevel: Int?
    var receivedPercentage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        
        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
        }
        
        scoreLabel.text = "Score: \(finalScore) / 10"
        scoreLabelBGView.layer.cornerRadius = 10
        
        nextBtn.layer.cornerRadius = 10
      
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
    }

    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            scoreLabelBGView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreLabelBGView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)
        }
    }
    
   
    func calculatePercentage() -> Int {
        return finalScore * 10
    }

    @IBAction func backTapBtn(_ sender: UIButton) {
        goToMenu()
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu()
    }

    func goToMenu() {

        let percentage = receivedPercentage ?? calculatePercentage()

        // ✅ level identify
        let level = receivedLevel ?? 1

        // ✅ save level wise
        UserDefaults.standard.set(
            true,
            forKey: "patternRepeatLevel\(level)Completed"
        )

        UserDefaults.standard.set(
            percentage,
            forKey: "patternRepeatLevel\(level)Percentage"
        )

        // ✅ back to menu
        if let subVC = navigationController?.viewControllers.first(
            where: { $0 is PatternRepeatMenuVC }
        ) as? PatternRepeatMenuVC {

            navigationController?.popToViewController(
                subVC,
                animated: true
            )
        }
    }
}
