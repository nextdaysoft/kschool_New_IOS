//
//  HearAndFindResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 11/03/26.
//

import UIKit
import SDWebImage
import LanguageManager_iOS

class HearAndFindResultVC: BaseViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!

    @IBOutlet weak var gifImage: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreBGVIew: UIView!
    
    var finalScore: Int = 0
    
    var levelNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        
        scoreLabel.text = "\("Score".localiz()): \(finalScore) / 10"
        
        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
        }
        
        scoreBGVIew.layer.cornerRadius = 6
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

    @IBAction func backTapBtn(_ sender: UIButton) {
        goToMenu(markCompleted: true)
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu(markCompleted: true)
    }

    func goToMenu(markCompleted: Bool = true) {

        if markCompleted {

            let percentage = Int((Double(finalScore) / 10.0) * 100)

            let completedKey = "hearAndFindLevel\(levelNumber)Completed"
            let percentageKey = "hearAndFindLevel\(levelNumber)Percentage"

            UserDefaults.standard.set(true, forKey: completedKey)
            UserDefaults.standard.set(percentage, forKey: percentageKey)
        }

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is HearAndFindMenu }
        ) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
}
