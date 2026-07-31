//
//  GuessTheBabyAnimalHerbivoresResultVC.swift
//  Kids
//
//  Created by Koshal Singh on 27/02/26.
//

import UIKit
import SDWebImage

class GuessTheBabyAnimalHerbivoresResultVC: BaseViewController {

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

        scoreLabel.text = "Score: \(finalScore) / 10"
        
        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
        }
        scoreBGVIew.layer.cornerRadius = 10
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

    @IBAction func backTapBtn(_ sender: UIButton) {
        goToMenu(markCompleted: true)
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu(markCompleted: true)
    }

    func goToMenu(markCompleted: Bool = true) {

        if markCompleted {

            let percentage = Int((Double(finalScore) / 10.0) * 100)

            let completedKey = "guessTheBabyAnimalHerbivoresLevel\(levelNumber)Completed"
            let percentageKey = "guessTheBabyAnimalHerbivoresLevel\(levelNumber)Percentage"

            UserDefaults.standard.set(true, forKey: completedKey)
            UserDefaults.standard.set(percentage, forKey: percentageKey)
        }

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is GuessTheBabyAnimalHerbivoresMenuVC }
        ) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    
}
