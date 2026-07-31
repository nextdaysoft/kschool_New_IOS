//
//  LearnPunctuationMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 09/03/26.
//

import UIKit
import LanguageManager_iOS

class LearnPunctuationMenuVC: BaseViewController {

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
    
    let planets1: [LearnPlanetsItem] = [

        LearnPlanetsItem(
            text: "Quotation Marks".localiz(),
            imageName: "quotationMarks"
        ),

        LearnPlanetsItem(
            text: "Colon".localiz(),
            imageName: "colon"
        ),

        LearnPlanetsItem(
            text: "Comma".localiz(),
            imageName: "comma"
        ),

        LearnPlanetsItem(
            text: "Exclamation Mark".localiz(),
            imageName: "exclamationMark"
        ),

        LearnPlanetsItem(
            text: "Period / Full Stop".localiz(),
            imageName: "fullStop"
        ),

        LearnPlanetsItem(
            text: "Semicolon".localiz(),
            imageName: "semicolon"
        ),

        LearnPlanetsItem(
            text: "Question Mark".localiz(),
            imageName: "questionMark"
        ),

        LearnPlanetsItem(
            text: "Parentheses".localiz(),
            imageName: "parentheses"
        ),

        LearnPlanetsItem(
            text: "Hyphen".localiz(),
            imageName: "Hyphen"
        )
    ]

    let planets2: [LearnPlanetsItem] = [

        LearnPlanetsItem(
            text: "Ampersand".localiz(),
            imageName: "ampersand"
        ),

        LearnPlanetsItem(
            text: "Asterisk".localiz(),
            imageName: "asterisk"
        ),

        LearnPlanetsItem(
            text: "At Sign".localiz(),
            imageName: "atSign"
        ),

        LearnPlanetsItem(
            text: "Curly Braces".localiz(),
            imageName: "curlyBraces"
        ),

        LearnPlanetsItem(
            text: "Dash".localiz(),
            imageName: "dash"
        ),

        LearnPlanetsItem(
            text: "Ellipsis".localiz(),
            imageName: "ellipsis"
        ),

        LearnPlanetsItem(
            text: "Underscore".localiz(),
            imageName: "underscore"
        ),

        LearnPlanetsItem(
            text: "Tilde".localiz(),
            imageName: "tilde"
        ),

        LearnPlanetsItem(
            text: "Square Brackets".localiz(),
            imageName: "squareBrackets"
        ),

        LearnPlanetsItem(
            text: "Slash".localiz(),
            imageName: "slash"
        )
    ]
    
    
    
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

        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        applyTheme()
     
        if UserDefaults.standard.bool(forKey: "learnPunctuationLevel1Completed") {
            image1.image = UIImage(named: "done")
        } else {
            image1.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "learnPunctuationLevel2Completed") {
            image2.image = UIImage(named: "done")
        } else {
            image2.image = nil
        }
        
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "learnPunctuationLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "learnPunctuationLevel3Completed")
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
 
    func updateLevelImages() {

        image1.image = UserDefaults.standard.bool(forKey: "learnPunctuationLevel1Completed") ? UIImage(named: "done") : nil
        image2.image = UserDefaults.standard.bool(forKey: "learnPunctuationLevel2Completed") ? UIImage(named: "done") : nil
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

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnPunctuationShowVC") as! LearnPunctuationShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LearnPunctuationShowVC") as! LearnPunctuationShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        for i in 1...5 {
            defaults.removeObject(forKey: "learnPunctuationLevel\(i)Completed")
        }
        
        defaults.synchronize()
        
        updateLevelImages()
        updateResetVisibility()
    }
    
}
