//
//  GuessColorMixingMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 01/04/26.
//


import UIKit

class GuessColorMixingMenuVC: BaseViewController {

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
    
    let colorMixData1: [ColorMixItem] = [

        ColorMixItem(color1Name: "Blue", color1: .blue,
                     color2Name: "Yellow", color2: .yellow,
                     resultName: "Green", resultColor: .green),

        ColorMixItem(color1Name: "Green", color1: .green,
                     color2Name: "Brown", color2: .brown,
                     resultName: "Forest", resultColor: UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1)),

        ColorMixItem(color1Name: "Blue", color1: .blue,
                     color2Name: "Purple", color2: .systemPurple,
                     resultName: "Indigo", resultColor: UIColor(red: 75/255, green: 0, blue: 130/255, alpha: 1)),

        ColorMixItem(color1Name: "Red", color1: .red,
                     color2Name: "Brown", color2: .brown,
                     resultName: "Brick", resultColor: UIColor(red: 156/255, green: 102/255, blue: 31/255, alpha: 1)),

        // Q5
        ColorMixItem(color1Name: "Red", color1: .red,
                     color2Name: "Blue", color2: .blue,
                     resultName: "Purple", resultColor: .systemPurple),

        ColorMixItem(color1Name: "Yellow", color1: .yellow,
                     color2Name: "Green", color2: .green,
                     resultName: "Lime", resultColor: UIColor(red: 191/255, green: 255/255, blue: 0, alpha: 1)),

        ColorMixItem(color1Name: "Blue", color1: .blue,
                     color2Name: "Green", color2: .green,
                     resultName: "Cyan", resultColor: .cyan),

        ColorMixItem(color1Name: "Orange", color1: .orange,
                     color2Name: "Brown", color2: .brown,
                     resultName: "Chocolate", resultColor: UIColor(red: 123/255, green: 63/255, blue: 0, alpha: 1)),

        ColorMixItem(color1Name: "Red", color1: .red,
                     color2Name: "Yellow", color2: .yellow,
                     resultName: "Orange", resultColor: .orange),
        
        ColorMixItem(color1Name: "Red", color1: .red,
                     color2Name: "Pink", color2: .systemPink,
                     resultName: "Magenta", resultColor: .magenta)
    ]
    
    
    let colorMixData2: [ColorMixItem] = [

        ColorMixItem(color1Name: "Brown", color1: .brown,
                     color2Name: "Grey", color2: .systemGray,
                     resultName: "Charcoal",
                     resultColor: UIColor(red: 54/255, green: 69/255, blue: 79/255, alpha: 1)),

        ColorMixItem(color1Name: "Blue", color1: .blue,
                     color2Name: "Grey", color2: .systemGray,
                     resultName: "Steel Blue",
                     resultColor: UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)),

        ColorMixItem(color1Name: "Orange", color1: .orange,
                     color2Name: "Pink", color2: .systemPink,
                     resultName: "Peach",
                     resultColor: UIColor(red: 255/255, green: 203/255, blue: 164/255, alpha: 1)),

        ColorMixItem(color1Name: "Purple", color1: .systemPurple,
                     color2Name: "Pink", color2: .systemPink,
                     resultName: "Violet",
                     resultColor: UIColor(red: 143/255, green: 0, blue: 255/255, alpha: 1)),

        ColorMixItem(color1Name: "Red", color1: .red,
                     color2Name: "Orange", color2: .orange,
                     resultName: "Coral",
                     resultColor: UIColor(red: 255/255, green: 127/255, blue: 80/255, alpha: 1)),

        ColorMixItem(color1Name: "Green", color1: .green,
                     color2Name: "Yellow", color2: .yellow,
                     resultName: "Olive",
                     resultColor: UIColor(red: 128/255, green: 128/255, blue: 0, alpha: 1)),

        ColorMixItem(color1Name: "Yellow", color1: .yellow,
                     color2Name: "Orange", color2: .orange,
                     resultName: "Amber",
                     resultColor: UIColor(red: 255/255, green: 191/255, blue: 0, alpha: 1)),

        ColorMixItem(color1Name: "Yellow", color1: .yellow,
                     color2Name: "Brown", color2: .brown,
                     resultName: "Mustard",
                     resultColor: UIColor(red: 205/255, green: 171/255, blue: 45/255, alpha: 1)),

        ColorMixItem(color1Name: "Red", color1: .red,
                     color2Name: "Purple", color2: .systemPurple,
                     resultName: "Maroon",
                     resultColor: UIColor(red: 128/255, green: 0, blue: 0, alpha: 1)),

        ColorMixItem(color1Name: "Pink", color1: .systemPink,
                     color2Name: "Grey", color2: .systemGray,
                     resultName: "Smoky Pink",
                     resultColor: UIColor(red: 207/255, green: 159/255, blue: 165/255, alpha: 1))
    ]
    
    
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
        
        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        for i in 1...2 {
            print("Level \(i) Completed:",
                  UserDefaults.standard.bool(forKey: "guessColorMixingLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessColorMixingLevelData") as? [String: Int]

        let isAnyCompleted = !(levelData?.isEmpty ?? true)

        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    
    func updateLevelImages() {
        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessColorMixingLevelData") as? [String: Int] ?? [:]

        if let percentage = levelData["\(level)"] {
            imageView.image = UIImage(named: "done")
            label.text = "\(percentage)%"
        } else {
            imageView.image = nil
            label.text = ""
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessColorMixingShowVC") as! GuessColorMixingShowVC
        vc.colors = colorMixData1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessColorMixingShowVC") as! GuessColorMixingShowVC
        vc.colors = colorMixData2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "guessColorMixingLevelData")
        updateLevelImages()
        updateResetVisibility()
    }
    
}
