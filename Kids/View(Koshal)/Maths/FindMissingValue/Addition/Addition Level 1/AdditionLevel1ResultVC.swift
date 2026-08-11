//
//  AdditionLevel1ResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 08/06/26.
//

import UIKit

class AdditionLevel1ResultVC: BaseViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titelLbl: UILabel!
    
    @IBOutlet weak var scoreBGView: UIView!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    @IBOutlet weak var bgView1: UIView!
    @IBOutlet weak var bgView2: UIView!
    @IBOutlet weak var bgView3: UIView!
    @IBOutlet weak var bgView4: UIView!
    @IBOutlet weak var bgView5: UIView!
    @IBOutlet weak var bgView6: UIView!
    @IBOutlet weak var bgView7: UIView!
    @IBOutlet weak var bgView8: UIView!
    @IBOutlet weak var bgView9: UIView!
    @IBOutlet weak var bgView10: UIView!
    
    
    @IBOutlet var lbl1Array: [UILabel]!
    @IBOutlet var lbl2Array: [UILabel]!
    @IBOutlet var lbl3Array: [UILabel]!
    @IBOutlet var lbl4Array: [UILabel]!
    
   
    @IBOutlet var ans1Array: [UILabel]!
    @IBOutlet var ans2Array: [UILabel]!
    
    @IBOutlet var ansBg1Array: [UIView]!
    @IBOutlet var ansBg2Array: [UIView]!
   

    @IBOutlet var resultImgArray: [UIImageView]!
    @IBOutlet var signArray: [UILabel]!

    var mode: AddSubMode = .addition
    var score: Int = 0
    var results: [AddSubResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()

        if mode == .addition {
            titelLbl.text = "Addition"
        } else {
            titelLbl.text = "Find The Number"
        }

        scoreLbl.text = "Score : \(score) / 10"
        setupResults()

        bgView1.layer.cornerRadius = 10
        bgView2.layer.cornerRadius = 10
        bgView3.layer.cornerRadius = 10
        bgView4.layer.cornerRadius = 10
        bgView5.layer.cornerRadius = 10
        bgView6.layer.cornerRadius = 10
        bgView7.layer.cornerRadius = 10
        bgView8.layer.cornerRadius = 10
        bgView9.layer.cornerRadius = 10
        bgView10.layer.cornerRadius = 10

        for view in ansBg1Array {
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
        }

        for view in ansBg2Array {
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
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
        nextBtn.layer.cornerRadius = 6
        scoreBGView.layer.cornerRadius = 6
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

    func saveLevelResult() {

        let percentage = Int((Double(score) / 10.0) * 100.0)

        if mode == .addition {

            UserDefaults.standard.set(true,
                                      forKey: "additionLevel1Completed")

            UserDefaults.standard.set(percentage,
                                      forKey: "additionLevel1Percentage")

        } else {

            UserDefaults.standard.set(true,
                                      forKey: "mathOperationsLevel2Completed")

            UserDefaults.standard.set(percentage,
                                      forKey: "mathOperationsLevel2Percentage")
        }

        UserDefaults.standard.synchronize()
    }
    
    func setupResults() {

        let maxCount = min(
            results.count,
            lbl1Array.count,
            lbl2Array.count,
            lbl3Array.count,
            lbl4Array.count,
            ans1Array.count,
            ans2Array.count,
            ansBg1Array.count,
            ansBg2Array.count,
            resultImgArray.count,
            signArray.count
        )

        for i in 0..<maxCount {

            let data = results[i]

            // MARK: - Question Numbers

            let left = String(format: "%02d", data.leftNumber)
            let right = String(format: "%02d", data.rightNumber)

            // LEFT NUMBER
            lbl1Array[i].isHidden = false
            lbl2Array[i].isHidden = false

            lbl1Array[i].text = String(
                left[left.startIndex]
            )

            lbl2Array[i].text = String(
                left[left.index(after: left.startIndex)]
            )

            // RIGHT NUMBER
            lbl3Array[i].isHidden = false
            lbl4Array[i].isHidden = false

            lbl3Array[i].text = String(
                right[right.startIndex]
            )

            lbl4Array[i].text = String(
                right[right.index(after: right.startIndex)]
            )

            // MARK: - Sign

            signArray[i].text = data.isSign ? "+" : "-"

            // MARK: - Answer

            let userAnswer = Int(data.userAnswer) ?? 0
            let correctAnswer = Int(data.correctAnswer) ?? 0

            // IMPORTANT:
            // Actual answer compare karo
            let isCorrect = userAnswer == correctAnswer

            let formatted = String(
                format: "%02d",
                userAnswer
            )

            ans1Array[i].isHidden = false
            ans2Array[i].isHidden = false

            ansBg1Array[i].isHidden = false
            ansBg2Array[i].isHidden = false

            // First digit
            ans1Array[i].text = String(
                formatted[formatted.startIndex]
            )

            // Second digit
            ans2Array[i].text = String(
                formatted[
                    formatted.index(
                        after: formatted.startIndex
                    )
                ]
            )

            // MARK: - Correct / Wrong Image

            resultImgArray[i].isHidden = false

            if isCorrect {

                // ✅ CORRECT
                resultImgArray[i].image = UIImage(named: "check mark")

                ansBg1Array[i].backgroundColor = .systemGreen
                ansBg2Array[i].backgroundColor = .systemGreen

            } else {

                // ❌ WRONG
                resultImgArray[i].image = UIImage(named: "close")

                ansBg1Array[i].backgroundColor = .systemRed
                ansBg2Array[i].backgroundColor = .systemRed
            }
        }

        view.layoutIfNeeded()
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {

        saveLevelResult()

        if mode == .addition {

            if let vc = navigationController?.viewControllers.first(where: {
                $0 is AdditionLevelMenuVC
            }) {
                navigationController?.popToViewController(vc, animated: true)
            }

        } else {

            if let vc = navigationController?.viewControllers.first(where: {
                $0 is MathOperationsMenuVC
            }) {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func nextTap(_ sender: UIButton) {

        saveLevelResult()

        if mode == .addition {

            if let vc = navigationController?.viewControllers.first(where: {
                $0 is AdditionLevelMenuVC
            }) {
                navigationController?.popToViewController(vc, animated: true)
            }

        } else {

            if let vc = navigationController?.viewControllers.first(where: {
                $0 is MathOperationsMenuVC
            }) {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    
    
}
