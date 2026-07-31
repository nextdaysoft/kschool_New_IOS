//
//  ScienceMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 20/01/26.
//

import UIKit

class ScienceMenuVC: BaseViewController {

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
    @IBOutlet weak var image13: UIImageView!
    
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
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    
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
    @IBOutlet weak var viewBG13: UIView!
    
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
        viewBG11.layer.cornerRadius = 10
        viewBG12.layer.cornerRadius = 10
        viewBG13.layer.cornerRadius = 10
        
        
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
        viewBG13.isHidden = true
        
        updateScrollHeight()

        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.bool(forKey: "scienceLevel2Completed") {
            image2.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel2Percentage")
            label2.text = "\(percentage)%"
        } else {
            image2.image = nil
            label2.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "scienceLevel3Completed") {
            image3.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel3Percentage")
            label3.text = "\(percentage)%"
        } else {
            image3.image = nil
            label3.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "scienceLevel4Completed") {
            image4.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel4Percentage")
            label4.text = "\(percentage)%"
        } else {
            image4.image = nil
            label4.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "scienceLevel5Completed") {
            image5.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel5Percentage")
            label5.text = "\(percentage)%"
        } else {
            image5.image = nil
            label5.text = ""
        }
        
        
        if UserDefaults.standard.bool(forKey: "scienceLevel6Completed") {
            image6.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel6Percentage")
            label6.text = "\(percentage)%"
        } else {
            image6.image = nil
            label6.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "scienceLevel9Completed") {
            image9.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel9Percentage")
            label9.text = "\(percentage)%"
        } else {
            image9.image = nil
            label9.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "scienceLevel10Completed") {
            image10.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel10Percentage")
            label10.text = "\(percentage)%"
        } else {
            image10.image = nil
            label10.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "scienceLevel11Completed") {
            image11.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel11Percentage")
            label11.text = "\(percentage)%"
        } else {
            image11.image = nil
            label11.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "scienceLevel12Completed") {
            image12.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel12Percentage")
            label12.text = "\(percentage)%"
        } else {
            image12.image = nil
            label12.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "scienceLevel13Completed") {
            image13.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "scienceLevel13Percentage")
            label13.text = "\(percentage)%"
        } else {
            image13.image = nil
            label13.text = ""
        }
        
        updateResetVisibility()
        setupSubscriptionLock()
        updateScrollHeight()
        applyTheme()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "scienceLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel9Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel10Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel11Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel12Completed") ||
        UserDefaults.standard.bool(forKey: "scienceLevel13Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
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

        let lockImage =
        UIImage(named:"lock")

        let levels:[(UIImageView,UIView,UILabel,Int)] = [

            (image1,viewBG1,label1,1),
            (image5,viewBG5,label5,5),
            (image6,viewBG6,label6,6),
            (image7,viewBG7,label7,7),
            (image8,viewBG8,label8,8),
            (image9,viewBG9,label9,9),
            (image10,viewBG10,label10,10),
            (image11,viewBG11,label11,11),
            (image12,viewBG12,label12,12),
            (image13,viewBG13,label13,13)
        ]

        for (image,bg,label,level) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey:
                "scienceLevel\(level)Completed"
            )

            if completed {

                image.image =
                UIImage(named:"done")

                let percentage =
                UserDefaults.standard.integer(
                    forKey:
                    "scienceLevel\(level)Percentage"
                )

                label.text =
                "\(percentage)%"

                bg.backgroundColor =
                        UserDefaults.standard.bool(forKey: "WhiteTheme")
                        ? .white
                        : ColorManager.randomColor()

            } else {

                image.image =
                subscribed
                ? nil
                : lockImage

                label.text = ""

                bg.backgroundColor =
                        subscribed
                        ? (UserDefaults.standard.bool(forKey: "WhiteTheme")
                            ? .white
                            : ColorManager.randomColor())
                        : .systemGray4
            }
        }
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
    }

    func applyTheme() {

        let bgViews = [
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
            viewBG12,
            viewBG13
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            learningView.backgroundColor = .white
            quizView.backgroundColor = .white

            bgViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            learningView.backgroundColor = ColorManager.randomColor()
            quizView.backgroundColor = ColorManager.randomColor()

            bgViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
        }

        setupSubscriptionLock()
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
            viewBG12,
            viewBG13
        ]

        let visibleCount = allViews.filter { !$0.isHidden }.count

        let oneViewHeight: CGFloat = 70
        let spacing: CGFloat = 15
        let bottomSpace: CGFloat = 120   // 👈 Last view ke niche extra space

        let totalHeight =
            (CGFloat(visibleCount) * oneViewHeight) +
            (CGFloat(max(visibleCount - 1, 0)) * spacing) +
            bottomSpace

        scrollViewHeightConstraint.constant = totalHeight

        view.layoutIfNeeded()
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
        
        toggleViews([viewBG1],
                    expand: isLearningExpanded)
        
        rotateArrow(learningArrowImg,
                    expanded: isLearningExpanded)
    }
    
    
    @IBAction func quizBtn(_ sender: UIButton) {
        
        highlightAnimation(quizView)
        
        isQuizExpanded.toggle()
        
        toggleViews([viewBG2,viewBG3,viewBG4,viewBG5, viewBG6, viewBG7,viewBG8,viewBG9,viewBG10,viewBG11,viewBG12,viewBG13],
                    expand: isQuizExpanded)
        
        rotateArrow(quizArrowImg,
                    expanded: isQuizExpanded)
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "ListenHealthyFoodHabitsLevelsMenuVC"
        ) as! ListenHealthyFoodHabitsLevelsMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "DomesticAndWildAnimal"
        ) as! DomesticAndWildAnimal

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfComputerVC"
        ) as! PartsOfComputerVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "FoodChainVC"
        ) as! FoodChainVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "WaterCycleVC"
        ) as! WaterCycleVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfPlantVC"
        ) as! PartsOfPlantVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "HealthyVsUnhealthyMenuVC"
        ) as! HealthyVsUnhealthyMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "HealthyFoodHabitsMenuVC"
        ) as! HealthyFoodHabitsMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfDogVC"
        ) as! PartsOfDogVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level10TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfTreeVC"
        ) as! PartsOfTreeVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level11TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "RainbowVC"
        ) as! RainbowVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level12TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "PartsOfFishVC"
        ) as! PartsOfFishVC

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level13TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "LighterAndHeavierVC"
        ) as! LighterAndHeavierVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        image2.image = nil
        label2.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel2Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel2Percentage")

        image3.image = nil
        label3.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel3Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel3Percentage")

        image4.image = nil
        label4.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel4Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel4Percentage")

        image5.image = nil
        label5.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel5Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel5Percentage")

        image6.image = nil
        label6.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel6Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel6Percentage")

        image9.image = nil
        label9.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel9Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel9Percentage")

        image10.image = nil
        label10.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel10Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel10Percentage")

        image11.image = nil
        label11.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel11Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel11Percentage")

        image12.image = nil
        label12.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel12Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel12Percentage")

        image13.image = nil
        label13.text = ""
        UserDefaults.standard.set(false, forKey: "scienceLevel13Completed")
        UserDefaults.standard.removeObject(forKey: "scienceLevel13Percentage")

        updateResetVisibility()

        // ✅ lock image wapas lag jayegi
        setupSubscriptionLock()
    }
    
    
}
