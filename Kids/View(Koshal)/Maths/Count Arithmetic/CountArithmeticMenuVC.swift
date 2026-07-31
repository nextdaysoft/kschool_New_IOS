//
//  CountArithmeticMenuVC.swift
//  New
//
//  Created by Koshal Singh on 18/04/26.
//

import UIKit

class CountArithmeticMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
  
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
  
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


        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor

     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLevelImages()
        updateResetVisibility()
        
      //  updatePercentageUI()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "countArithmeticLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "countArithmeticLevel2Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let completedKey = "countArithmeticLevel\(level)Completed"
        let percentageKey = "countArithmeticLevel\(level)Percentage"
        
        let isCompleted = UserDefaults.standard.bool(forKey: completedKey)
        let percentage = UserDefaults.standard.integer(forKey: percentageKey)
        
        // ✅ IMAGE
        imageView.image = isCompleted ? UIImage(named: "done") : nil
        
        // ✅ LABEL
        if isCompleted {
            label.text = "\(percentage)%"
            //label.textColor = .systemGreen   // optional 🔥
        } else {
            label.text = ""
          //  label.textColor = .black
        }
    }
    
//    func updatePercentageUI() {
//        
//        let percent1 = getPercentage(for: 1)
//        let percent2 = getPercentage(for: 2)
//        
//        label1.text = "\(percent1)%"
//        label2.text = "\(percent2)%"
//    }
    
    func getPercentage(for level: Int) -> Int {
        return UserDefaults.standard.integer(forKey: "countArithmeticLevel\(level)Percentage")
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "CountArithmeticShowVC") as! CountArithmeticShowVC
        vc.levelNumber = 1
        vc.operationType = "+"   // 👈 ADD
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CountArithmeticShowVC") as! CountArithmeticShowVC
        vc.levelNumber = 2
        vc.operationType = "-"   // 👈 SUBTRACT
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        for i in 1...2 {
            defaults.removeObject(forKey: "countArithmeticLevel\(i)Completed")
        }
        
        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
