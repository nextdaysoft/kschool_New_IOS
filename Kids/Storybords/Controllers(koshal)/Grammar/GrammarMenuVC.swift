//
//  GrammarMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 20/01/26.
//

import UIKit

class GrammarMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    
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
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    @IBOutlet weak var viewBG9: UIView!
    @IBOutlet weak var viewBG10: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    
    @IBOutlet weak var learningView: UIView!
    @IBOutlet weak var learningArrowImg: UIImageView!
    
    @IBOutlet weak var quizView: UIView!
    @IBOutlet weak var quizArrowImg: UIImageView!
    
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var learningButton: UIButton!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    
    var isLearningExpanded = false
    var isQuizExpanded = false
    
    var didTapLockedLevel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setup()
        applyTheme()
        setupForRestBtn()
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10
        viewBG7.layer.cornerRadius = 10
        viewBG8.layer.cornerRadius = 10
        viewBG9.layer.cornerRadius = 10
        viewBG10.layer.cornerRadius = 10
       
        
        learningView.layer.cornerRadius = 10
        quizView.layer.cornerRadius = 10
        
        viewBG1.isHidden = true
        viewBG2.isHidden = true
        viewBG3.isHidden = true
        viewBG4.isHidden = true
        viewBG5.isHidden = true
        viewBG6.isHidden = true
        viewBG7.isHidden = true
        viewBG8.isHidden = true
        
        viewBG9.isHidden = true
        viewBG10.isHidden = true
        
        updateScrollHeight()

        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        applyTheme()
        
        if UserDefaults.standard.bool(forKey: "sentenceTypeLevel3Completed") {
            image3.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "sentenceTypeLevel3Percentage")
            label3.text = "\(percentage)%"
        } else {
            image3.image = nil
            label3.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "isAmAreLevel4Completed") {
            image4.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "isAmAreLevel4Percentage")
            label4.text = "\(percentage)%"
        } else {
            image4.image = nil
            label4.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "wasWereLevel5Completed") {
            image5.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "wasWereLevel5Percentage")
            label5.text = "\(percentage)%"
        } else {
            image5.image = nil
            label5.text = ""
        }
        
        
        if UserDefaults.standard.bool(forKey: "identifyActionVerbLevel6Completed") {
            image6.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "identifyActionVerbLevel6Percentage")
            label6.text = "\(percentage)%"
        } else {
            image6.image = nil
            label6.text = ""
        }
        
        
        if UserDefaults.standard.bool(forKey: "articleLevel7Completed") {
            image7.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "articleLevel7Percentage")
            label7.text = "\(percentage)%"
        } else {
            image7.image = nil
            label7.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "properNounLevel8Completed") {
            image8.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "properNounLeve8Percentage")
            label8.text = "\(percentage)%"
        } else {
            image8.image = nil
            label8.text = ""
        }
        
        updateResetVisibility()
        setupSubscriptionLock()
        updateScrollHeight()
    }
    
    func updateScrollHeight() {

        let allViews: [UIView] = [
            learningView,
            quizView,
            viewBG1,
            viewBG2,
            viewBG3,
            viewBG4,
            viewBG5,
            viewBG6,
            viewBG7,
            viewBG8,
            viewBG9,
            viewBG10
        ]

        let visibleCount = allViews.filter { !$0.isHidden }.count

        let oneViewHeight: CGFloat = 70
        let spacing: CGFloat = 15
        let bottomSpace: CGFloat = 120

        let totalHeight =
            (CGFloat(visibleCount) * oneViewHeight) +
            (CGFloat(max(visibleCount - 1, 0)) * spacing) +
            bottomSpace

        scrollViewHeightConstraint.constant = totalHeight

        view.layoutIfNeeded()
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white
            
            viewBG1.backgroundColor = .white
            viewBG2.backgroundColor = .white
            viewBG3.backgroundColor = .white
            viewBG4.backgroundColor = .white
            viewBG5.backgroundColor = .white
            viewBG6.backgroundColor = .white
            viewBG7.backgroundColor = .white
            viewBG8.backgroundColor = .white
            viewBG9.backgroundColor = .white
            viewBG10.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
            viewBG4.backgroundColor = ColorManager.randomColor()
            viewBG5.backgroundColor = ColorManager.randomColor()
            viewBG6.backgroundColor = ColorManager.randomColor()
            viewBG7.backgroundColor = ColorManager.randomColor()
            viewBG8.backgroundColor = ColorManager.randomColor()
            viewBG9.backgroundColor = ColorManager.randomColor()
            viewBG10.backgroundColor = ColorManager.randomColor()
        }
    }
    
    func setupSubscriptionLock() {

        let subscribed =
        SubscriptionManager.shared.isSubscribed()

        let lockImage =
        UIImage(named:"lock")

        let levels: [(UIImageView, UIView, String, String, UILabel)] = [

            (image3, viewBG3,
             "sentenceTypeLevel3Completed",
             "sentenceTypeLevel3Percentage",
             label3),

            (image4, viewBG4,
             "isAmAreLevel4Completed",
             "isAmAreLevel4Percentage",
             label4),

            (image5, viewBG5,
             "wasWereLevel5Completed",
             "wasWereLevel5Percentage",
             label5),

            (image6, viewBG6,
             "identifyActionVerbLevel6Completed",
             "identifyActionVerbLevel6Percentage",
             label6),

            (image7, viewBG7,
             "articleLevel7Completed",
             "articleLevel7Percentage",
             label7),

            (image8, viewBG8,
             "properNounLevel8Completed",
             "properNounLeve8Percentage",
             label8),

            (image9, viewBG9,
             "learnPunctuationLevel9Completed",
             "learnPunctuationLevel9Percentage",
             label9),
            
            (image10, viewBG10,
             "learnPunctuationLevel10Completed",
             "learnPunctuationLevel10Percentage",
             label10)
        ]

        for (image,bg,completedKey,
             percentageKey,label) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: completedKey
            )

            if completed {

                // done highest priority
                image.image =
                UIImage(named:"done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey: percentageKey
                )

                label.text =
                "\(percentage)%"

                if UserDefaults.standard.bool(forKey: "WhiteTheme") {

                    bg.backgroundColor = completed ? .white : .systemGray4

                } else {

                    bg.backgroundColor = completed
                        ? ColorManager.randomColor()
                        : .systemGray4
                }

            } else {

                image.image = subscribed ? nil : lockImage
                label.text = ""

                if subscribed {

                    if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                        bg.backgroundColor = .white
                    } else {
                        bg.backgroundColor = ColorManager.randomColor()
                    }

                } else {

                    if UserDefaults.standard.bool(forKey: "WhiteTheme") {
                        bg.backgroundColor = .systemGray4
                    } else {
                        bg.backgroundColor = .systemGray4
                    }
                }
            }
        }
    }

    func checkSubscription() -> Bool {

        if SubscriptionManager.shared.isSubscribed() {
            return true
        }

        goToSubscription()
        return false
    }

    func goToSubscription() {

        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier: "SubscriptionVC"
        ) as! SubscriptionVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "sentenceTypeLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "isAmAreLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "wasWereLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "identifyActionVerbLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "articleLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "properNounLevel8Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
    }

    func setupForRestBtn() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        
        
        let img = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: config)
        
        restBtn.setImage(img, for: .normal)
        
        restBtn.tintColor = UIColor(
            red: 0.17,
            green: 0.21,
            blue: 0.33,
            alpha: 1
        )
        
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    
    func toggleViews(_ views: [UIView], expand: Bool) {

        if expand {

            views.forEach {
                $0.isHidden = false
                $0.alpha = 0
                $0.transform = CGAffineTransform(translationX: 0, y: -10)
            }

            updateScrollHeight()

            UIView.animate(withDuration: 0.3) {

                views.forEach {
                    $0.alpha = 1
                    $0.transform = .identity
                }

                self.view.layoutIfNeeded()
            }

        } else {

            UIView.animate(withDuration: 0.3, animations: {

                views.forEach {
                    $0.alpha = 0
                    $0.transform = CGAffineTransform(translationX: 0, y: -10)
                }

            }) { _ in

                views.forEach {
                    $0.isHidden = true
                    $0.alpha = 1
                    $0.transform = .identity
                }

                self.updateScrollHeight()

                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func rotateArrow(_ imageView: UIImageView, expanded: Bool) {

        if expanded {

            // ⌄ → <
            UIView.animate(
                withDuration: 0.25,
                delay: 0,
                options: [.curveLinear],
                animations: {
                    imageView.transform = CGAffineTransform(rotationAngle: .pi / 2)
                },
                completion: nil
            )

            // < → ^
            UIView.animate(
                withDuration: 0.25,
                delay: 0.12,
                options: [.curveLinear],
                animations: {
                    imageView.transform = CGAffineTransform(rotationAngle: .pi)
                },
                completion: nil
            )

        } else {

            // ^ → <
            UIView.animate(
                withDuration: 0.25,
                delay: 0,
                options: [.curveLinear],
                animations: {
                    imageView.transform = CGAffineTransform(rotationAngle: .pi / 2)
                },
                completion: nil
            )

            // < → ⌄
            UIView.animate(
                withDuration: 0.25,
                delay: 0.12,
                options: [.curveLinear],
                animations: {
                    imageView.transform = .identity
                },
                completion: nil
            )
        }
    }
    
    func highlightAnimation(_ view: UIView) {
        
        let originalColor = view.backgroundColor
        
        UIView.animate(withDuration: 0.18, animations: {
            view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.35)
        }) { _ in
            
            UIView.animate(withDuration: 0.25) {
                view.backgroundColor = originalColor
            }
        }
    }
    
    @IBAction func learningBtn(_ sender: UIButton) {
        
        highlightAnimation(learningView)
        
        isLearningExpanded.toggle()
        
        toggleViews([viewBG9,viewBG10],
                    expand: isLearningExpanded)
        
        rotateArrow(learningArrowImg,
                    expanded: isLearningExpanded)
    }
    
    
    @IBAction func quizBtn(_ sender: UIButton) {
        
        highlightAnimation(quizView)
        
        isQuizExpanded.toggle()
        
        toggleViews([viewBG1,viewBG2,viewBG3,viewBG4,viewBG5, viewBG6, viewBG7,viewBG8],
                    expand: isQuizExpanded)
        
        rotateArrow(quizArrowImg,
                    expanded: isQuizExpanded)
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "MatchTheWordMenuVC"
        ) as! MatchTheWordMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "OrderSentenceMenuVC"
        ) as! OrderSentenceMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {
        
        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "SentenceTypeVC"
        ) as! SentenceTypeVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "IsAmAreVC"
        ) as! IsAmAreVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "WasWereVC"
        ) as! WasWereVC

        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "IdentifyActionVerbVC"
        ) as! IdentifyActionVerbVC

        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func level7TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "ArticlesVC"
        ) as! ArticlesVC

        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func level8TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "ProperNounVC"
        ) as! ProperNounVC

        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnPunctuationMenuVC"
        ) as! LearnPunctuationMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level10TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnPrepositionVC"
        ) as! LearnPrepositionVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        
        image3.image = nil
        label3.text = ""
        UserDefaults.standard.set(false, forKey: "sentenceTypeLevel3Completed")
        UserDefaults.standard.removeObject(forKey: "sentenceTypeLevel3Percentage")
        
        
        image4.image = nil
        label4.text = ""
        UserDefaults.standard.set(false, forKey: "isAmAreLevel4Completed")
        UserDefaults.standard.removeObject(forKey: "isAmAreLevel4Percentage")
    
        
        image5.image = nil
        label5.text = ""
        UserDefaults.standard.set(false, forKey: "wasWereLevel5Completed")
        UserDefaults.standard.removeObject(forKey: "wasWereLevel5Percentage")
        
        
        image6.image = nil
        label6.text = ""
        UserDefaults.standard.set(false, forKey: "identifyActionVerbLevel6Completed")
        UserDefaults.standard.removeObject(forKey: "identifyActionVerbLevel6Percentage")
        
        image7.image = nil
        label7.text = ""
        UserDefaults.standard.set(false, forKey: "articleLevel7Completed")
        UserDefaults.standard.removeObject(forKey: "articleLevel7Percentage")
        
        image8.image = nil
        label8.text = ""
        UserDefaults.standard.set(false, forKey: "properNounLevel8Completed")
        UserDefaults.standard.removeObject(forKey: "properNounLeve8Percentage")
        
        image9.image = nil
        label9.text = ""

        UserDefaults.standard.set(
            false,
            forKey:"learnPunctuationLevel9Completed"
        )

        UserDefaults.standard.removeObject(
            forKey:"learnPunctuationLevel9Percentage"
        )
        
        updateResetVisibility()
    }
    
    
}
