//
//  RomanNumeralsMenuVC.swift
//  New
//
//  Created by Koshal Singh on 06/04/26.
//

import UIKit

class RomanNumeralsMenuVC: BaseViewController {

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
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    
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
    @IBOutlet weak var viewBG11: UIView!
    @IBOutlet weak var viewBG12: UIView!
   
    
    
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

    var level2Percentage: Int = 0
    var level3Percentage: Int = 0
    var level4Percentage: Int = 0
    var level5Percentage: Int = 0
    var level6Percentage: Int = 0
    var level7Percentage: Int = 0
    var level8Percentage: Int = 0
    var level9Percentage: Int = 0
    var level10Percentage: Int = 0
    var level11Percentage: Int = 0
    var level12Percentage: Int = 0
    
    var didTapLockedLevel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setup()
        setupForRestBtn()
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()

        viewBG4.layer.cornerRadius = 10
        viewBG4.backgroundColor = ColorManager.randomColor()
        
        viewBG5.layer.cornerRadius = 10
        viewBG5.backgroundColor = ColorManager.randomColor()
        
        viewBG6.layer.cornerRadius = 10
        viewBG6.backgroundColor = ColorManager.randomColor()
        
        viewBG7.layer.cornerRadius = 10
        viewBG7.backgroundColor = ColorManager.randomColor()
        
        viewBG8.layer.cornerRadius = 10
        viewBG8.backgroundColor = ColorManager.randomColor()
        
        viewBG9.layer.cornerRadius = 10
        viewBG9.backgroundColor = ColorManager.randomColor()
        
        viewBG10.layer.cornerRadius = 10
        viewBG10.backgroundColor = ColorManager.randomColor()
        
        viewBG11.layer.cornerRadius = 10
        viewBG11.backgroundColor = ColorManager.randomColor()
        
        viewBG12.layer.cornerRadius = 10
        viewBG12.backgroundColor = ColorManager.randomColor()

     
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
        viewBG11.isHidden = true
        viewBG12.isHidden = true
      
        updateScrollHeight()

        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let isCompleted2 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel2Completed")
           let percentage2 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel2Percentage")

           if isCompleted2 {
               image2.image = UIImage(named: "done")
               label2.text = "\(percentage2)%"
           } else {
               image2.image = nil
               label2.text = ""
           }
        
        let isCompleted3 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel3Completed")
           let percentage3 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel3Percentage")

           if isCompleted3 {
               image3.image = UIImage(named: "done")
               label3.text = "\(percentage3)%"
           } else {
               image3.image = nil
               label3.text = ""
           }
        
        let isCompleted4 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel4Completed")
           let percentage4 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel4Percentage")

           if isCompleted4 {
               image4.image = UIImage(named: "done")
               label4.text = "\(percentage4)%"
           } else {
               image4.image = nil
               label4.text = ""
           }
        
        let isCompleted5 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel5Completed")
           let percentage5 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel5Percentage")

           if isCompleted5 {
               image5.image = UIImage(named: "done")
               label5.text = "\(percentage5)%"
           } else {
               image5.image = nil
               label5.text = ""
           }
        
        let isCompleted6 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel6Completed")
           let percentage6 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel6Percentage")

           if isCompleted6 {
               image6.image = UIImage(named: "done")
               label6.text = "\(percentage6)%"
           } else {
               image6.image = nil
               label6.text = ""
           }
        
        let isCompleted7 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel7Completed")
           let percentage7 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel7Percentage")

           if isCompleted7 {
               image7.image = UIImage(named: "done")
               label7.text = "\(percentage7)%"
           } else {
               image7.image = nil
               label7.text = ""
           }
        
        let isCompleted8 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel8Completed")
           let percentage8 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel8Percentage")

           if isCompleted8 {
               image8.image = UIImage(named: "done")
               label8.text = "\(percentage8)%"
           } else {
               image8.image = nil
               label8.text = ""
           }
        
        let isCompleted9 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel9Completed")
           let percentage9 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel9Percentage")

           if isCompleted9 {
               image9.image = UIImage(named: "done")
               label9.text = "\(percentage9)%"
           } else {
               image9.image = nil
               label9.text = ""
           }
        
        let isCompleted10 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel10Completed")
           let percentage10 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel10Percentage")

           if isCompleted10 {
               image10.image = UIImage(named: "done")
               label10.text = "\(percentage10)%"
           } else {
               image10.image = nil
               label10.text = ""
           }
        
        let isCompleted11 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel11Completed")
           let percentage11 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel11Percentage")

           if isCompleted11 {
               image11.image = UIImage(named: "done")
               label11.text = "\(percentage11)%"
           } else {
               image11.image = nil
               label11.text = ""
           }
        
        let isCompleted12 = UserDefaults.standard.bool(forKey: "romanNumeralsLevel12Completed")
           let percentage12 = UserDefaults.standard.integer(forKey: "romanNumeralsLevel12Percentage")

           if isCompleted12 {
               image12.image = UIImage(named: "done")
               label12.text = "\(percentage12)%"
           } else {
               image12.image = nil
               label12.text = ""
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
            viewBG10,
            viewBG11,
            viewBG12
        ]

        let visibleCount = allViews.filter { !$0.isHidden }.count

        let oneViewHeight: CGFloat = 70
        let spacing: CGFloat = 15
        let bottomSpace: CGFloat = 120

        let totalHeight =
            CGFloat(visibleCount) * oneViewHeight +
            CGFloat(max(visibleCount - 1, 0)) * spacing +
            bottomSpace

        scrollViewHeightConstraint.constant = totalHeight

        view.layoutIfNeeded()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel8Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel9Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel10Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel11Completed") ||
        UserDefaults.standard.bool(forKey: "romanNumeralsLevel12Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
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
        
        // Text right side + icon right
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
    
    
    func setupSubscriptionLock() {

        let subscribed =
        SubscriptionManager.shared.isSubscribed()

        let lockImage = UIImage(named:"lock")

        let images = [
            image2,image3,image4,image5,image6,
            image7,image8,image9,image10,
            image11,image12
        ]

        let labels = [
            label2,label3,label4,label5,label6,
            label7,label8,label9,label10,
            label11,label12
        ]

        let views = [
            viewBG2,viewBG3,viewBG4,viewBG5,
            viewBG6,viewBG7,viewBG8,viewBG9,
            viewBG10,viewBG11,viewBG12
        ]

        for level in 2...12 {

            let isCompleted =
            UserDefaults.standard.bool(
                forKey:"romanNumeralsLevel\(level)Completed"
            )

            let percentage =
            UserDefaults.standard.integer(
                forKey:"romanNumeralsLevel\(level)Percentage"
            )

            let image = images[level-2]
            let label = labels[level-2]
            let view = views[level-2]

            if isCompleted {

                // highest priority
                image?.image = UIImage(named:"done")
                label?.text = "\(percentage)%"

                view?.backgroundColor =
                ColorManager.randomColor()

            } else {

                image?.image =
                subscribed ? nil : lockImage

                label?.text = ""

                view?.backgroundColor =
                subscribed
                ? ColorManager.randomColor()
                : .systemGray4
            }
        }
    }
    
    func labelsReset() {

        let labels = [
            label2,label3,label4,label5,label6,
            label7,label8,label9,label10,
            label11,label12
        ]

        labels.forEach {
            $0?.text = ""
        }
    }
    
    
    @IBAction func learningBtn(_ sender: UIButton) {
        
        highlightAnimation(learningView)
        
        
        isLearningExpanded.toggle()
        
        toggleViews([viewBG1],
                    expand: isLearningExpanded)
        
        rotateArrow(learningArrowImg,
                    expanded: isLearningExpanded)
    }
    
    
    @IBAction func quizBtn(_ sender: UIButton) {
        
        highlightAnimation(quizView)
        
        isQuizExpanded.toggle()
        
        toggleViews([viewBG2, viewBG3, viewBG4,viewBG5,viewBG6,viewBG7,viewBG8,viewBG9,viewBG10,viewBG11,viewBG12],
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
            withIdentifier: "LearnRomanNumeralsVC"
        ) as! LearnRomanNumeralsVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman1To10ShowVC"
        ) as! GuessRoman1To10ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman11To20ShowVC"
        ) as! GuessRoman11To20ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman21To30ShowVC"
        ) as! GuessRoman21To30ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman31To40ShowVC"
        ) as! GuessRoman31To40ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman41To50ShowVC"
        ) as! GuessRoman41To50ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman51To60ShowVC"
        ) as! GuessRoman51To60ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman61To70ShowVC"
        ) as! GuessRoman61To70ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman71To80ShowVC"
        ) as! GuessRoman71To80ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level10TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman81To90ShowVC"
        ) as! GuessRoman81To90ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level11TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman91To100ShowVC"
        ) as! GuessRoman91To100ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level12TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessRoman1To100ShowVC"
        ) as! GuessRoman1To100ShowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    
    @IBAction func restTapBtn(_ sender: UIButton) {

        for level in 2...12 {

            UserDefaults.standard.set(
                false,
                forKey:"romanNumeralsLevel\(level)Completed"
            )

            UserDefaults.standard.set(
                0,
                forKey:"romanNumeralsLevel\(level)Percentage"
            )
        }

        level2Percentage = 0
        level3Percentage = 0
        level4Percentage = 0
        level5Percentage = 0
        level6Percentage = 0
        level7Percentage = 0
        level8Percentage = 0
        level9Percentage = 0
        level10Percentage = 0
        level11Percentage = 0
        level12Percentage = 0

        labelsReset()

        updateResetVisibility()

        // lock/unlock state restore
        setupSubscriptionLock()
    }
    
    
}
