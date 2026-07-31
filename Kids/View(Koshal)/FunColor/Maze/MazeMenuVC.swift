//
//  MazeMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 03/06/26.
//

import UIKit

class MazeMenuVC: BaseViewController {

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

    
    func updateLevelUI(level: Int,
                       imageView: UIImageView) {

        let completedKey = "mazeLevel\(level)Completed"

        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
        } else {
            imageView.image = nil
        }
    }
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
        UserDefaults.standard.bool(forKey: "mazeLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel8Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel9Completed") ||
        UserDefaults.standard.bool(forKey: "mazeLevel10Completed")
        
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)
        updateLevelUI(level: 3, imageView: image3)
        updateLevelUI(level: 4, imageView: image4)
        updateLevelUI(level: 5, imageView: image5)
        updateLevelUI(level: 6, imageView: image6)
        updateLevelUI(level: 7, imageView: image7)
        updateLevelUI(level: 8, imageView: image8)
        updateLevelUI(level: 9, imageView: image9)
        updateLevelUI(level: 10, imageView: image10)
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
            viewBG4.backgroundColor = .white
            viewBG5.backgroundColor = .white
            viewBG6.backgroundColor = .white
            viewBG7.backgroundColor = .white
            viewBG8.backgroundColor = .white
            viewBG9.backgroundColor = .white
            viewBG10.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
            viewBG4.backgroundColor = ColorManager.randomColor()
            viewBG5.backgroundColor = ColorManager.randomColor()
            viewBG6.backgroundColor = ColorManager.randomColor()
            viewBG7.backgroundColor = ColorManager.randomColor()
            viewBG8.backgroundColor = ColorManager.randomColor()
            viewBG9.backgroundColor = ColorManager.randomColor()
            viewBG10.backgroundColor = ColorManager.randomColor()
        }
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 1
            vc.totalLevels = 10
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 2
            vc.totalLevels = 9
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 3
            vc.totalLevels = 8
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 4
            vc.totalLevels = 7
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 5
            vc.totalLevels = 6
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 6
            vc.totalLevels = 5
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 7
            vc.totalLevels = 4
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 8
            vc.totalLevels = 3
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 9
            vc.totalLevels = 2
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level10TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MazeVC") as? MazeVC {
            vc.menuLevel = 10
            vc.totalLevels = 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        for i in 1...10 {
            defaults.removeObject(forKey: "mazeLevel\(i)Completed")
        }
        
        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
