//
//  LearnMonthsResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 02/04/26.
//

import UIKit
import SDWebImage

class LearnMonthsResultVC: BaseViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!

    @IBOutlet weak var gifImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        if let url = Bundle.main.url(forResource: "celebration", withExtension: "gif") {
            gifImage.sd_setImage(with: url)
        }
        
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
        goToMenu()
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu()
    }

    func goToMenu() {

        UserDefaults.standard.set(true, forKey: "calendarLevel2Completed")
            if let menuVC = navigationController?.viewControllers.first(
                where: { $0 is CalendarMenuVC }
            ) as? CalendarMenuVC {
                navigationController?.popToViewController(menuVC, animated: true)
            }
        }
}
