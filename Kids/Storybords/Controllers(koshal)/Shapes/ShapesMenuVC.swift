//
//  ShapesMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 06/04/26.
//

import UIKit

class ShapesMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
   
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
 
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
   
    
    
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
    var level3Percentage: Int = 0
    var level4Percentage: Int = 0
    
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
     

     
        learningView.layer.cornerRadius = 10
        quizView.layer.cornerRadius = 10
        
        viewBG1.isHidden = true
        
        viewBG2.isHidden = true
        viewBG3.isHidden = true
        viewBG4.isHidden = true
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let isCompleted2 = UserDefaults.standard.bool(forKey: "shapesLevel2Completed")
           let percentage2 = UserDefaults.standard.integer(forKey: "shapesLevel2Percentage")

           if isCompleted2 {
               image2.image = UIImage(named: "done")
               label2.text = "\(percentage2)%"
           } else {
               image2.image = nil
               label2.text = ""
           }
        
        let isCompleted3 = UserDefaults.standard.bool(forKey: "shapesLevel3Completed")
           let percentage3 = UserDefaults.standard.integer(forKey: "shapesLevel3Percentage")

           if isCompleted3 {
               image3.image = UIImage(named: "done")
               label3.text = "\(percentage3)%"
           } else {
               image3.image = nil
               label3.text = ""
           }
        
        let isCompleted4 = UserDefaults.standard.bool(forKey: "shapesLevel4Completed")
           let percentage4 = UserDefaults.standard.integer(forKey: "shapesLevel4Percentage")

           if isCompleted4 {
               image4.image = UIImage(named: "done")
               label4.text = "\(percentage4)%"
           } else {
               image4.image = nil
               label4.text = ""
           }
       
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "shapesLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "shapesLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "shapesLevel4Completed")
        
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

        let lockImage = UIImage(named: "lock")

        let levels: [(Int, UIImageView, UILabel, UIView)] = [

            (2,image2,label2,viewBG2),
            (3,image3,label3,viewBG3),
            (4,image4,label4,viewBG4)
        ]

        for (level,image,label,bg) in levels {

            let isCompleted =
            UserDefaults.standard.bool(
                forKey: "shapesLevel\(level)Completed"
            )

            let percentage =
            UserDefaults.standard.integer(
                forKey: "shapesLevel\(level)Percentage"
            )

            if isCompleted {

                // highest priority
                image.image = UIImage(named:"done")
                label.text = "\(percentage)%"

                bg.backgroundColor =
                ColorManager.randomColor()

            } else {

                image.image =
                subscribed
                ? nil
                : lockImage

                label.text = ""

                bg.backgroundColor =
                subscribed
                ? ColorManager.randomColor()
                : .systemGray4
            }
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
        
        toggleViews([viewBG2, viewBG3, viewBG4],
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
            withIdentifier: "LearnShapesVC"
        ) as! LearnShapesVC

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
            withIdentifier: "Guess2DShapesShowVC"
        ) as! Guess2DShapesShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(
            name: "KoshalSB",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier: "Guess3DShapesShowVC"
        ) as! Guess3DShapesShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let storyboard = UIStoryboard(
            name: "KoshalSB",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessShapes2DAnd3DShowVC"
        ) as! GuessShapes2DAnd3DShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    
    @IBAction func restTapBtn(_ sender: UIButton) {

        for level in 2...4 {

            UserDefaults.standard.set(
                false,
                forKey: "shapesLevel\(level)Completed"
            )

            UserDefaults.standard.set(
                0,
                forKey: "shapesLevel\(level)Percentage"
            )
        }

        level2Percentage = 0
        level3Percentage = 0
        level4Percentage = 0

        label2.text = ""
        label3.text = ""
        label4.text = ""

        updateResetVisibility()

        // restore proper state
        setupSubscriptionLock()
    }
    
    
}
