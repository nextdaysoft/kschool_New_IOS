//
//  AdditionLevelMenuVC.swift
//  New
//
//  Created by Koshal Singh on 21/04/26.
//

import UIKit

class AdditionLevelMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
  
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!

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
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
        
        updateLevelImages()
        updateResetVisibility()
        updatePercentageLabels()
    }
    
    func updatePercentageLabels() {

        let defaults = UserDefaults.standard

        if defaults.object(forKey: "additionLevel1Percentage") != nil {
            label1.text = "\(getPercentage(for: 1))%"
        } else {
            label1.text = ""
        }

        if defaults.object(forKey: "additionLevel2Percentage") != nil {
            label2.text = "\(getPercentage(for: 2))%"
        } else {
            label2.text = ""
        }

        if defaults.object(forKey: "additionLevel3Percentage") != nil {
            label3.text = "\(getPercentage(for: 3))%"
        } else {
            label3.text = ""
        }
    }
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "additionLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "additionLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "additionLevel3Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)
        updateLevelUI(level: 3, imageView: image3)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView) {

        let completedKey = "additionLevel\(level)Completed"

        if UserDefaults.standard.bool(forKey: completedKey) {

            imageView.image = UIImage(named: "done")

        } else {

            imageView.image = nil
        }
    }
    
    func getPercentage(for level: Int) -> Int {
        return UserDefaults.standard.integer(forKey: "additionLevel\(level)Percentage")
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
    }

    func applyTheme() {

        let bgViews = [
            viewBG1,
            viewBG2,
            viewBG3
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            bgViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            bgViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
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
        
        // Text right side + icon right
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AdditionLevel1") as! AdditionLevel1
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AdditionLevel2VC") as! AdditionLevel2VC
        vc.questionText = "Addition"
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FindMissingValue") as! FindMissingValue
        vc.questionText = "Addition"
        navigationController?.pushViewController(vc, animated: true)
    }


    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...3 {

            defaults.removeObject(forKey: "additionLevel\(i)Completed")
            defaults.removeObject(forKey: "additionLevel\(i)Percentage")
        }

        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
        updatePercentageLabels()
    }
    
}
