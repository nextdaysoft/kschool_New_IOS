//
//  AscendingAndDescendingResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 16/04/26.
//

import UIKit

class AscendingAndDescendingResultVC: BaseViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
  
   
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!

    @IBOutlet weak var titelLbl: UILabel!
    @IBOutlet weak var texLbl: UILabel!
    
    @IBOutlet weak var questionLbl: UILabel!
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var scoreBGView: UIView!
    
    
    var userOrder: [String] = []
    var correctOrder: [String] = []
    
    var currentQuestionIndex: Int = 0
    var totalQuestions: Int = 10
    var score: Int = 0
    var results: [(numbers: [Int], isCorrect: Bool)] = []
    var isAscending: Bool = true
    
    var levelNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        showResults()
        
        nextBtn.layer.cornerRadius = 10
        
        if isAscending {
              titelLbl.text = "Ascending Order"
              texLbl.text = "Rearrange the numbers in ascending order"
          } else {
              titelLbl.text = "Descending Order"
              texLbl.text = "Rearrange the numbers in descending order"
          }

        
        questionLbl.text = "Question \(currentQuestionIndex + 1)"
        scoreLbl.text = "Score: \(score) / \(currentQuestionIndex + 1)"
        scoreBGView.layer.cornerRadius = 10
        
        nextBtn.layer.cornerRadius = 10

        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
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
    
    func setCornerRadius() {
        let views = [view1, view2, view3, view4]
        
        for view in views {
            view?.layer.cornerRadius = 12   // yahan radius adjust kar sakte ho
            view?.layer.masksToBounds = true
        }
    }
    
    func textWithGreenCheck(_ text: String) -> NSAttributedString {

        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "check mark")?.withRenderingMode(.alwaysTemplate)
        attachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16)

        let imageString = NSAttributedString(attachment: attachment)

        let textString = NSAttributedString(
            string: "  \(text)",
            attributes: [
                .foregroundColor: UIColor.systemGreen,
                .font: UIFont.systemFont(ofSize: 16, weight: .medium)
            ]
        )

        let finalString = NSMutableAttributedString()
        finalString.append(imageString)
        finalString.append(textString)

        return finalString
    }
    
    func showResults() {

        let imageViews = [img1, img2, img3, img4]
        let labels = [label1, label2, label3, label4]

        for i in 0..<userOrder.count {

            // ✅ Always show user number only
            labels[i]?.text = userOrder[i]

            if userOrder[i] == correctOrder[i] {

                imageViews[i]?.image = UIImage(named: "check mark")
                labels[i]?.textColor = .black   // normal

            } else {

                imageViews[i]?.image = UIImage(named: "close")
                labels[i]?.textColor = .black   // ❗ color bhi normal rakho
            }
        }
    }

    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
    }
    
    func calculatePercentage() -> Int {
        let correctCount = zip(userOrder, correctOrder)
            .filter { $0 == $1 }
            .count

        // 8 planets → each = 12.5%
        let percentage = Int((Double(correctCount) / Double(correctOrder.count)) * 100)
        return percentage
    }
    
    func passResultToScienceMenu() {

        let percentage = calculatePercentage()

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is CalendarMenuVC }
        ) as? CalendarMenuVC {
            
            // ✅ Save completion
            UserDefaults.standard.set(true, forKey: "calendarLevel3Completed")
            
            // ✅ Pass percentage
            menuVC.level3Percentage = percentage
            
            navigationController?.popToViewController(menuVC, animated: false)
        }
    }
    
    func goToMenu() {

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is AscendingAndDescendingMenuVC }
        ) {
            navigationController?.popToViewController(menuVC, animated: true)
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        goToMenu()
    }
    
 
    @IBAction func nextTapBtn(_ sender: Any) {

        if self.currentQuestionIndex + 1 < self.totalQuestions {

            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

            let vc = storyboard.instantiateViewController(
                withIdentifier: "AscendingAndDescendingShowVC"
            ) as! AscendingAndDescendingShowVC

            vc.currentQuestionIndex = self.currentQuestionIndex + 1
            vc.score = self.score
            vc.results = self.results
            vc.isAscending = self.isAscending
            vc.levelNumber = self.levelNumber
            navigationController?.pushViewController(vc, animated: false)

        } else {

            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

            let vc = storyboard.instantiateViewController(
                withIdentifier: "AscendingAndDescendingScoreResultVC"
            ) as! AscendingAndDescendingScoreResultVC

            vc.finalScore = self.score
            vc.resultsData = self.results
            vc.screenTitleText = self.isAscending ? "Ascending Order" : "Descending Order"
            vc.isAscending = self.isAscending
            vc.levelNumber = self.levelNumber
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
