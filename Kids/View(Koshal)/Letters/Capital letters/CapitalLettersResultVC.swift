//
//  CapitalLettersResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 08/05/26.
//

import UIKit
import SDWebImage

class CapitalLettersResultVC: BaseViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var titelLbl: UILabel!
    
    var finalScore: Int = 0
    var levelKey = "letterLevel1Completed"
    var titleText = ""
    var menuVCType: UIViewController.Type?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
        
        titelLbl.text = titleText
        
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

        UserDefaults.standard.set(
            true,
            forKey: levelKey
        )

        if let targetType = menuVCType,
           let menuVC = navigationController?
            .viewControllers
            .first(where: { type(of: $0) == targetType }) {

            navigationController?.popToViewController(
                menuVC,
                animated: true
            )
        }
    }

    @IBAction func nextTapBtn(_ sender: UIButton) {

        UserDefaults.standard.set(
            true,
            forKey: levelKey
        )

        if let targetType = menuVCType,
           let menuVC = navigationController?
            .viewControllers
            .first(where: { type(of: $0) == targetType }) {

            navigationController?.popToViewController(
                menuVC,
                animated: true
            )
        }
    }
}
