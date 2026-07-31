//
//  MathOperationsResultVC.swift
//  New
//
//  Created by Koshal Singh on 21/04/26.
//

import UIKit

class MathOperationsResultVC: BaseViewController {

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
    @IBOutlet var lbl5Array: [UILabel]!
    @IBOutlet var lbl6Array: [UILabel]!

    @IBOutlet var ans1Array: [UILabel]!
    @IBOutlet var ans2Array: [UILabel]!
    @IBOutlet var ans3Array: [UILabel]!

    @IBOutlet var ansBg1Array: [UIView]!
    @IBOutlet var ansBg2Array: [UIView]!
    @IBOutlet var ansBg3Array: [UIView]!

    @IBOutlet var resultImgArray: [UIImageView]!
    @IBOutlet var signArray: [UILabel]!
    
    var results: [AddSubResult] = []
    var score: Int = 0
    var level: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        
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
        
        for view in ansBg3Array {
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

            scoreBGView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreBGView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)
        }
    }
    
    func saveLevelResult() {

        let percentage = Int((Double(score) / 10.0) * 100.0)

        UserDefaults.standard.set(true,
                                  forKey: "additionLevel\(level)Completed")

        UserDefaults.standard.set(percentage,
                                  forKey: "additionLevel\(level)Percentage")

        UserDefaults.standard.synchronize()
    }
    
    func setupResults() {

        for i in 0..<min(results.count, 10) {

            let data = results[i]

            // 3 digit string
            let left = String(format: "%03d", data.leftNumber)
            let right = String(format: "%03d", data.rightNumber)
            let ans = String(format: "%03d", Int(data.userAnswer) ?? 0)

            // Top Number
            lbl1Array[i].text = String(left[left.startIndex])
            lbl2Array[i].text = String(left[left.index(left.startIndex, offsetBy: 1)])
            lbl5Array[i].text = String(left[left.index(left.startIndex, offsetBy: 2)])

            // Bottom Number
            lbl3Array[i].text = String(right[right.startIndex])
            lbl4Array[i].text = String(right[right.index(right.startIndex, offsetBy: 1)])
            lbl6Array[i].text = String(right[right.index(right.startIndex, offsetBy: 2)])

            // Answer
            ans1Array[i].text = String(ans[ans.startIndex])
            ans2Array[i].text = String(ans[ans.index(ans.startIndex, offsetBy: 1)])
            ans3Array[i].text = String(ans[ans.index(ans.startIndex, offsetBy: 2)])

            // Show all digits
            lbl1Array[i].isHidden = false
            lbl2Array[i].isHidden = false
            lbl3Array[i].isHidden = false
            lbl4Array[i].isHidden = false

            ans1Array[i].isHidden = false
            ansBg1Array[i].isHidden = false

            // Sign
            signArray[i].text = data.isSign ? "+" : "-"

            // Result Image
            resultImgArray[i].image = UIImage(
                named: data.isCorrect ? "check mark" : "close"
            )

            // Color
            let color = data.isCorrect ? UIColor.systemGreen : UIColor.systemRed
            ansBg1Array[i].backgroundColor = color
            ansBg2Array[i].backgroundColor = color
            ansBg3Array[i].backgroundColor = color
        }
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {

        saveLevelResult()

        if let vc = navigationController?.viewControllers.first(where: {
            $0 is AdditionLevelMenuVC
        }) {
            navigationController?.popToViewController(vc, animated: true)
        }
    }
    
    @IBAction func nextTap(_ sender: UIButton) {
        saveLevelResult()

        if let vc = navigationController?.viewControllers.first(where: {
            $0 is AdditionLevelMenuVC
        }) {
            navigationController?.popToViewController(vc, animated: true)
        }
    }
    
    
}
