//
//  MatchshapeMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 13/04/26.
//

import UIKit

class MatchshapeMenuVC: BaseViewController {

    @IBOutlet weak var leveLabel1: UILabel!
    @IBOutlet weak var leveLabel2: UILabel!
    @IBOutlet weak var leveLabel3: UILabel!
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
  
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
   
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
 
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    @IBOutlet weak var imageHeightConstraint1: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint2: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint3: NSLayoutConstraint!
 
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var receivedPercentage1: Int?
    var receivedPercentage2: Int?
    var receivedPercentage3: Int?
 
    
    var receivedImage1: UIImage?
    var receivedImage2: UIImage?
    var receivedImage3: UIImage?
   
    var levelNumber: Int = 1   // 👈 ADD THIS
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        applyTheme()
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
      
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor
       
        
        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor
       
        
        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()
        viewBG3.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()

        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "matchshapeLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "matchshapeLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "matchshapeLevel3Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: imageView1)
        updateLevelUI(level: 2, imageView: imageView2)
        updateLevelUI(level: 3, imageView: imageView3)
    }

    func updateLevelUI(level: Int, imageView: UIImageView) {

        let completedKey = "matchshapeLevel\(level)Completed"

        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
        } else {
            imageView.image = nil
        }
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
        
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
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

            viewBG1.backgroundColor = .white
            viewBG2.backgroundColor = .white
            viewBG3.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
        }
    }
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "MatchShape") as! MatchShape
        vc.levelNumber = 1   // 👈 IMPORTANT
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "MatchShape") as! MatchShape
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "MatchShape") as! MatchShape
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }

    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        for i in 1...3 {
            defaults.removeObject(forKey: "matchshapeLevel\(i)Completed")
        }
        
        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
   
}
