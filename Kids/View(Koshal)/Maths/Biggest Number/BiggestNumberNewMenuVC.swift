//
//  BiggestNumberNewMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 15/04/26.
//
import LanguageManager_iOS
struct QuestionGenerator {
    
    static func generateQuestions(range: ClosedRange<Int>, count: Int = 10, isBiggest: Bool) -> [BiggestNumberQuestion] {
        
        var questions: [BiggestNumberQuestion] = []
        
        for _ in 0..<count {
            
            var numbers: Set<Int> = []
            
            while numbers.count < 4 {
                numbers.insert(Int.random(in: range))
            }
            
            let options = Array(numbers)
            
            let correct = isBiggest ? (options.max() ?? 0) : (options.min() ?? 0)
            
            questions.append(BiggestNumberQuestion(options: options, correctAnswer: correct))
        }
        
        return questions
    }
}


import UIKit

class BiggestNumberNewMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    
    @IBOutlet weak var titelLbl: UILabel!
    
    var isBiggestMode: Bool = true
    
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
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10
      
        
        if isBiggestMode {
            titelLbl.text = "Biggest Number Level".localiz()
        } else {
            titelLbl.text = "Smallest Number Level".localiz()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
        updateLevelUI(level: 5, imageView: image5, label: label5)
        updateLevelUI(level: 6, imageView: image6, label: label6)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let mode = isBiggestMode ? "biggest" : "smallest"

        let completedKey = "\(mode)Level\(level)Completed"
        let percentageKey = "\(mode)Level\(level)Percentage"

        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: percentageKey)
            label.text = "\(percentage)%"
        } else {
            imageView.image = nil
            label.text = ""
        }
    }
    
    func updateResetVisibility() {

        let mode = isBiggestMode ? "biggest" : "smallest"

        var isAnyCompleted = false

        for i in 1...6 {
            if UserDefaults.standard.bool(forKey: "\(mode)Level\(i)Completed") {
                isAnyCompleted = true
                break
            }
        }

        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
    }

    func applyTheme() {

        let whiteTheme = UserDefaults.standard.bool(forKey: "WhiteTheme")

        if whiteTheme {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            viewBG1.backgroundColor = .white
            viewBG2.backgroundColor = .white
            viewBG3.backgroundColor = .white
            viewBG4.backgroundColor = .white
            viewBG5.backgroundColor = .white
            viewBG6.backgroundColor = .white

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
        let vc = storyboard?.instantiateViewController(withIdentifier: "BiggestNumberNewShowVC") as! BiggestNumberNewShowVC
        
        vc.questions = QuestionGenerator.generateQuestions(
            range: 1...100,
            isBiggest: isBiggestMode
        )
        
        vc.isBiggestMode = isBiggestMode   // ✅ ADD THIS
        vc.levelNumber = 1
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BiggestNumberNewShowVC") as! BiggestNumberNewShowVC
        
        vc.questions = QuestionGenerator.generateQuestions(
            range: 100...200,
            isBiggest: isBiggestMode
        )
        
        vc.isBiggestMode = isBiggestMode
        vc.levelNumber = 2
        
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BiggestNumberNewShowVC") as! BiggestNumberNewShowVC
        
        vc.questions = QuestionGenerator.generateQuestions(
            range: 200...300,
            isBiggest: isBiggestMode
        )
        
        vc.isBiggestMode = isBiggestMode
        vc.levelNumber = 3   // ✅ FIX
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BiggestNumberNewShowVC") as! BiggestNumberNewShowVC
        
        vc.questions = QuestionGenerator.generateQuestions(
            range: 300...400,
            isBiggest: isBiggestMode
        )
        
        vc.isBiggestMode = isBiggestMode
        vc.levelNumber = 4
        
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BiggestNumberNewShowVC") as! BiggestNumberNewShowVC
        
        vc.questions = QuestionGenerator.generateQuestions(
            range: 400...500,
            isBiggest: isBiggestMode
        )
        
        vc.isBiggestMode = isBiggestMode
        vc.levelNumber = 5
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BiggestNumberNewShowVC") as! BiggestNumberNewShowVC
        
        vc.questions = QuestionGenerator.generateQuestions(
            range: 1...500,
            isBiggest: isBiggestMode
        )
        
        vc.isBiggestMode = isBiggestMode
        vc.levelNumber = 6
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard

        let mode = isBiggestMode ? "biggest" : "smallest"

        for i in 1...6 {
            defaults.removeObject(forKey: "\(mode)Level\(i)Completed")
            defaults.removeObject(forKey: "\(mode)Level\(i)Percentage")
        }

        defaults.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
