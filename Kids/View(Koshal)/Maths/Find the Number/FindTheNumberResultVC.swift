//
//  FindTheNumberResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 23/03/26.
//

import UIKit
import SDWebImage

class FindTheNumberResultVC: BaseViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreBGView: UIView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    var finalScore: Int = 0
    var totalRounds: Int = 10
    var levelNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        
        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
        }
        
        scoreLabel.text = "Score: \(finalScore) / \(totalRounds)"

        scoreBGView.layer.cornerRadius = 6
        
        nextBtn.layer.cornerRadius = 6
        
        let percentage = (finalScore * 100) / totalRounds

          let defaults = UserDefaults.standard

          defaults.set(true, forKey: "findTheNumberLevel\(levelNumber)Completed")
          defaults.set(percentage, forKey: "findTheNumberLevel\(levelNumber)Percentage")
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

            scoreBGView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreBGView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        goToMenu(markCompleted: true)
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu(markCompleted: true)
    }

    
    func goToMenu(markCompleted: Bool = true) {

        if markCompleted {

            let percentage = Int((Double(finalScore) / 10.0) * 100)

            let completedKey = "findTheNumberLevel\(levelNumber)Completed"
            let percentageKey = "findTheNumberLevel\(levelNumber)Percentage"

            UserDefaults.standard.set(true, forKey: completedKey)
            UserDefaults.standard.set(percentage, forKey: percentageKey)
        }

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is FindTheNumberMenuVC }
        ) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
}
