//
//  AfterBefore.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 17/01/26.
//

import UIKit
import LanguageManager_iOS

class AfterBefore: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblbefore: UILabel!
    @IBOutlet weak var lblafter: UILabel!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!
    @IBOutlet weak var scoreMainView: UIView!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var keyPad: UICollectionView!
    @IBOutlet weak var bfafterView: UIView!
    @IBOutlet weak var beforeView: UIView!
    @IBOutlet weak var afterView:UIView!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    // MARK: Variable
    var isBeforeNumber = false   // true → after, false → before
    var screenTitle = ""
    private var keys: [KeypadItem] = []
    private var currentNumber: Int = 0
    private var correctAnswer: Int = 0
    private var userInput: String = ""
    private var score: Int = 0
    private var isAnswered = false
    private var questionIndex: Int = 1
    private let totalQuestions = 10
    private var mode: ScreenModes = .keypad
    private var results: [AfterBeforeResult] = []

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        generateQuestion()
        setupKeys()
        setupCollectionView()
        bfafterView.layer.cornerRadius = 10
    }
    // MARK: Function
    
    func generateQuestion() {

        guard questionIndex <= totalQuestions else {
            btnNext.setTitle("Finish", for: .normal)
            return
        }

        // ✅ RESET ANSWER STATE
        isAnswered = false

        lblQuestionNumber.text = "\("Question".localiz()) \(questionIndex)"

        // ✅ RANDOM NUMBER
        currentNumber = Int.random(in: 1...100)

        // ✅ RESET VALUES
        userInput = ""

        lblbefore.textColor = .black
        lblafter.textColor = .black

        lblbefore.attributedText = nil
        lblafter.attributedText = nil

        resultImage.isHidden = true

        btnNext.setTitle("Submit", for: .normal)
        btnNext.isHidden = true

        // ✅ SHOW NUMBER LEFT
        lblbefore.text = "\(currentNumber)"

        // ✅ EMPTY RIGHT SIDE
        lblafter.text = ""

        if isBeforeNumber {

            lblQuestion.text = "Write the before number".localiz()

            correctAnswer = currentNumber - 1

            arrowImage.image = UIImage(systemName: "arrow.left")

        } else {

            lblQuestion.text = "Write the after number".localiz()

            correctAnswer = currentNumber + 1

            arrowImage.image = UIImage(systemName: "arrow.right")
        }
    }

    func showCorrect() {

        // ✅ ALWAYS SHOW RESULT IN lblafter
        lblafter.textColor = .systemGreen

        resultImage.image = UIImage(named: "check mark")
        resultImage.tintColor = .systemGreen
        resultImage.isHidden = false
    }
    
    func showWrong(userAnswer: Int) {

        let wrongText = "\(userAnswer)"
        let correctText = "\(correctAnswer)"

        let attr = NSMutableAttributedString(
            string: wrongText,
            attributes: [
                .foregroundColor: UIColor.systemRed,
                .strikethroughStyle: NSUnderlineStyle.single.rawValue
            ]
        )

        attr.append(NSAttributedString(
            string: " \(correctText)",
            attributes: [
                .foregroundColor: UIColor.systemGreen
            ]
        ))

        // ✅ ALWAYS SHOW RESULT IN lblafter
        lblafter.attributedText = attr

        resultImage.image = UIImage(named: "close")
        resultImage.tintColor = .systemRed
        resultImage.isHidden = false
    }
    
    func resetForNext() {

        isAnswered = false
        userInput = ""

        lblbefore.textColor = .black
        lblafter.textColor = .black

        lblbefore.attributedText = nil
        lblafter.attributedText = nil

        // ✅ SAME STRUCTURE BOTH MODES
        lblbefore.text = "\(currentNumber)"
        lblafter.text = ""

        resultImage.isHidden = true

        btnNext.setTitle("Submit", for: .normal)
        btnNext.isHidden = true
    }

    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        lblTitle.text = screenTitle
        lblQuestion.text = isBeforeNumber
        ? "write the before number"
        : "write the after number"
      //  addShadow(to: bfafterView)
        beforeView.layer.cornerRadius = 10
        afterView.layer.cornerRadius = 10
        resultImage.isHidden = true
        //
        btnNext.isHidden = true
        scorelbl.text = "Score : 0 / 0"
        lblQuestionNumber.text = "Question 1 / \(totalQuestions)"
        scoreView.layer.cornerRadius = 10
        //
        keyPad.dataSource = self
        keyPad.delegate = self
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        collView.dataSource = self
        collView.delegate = self

        collView.isHidden = true
        btnNext.layer.cornerRadius = 6
        btnNext.backgroundColor = color

    }
    func addShadow(to view: UIView) {
        view.layer.cornerRadius = 10           // match your design
        view.layer.masksToBounds = false       // ⭐ IMPORTANT
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 8
        // ⭐ Performance optimization
        view.layer.shadowPath = UIBezierPath(
            roundedRect: view.bounds,
            cornerRadius: view.layer.cornerRadius
        ).cgPath
    }

    func setupKeys() {
        
        keys = [
            KeypadItem(title: "1", color: ColorManager.randomColor()),
            KeypadItem(title: "2", color: ColorManager.randomColor()),
            KeypadItem(title: "3", color: ColorManager.randomColor()),
            KeypadItem(title: "4", color: ColorManager.randomColor()),
            KeypadItem(title: "5", color: ColorManager.randomColor()),
            KeypadItem(title: "6", color: ColorManager.randomColor()),
            KeypadItem(title: "7", color: ColorManager.randomColor()),
            KeypadItem(title: "8", color: ColorManager.randomColor()),
            KeypadItem(title: "9", color: ColorManager.randomColor()),
            KeypadItem(title: "0", color: ColorManager.randomColor()),
            KeypadItem(title: "X", color: .red)
        ]
    }
    private func setupCollectionView() {
        if let layout = keyPad.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical      // ⭐ IMPORTANT
                layout.minimumLineSpacing = 12
                layout.minimumInteritemSpacing = 12
                layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
                layout.estimatedItemSize = .zero           // ⭐ VERY IMPORTANT
            }
        keyPad.showsHorizontalScrollIndicator = false
        if let layout = collView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical      // ⭐ IMPORTANT
                layout.minimumLineSpacing = 12
                layout.minimumInteritemSpacing = 12
                layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
                layout.estimatedItemSize = .zero           // ⭐ VERY IMPORTANT
            }
        collView.showsHorizontalScrollIndicator = false
    }
    //
    func showResultScreen() {

        mode = .result

        // Hide question UI
        keyPad.isHidden = true
        bfafterView.isHidden = true
        arrowImage.isHidden = true
        resultImage.isHidden = true
        // Show results
        collView.isHidden = false
        collView.reloadData()
        reloadCollectionHeight()
        lblQuestion.text = "You have completed this activity."
        lblQuestionNumber.isHidden = true
        btnNext.setTitle("Finish", for: .normal)
        btnNext.isHidden = false
        view.layoutIfNeeded()

    }
    func reloadCollectionHeight() {
           DispatchQueue.main.async {
               self.collHeight.constant =
                   self.collView.collectionViewLayout.collectionViewContentSize.height
           }
       }


    func goToResultScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(withIdentifier: "AfterBeforeMenuVC") as? AfterBeforeMenuVC {

            // ✅ Pass score
            vc.finalScore = score
            
            vc.screenTitleText = isBeforeNumber ? "Before Number" : "After Number"
            
            // ✅ Convert data (IMPORTANT)
            vc.results = results.map {
                QuestionResultsLevel1(
                    formedWord: "\(isBeforeNumber ? "\($0.userAnswer) ← \($0.baseNumber)" : "\($0.baseNumber) → \($0.userAnswer)")",
                    correctWord: "\(isBeforeNumber ? "\($0.correctAnswer) ← \($0.baseNumber)" : "\($0.baseNumber) → \($0.correctAnswer)")",
                    isCorrect: $0.isCorrect
                )
            }

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    // MARK: Action
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNextTapped(_ sender: UIButton) {
        // FINISH
           if sender.currentTitle == "Finish" {
               navigationController?.popViewController(animated: true)
               return
           }

           // SUBMIT
           if !isAnswered {

               guard let entered = Int(userInput) else { return }
               isAnswered = true

               let correct = entered == correctAnswer
               if correct {
                   showCorrect()
                   score += 1
               } else {
                   showWrong(userAnswer: entered)
               }

               // 🔥 STORE RESULT
               results.append(
                   AfterBeforeResult(
                       baseNumber: currentNumber,
                       userAnswer: entered,
                       correctAnswer: correctAnswer,
                       isCorrect: correct
                   )
               )


               scorelbl.text = "Score : \(score) / \(questionIndex)"
               btnNext.setTitle("Next", for: .normal)
               return
           }

           // NEXT QUESTION OR RESULT
           questionIndex += 1

        if questionIndex > totalQuestions {
            goToResultScreen()   // ✅ direct VC open
        } else {
            generateQuestion()
        }

    }

}
// MARK: Extension
struct KeypadItem {
    let title: String
    var color: UIColor
}

struct AfterBeforeResult {
    let baseNumber: Int
    let userAnswer: Int
    let correctAnswer: Int
    let isCorrect: Bool
}

enum ScreenModes {
    case keypad
    case result
}

extension AfterBefore: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        if collectionView == keyPad {
            return keys.count
        }

        // collView
        return results.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // 🔹 KEYPAD COLLECTION VIEW
        if collectionView == keyPad {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "KeypadCell",
                for: indexPath
            ) as! KeypadCell

            cell.configure(item: keys[indexPath.item])
            return cell
        }

        // 🔹 RESULT COLLECTION VIEW
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ResultCell2",
            for: indexPath
        ) as! ResultCell2

        let data = results[indexPath.item]
        cell.configure(result: data, isBefore: isBeforeNumber)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        guard collectionView == keyPad else { return }

        // ❌ ALREADY ANSWERED
        if isAnswered {
            return
        }

        let key = keys[indexPath.item].title

        // ✅ ALWAYS WRITE IN RIGHT LABEL
        let label = lblafter

        // BACKSPACE
        if key == "X" {

            guard !userInput.isEmpty else { return }

            userInput.removeLast()

            label?.text = userInput

            btnNext.isHidden = userInput.isEmpty
            return
        }

        // ✅ ONLY 2 DIGITS ALLOWED
        if userInput.count < 2 {

            userInput.append(key)

            label?.text = userInput

            btnNext.isHidden = false
        }
    }

}

extension AfterBefore: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == keyPad {
            let width = (collectionView.bounds.width - 64) / 3
            return CGSize(width: width, height: 40)
        }

        // Result cells (3-column grid)
        let columns: CGFloat = 3
        let spacing: CGFloat = 12
        let sectionInset: CGFloat = 12
        let totalPadding = (columns - 1) * spacing + sectionInset * 2
        let width = (collectionView.bounds.width - totalPadding) / columns
        return CGSize(width: width, height: 75)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView == collView ? 12 : 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView == collView ? 12 : 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == collView {
            return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        }
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}
