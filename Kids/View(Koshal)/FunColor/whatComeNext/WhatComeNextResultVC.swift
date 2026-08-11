//
//  WhatComeNextResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 12/05/26.
//

import UIKit
import SDWebImage
import LanguageManager_iOS

class WhatComeNextResultVC: BaseViewController {

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
        
        scoreLabel.text = "\("Score".localiz()): \(finalScore) / 2"
        
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
        nextBtn.layer.cornerRadius = 6
        nextBtn.backgroundColor = color
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

        // ✅ SAVE PERCENTAGE
        UserDefaults.standard.set(
            percentage,
            forKey: "funColorLevel5Percentage"
        )

        // ✅ SAVE COMPLETED
        UserDefaults.standard.set(
            true,
            forKey: "funColorLevel5Completed"
        )

        // ✅ GO BACK TO FUN COLOR MENU
        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is FunColorMenuVC }
        ) as? FunColorMenuVC {

            navigationController?.popToViewController(
                menuVC,
                animated: true
            )
        }
    }
    
}
