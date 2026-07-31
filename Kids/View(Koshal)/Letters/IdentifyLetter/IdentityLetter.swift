//
//  IdentityLetter.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 28/01/26.
//

import UIKit

class IdentityLetter: BaseViewController {
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
    var mode: ScreenMode = .question
    var screenTitle = ""
    var levelRange: NumberRange!
    var selectedLevel: Int?
    var currentQuestionIndex = 0
    let totalQuestions = 10
    var score = 0
    var spokenAlphabet: String = "" // TTS
    var currentOptions: [String] = []

    var results: [LetterResult] = []
    var items: [CollectionItem] = []
    var correctAnswer: Int = 0
    var hasAnsweredCurrentQuestion = false
    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadQuestion()
        // Do any additional setup after loading the view.
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
    func loadQuestion() {

        mode = .question
        hasAnsweredCurrentQuestion = false

        // 🔤 Generate alphabet options
        currentOptions = AlphabetHelper.randomOptions()

        // 🔊 Pick alphabet to speak
        spokenAlphabet = currentOptions.randomElement()!

        lblQuestionNumber.text = "Question \(currentQuestionIndex + 1)"
        lblLevel.text = "# Level \(selectedLevel ?? 1)"
        lblQuestion.text = "Identify the spoken letter"
        resultImage.isHidden = true

        collView.reloadData()
        reloadCollectionHeight()

        // 🔊 Speak alphabet (cartoon-friendly)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            TextToSpeechManager.shared.speak(
                "Letter \(self.spokenAlphabet)",
                rate: 0.45,
                pitch: 1.6
            )
        }
    }
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
    // MARK: Action
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnRepeatAction(_ sender: Any) {
        print("Repeat Action")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            TextToSpeechManager.shared.speak(
                "Letter \(self.spokenAlphabet)",
                rate: 0.45,
                pitch: 1.6
            )
        }
    }
    @IBAction func btnNextAction(_ sender: Any) {
        print("Next Action")
    // ❌ Don't allow next without answering
        guard hasAnsweredCurrentQuestion else {
            // Optional: Speak reminder
//            TextToSpeechManager.shared.speak(
//                "Please select the number"
//            )
            return
        }
        currentQuestionIndex += 1
        // ✅ Quiz finished
        if currentQuestionIndex >= totalQuestions {
            showResultScreen()
            return
        }
        // 🔁 Load next question
        loadQuestion()
    }
}
// MARK: Extension
extension IdentityLetter: UICollectionViewDataSource, UICollectionViewDelegate {

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
            cell.configureLetter(text: currentOptions[indexPath.item])
//            cell.configure(number: currentOptions[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ResultCell",
                for: indexPath
            ) as! ResultCell

            let data = results[indexPath.item]
            cell.LetterConfigure(letter: "\(data.answer)")
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        guard mode == .question, !hasAnsweredCurrentQuestion else { return }

        hasAnsweredCurrentQuestion = true

        let selected = currentOptions[indexPath.item]
        let correct = spokenAlphabet

        results.append(.init(answer:correct)) // adapt model if needed

        let isCorrect = selected == correct
        if isCorrect { score += 1 }

        scorelbl.text = "Score: \(score) / \(currentQuestionIndex + 1)"

        for i in 0..<currentOptions.count {
            let idx = IndexPath(item: i, section: 0)
            guard let cell = collectionView.cellForItem(at: idx) as? OptionCell else { continue }

            let value = currentOptions[i]

            if value == correct {
                cell.showCorrect()
            } else if value == selected {
                cell.showWrong()
            }
        }

        if isCorrect {
            resultImage.image = UIImage(systemName: "checkmark.circle.fill")
            resultImage.tintColor = .systemGreen
            TextToSpeechManager.shared.speak("Good job", pitch: 1.7)
        } else {
            resultImage.image = UIImage(systemName: "xmark.circle.fill")
            resultImage.tintColor = .systemRed
            TextToSpeechManager.shared.speak(
                "The correct letter is \(correct)",
                pitch: 1.6
            )
        }

        resultImage.isHidden = false
    }
}

extension IdentityLetter: UICollectionViewDelegateFlowLayout {

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
//
struct AlphabetHelper {

    static let alphabets: [String] =
        Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ").map { String($0) }

    static func randomOptions(count: Int = 4) -> [String] {
        Array(Set(alphabets.shuffled().prefix(count)))
    }
}


