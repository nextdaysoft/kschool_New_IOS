//
//  FillTheMissingLetterLevel3VC.swift
//  Kids
//
//  Created by Koshal Singh on 21/01/26.
//

import LanguageManager_iOS
struct QuestionResultsLevel3 {
    let formedWord: String
    let correctWord: String
    let isCorrect: Bool
}

import UIKit

class FillTheMissingLetterLevel3VC: BaseViewController {

    
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
    
    var wordsData: [(word: String, image: String)] = [
        ("STAR", "star 1"),
        ("BEE", "animal"),
        ("FISH", "clown-fish"),
        ("DUCK", "duckling"),
        ("RAIN", "rain"),
        ("LEAF", "leaf"),
        ("BIRD", "sparrow"),
        ("SKY", "clouds"),
        ("TREE", "tree"),
        ("COW", "cow")
    ]

    var currentIndex = 0
    var score = 0
    var selectedLetter: String = ""
    var isSubmitted = false
    var results: [QuestionResultsLevel3] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()

        wordsData.shuffle()
        
        wordsData.shuffle()
        nextAndSubmitBtn.isHidden = true
        
        scoreBGView.layer.cornerRadius = 6
       
        let textBGViews = [
              textBGView1, textBGView2, textBGView3, textBGView4, textBGView5,
              textBGView6, textBGView7, textBGView8, textBGView9, textBGView10,
              textBGView11, textBGView12, textBGView13, textBGView14, textBGView15,
              textBGView16, textBGView17, textBGView18, textBGView19, textBGView20,
              textBGView21, textBGView22, textBGView23, textBGView24, textBGView25,
              textBGView26, nameBGView,
              scoreBGView, textBGView, imgBGView
              
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
            textBGView26,
            nameBGView,
            scoreBGView,
            textBGView,
            imgBGView
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextAndSubmitBtn.backgroundColor = .white
            nextAndSubmitBtn.setTitleColor(.black, for: .normal)

            cardViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextAndSubmitBtn.backgroundColor = color
            nextAndSubmitBtn.setTitleColor(.white, for: .normal)

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
    
    @IBAction func nextAndSubmitTapBtn(_ sender: UIButton) {

        if !isSubmitted {

            let selected = firstLatterLabel.text ?? ""
            let remaining = lastLatternLabel.text ?? ""
            let fullWord = selected + remaining

            let correctWord = wordsData[currentIndex].word
            let isCorrect = fullWord.uppercased() == correctWord

            let result = QuestionResultsLevel3(
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
                withIdentifier: "FillTheMissingLetterResultLevel3VC"
            ) as! FillTheMissingLetterResultLevel3VC

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
    
}
