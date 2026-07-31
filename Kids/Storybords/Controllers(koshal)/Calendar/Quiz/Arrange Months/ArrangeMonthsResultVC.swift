//
//  ArrangeMonthsResultVC.swift
//  KSchool
//
//  Created by Koshal Singh on 03/04/26.
//

import UIKit

class ArrangeMonthsResultVC: BaseViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: UIView!
    
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
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
   
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var img10: UIImageView!
    @IBOutlet weak var img11: UIImageView!
    @IBOutlet weak var img12: UIImageView!
    
    @IBOutlet weak var resultLabel1: UILabel!
    @IBOutlet weak var resultLabel2: UILabel!
    @IBOutlet weak var resultLabel3: UILabel!
    @IBOutlet weak var resultLabel4: UILabel!
    @IBOutlet weak var resultLabel5: UILabel!
    @IBOutlet weak var resultLabel6: UILabel!
    @IBOutlet weak var resultLabel7: UILabel!
    @IBOutlet weak var resultLabel8: UILabel!
    @IBOutlet weak var resultLabel9: UILabel!
    @IBOutlet weak var resultLabel10: UILabel!
    @IBOutlet weak var resultLabel11: UILabel!
    @IBOutlet weak var resultLabel12: UILabel!
    
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!

    
    var userOrder: [String] = []

    let correctOrder = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        showResults()
        setCornerRadius()
        nextBtn.layer.cornerRadius = 10
        
        nextBtn.layer.cornerRadius = 10
        nextBtn.backgroundColor = ColorManager.randomColor()
        nextBtn.layer.borderColor = UIColor.black.cgColor

        
        view1.layer.cornerRadius = 10
        view1.backgroundColor = ColorManager.randomColor()
        
        view2.layer.cornerRadius = 10
        view2.backgroundColor = ColorManager.randomColor()
        view2.layer.borderColor = UIColor.black.cgColor
        
        view3.layer.cornerRadius = 10
        view3.backgroundColor = ColorManager.randomColor()
        
        view4.layer.cornerRadius = 10
        view4.backgroundColor = ColorManager.randomColor()
        
        view5.layer.cornerRadius = 10
        view5.backgroundColor = ColorManager.randomColor()
        
        view6.layer.cornerRadius = 10
        view6.backgroundColor = ColorManager.randomColor()
        
        view7.layer.cornerRadius = 10
        view7.backgroundColor = ColorManager.randomColor()
     
        view8.layer.cornerRadius = 10
        view8.backgroundColor = ColorManager.randomColor()
        
        view9.layer.cornerRadius = 10
        view9.backgroundColor = ColorManager.randomColor()
       
        view10.layer.cornerRadius = 10
        view10.backgroundColor = ColorManager.randomColor()
        
        view11.layer.cornerRadius = 10
        view11.backgroundColor = ColorManager.randomColor()
        
        view12.layer.cornerRadius = 10
        view12.backgroundColor = ColorManager.randomColor()
    }
    
    
    func setCornerRadius() {
        let views = [view1, view2, view3, view4, view5, view6, view7, view8, view9, view10, view11, view12]
        
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

        let imageViews = [img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12]
        let resultLabels = [
            resultLabel1, resultLabel2, resultLabel3, resultLabel4,
            resultLabel5, resultLabel6, resultLabel7, resultLabel8,
            resultLabel9, resultLabel10, resultLabel11, resultLabel12
        ]

        for i in 0..<correctOrder.count {

            if userOrder[i] == correctOrder[i] {

                // ✅ Planet already correct → kuch bhi show nahi karna
                imageViews[i]?.image = UIImage(named: "check mark")
                resultLabels[i]?.text = ""
                resultLabels[i]?.attributedText = nil

            } else {

                imageViews[i]?.image = UIImage(named: "close")

                let textString = NSAttributedString(
                    string: "\(correctOrder[i]) ",
                    attributes: [
                        .foregroundColor: UIColor.systemGreen,
                        .font: resultLabels[i]?.font ?? UIFont.systemFont(ofSize: 16)
                    ]
                )

                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "check mark")?
                    .withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
                attachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16)

                let imageString = NSAttributedString(attachment: attachment)

                let finalText = NSMutableAttributedString()
                finalText.append(textString)
                finalText.append(imageString)

                resultLabels[i]?.attributedText = finalText
            }
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
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        passResultToScienceMenu()
    }
 

    @IBAction func nextTapBtn(_ sender: Any) {
        passResultToScienceMenu()
    }
    
}
