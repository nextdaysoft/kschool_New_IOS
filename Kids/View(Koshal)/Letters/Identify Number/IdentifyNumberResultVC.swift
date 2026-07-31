//
//  IdentifyNumberResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 20/03/26.
//

import UIKit

class IdentifyNumberResultVC: BaseViewController {

    @IBOutlet weak var scoreBGVIew: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    @IBOutlet weak var labela: UILabel!
    @IBOutlet weak var labelb: UILabel!
    @IBOutlet weak var labelc: UILabel!
    @IBOutlet weak var labeld: UILabel!
    @IBOutlet weak var labele: UILabel!
    @IBOutlet weak var labelf: UILabel!
    @IBOutlet weak var labelg: UILabel!
    @IBOutlet weak var labelh: UILabel!
    @IBOutlet weak var labeli: UILabel!
    @IBOutlet weak var labelj: UILabel!
    
    
    
    @IBOutlet weak var viewa: UIView!
    @IBOutlet weak var viewb: UIView!
    @IBOutlet weak var viewc: UIView!
    @IBOutlet weak var viewd: UIView!
    @IBOutlet weak var viewe: UIView!
    @IBOutlet weak var viewf: UIView!
    @IBOutlet weak var viewg: UIView!
    @IBOutlet weak var viewh: UIView!
    @IBOutlet weak var viewi: UIView!
    @IBOutlet weak var viewj: UIView!
   
    
    
    var finalScore: Int = 0
    var results: [Int: Bool] = [:]
    var levelNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
        setupUI()
   
        scoreBGVIew.layer.cornerRadius = 10
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
        nextBtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            scoreBGVIew.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreBGVIew.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)
        }
    }
    
    func setupUI() {

        let labels = [
            labela,labelb,labelc,labeld,labele,
            labelf,labelg,labelh,labeli,labelj
        ]

        let views = [
            viewa,viewb,viewc,viewd,viewe,
            viewf,viewg,viewh,viewi,viewj
        ]

        let startNumber = ((levelNumber - 1) * 10) + 1

        for i in 0..<labels.count {

            // ✅ Show actual level numbers
            labels[i]?.text = "\(startNumber + i)"

            views[i]?.layer.cornerRadius = 10
            views[i]?.layer.borderWidth = 3

            if let isCorrect = results[i] {

                if isCorrect {
                    views[i]?.layer.borderColor = UIColor.systemGreen.cgColor
                } else {
                    views[i]?.layer.borderColor = UIColor.systemRed.cgColor
                }

            } else {
                views[i]?.layer.borderColor = UIColor.systemRed.cgColor
            }
        }

        scoreLabel.text = "Score : \(finalScore) / 10"
    }
    
    func calculatePercentage() -> Int {
        return finalScore * 10
    }
    
    @IBAction func backBtn(_ sender: Any) {
        goToMenu(markCompleted: true)
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu(markCompleted: true)
    }

    func goToMenu(markCompleted: Bool = true) {

        if markCompleted {

            let percentage = Int((Double(finalScore) / 10.0) * 100)

            let completedKey = "identifyNumberLevel\(levelNumber)Completed"
            let percentageKey = "identifyNumberLevel\(levelNumber)Percentage"

            UserDefaults.standard.set(true, forKey: completedKey)
            UserDefaults.standard.set(percentage, forKey: percentageKey)
        }

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is IdentifyNumberMenuVC }
        ) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }

}
