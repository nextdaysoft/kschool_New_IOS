//
//  IdentifyLetterResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 20/03/26.
//

import UIKit

class IdentifyLetterResultVC: BaseViewController {
    
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
    @IBOutlet weak var labelk: UILabel!
    @IBOutlet weak var labell: UILabel!
    @IBOutlet weak var labelm: UILabel!
    @IBOutlet weak var labeln: UILabel!
    @IBOutlet weak var labelo: UILabel!
    @IBOutlet weak var labelp: UILabel!
    @IBOutlet weak var labelq: UILabel!
    @IBOutlet weak var labelr: UILabel!
    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var labelt: UILabel!
    @IBOutlet weak var labelu: UILabel!
    @IBOutlet weak var labelv: UILabel!
    @IBOutlet weak var labelw: UILabel!
    @IBOutlet weak var labelx: UILabel!
    @IBOutlet weak var labely: UILabel!
    @IBOutlet weak var labelz: UILabel!
    
    
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
    @IBOutlet weak var viewk: UIView!
    @IBOutlet weak var viewl: UIView!
    @IBOutlet weak var viewm: UIView!
    @IBOutlet weak var viewn: UIView!
    @IBOutlet weak var viewo: UIView!
    @IBOutlet weak var viewp: UIView!
    @IBOutlet weak var viewq: UIView!
    @IBOutlet weak var viewr: UIView!
    @IBOutlet weak var views: UIView!
    @IBOutlet weak var viewt: UIView!
    @IBOutlet weak var viewu: UIView!
    @IBOutlet weak var viewv: UIView!
    @IBOutlet weak var vieww: UIView!
    @IBOutlet weak var viewx: UIView!
    @IBOutlet weak var viewy: UIView!
    @IBOutlet weak var viewz: UIView!
    
    var results: [Bool] = []
    
    var finalScore: Int = 0
    
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
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            scoreBGVIew.backgroundColor = .white

            nextBtn.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreBGVIew.backgroundColor = color

            nextBtn.backgroundColor = color
        }
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
    }
    
    func setupUI() {

        let labelsArray = [
            labela,labelb,labelc,labeld,labele,labelf,labelg,labelh,labeli,labelj,labelk,labell,
            labelm,labeln,labelo,labelp,labelq,labelr,labels,labelt,labelu,labelv,labelw,labelx,labely,labelz
        ]

        let viewsArray = [
            viewa,viewb,viewc,viewd,viewe,viewf,viewg,viewh,viewi,viewj,viewk,viewl,
            viewm,viewn,viewo,viewp,viewq,viewr,views,viewt,viewu,viewv,vieww,viewx,viewy,viewz
        ]

        for index in 0..<viewsArray.count {

            let alphabets = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            labelsArray[index]?.text = String(alphabets[index])

            viewsArray[index]?.layer.cornerRadius = 10
            viewsArray[index]?.layer.borderWidth = 3

            if index < results.count {

                if results[index] {

                    // ✅ correct
                    viewsArray[index]?.layer.borderColor = UIColor.systemGreen.cgColor

                } else {

                    // ❌ wrong
                    viewsArray[index]?.layer.borderColor = UIColor.systemRed.cgColor
                }

            } else {

                viewsArray[index]?.layer.borderColor = UIColor.lightGray.cgColor
            }
        }

        scoreLabel.text = "Score : \(finalScore) / 26"
    }
    
    func calculatePercentage() -> Int {
        return finalScore * 10
    }
    
    @IBAction func backBtn(_ sender: Any) {
        goToMenu()
    }
    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        goToMenu()
    }
    
    func goToMenu() {
        UserDefaults.standard.set(true, forKey: "letterLevel6Completed")
        let percentage = Int((Double(finalScore) / 26.0) * 100)
        UserDefaults.standard.set(percentage, forKey: "letterLevel6Percentage")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is LetterMenuVC }
        ) as? LetterMenuVC {

            navigationController?.popToViewController(menuVC, animated: true)
        }
    }


}
