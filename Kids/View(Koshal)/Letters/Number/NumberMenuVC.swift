//
//  NumberMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 22/05/26.
//

import UIKit

class NumberMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    @IBOutlet weak var viewBG9: UIView!
    @IBOutlet weak var viewBG10: UIView!
  
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var didTapLockedLevel = false
    
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

        view4.layer.borderColor = UIColor.black.cgColor
        view4.layer.borderWidth = 1
        view4.layer.cornerRadius = 20
        view4.clipsToBounds = true

        view5.layer.borderColor = UIColor.black.cgColor
        view5.layer.borderWidth = 1
        view5.layer.cornerRadius = 20
        view5.clipsToBounds = true

        view6.layer.borderColor = UIColor.black.cgColor
        view6.layer.borderWidth = 1
        view6.layer.cornerRadius = 20
        view6.clipsToBounds = true

        view7.layer.borderColor = UIColor.black.cgColor
        view7.layer.borderWidth = 1
        view7.layer.cornerRadius = 20
        view7.clipsToBounds = true

        view8.layer.borderColor = UIColor.black.cgColor
        view8.layer.borderWidth = 1
        view8.layer.cornerRadius = 20
        view8.clipsToBounds = true

        view9.layer.borderColor = UIColor.black.cgColor
        view9.layer.borderWidth = 1
        view9.layer.cornerRadius = 20
        view9.clipsToBounds = true

        view10.layer.borderColor = UIColor.black.cgColor
        view10.layer.borderWidth = 1
        view10.layer.cornerRadius = 20
        view10.clipsToBounds = true
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10
        viewBG7.layer.cornerRadius = 10
        viewBG8.layer.cornerRadius = 10
        viewBG9.layer.cornerRadius = 10
        viewBG10.layer.cornerRadius = 10
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
        updateLevelImages()
        updateResetVisibility()
    }

    func applyTheme() {

        let bgViews = [
            viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,
            viewBG6, viewBG7, viewBG8, viewBG9, viewBG10
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            bgViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let headerColor = ColorManager.randomColor()

            HeaderView.backgroundColor = headerColor
            statusView.backgroundColor = headerColor

            bgViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }
    }
    

    
    func updateLevelUI(
        level: Int,
        imageView: UIImageView,
        label: UILabel
    ) {

        let completedKey =
        "pickCorrectSpellingLevel\(level)Completed"

        if UserDefaults.standard.bool(
            forKey: completedKey
        ) {

            imageView.image =
            UIImage(named: "done")

            // percentage remove
            label.text = ""

        } else {

            imageView.image = nil
            label.text = ""
        }
    }
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel8Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel9Completed") ||
        UserDefaults.standard.bool(forKey: "pickCorrectSpellingLevel10Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
        updateLevelUI(level: 5, imageView: image5, label: label5)
        updateLevelUI(level: 6, imageView: image6, label: label6)
        updateLevelUI(level: 7, imageView: image7, label: label7)
        updateLevelUI(level: 8, imageView: image8, label: label8)
        updateLevelUI(level: 9, imageView: image9, label: label9)
        updateLevelUI(level: 10, imageView: image10, label: label10)
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

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 2
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 3
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 4
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 5
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 6
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 7
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 8
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 9
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level10TapBtn(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "Numbers"
        ) as? Numbers {
            vc.levelNumber = 10
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        for i in 1...10 {
            defaults.removeObject(forKey: "pickCorrectSpellingLevel\(i)Completed")
        }
        
        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
