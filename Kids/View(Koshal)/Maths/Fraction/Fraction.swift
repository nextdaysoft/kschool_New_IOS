//
//  Fraction.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 19/01/26.
//

import UIKit
import LanguageManager_iOS

class Fraction: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var fracttion: FractionCircleView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!
    @IBOutlet weak var scoreMainView: UIView!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    // MARK: Variable
    private var questions: [FractionQuestion] = []
    private var currentIndex = 0
    private let totalQuestions = 10
    private var isAnswered = false
    private var score = 0
    private var results: [FractionResult] = []
    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()

        generateQuestions()
        setupCollectionView()
        loadQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    // MARK: Function
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        resultImage.isHidden = true
        btnNext.isHidden = true
        scorelbl.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        lblQuestionNumber.text = "\("Question".localiz()) \(currentIndex)"
        scoreView.layer.cornerRadius = 6
        collView.dataSource = self
        collView.delegate = self
        collView.isHidden = true
        fracttion.onSelectionChanged = { [weak self] count in
            self?.btnNext.isHidden = (count == 0)
        }
        btnNext.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            scoreView.backgroundColor = .white

            btnNext.backgroundColor = .white
            btnNext.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreView.backgroundColor = color

            btnNext.backgroundColor = color
            btnNext.setTitleColor(.white, for: .normal)
        }
    }
    
    func generateQuestions() {
        let fixedDenominator = 5   // ⭐ ALWAYS SAME UI

        questions = (0..<totalQuestions).map { _ in
            let numerator = Int.random(in: 1...fixedDenominator)
            return FractionQuestion(numerator: numerator, denominator: fixedDenominator)
        }
    }
    func loadQuestion() {
        
        isAnswered = false
        
        let q = questions[currentIndex]
        
        lblQuestionNumber.text = "\("Question".localiz()) \(currentIndex + 1)"
        lblQuestion.text = "\("Fill".localiz()) \(q.numerator) / \(q.denominator)"
        
        if fracttion.layer.sublayers?.isEmpty ?? true {
            fracttion.configure(denominator: q.denominator)
        } else {
            fracttion.reset()
        }
        
        resultImage.isHidden = true
        btnNext.setTitle("Submit", for: .normal)
        
        // 🔥 Hide submit until user selects slices
        //btnNext.isHidden = true
    }
    
    func checkAnswerAndStoreResult() {

        let q = questions[currentIndex]
        let selectedCount = fracttion.selectedSlices.count
        let isCorrect = selectedCount == q.numerator

        isAnswered = true
        // 🔒 LOCK FRACTION AFTER SUBMIT
        fracttion.isSelectionEnabled = false
        // ✅ Increase score only if correct
        if isCorrect {
            score += 1
            resultImage.image = UIImage(named: "check mark")
            resultImage.tintColor = .systemGreen
        } else {
            resultImage.image = UIImage(named: "close")
            resultImage.tintColor = .systemRed
        }

        // ✅ Store result
        results.append(
            FractionResult(
                numerator: q.numerator,
                denominator: q.denominator,
                selectedCount: selectedCount,
                isCorrect: isCorrect
            )
        )

        // ✅ Show running score: correct / questions attempted
      
        scorelbl.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"
        resultImage.isHidden = false
    }

    
    func showResultScreen() {
        
        // hide fraction UI
        fracttion.isHidden = true
        lblQuestion.isHidden = true
        lblQuestionNumber.isHidden = true
        resultImage.isHidden = true
        
        // show result list
        collView.isHidden = false
        collView.reloadData()
        reloadCollectionHeight()
        
        btnNext.setTitle("Finish", for: .normal)
        btnNext.isHidden = false
    }
    func reloadCollectionHeight() {
        DispatchQueue.main.async {
            self.collHeight.constant =
            self.collView.collectionViewLayout.collectionViewContentSize.height
        }
    }
    func showCorrect() {
        let alert = UIAlertController(
            title: "Correct ✅",
            message: nil,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Next", style: .default))
        present(alert, animated: true)
    }
    
    func showWrong() {
        let alert = UIAlertController(
            title: "Wrong ❌",
            message: "Try to fill exact parts",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    private func setupCollectionView() {
        if let layout = collView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical      // ⭐ IMPORTANT
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 12
            layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            layout.estimatedItemSize = .zero           // ⭐ VERY IMPORTANT
        }
        collView.showsHorizontalScrollIndicator = false
    }
    
    func goToResultScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(withIdentifier: "FractionResultVC") as? FractionResultVC {

            // ✅ Score pass karo
            vc.finalScore = score
            
            vc.screenTitleText = "Fraction"

            // ✅ Convert data (IMPORTANT)
            vc.results = results.map {
                QuestionResultsLevel1(
                    formedWord: "\($0.selectedCount)/\($0.denominator)",
                    correctWord: "\($0.numerator)/\($0.denominator)",
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
            checkAnswerAndStoreResult()
            sender.setTitle("Next", for: .normal)
            return
        }
        
        // NEXT QUESTION
        currentIndex += 1
        
        if currentIndex >= totalQuestions {
            goToResultScreen()   // ✅ direct result screen
        } else {
            sender.setTitle("Submit", for: .normal)
            loadQuestion()
        }
    }
}
extension Fraction: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

   
        // collView
        return results.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // 🔹 RESULT COLLECTION VIEW
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ResultCell3",
            for: indexPath
        ) as! ResultCell3

        let data = results[indexPath.item]
        cell.configureoneOone(result: data)
        return cell
    }
}
extension Fraction: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {


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
struct FractionResult {
    let numerator: Int
    let denominator: Int
    let selectedCount: Int
    let isCorrect: Bool
}
