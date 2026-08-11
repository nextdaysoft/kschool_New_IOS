//
//  GuessRoman41To50ResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 07/04/26.
//

import UIKit
import SDWebImage

class GuessRoman41To50ResultVC: BaseViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!

    @IBOutlet weak var gifImage: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreBGVIew: UIView!
    
    var finalScore: Int = 0
    var levelNumber: Int = 1
    var totalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        scoreLabel.text = "Score: \(finalScore) / \(totalScore)"
        
        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
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

    @IBAction func backTapBtn(_ sender: UIButton) {
        goToMenu(markCompleted: true)
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu(markCompleted: true)
    }

    func goToMenu(markCompleted: Bool = true) {

        let percentage = Int((Double(finalScore) / Double(totalScore)) * 100)

        if markCompleted {
            UserDefaults.standard.set(true, forKey: "romanNumeralsLevel6Completed")
            UserDefaults.standard.set(percentage, forKey: "romanNumeralsLevel6Percentage")
        }

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is RomanNumeralsMenuVC }
        ) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
}
