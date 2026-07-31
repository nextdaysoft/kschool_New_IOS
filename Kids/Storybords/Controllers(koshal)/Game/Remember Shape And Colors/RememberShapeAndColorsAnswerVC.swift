//
//  RememberShapeAndColorsAnswerVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 29/12/25.
//

import UIKit

class RememberShapeAndColorsAnswerVC: BaseViewController {

    @IBOutlet weak var displayImg1: UIImageView!
    @IBOutlet weak var displayImg2: UIImageView!
    @IBOutlet weak var displayImg3: UIImageView!
    @IBOutlet weak var displayImg4: UIImageView!
    
    
    @IBOutlet weak var answerImg1: UIImageView!
    @IBOutlet weak var answerImg2: UIImageView!
    @IBOutlet weak var answerImg3: UIImageView!
    @IBOutlet weak var answerImg4: UIImageView!
    
    
    @IBOutlet weak var rightOrWrongImg1: UIImageView!
    @IBOutlet weak var rightOrWrongImg2: UIImageView!
    @IBOutlet weak var rightOrWrongImg3: UIImageView!
    @IBOutlet weak var rightOrWrongImg4: UIImageView!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    var shapesData: [ShapeColorData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationItem.hidesBackButton = true
        setupResult()
       
    }
    
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        nextBtn.backgroundColor = color
        nextBtn.layer.cornerRadius = 6
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        goToGameMenu()
    }
 
    
    func setupResult() {
        let displayImgs = [displayImg1, displayImg2, displayImg3, displayImg4]
        let answerImgs  = [answerImg1, answerImg2, answerImg3, answerImg4]
        let resultImgs  = [rightOrWrongImg1, rightOrWrongImg2, rightOrWrongImg3, rightOrWrongImg4]

        for i in 0..<shapesData.count {
            let data = shapesData[i]

            
            displayImgs[i]?.image = UIImage(
                named: data.templateImageName
            )?.withRenderingMode(.alwaysTemplate)
            displayImgs[i]?.tintColor = data.correctColor


            answerImgs[i]?.image = UIImage(
                named: data.templateImageName
            )?.withRenderingMode(.alwaysTemplate)
            answerImgs[i]?.tintColor = data.selectedColor ?? .systemGray


            let isCorrect = data.correctColor == data.selectedColor
            resultImgs[i]?.image = UIImage(
                named: isCorrect ? "check mark" : "close"
            )
        }
    }
    
    func calculatePercentage() -> Int {
        var correct = 0

        for data in shapesData {
            if data.correctColor == data.selectedColor {
                correct += 1
            }
        }

        // 4 shapes → each = 25%
        return correct * 25
    }
    
    func goToGameMenu() {
        let percentage = calculatePercentage()

        UserDefaults.standard.set(true, forKey: "gameLevel3Completed")
        UserDefaults.standard.set(percentage, forKey: "gameLevel3Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is GameMenuVC }
        ) as? GameMenuVC {

            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {

        let percentage = calculatePercentage()

        // Save result
        UserDefaults.standard.set(true, forKey: "gameLevel3Completed")
        UserDefaults.standard.set(percentage, forKey: "gameLevel3Percentage")

        if let nav = navigationController {
            for vc in nav.viewControllers {
                if let rememberVC = vc as? RememberShapeAndColorVC {
                    nav.popToViewController(rememberVC, animated: true)
                    return
                }
            }
        }
    }
    
    
}
