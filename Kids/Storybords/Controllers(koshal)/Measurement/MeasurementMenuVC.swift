//
//  MeasurementMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 03/04/26.
//

import UIKit

class MeasurementMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
 
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
   
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

    var level8Percentage: Int = 0
    var level9Percentage: Int = 0
    var level10Percentage: Int = 0
    
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
        
     
        learningView.layer.cornerRadius = 10
        quizView.layer.cornerRadius = 10
        
        viewBG1.isHidden = true
        viewBG2.isHidden = true
        viewBG3.isHidden = true
        viewBG4.isHidden = true
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
  
        if UserDefaults.standard.bool(forKey: "measurementLevel1Completed") {
            image1.image = UIImage(named: "done")
        } else {
            image1.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "measurementLevel2Completed") {
            image2.image = UIImage(named: "done")
        } else {
            image2.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "measurementLevel3Completed") {
            image3.image = UIImage(named: "done")
        } else {
            image3.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "measurementLevel4Completed") {
            image4.image = UIImage(named: "done")
        } else {
            image4.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "measurementLevel6Completed") {
            image6.image = UIImage(named: "done")
        } else {
            image6.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "measurementLevel7Completed") {
            image7.image = UIImage(named: "done")
        } else {
            image7.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "measurementLevel8Completed") {
            image8.image = UIImage(named: "done")
            label8.text = "\(level8Percentage)%"
        } else {
            image8.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "measurementLevel9Completed") {
            image9.image = UIImage(named: "done")
            label9.text = "\(level9Percentage)%"
        } else {
            image9.image = nil
        }
        
        if UserDefaults.standard.bool(forKey: "measurementLevel10Completed") {
            image10.image = UIImage(named: "done")
            label10.text = "\(level10Percentage)%"
        } else {
            image10.image = nil
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
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "measurementLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "measurementLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "measurementLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "measurementLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "measurementLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "measurementLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "measurementLevel8Completed") ||
        UserDefaults.standard.bool(forKey: "measurementLevel9Completed") ||
        UserDefaults.standard.bool(forKey: "measurementLevel10Completed")
        
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

        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lock = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?)] = [

            (3,image3,viewBG3),
            (4,image4,viewBG4),
            (6,image6,viewBG6),
            (7,image7,viewBG7),
            (9,image9,viewBG9),
            (10,image10,viewBG10)
        ]

        for (level,image,bg) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "measurementLevel\(level)Completed"
            )

            if completed {

                image?.image = UIImage(named:"done")

                bg?.backgroundColor =
                    ColorManager.randomColor()

            } else {

                image?.image =
                    subscribed ? nil : lock

                bg?.backgroundColor =
                    subscribed
                    ? ColorManager.randomColor()
                    : .systemGray4
            }
        }
    }
    
    @IBAction func learningBtn(_ sender: UIButton) {
        
        highlightAnimation(learningView)
        
        
        isLearningExpanded.toggle()
        
        toggleViews([viewBG1, viewBG2, viewBG3,viewBG4,viewBG6,viewBG7],
                    expand: isLearningExpanded)
        
        rotateArrow(learningArrowImg,
                    expanded: isLearningExpanded)
    }
    
    
    @IBAction func quizBtn(_ sender: UIButton) {
        
        highlightAnimation(quizView)
        
        isQuizExpanded.toggle()
        
        toggleViews([viewBG8,viewBG9,viewBG10],
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
            withIdentifier: "LearnWeightUnitsShowVC"
        ) as! LearnWeightUnitsShowVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnWeightUnitConversionShowVC"
        ) as! LearnWeightUnitConversionShowVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnDistanceUnitsShowVC"
        ) as! LearnDistanceUnitsShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnDistanceUnitConversionShowVC"
        ) as! LearnDistanceUnitConversionShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnCapacityUnitsShowVC"
        ) as! LearnCapacityUnitsShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level7TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnCapacityUnitConversionShowVC"
        ) as! LearnCapacityUnitConversionShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level8TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessTheWeightUnitShowVC"
        ) as! GuessTheWeightUnitShowVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessTheDistanceUnitShowVC"
        ) as! GuessTheDistanceUnitShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level10TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessTheCapacityUnitShowVC"
        ) as! GuessTheCapacityUnitShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        let levels = [1,2,3,4,6,7,8,9,10]

        for level in levels {

            defaults.set(
                false,
                forKey: "measurementLevel\(level)Completed"
            )
        }

        level8Percentage = 0
        level9Percentage = 0
        level10Percentage = 0

        label8.text = ""
        label9.text = ""
        label10.text = ""

        // free levels only clear
        image1.image = nil
        image2.image = nil
        image8.image = nil

        updateResetVisibility()

        setupSubscriptionLock()
    }
    
    
}
