//
//  InternalBodyPartsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 04/04/26.
//

import UIKit

class InternalBodyPartsMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var label2: UILabel!
 
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    
    
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
    
    
    var isLearningExpanded = false
    var isQuizExpanded = false

    var level2Percentage: Int = 0
    
    var didTapLockedLevel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setup()
        setupForRestBtn()
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()

     
        learningView.layer.cornerRadius = 10
        quizView.layer.cornerRadius = 10
        
        viewBG1.isHidden = true
        
        viewBG2.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let isCompleted = UserDefaults.standard.bool(forKey: "internalBodyPartsLevel2Completed")
           let percentage = UserDefaults.standard.integer(forKey: "internalBodyPartsLevel2Percentage")

           if isCompleted {
               image2.image = UIImage(named: "done")
               label2.text = "\(percentage)%"
           } else {
               image2.image = nil
               label2.text = ""
           }
       
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "internalBodyPartsLevel2Completed")
        
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
            // Show
            views.forEach {
                $0.isHidden = false
                $0.alpha = 0
                $0.transform = CGAffineTransform(translationX: 0, y: -10)
            }
            
            UIView.animate(withDuration: 0.3) {
                views.forEach {
                    $0.alpha = 1
                    $0.transform = .identity
                }
            }
            
        } else {
            // Hide
            UIView.animate(withDuration: 0.3, animations: {
                views.forEach {
                    $0.alpha = 0
                    $0.transform = CGAffineTransform(translationX: 0, y: -10)
                }
            }) { _ in
                views.forEach {
                    $0.isHidden = true
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

        let isCompleted =
        UserDefaults.standard.bool(
            forKey: "internalBodyPartsLevel2Completed"
        )

        let percentage =
        UserDefaults.standard.integer(
            forKey: "internalBodyPartsLevel2Percentage"
        )

        if isCompleted {

            // completed state always highest priority
            image2.image = UIImage(named:"done")
            label2.text = "\(percentage)%"

            viewBG2.backgroundColor =
            ColorManager.randomColor()

        } else {

            // not completed
            image2.image =
            subscribed
            ? nil
            : UIImage(named:"lock")

            label2.text = ""

            viewBG2.backgroundColor =
            subscribed
            ? ColorManager.randomColor()
            : .systemGray4
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
        
        toggleViews([viewBG2],
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
            withIdentifier: "InternalBodyPartsVC"
        ) as! InternalBodyPartsVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(
            name: "KoshalSB",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessInternalBodyPartsShowVC"
        ) as! GuessInternalBodyPartsShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
 
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        UserDefaults.standard.set(
            false,
            forKey: "internalBodyPartsLevel2Completed"
        )

        UserDefaults.standard.set(
            0,
            forKey: "internalBodyPartsLevel2Percentage"
        )

        level2Percentage = 0

        label2.text = ""

        updateResetVisibility()

        // important
        setupSubscriptionLock()
    }
    
    
}
