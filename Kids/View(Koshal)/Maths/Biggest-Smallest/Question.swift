//
//  Question.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 19/12/25.
//

import UIKit

class Question: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLevel: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var StatusView: UIView!
    // MARK: Variable
    var selectedCategory: Any!        // Maths / Vocabulary / Grammar / etc.
    var selectedLevel: Int?
    var screenTitle = ""
    // gpt
    var levelRange: LevelRange!
    var items: [CollectionItem] = []
    var mode: ScreenMode = .question
    var currentQuestionIndex = 0
    let totalQuestions = 10
    var score = 0
    var currentOptions: [Int] = []
    var results: [QuestionResult] = []
    var hasAnsweredCurrentQuestion = false
    var isBiggestNumber = false// true → biggest, false → smallest

    var correctAnswer: Int = 0

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadQuestion()
    }
    
    // MARK: Function
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
       // let img = UIImage(systemName: "arrow.backward.circle")
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        lblTitle.text = screenTitle
        lblQuestion.text = isBiggestNumber
            ? "Select the Biggest Number"
            : "Select the Smallest Number"
        StatusView.backgroundColor = color
        HeaderView.backgroundColor = color
        collView.delegate = self
        collView.dataSource = self
        collView.isScrollEnabled = false   // 🔥 IMPORTANT
        if let layout = collView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical      // ⭐ IMPORTANT
                layout.minimumLineSpacing = 12
                layout.minimumInteritemSpacing = 12
                layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
                layout.estimatedItemSize = .zero           // ⭐ VERY IMPORTANT
            }
        collView.showsHorizontalScrollIndicator = false
        scoreView.layer.cornerRadius = 12
        scoreView.layer.borderColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        scoreView.layer.borderWidth = 0.5
        resultImage.isHidden = true
    }
    //
    func reloadCollectionHeight() {
        DispatchQueue.main.async {
            self.collView.layoutIfNeeded()
            self.collHeight.constant =
                self.collView.collectionViewLayout.collectionViewContentSize.height
        }
    }
    func showResultScreen() {
        mode = .result
        collView.reloadData()
        resultImage.isHidden = true
        reloadCollectionHeight()
    }
    func loadQuestion() {

        mode = .question
        hasAnsweredCurrentQuestion = false

        guard let range = levelRange else { return }
        currentOptions = Array(
            Set(
                (range.start...range.end)
                    .shuffled()
                    .prefix(4)
            )
        )
        lblQuestionNumber.text = "Question \(currentQuestionIndex + 1)"
        lblLevel.text = "# Level \(selectedLevel ?? 1)"
        resultImage.isHidden = true
        lblQuestion.text = isBiggestNumber
            ? "Select the Biggest Number"
            : "Select the Smallest Number"

        collView.reloadData()
        reloadCollectionHeight()
    }
    // MARK: Action
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNextAction(_ sender: Any) {
        print("Next Action")
  
        guard hasAnsweredCurrentQuestion else {
            // Optional: show alert "Please select an answer"
            return
        }
        currentQuestionIndex += 1

        if currentQuestionIndex >= totalQuestions {
            showResultScreen()
        } else {
            loadQuestion()
        }
    }
}
// MARK: Extension

extension Question: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mode == .question ? currentOptions.count : results.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if mode == .question {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "OptionCell",
                for: indexPath
            ) as! OptionCell
            cell.bgView.backgroundColor = ColorManager.randomColor()
            cell.configure(number: currentOptions[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ResultCell",
                for: indexPath
            ) as! ResultCell

            let data = results[indexPath.item]
            cell.configure(numbers: data.numbers, answer: data.answer)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard mode == .question, !hasAnsweredCurrentQuestion else { return }

        hasAnsweredCurrentQuestion = true

        let selected = currentOptions[indexPath.item]
        let correct = isBiggestNumber
            ? currentOptions.max()!
            : currentOptions.min()!

        results.append(.init(numbers: currentOptions, answer: correct))

        let isCorrect = selected == correct
        if isCorrect { score += 1 }

        scorelbl.text = "Score: \(score) / \(currentQuestionIndex + 1)"

        // 🔥 Update cell UI
        for i in 0..<currentOptions.count {
            let idx = IndexPath(item: i, section: 0)
            guard let cell = collectionView.cellForItem(at: idx) as? OptionCell else { continue }

            let value = currentOptions[i]

            if value == correct {
                // ✅ Always show correct answer
                cell.showCorrect()
            } else if value == selected {
                // ❌ Show wrong only for selected incorrect answer
                cell.showWrong()
            }
        }

        // 🔥 Show result image
        if isCorrect {
            resultImage.image = UIImage(systemName: "checkmark.circle.fill")
            resultImage.tintColor = .systemGreen
        } else {
            resultImage.image = UIImage(systemName: "xmark.circle.fill")
            resultImage.tintColor = .systemRed
        }

        resultImage.isHidden = false
    }

}

extension Question: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding: CGFloat = 12 * 3   // left + right + middle
        let width = (collectionView.bounds.width - padding) / 2
        return CGSize(width: width, height: 90)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
}

// MARK: Item

enum CollectionItem {
    case option(Int)                   // Question option
    case result(numbers: [Int], answer: Int) // Result row
}
struct QuestionResult {
    let numbers: [Int]
    let answer: Int
}
enum ScreenMode {
    case question
    case result
}
struct LetterResult {
    let answer: String
}
