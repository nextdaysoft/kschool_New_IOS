//
//  LetterMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 19/03/26.
//

import UIKit

class LetterMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!

    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    
    
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
        setupForRestBtn()
        applyTheme()
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10
        viewBG7.layer.cornerRadius = 10
        viewBG8.layer.cornerRadius = 10
        
      
        
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
        
        updateScrollHeight()

        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        applyTheme()
        
        if UserDefaults.standard.bool(forKey: "letterLevel1Completed") {

            image1.image = UIImage(named: "done")
            label1.text = ""

        } else {

            image1.image = nil
            label1.text = ""
        }
        
        if UserDefaults.standard.bool(
            forKey: "letterLevel2Completed"
        ) {

            image2.image = UIImage(named: "done")
            label2.text = ""

        } else {

            image2.image = nil
            label2.text = ""
        }
        
        if UserDefaults.standard.bool(
            forKey:"letterLevel3Completed"
        ){

            image3.image =
                UIImage(named:"done")

        } else {

            image3.image = nil
        }
        
        if UserDefaults.standard.bool(
            forKey: "letterLevel4Completed"
        ) {

            image4.image = UIImage(named: "done")
            label4.text = ""

        } else {

            image4.image = nil
            label4.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "letterLevel5Completed") {

            image5.image = UIImage(named: "done")
            label5.text = ""

        } else {

            image5.image = nil
            label5.text = ""
        }
        
        
        if UserDefaults.standard.bool(forKey: "letterLevel6Completed") {
            image6.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "letterLevel6Percentage")
            label6.text = "\(percentage)%"
              
          } else {
              image6.image = nil
              label6.text = ""
          }
       
        
        updateResetVisibility()
        setupSubscriptionLock()
        updateScrollHeight()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "letterLevel1Completed") ||
        UserDefaults.standard.bool(forKey: "letterLevel2Completed") ||
        UserDefaults.standard.bool(forKey: "letterLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "letterLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "letterLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "letterLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "letterLevel7Completed") ||
        UserDefaults.standard.bool(forKey: "letterLevel8Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
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
        }
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
            viewBG8
        ]

        let visibleCount = allViews.filter {
            !$0.isHidden
        }.count

        let oneViewHeight: CGFloat = 70
        let spacing: CGFloat = 15

        // Last view ke niche extra space
        let bottomPadding: CGFloat = 100 + view.safeAreaInsets.bottom

        let totalHeight =
            (CGFloat(visibleCount) * oneViewHeight) +
            (CGFloat(max(visibleCount - 1, 0)) * spacing) +
            bottomPadding

        scrollViewHeightConstraint.constant = totalHeight

        view.layoutIfNeeded()
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        if subscribed {

            // LEVEL 2
            image2.image = UserDefaults.standard.bool(forKey: "letterLevel2Completed")
                ? UIImage(named: "done")
                : nil

            // LEVEL 3
            image3.image = UserDefaults.standard.bool(forKey: "letterLevel3Completed")
                ? UIImage(named: "done")
                : nil

            // LEVEL 4
            image4.image = UserDefaults.standard.bool(forKey: "letterLevel4Completed")
                ? UIImage(named: "done")
                : nil

            // LEVEL 5
            image5.image = UserDefaults.standard.bool(forKey: "letterLevel5Completed")
                ? UIImage(named: "done")
                : nil

            // LEVEL 6
            if UserDefaults.standard.bool(forKey: "letterLevel6Completed") {

                image6.image = UIImage(named: "done")

                let percentage = UserDefaults.standard.integer(
                    forKey: "letterLevel6Percentage"
                )

                label6.text = "\(percentage)%"

            } else {

                image6.image = nil
                label6.text = ""
            }

            image7.image = nil
            image8.image = nil

            if UserDefaults.standard.bool(forKey: "WhiteTheme") {

                viewBG2.backgroundColor = .white
                viewBG3.backgroundColor = .white
                viewBG4.backgroundColor = .white
                viewBG5.backgroundColor = .white
                viewBG6.backgroundColor = .white
                viewBG7.backgroundColor = .white
                viewBG8.backgroundColor = .white

            } else {

                viewBG2.backgroundColor = ColorManager.randomColor()
                viewBG3.backgroundColor = ColorManager.randomColor()
                viewBG4.backgroundColor = ColorManager.randomColor()
                viewBG5.backgroundColor = ColorManager.randomColor()
                viewBG6.backgroundColor = ColorManager.randomColor()
                viewBG7.backgroundColor = ColorManager.randomColor()
                viewBG8.backgroundColor = ColorManager.randomColor()
            }

        } else {

            let lockImage = UIImage(named: "lock")

            // LEVEL 2
            image2.image = UserDefaults.standard.bool(forKey: "letterLevel2Completed")
                ? UIImage(named: "done")
                : lockImage

            // LEVEL 3
            image3.image = UserDefaults.standard.bool(forKey: "letterLevel3Completed")
                ? UIImage(named: "done")
                : lockImage

            // LEVEL 4
            image4.image = UserDefaults.standard.bool(forKey: "letterLevel4Completed")
                ? UIImage(named: "done")
                : lockImage

            // LEVEL 5
            image5.image = UserDefaults.standard.bool(forKey: "letterLevel5Completed")
                ? UIImage(named: "done")
                : lockImage

            // LEVEL 6
            if UserDefaults.standard.bool(forKey: "letterLevel6Completed") {

                image6.image = UIImage(named: "done")

                let percentage = UserDefaults.standard.integer(
                    forKey: "letterLevel6Percentage"
                )

                label6.text = "\(percentage)%"

            } else {

                image6.image = lockImage
                label6.text = ""
            }

            image7.image = lockImage
            image8.image = lockImage

            // Locked levels hamesha Gray rahenge
            viewBG2.backgroundColor = .systemGray4
            viewBG3.backgroundColor = .systemGray4
            viewBG4.backgroundColor = .systemGray4
            viewBG5.backgroundColor = .systemGray4
            viewBG6.backgroundColor = .systemGray4
            viewBG7.backgroundColor = .systemGray4
            viewBG8.backgroundColor = .systemGray4
        }
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
    
    @IBAction func learningBtn(_ sender: UIButton) {
        
        highlightAnimation(learningView)
        
        isLearningExpanded.toggle()
        
        toggleViews([viewBG1,viewBG2,viewBG3,viewBG4,viewBG5],
                    expand: isLearningExpanded)
        
        rotateArrow(learningArrowImg,
                    expanded: isLearningExpanded)
    }
    //viewBG2,viewBG3,viewBG4,viewBG5
    
    @IBAction func quizBtn(_ sender: UIButton) {
        
        highlightAnimation(quizView)
        
        isQuizExpanded.toggle()
        
        toggleViews([viewBG6, viewBG7,viewBG8],
                    expand: isQuizExpanded)
        
        rotateArrow(quizArrowImg,
                    expanded: isQuizExpanded)
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "DrawLetters"
        ) as! DrawLetters

        vc.screenTitleText = "Capital Letter"
        vc.letterStyle = .normal

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        guard SubscriptionManager.shared.isSubscribed()
        else{

            goToSubscription()
            return
        }

        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier:"DrawSmallLetters"
        ) as! DrawSmallLetters

        navigationController?.pushViewController(
            vc,
            animated:true
        )
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard SubscriptionManager.shared.isSubscribed() else {

            goToSubscription()
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "NumberMenuVC"
        ) as! NumberMenuVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard SubscriptionManager.shared.isSubscribed() else {
            goToSubscription()
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "DrawLetters"
        ) as! DrawLetters

        vc.letterStyle = .cursive
        vc.screenTitleText = "Capital Cursive Letter"

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    @IBAction func level5TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "SmallCursiveLetterVC"
        ) as! SmallCursiveLetterVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "IdentifyLetterShowVC"
        ) as! IdentifyLetterShowVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }


    @IBAction func level7TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "IdentifyNumberMenuVC"
        ) as! IdentifyNumberMenuVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }


    @IBAction func level8TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "ConnectTheVowelsMenuVC"
        ) as! ConnectTheVowelsMenuVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        defaults.set(false, forKey: "letterLevel1Completed")
        defaults.set(false, forKey: "letterLevel2Completed")
        defaults.set(false, forKey: "letterLevel3Completed")
        defaults.set(false, forKey: "letterLevel4Completed")
        defaults.set(false, forKey: "letterLevel5Completed")
        defaults.set(false, forKey: "letterLevel6Completed")

        defaults.removeObject(forKey: "letterLevel6Percentage")

        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
        image5.image = nil
        
        label5.text = ""
        label6.text = ""

        // Important
        setupSubscriptionLock()

        updateResetVisibility()
    }
    
    
}


