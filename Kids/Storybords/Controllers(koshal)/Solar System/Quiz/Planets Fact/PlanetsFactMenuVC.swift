//
//  PlanetsFactMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 24/02/26.
//

import UIKit

class PlanetsFactMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupForRestBtn()
        
        view1.layer.borderColor = UIColor.black.cgColor
        view1.layer.borderWidth = 1
        view1.layer.cornerRadius = 20
        view1.clipsToBounds = true

        view2.layer.borderColor = UIColor.black.cgColor
        view2.layer.borderWidth = 1
        view2.layer.cornerRadius = 20
        view2.clipsToBounds = true

        view3.layer.borderColor = UIColor.black.cgColor
        view3.layer.borderWidth = 1
        view3.layer.cornerRadius = 20
        view3.clipsToBounds = true

        view4.layer.borderColor = UIColor.black.cgColor
        view4.layer.borderWidth = 1
        view4.layer.cornerRadius = 20
        view4.clipsToBounds = true

        view5.layer.borderColor = UIColor.black.cgColor
        view5.layer.borderWidth = 1
        view5.layer.cornerRadius = 20
        view5.clipsToBounds = true

       
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor
        

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor
        

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()
        viewBG3.layer.borderColor = UIColor.black.cgColor
       

        viewBG4.layer.cornerRadius = 10
        viewBG4.backgroundColor = ColorManager.randomColor()
        viewBG4.layer.borderColor = UIColor.black.cgColor


        viewBG5.layer.cornerRadius = 10
        viewBG5.backgroundColor = ColorManager.randomColor()
        viewBG5.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 🔥 LEVEL 1
        if UserDefaults.standard.bool(forKey: "planetsFactLevel1Completed") {
            image1.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "planetsFactLevel1Percentage")
            label1.text = "\(percentage)%"
        } else {
            image1.image = nil
            label1.text = ""
        }
        
        // 🔥 LEVEL 2
        if UserDefaults.standard.bool(forKey: "planetsFactLevel2Completed") {
            image2.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "planetsFactLevel2Percentage")
            label2.text = "\(percentage)%"
        } else {
            image2.image = nil
            label2.text = ""
        }
    
        // 🔥 LEVEL 3
        if UserDefaults.standard.bool(forKey: "planetsFactLevel3Completed") {
            image3.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "planetsFactLevel3Percentage")
            label3.text = "\(percentage)%"
        } else {
            image3.image = nil
            label3.text = ""
        }
         
        // 🔥 LEVEL 4
        if UserDefaults.standard.bool(forKey: "planetsFactLevel4Completed") {
            image4.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "planetsFactLevel4Percentage")
            label4.text = "\(percentage)%"
        } else {
            image4.image = nil
            label4.text = ""
        }
     
        // 🔥 LEVEL 5  (FIXED KEY)
        if UserDefaults.standard.bool(forKey: "planetsFactLevel5Completed") {
            image5.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "planetsFactLevel5Percentage")
            label5.text = "\(percentage)%"
        } else {
            image5.image = nil
            label5.text = ""
        }
        
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "planetsFactLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "planetsFactLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "planetsFactLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "planetsFactLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "planetsFactLevel5Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
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

    
    func setupForRestBtn() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        
        
        let img = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: config)
        
        restBtn.setImage(img, for: .normal)
        
        restBtn.tintColor = UIColor(
            red: 0.17,
            green: 0.21,
            blue: 0.33,
            alpha: 1
        )
        
        // Text right side + icon right
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PlanentOrderMatchLevel1VC"
        ) as! PlanentOrderMatchLevel1VC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PlanentOrderMatchLevel2VC"
        ) as? PlanentOrderMatchLevel2VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PlanentOrderMatchLevel3VC"
        ) as? PlanentOrderMatchLevel3VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PlanentOrderMatchLevel4VC"
        ) as? PlanentOrderMatchLevel4VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PlanentOrderMatchLevel5VC"
        ) as? PlanentOrderMatchLevel5VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        // 🔥 LEVEL 1 RESET
        image1.isHidden = true
        UserDefaults.standard.set(false, forKey: "planetsFactLevel1Completed")
        
        // 🔥 LEVEL 2 RESET
        image2.isHidden = true
        UserDefaults.standard.set(false, forKey: "planetsFactLevel2Completed")
        
        // 🔥 LEVEL 3 RESET
        image3.isHidden = true
        UserDefaults.standard.set(false, forKey: "planetsFactLevel3Completed")
        
        // 🔥 LEVEL 4 RESET
        image4.isHidden = true
        UserDefaults.standard.set(false, forKey: "planetsFactLevel4Completed")
        
        // 🔥 LEVEL 5 RESET
        image5.isHidden = true
        UserDefaults.standard.set(false, forKey: "planetsFactLevel5Completed")
        
        updateResetVisibility()
    }
    
}
