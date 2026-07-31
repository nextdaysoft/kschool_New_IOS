//
//  FindTheOrderResultVC.swift
//  Kids
//
//  Created by Koshal Singh on 29/01/26.
//

import UIKit
import SDWebImage

class FindTheOrderResultVC: BaseViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreBGView: UIView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    var finalScore: Int = 0
    var totalRounds: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
        }
        
        let percentage = Int((Double(finalScore) / Double(totalRounds)) * 100)
        scoreLabel.text = "Score: \(percentage)%"

        scoreBGView.layer.cornerRadius = 10
        
        nextBtn.layer.cornerRadius = 10
        nextBtn.backgroundColor = ColorManager.randomColor()
        nextBtn.layer.borderColor = UIColor.black.cgColor
        
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
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        goToGameMenu()
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToGameMenu()
    }

    
    func goToGameMenu() {
        let percentage = Int((Double(finalScore) / Double(totalRounds)) * 100)

        // 🔐 SAVE FIND THE ORDER RESULT
        UserDefaults.standard.set(true, forKey: "gameLevel4Completed")
        UserDefaults.standard.set(percentage, forKey: "gameLevel4Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is GameMenuVC }
        ) as? GameMenuVC {
            
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
}
