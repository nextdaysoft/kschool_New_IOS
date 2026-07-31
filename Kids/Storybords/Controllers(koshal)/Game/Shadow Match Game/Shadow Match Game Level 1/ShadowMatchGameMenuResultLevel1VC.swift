//
//  DragTheAnimalResultVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 06/01/26.
//

import UIKit
import SDWebImage
import LanguageManager_iOS

class ShadowMatchGameMenuResultLevel1VC: BaseViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var nextBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    var finalScore: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
        }
        
        scoreLabel.text = "\("Score".localiz()): \(finalScore) / 10"
        
        scoreLabelBGView.layer.cornerRadius = 10
    
    }

    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        nextBtn.backgroundColor = color
        nextBtn.layer.cornerRadius = 6
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
        let percentage = calculatePercentage()

        // 🔐 SAVE SHADOW MATCH LEVEL 1 RESULT
        UserDefaults.standard.set(true, forKey: "shadowMatchLevel1Completed")
        UserDefaults.standard.set(percentage, forKey: "shadowMatchLevel1Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is ShadowMatchGameMenuVC }
        ) as? ShadowMatchGameMenuVC {

            menuVC.receivedPercentage1 = percentage
            menuVC.receivedImage1 = UIImage(named: "well-done")

            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
}
