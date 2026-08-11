//
//  PluralFormLevel1VC.swift
//  Kids
//
//  Created by Koshal Singh on 02/02/26.
//

import LanguageManager_iOS
struct PluralQuestion {
    let singular: String
    let correctPlural: String
    let wrongPlural: String
}

struct PickSpellingResults {
    let selectedWord: String
    let correctWord: String
    let isCorrect: Bool
}

import UIKit

class PluralFormLevel1VC: BaseViewController {
    
    @IBOutlet weak var dropView: UIView!
    @IBOutlet weak var rightOrWrongImgView: UIImageView!
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var currentIndex = 0
    var score = 0
    var results: [PickSpellingResults] = []

    var draggedSnapshot: UIView?
    var originalCenter: CGPoint = .zero
    var isAnswered = false
    
    var draggedLabel: UILabel?
    
    var view1OriginalCenter: CGPoint = .zero
    var view2OriginalCenter: CGPoint = .zero

    
    weak var view1OriginalSuperview: UIView?
    weak var view2OriginalSuperview: UIView?
    
    var questions: [PluralQuestion] = [
        PluralQuestion(singular: "tree", correctPlural: "trees", wrongPlural: "treeses"),
        PluralQuestion(singular: "cat", correctPlural: "cats", wrongPlural: "cates"),
        PluralQuestion(singular: "dog", correctPlural: "dogs", wrongPlural: "doges"),
        PluralQuestion(singular: "ball", correctPlural: "balls", wrongPlural: "balles"),
        PluralQuestion(singular: "book", correctPlural: "books", wrongPlural: "bookes"),
        PluralQuestion(singular: "car", correctPlural: "cars", wrongPlural: "cares"),
        PluralQuestion(singular: "hat", correctPlural: "hats", wrongPlural: "hattes"),
        PluralQuestion(singular: "fish", correctPlural: "fish", wrongPlural: "fishes"),
        PluralQuestion(singular: "cup", correctPlural: "cups", wrongPlural: "cupps"),
        PluralQuestion(singular: "bird", correctPlural: "birds", wrongPlural: "birdd")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions.shuffle()
        
        setup()
        applyTheme()
        setupDragDrop()
        loadQuestion()
       
        scoreLabelBGView.layer.cornerRadius = 10
        
        dropView.layer.borderWidth = 2
        dropView.layer.borderColor = UIColor(
            red: 0.135,
            green: 0.211,
            blue: 0.238,
            alpha: 1
        ).cgColor
        
        view1.layer.masksToBounds = true
        view2.layer.masksToBounds = true
        
        nextBtn.isHidden = true
        rightOrWrongImgView.isHidden = true
       
        titleView.layer.cornerRadius = 10
        dropView.layer.cornerRadius = 35
        
        dropView.layer.cornerRadius = dropView.frame.height / 2

        view1.layer.cornerRadius = view1.frame.height / 2
        view2.layer.cornerRadius = view2.frame.height / 2
        
        view1OriginalCenter = view1.center
        view2OriginalCenter = view2.center

        view1OriginalSuperview = view1.superview
        view2OriginalSuperview = view2.superview
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
        nextBtn.layer.cornerRadius = 6
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white

            scoreLabelBGView.backgroundColor = .white

            titleView.backgroundColor = .white

            view1.backgroundColor = .white
            view2.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            view1.backgroundColor = ColorManager.randomColor()
            view2.backgroundColor = ColorManager.randomColor()
        }
    }
    
    func resetDragViews() {

        if view1.superview !== view1OriginalSuperview {
            let frame = dropView.convert(view1.frame, to: view1OriginalSuperview)
            view1.removeFromSuperview()
            view1OriginalSuperview?.addSubview(view1)
            view1.frame = frame
        }
        view1.center = view1OriginalCenter

        if view2.superview !== view2OriginalSuperview {
            let frame = dropView.convert(view2.frame, to: view2OriginalSuperview)
            view2.removeFromSuperview()
            view2OriginalSuperview?.addSubview(view2)
            view2.frame = frame
        }
        view2.center = view2OriginalCenter
    }
    
    
    func setupDragDrop() {
        let pan1 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view1.isUserInteractionEnabled = true
        view1.addGestureRecognizer(pan1)

        let pan2 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view2.isUserInteractionEnabled = true
        view2.addGestureRecognizer(pan2)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let draggedView = gesture.view else { return }

        if isAnswered { return }

        let translation = gesture.translation(in: view)

        switch gesture.state {

        case .began:
            // 🔹 jis view ko uthaya uska original center save karo
            if draggedView == view1 {
                view1OriginalCenter = view1.center
            } else if draggedView == view2 {
                view2OriginalCenter = view2.center
            }

        case .changed:
            draggedView.center = CGPoint(
                x: draggedView.center.x + translation.x,
                y: draggedView.center.y + translation.y
            )
            gesture.setTranslation(.zero, in: view)

        case .ended:

            let draggedCenterInDropView =
                draggedView.superview?.convert(draggedView.center, to: dropView)

            if let point = draggedCenterInDropView,
               dropView.bounds.contains(point) {

                handleDrop(draggedView)

            } else {
                // 🔁 jis jagah se uthaya tha wahi wapas bhejo
                UIView.animate(withDuration: 0.3) {
                    if draggedView == self.view1 {
                        draggedView.center = self.view1OriginalCenter
                    } else if draggedView == self.view2 {
                        draggedView.center = self.view2OriginalCenter
                    }
                }
            }

        default:
            break
        }
    }
    
    func loadQuestion() {
        let q = questions[currentIndex]

        titleLabel.text = q.singular
        questionLabel.text = "\("Question".localiz()) \(currentIndex + 1)"
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentIndex + 1)"

        let options = [q.correctPlural, q.wrongPlural].shuffled()

        label1.text = options[0]
        label2.text = options[1]

        label1.tag = options[0] == q.correctPlural ? 1 : 0
        label2.tag = options[1] == q.correctPlural ? 1 : 0

  
        isAnswered = false
        view1.isUserInteractionEnabled = true
        view2.isUserInteractionEnabled = true
        rightOrWrongImgView.isHidden = true
        nextBtn.isHidden = true
        
        applyTheme()
    }
    
    func handleDrop(_ draggedView: UIView) {

        isAnswered = true

        
        guard let superview = draggedView.superview else { return }

        let dropCenterInSuperview = dropView.convert(
            CGPoint(x: dropView.bounds.midX, y: dropView.bounds.midY),
            to: superview
        )

    
        UIView.animate(withDuration: 0.3) {
            draggedView.center = dropCenterInSuperview
        }

        
        let selectedLabel = (draggedView == view1) ? label1 : label2
        let selectedText = selectedLabel?.text ?? ""
        let isCorrect = selectedLabel?.tag == 1

        if isCorrect {
            score += 1
            rightOrWrongImgView.image = UIImage(named: "check mark")
        } else {
            rightOrWrongImgView.image = UIImage(named: "close")
        }

        rightOrWrongImgView.isHidden = false
        nextBtn.isHidden = false


        view1.isUserInteractionEnabled = false
        view2.isUserInteractionEnabled = false

        let q = questions[currentIndex]
        results.append(
            PickSpellingResults(
                selectedWord: selectedText,
                correctWord: q.correctPlural,
                isCorrect: isCorrect
            )
        )
    }
    
    
    @IBAction func nextTapBtn(_ sender: UIButton) {

        resetDragViews()

        if currentIndex < questions.count - 1 {
            currentIndex += 1
            loadQuestion()
        } else {
            goToResult()
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func goToResult() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PluralFormResultLevel1VC"
        ) as! PluralFormResultLevel1VC

        vc.results = results
        vc.finalScore = score

        navigationController?.pushViewController(vc, animated: true)
    }
    

}
