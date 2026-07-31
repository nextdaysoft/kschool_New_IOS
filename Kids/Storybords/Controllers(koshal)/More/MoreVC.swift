//
//  MoreVC.swift
//  New
//
//  Created by Koshal Singh on 21/04/26.
//

import UIKit
import StoreKit
class MoreVC: BaseViewController {

    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var themeTapBtn: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        themeTapBtn.isOn = UserDefaults.standard.bool(forKey: "WhiteTheme")

        applyTheme()

        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10

        viewBG1.layer.borderColor = UIColor.black.cgColor
        viewBG2.layer.borderColor = UIColor.black.cgColor
        viewBG3.layer.borderColor = UIColor.black.cgColor
        viewBG4.layer.borderColor = UIColor.black.cgColor
        viewBG5.layer.borderColor = UIColor.black.cgColor
        viewBG6.layer.borderColor = UIColor.black.cgColor
    }
    
    func applyTheme() {

        if themeTapBtn.isOn {

            // White Theme
            viewBG1.backgroundColor = .white
            viewBG2.backgroundColor = .white
            viewBG3.backgroundColor = .white
            viewBG4.backgroundColor = .white
            viewBG5.backgroundColor = .white
            viewBG6.backgroundColor = .white

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

        } else {

            // Random Theme
            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
            viewBG4.backgroundColor = ColorManager.randomColor()
            viewBG5.backgroundColor = ColorManager.randomColor()
            viewBG6.backgroundColor = ColorManager.randomColor()

            let color = ColorManager.randomColor()
            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
        }
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

    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectLanguageVC") as! SelectLanguageVC
        vc.isFromMoreVC = true
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SubscriptionVC") as! SubscriptionVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func privacyBtn(_ sender: UIButton) {
        
        let appID = "6759913599" // Apna App Store App ID
        
        if let url = URL(string: "https://apps.apple.com/app/id\(appID)?action=write-review") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func termsBtn(_ sender: UIButton) {
//        if let url = URL(
//               string: "https://sites.google.com/view/termsofusekschool/home"
//           ) {
//               UIApplication.shared.open(url)
//           }
    }

    
    @IBAction func themeBtn(_ sender: UISwitch) {

        UserDefaults.standard.set(sender.isOn, forKey: "WhiteTheme")

        applyTheme()
    }
    
}
