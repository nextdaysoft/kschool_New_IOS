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
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    var viewColors: [UIColor] = []
    
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
            nextBtn.backgroundColor = .white
            
            view1.backgroundColor = .white
            view2.backgroundColor = .white
            view3.backgroundColor = .white
            view4.backgroundColor = .white
            
        } else {
            
            let color = ColorManager.randomColor()
            
            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
            
            nextBtn.backgroundColor = color
            
            if viewColors.count == 4 {
                view1.backgroundColor = viewColors[0]
                view2.backgroundColor = viewColors[1]
                view3.backgroundColor = viewColors[2]
                view4.backgroundColor = viewColors[3]
            }
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

        if let menuVC = navigationController?.viewControllers.last(where: {
            $0 is AscendingAndDescendingMenuVC
        }) {

            navigationController?.popToViewController(menuVC, animated: true)
        }
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
    
    func createPDF() -> URL? {

        let pdfName = isAscending ? "Ascending Order" : "Descending Order"

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("\(pdfName).pdf")

        view.layoutIfNeeded()

        // Capture all number views + result images
        let captureViews: [UIView] = [
            view1,
            view2,
            view3,
            view4,
            img1,
            img2,
            img3,
            img4
        ]

        guard let firstView = captureViews.first else { return nil }

        var captureRect = firstView.superview?.convert(firstView.frame, to: view) ?? firstView.frame

        for item in captureViews.dropFirst() {

            let rect: CGRect

            if let superView = item.superview {
                rect = superView.convert(item.frame, to: view)
            } else {
                rect = item.frame
            }

            captureRect = captureRect.union(rect)
        }

        // Extra padding so nothing gets cut
        captureRect.origin.x -= 30
        captureRect.origin.y -= 30
        captureRect.size.width += 60
        captureRect.size.height += 60

        let renderer = UIGraphicsImageRenderer(size: captureRect.size)

        let image = renderer.image { _ in

            let hiddenViews: [UIView] = [
                HeaderView,
                statusView,
                backBtn,
                pdfBtn,
                nextBtn,
                titelLbl,
                texLbl,
                questionLbl,
                scoreLbl,
                scoreBGView
            ]

            hiddenViews.forEach { $0.isHidden = true }

            self.view.layoutIfNeeded()

            self.view.drawHierarchy(
                in: CGRect(
                    x: -captureRect.origin.x,
                    y: -captureRect.origin.y,
                    width: self.view.bounds.width,
                    height: self.view.bounds.height
                ),
                afterScreenUpdates: true
            )

            hiddenViews.forEach { $0.isHidden = false }

            self.view.layoutIfNeeded()
        }

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let pdfRenderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                let title = isAscending
                ? "Rearrange the numbers in ascending order."
                : "Rearrange the numbers in descending order."

                title.draw(
                    in: CGRect(
                        x: 20,
                        y: 20,
                        width: pageWidth - 40,
                        height: 40
                    ),
                    withAttributes: [
                        .font: UIFont.boldSystemFont(ofSize: 24),
                        .foregroundColor: UIColor.black
                    ]
                )

                let maxWidth = pageWidth - 40
                let maxHeight = pageHeight - 90

                let scale = min(
                    maxWidth / image.size.width,
                    maxHeight / image.size.height
                )

                let drawWidth = image.size.width * scale
                let drawHeight = image.size.height * scale

                image.draw(
                    in: CGRect(
                        x: (pageWidth - drawWidth) / 2,
                        y: 80,
                        width: drawWidth,
                        height: drawHeight
                    )
                )
            }

            return pdfURL

        } catch {

            print(error)
            return nil
        }
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        let wasNextHidden = nextBtn.isHidden

        nextBtn.isHidden = true
        view.layoutIfNeeded()

        guard let url = createPDF() else {

            nextBtn.isHidden = wasNextHidden
            view.layoutIfNeeded()
            return
        }

        nextBtn.isHidden = wasNextHidden
        view.layoutIfNeeded()

        let activityVC = UIActivityViewController(
            activityItems: [url],
            applicationActivities: nil
        )

        if let pop = activityVC.popoverPresentationController {
            pop.sourceView = sender
        }

        present(activityVC, animated: true)
    }
    
}
