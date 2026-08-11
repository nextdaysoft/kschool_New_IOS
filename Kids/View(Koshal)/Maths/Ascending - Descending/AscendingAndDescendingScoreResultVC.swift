//
//  AscendingAndDescendingScoreResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 16/04/26.
//

import UIKit

class AscendingAndDescendingScoreResultVC: BaseViewController {

    @IBOutlet weak var labelBGView1: UIView!
    @IBOutlet weak var labelBGView2: UIView!
    @IBOutlet weak var labelBGView3: UIView!
    @IBOutlet weak var labelBGView4: UIView!
    @IBOutlet weak var labelBGView5: UIView!
    @IBOutlet weak var labelBGView6: UIView!
    @IBOutlet weak var labelBGView7: UIView!
    @IBOutlet weak var labelBGView8: UIView!
    @IBOutlet weak var labelBGView9: UIView!
    @IBOutlet weak var labelBGView10: UIView!
    
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
    
    
    @IBOutlet weak var scoreBGVIew: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var titelLbl: UILabel!
    
    var results: [QuestionResultsLevel1] = []
    var finalScore: Int = 0
    var screenTitleText: String = ""
    
    var resultsData: [(numbers: [Int], isCorrect: Bool)] = []
    
    var totalScore: Int = 10   // total questions
    var levelNumber: Int = 1   // jo level chal raha hai
    
    var isAscending: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        
        nextBtn.layer.cornerRadius = 10
        
        scoreBGVIew.layer.cornerRadius = 10
        
        scoreLabel.text = "Score: \(finalScore) / 10"
        titelLbl.text = screenTitleText

        let labels = [label1, label2, label3, label4, label5,
                      label6, label7, label8, label9, label10]

        let bgViews = [labelBGView1, labelBGView2, labelBGView3,
                       labelBGView4, labelBGView5, labelBGView6,
                       labelBGView7, labelBGView8, labelBGView9,
                       labelBGView10]

        for i in 0..<resultsData.count {

            let item = resultsData[i]

            let text = item.numbers.map { String($0) }.joined(separator: "\n")
            labels[i]?.text = text

            bgViews[i]?.layer.cornerRadius = 15
            bgViews[i]?.layer.borderWidth = 3

            if item.isCorrect {
                bgViews[i]?.layer.borderColor = UIColor.systemGreen.cgColor
            } else {
                bgViews[i]?.layer.borderColor = UIColor.systemRed.cgColor
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
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

            nextBtn.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
        }
    }
    
    func resultImage(for percentage: Int) -> UIImage? {
        return UIImage(named: "well-done")
    }
    
    func capitalizeFirstLetter(_ text: String) -> String {
        guard let first = text.first else { return text }
        return String(first).uppercased() + text.dropFirst()
    }
    
    func calculatePercentage() -> Int {
        return finalScore * 10
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu()
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {
        goToMenu()
    }
    
    func goToMenu() {

        let percentage = (finalScore * 100) / totalScore

        // ✅ mode based key
        let mode = isAscending ? "ascending" : "descending"

        let completedKey = "\(mode)Level\(levelNumber)Completed"
        let percentageKey = "\(mode)Level\(levelNumber)Percentage"

        UserDefaults.standard.set(true, forKey: completedKey)
        UserDefaults.standard.set(percentage, forKey: percentageKey)

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is AscendingAndDescendingMenuVC }
        ) as? AscendingAndDescendingMenuVC {

            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    func getImageView(for level: Int, vc: AscendingAndDescendingMenuVC) -> UIImageView {
        switch level {
        case 1: return vc.image1
        case 2: return vc.image2
        case 3: return vc.image3
        case 4: return vc.image4
        case 5: return vc.image5
        case 6: return vc.image6
        default: return vc.image1
        }
    }

    func getLabel(for level: Int, vc: AscendingAndDescendingMenuVC) -> UILabel {
        switch level {
        case 1: return vc.label1
        case 2: return vc.label2
        case 3: return vc.label3
        case 4: return vc.label4
        case 5: return vc.label5
        case 6: return vc.label6
        default: return vc.label1
        }
    }
    
    
}
