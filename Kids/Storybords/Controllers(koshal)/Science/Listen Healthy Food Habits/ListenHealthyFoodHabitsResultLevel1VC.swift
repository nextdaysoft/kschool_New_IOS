//
//  ListenHealthyFoodHabitsResultLevel1VC.swift
//  Kids
//
//  Created by Koshal Singh on 30/01/26.
//

import UIKit
import SDWebImage

class ListenHealthyFoodHabitsResultLevel1VC: BaseViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!

    @IBOutlet weak var gifImage: UIImageView!
    
    var levelNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()

        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
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

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
            nextBtn.backgroundColor = color
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

            var levelData = UserDefaults.standard.dictionary(forKey: "listenHealthyFoodHabitsData") as? [String: Int] ?? [:]

            levelData["\(levelNumber)"] = 1   // level completed mark

            UserDefaults.standard.set(levelData, forKey: "listenHealthyFoodHabitsData")
        }

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is ListenHealthyFoodHabitsLevelsMenuVC }
        ) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
}
