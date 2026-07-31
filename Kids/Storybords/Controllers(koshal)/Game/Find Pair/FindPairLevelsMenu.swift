//
//  FindPairLevelsMenu.swift
//  Kids
//
//  Created by Koshal Singh on 16/01/26.
//

import UIKit

class FindPairLevelsMenu: BaseViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var level1Completed = false
    var level2Completed = false

    // MARK: Variable
    var onTap: (() -> Void)?
    
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
        
        view1.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(cViewTapped))
        view1.addGestureRecognizer(tap)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        
           UserDefaults.standard.synchronize()
           
           if UserDefaults.standard.bool(forKey: "findPairLevel1Completed") {
               image1.image = UIImage(named: "done")
           } else {
               image1.image = nil
           }
           
           if UserDefaults.standard.bool(forKey: "findPairLevel2Completed") {
               image2.image = UIImage(named: "done")
           } else {
               image2.image = nil
           }
           
           updateResetVisibility()
    }
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "findPairLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "findPairLevel2Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
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
    
    @objc private func cViewTapped() {
            onTap?()
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
            withIdentifier: "FindPairLevel1VC"
        ) as? FindPairLevel1VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FindPairLevel2VC"
        ) as? FindPairLevel2VC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        image1.image = nil
        UserDefaults.standard.set(false, forKey: "findPairLevel1Completed")
           
           // 🔥 LEVEL 2 RESET
        image2.image = nil
        UserDefaults.standard.set(false, forKey: "findPairLevel2Completed")
           
           // ✅ YEH LINE ADD KARO - Force save to disk
        UserDefaults.standard.synchronize()
           
        updateResetVisibility()
    }
    
    

}
