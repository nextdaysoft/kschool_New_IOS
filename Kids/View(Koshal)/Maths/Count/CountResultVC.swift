//
//  CountResultVC.swift
//  New
//
//  Created by Koshal Singh on 20/04/26.
//

import UIKit
import SDWebImage

class CountResultVC: BaseViewController {

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
        
        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
        }
        
        scoreLabel.text = "Score: \(finalScore) / 10"
        scoreLabelBGView.layer.cornerRadius = 10
        
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

        UserDefaults.standard.set(true, forKey: "mathsLevel\(levelNumber)Completed")
        UserDefaults.standard.set(percentage, forKey: "mathsLevel\(levelNumber)Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is MathsMenuVC }
        ) as? MathsMenuVC {

            // ✅ DATA PASS KARO
            menuVC.updateLevel(level: levelNumber, percentage: percentage)

            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
}
