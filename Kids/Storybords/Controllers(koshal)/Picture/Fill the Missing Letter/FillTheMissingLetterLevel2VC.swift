//
//  FillTheMissingLetterLevel2VC.swift
//  Kids
//
//  Created by Koshal Singh on 22/01/26.
//

import LanguageManager_iOS
struct QuestionResultsLevel2 {
    let formedWord: String
    let correctWord: String
    let isCorrect: Bool
}

import UIKit

class FillTheMissingLetterLevel2VC: BaseViewController {

    @IBOutlet weak var allImages: UIImageView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!

    @IBOutlet weak var nameBGView: UIView!
    
    @IBOutlet weak var firstLatterLabel: UILabel!
    @IBOutlet weak var lastLatternLabel: UILabel!
    
    @IBOutlet weak var textBGView1: UIView!
    @IBOutlet weak var textBGView2: UIView!
    @IBOutlet weak var textBGView3: UIView!
    @IBOutlet weak var textBGView4: UIView!
    @IBOutlet weak var textBGView5: UIView!
    @IBOutlet weak var textBGView6: UIView!
    @IBOutlet weak var textBGView7: UIView!
    @IBOutlet weak var textBGView8: UIView!
    @IBOutlet weak var textBGView9: UIView!
    @IBOutlet weak var textBGView10: UIView!
    @IBOutlet weak var textBGView11: UIView!
    @IBOutlet weak var textBGView12: UIView!
    @IBOutlet weak var textBGView13: UIView!
    @IBOutlet weak var textBGView14: UIView!
    @IBOutlet weak var textBGView15: UIView!
    @IBOutlet weak var textBGView16: UIView!
    @IBOutlet weak var textBGView17: UIView!
    @IBOutlet weak var textBGView18: UIView!
    @IBOutlet weak var textBGView19: UIView!
    @IBOutlet weak var textBGView20: UIView!
    @IBOutlet weak var textBGView21: UIView!
    @IBOutlet weak var textBGView22: UIView!
    @IBOutlet weak var textBGView23: UIView!
    @IBOutlet weak var textBGView24: UIView!
    @IBOutlet weak var textBGView25: UIView!
    @IBOutlet weak var textBGView26: UIView!
    
    @IBOutlet weak var imgBGView: UIView!
    @IBOutlet weak var textBGView: UIView!
    @IBOutlet weak var scoreBGView: UIView!
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var nextAndSubmitBtn: UIButton!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    var wordsData: [(word: String, image: String)] = [
        ("BOX", "box"),
        ("LAG", "foot"),
        ("CUP", "mug"),
        ("JAR", "jar"),
        ("BUS", "busLane"),
        ("PIG", "pig"),
        ("LOG", "log"),
        ("HEN", "chicken"),
        ("FOX", "fox"),
        ("NET", "net")
    ]

    var currentIndex = 0
    var score = 0
    var selectedLetter: String = ""
    var isSubmitted = false
    var results: [QuestionResultsLevel2] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()

        wordsData.shuffle()
        
        nextAndSubmitBtn.isHidden = true
    
        scoreBGView.layer.cornerRadius = 6
        nameBGView.layer.cornerRadius = 6
       
        let textBGViews = [
              textBGView1, textBGView2, textBGView3, textBGView4, textBGView5,
              textBGView6, textBGView7, textBGView8, textBGView9, textBGView10,
              textBGView11, textBGView12, textBGView13, textBGView14, textBGView15,
              textBGView16, textBGView17, textBGView18, textBGView19, textBGView20,
              textBGView21, textBGView22, textBGView23, textBGView24, textBGView25,
              textBGView26,
              
          ]

        
          textBGViews.forEach { view in
              view?.layer.cornerRadius = 5
              view?.clipsToBounds = true
          }
     
        loadCurrentQuestion()
       
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
        nextAndSubmitBtn.layer.cornerRadius = 6
    }

    func applyTheme() {

        let cardViews = [
            textBGView1, textBGView2, textBGView3, textBGView4, textBGView5,
            textBGView6, textBGView7, textBGView8, textBGView9, textBGView10,
            textBGView11, textBGView12, textBGView13, textBGView14, textBGView15,
            textBGView16, textBGView17, textBGView18, textBGView19, textBGView20,
            textBGView21, textBGView22, textBGView23, textBGView24, textBGView25,
            textBGView26
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextAndSubmitBtn.backgroundColor = .white

            cardViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextAndSubmitBtn.backgroundColor = color

            cardViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func loadCurrentQuestion() {
        let current = wordsData[currentIndex]

        allImages.image = UIImage(named: current.image)

        firstLatterLabel.text = ""
        lastLatternLabel.text = String(current.word.dropFirst()).lowercased()

        rightOrWrongImgView.image = nil
        nextAndSubmitBtn.setTitle("Submit".localiz(), for: .normal)
        nextAndSubmitBtn.isHidden = true
        isSubmitted = false

        questionNumberLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex)"

        lineView.isHidden = false
    }
    
    func animateAlphabetButton(_ button: UIButton) {
        let originalColor = button.backgroundColor

        UIView.animate(withDuration: 0.12,
                       animations: {
            button.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.25)
        }) { _ in
            UIView.animate(withDuration: 0.12) {
                button.transform = .identity
                button.backgroundColor = originalColor
            }
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("Fill Missing Letter.pdf")

        view.layoutIfNeeded()

        // Sirf imgBGView ka screenshot
        let renderer = UIGraphicsImageRenderer(size: imgBGView.bounds.size)

        let image = renderer.image { _ in
            imgBGView.drawHierarchy(in: imgBGView.bounds, afterScreenUpdates: true)
        }

        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842)

        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pageRect)

        do {

            try pdfRenderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                // Title
                let title = "Fill the Missing Letter"
                let titleAttr: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 24)
                ]

                let titleSize = title.size(withAttributes: titleAttr)

                title.draw(
                    at: CGPoint(
                        x: (pageRect.width - titleSize.width) / 2,
                        y: 20
                    ),
                    withAttributes: titleAttr
                )

                // Subtitle
                let subtitle = "Complete the Word"
                let subtitleAttr: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 18)
                ]

                let subtitleSize = subtitle.size(withAttributes: subtitleAttr)

                subtitle.draw(
                    at: CGPoint(
                        x: (pageRect.width - subtitleSize.width) / 2,
                        y: 55
                    ),
                    withAttributes: subtitleAttr
                )

                // imgBGView
                let top: CGFloat = 100

                let scale = min(
                    (pageRect.width - 40) / image.size.width,
                    (pageRect.height - top - 20) / image.size.height
                )

                let width = image.size.width * scale
                let height = image.size.height * scale

                image.draw(in: CGRect(
                    x: (pageRect.width - width) / 2,
                    y: top,
                    width: width,
                    height: height
                ))
            }

            return pdfURL

        } catch {

            print(error)
            return nil
        }
    }
    
    @IBAction func nextAndSubmitTapBtn(_ sender: UIButton) {

        if !isSubmitted {

            let selected = firstLatterLabel.text ?? ""
            let remaining = lastLatternLabel.text ?? ""
            let fullWord = selected + remaining

            let correctWord = wordsData[currentIndex].word
            let isCorrect = fullWord.uppercased() == correctWord

            let result = QuestionResultsLevel2(
                formedWord: fullWord.capitalized,
                correctWord: correctWord.capitalized,
                isCorrect: isCorrect
            )
            results.append(result)

            if isCorrect {
                rightOrWrongImgView.image = UIImage(named: "check mark")
                score += 1
            } else {
                rightOrWrongImgView.image = UIImage(named: "close")
            }

            scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex)"

            isSubmitted = true
            sender.setTitle("Next".localiz(), for: .normal)
            return
        }

        currentIndex += 1

        if currentIndex < wordsData.count {
            loadCurrentQuestion()
        } else {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "FillTheMissingLetterResultLevel2VC"
            ) as! FillTheMissingLetterResultLevel2VC

            vc.results = results
            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func alphabetBtnTap(_ sender: UIButton) {

        if isSubmitted { return }

        animateAlphabetButton(sender)

        let letter = String(UnicodeScalar(sender.tag + 65)!)
        let word = wordsData[currentIndex].word

        firstLatterLabel.text = letter
        lastLatternLabel.text = String(word.dropFirst()).lowercased()

        nextAndSubmitBtn.isHidden = false

        lineView.isHidden = true
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        guard let pdfURL = createPDF() else { return }

        let activityVC = UIActivityViewController(
            activityItems: [pdfURL],
            applicationActivities: nil
        )

        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = sender
        }

        present(activityVC, animated: true)
    }
    
}
