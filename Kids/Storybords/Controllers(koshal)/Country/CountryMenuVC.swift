//
//  CountryMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 03/03/26.
//

import UIKit

class CountryMenuVC: BaseViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
   
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
   
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
 
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
   
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    @IBOutlet weak var viewBG9: UIView!
 
    
    
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
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor
    

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor
        

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()
        viewBG3.layer.borderColor = UIColor.black.cgColor
   

        viewBG4.layer.cornerRadius = 10
        viewBG4.backgroundColor = ColorManager.randomColor()
        viewBG4.layer.borderColor = UIColor.black.cgColor
      

        viewBG6.layer.cornerRadius = 10
        viewBG6.backgroundColor = ColorManager.randomColor()
        viewBG6.layer.borderColor = UIColor.black.cgColor
       
        
        viewBG7.layer.cornerRadius = 10
        viewBG7.backgroundColor = ColorManager.randomColor()
        viewBG7.layer.borderColor = UIColor.black.cgColor
        
        
        viewBG8.layer.cornerRadius = 10
        viewBG8.backgroundColor = ColorManager.randomColor()
        viewBG8.layer.borderColor = UIColor.black.cgColor
        
        
        viewBG9.layer.cornerRadius = 10
        viewBG9.backgroundColor = ColorManager.randomColor()
        viewBG9.layer.borderColor = UIColor.black.cgColor
        
        
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
   
        updateScrollHeight()

        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
        // 🔥 LEVEL 4
        if UserDefaults.standard.bool(forKey: "learnContinentsLevel4Completed") {
            image4.image = UIImage(named: "done")
        } else {
            image4.image = nil
        }
        
        // 🔥 LEVEL 6
        if UserDefaults.standard.bool(forKey: "learnOceansLevel6Completed") {
            image6.image = UIImage(named: "done")
        } else {
            image6.image = nil
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
            viewBG9
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
        UserDefaults.standard.bool(forKey: "learnContinentsLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "learnOceansLevel6Completed")
        
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

        let levels: [(Int, UIImageView, UIView, String?)] = [

            (3, image3, viewBG3, nil),

            (4, image4, viewBG4,
             "learnContinentsLevel4Completed"),

            (6, image6, viewBG6,
             "learnOceansLevel6Completed"),

            (8, image8, viewBG8, nil),

            (9, image9, viewBG9, nil)
        ]

        let lockImage = UIImage(named: "lock")

        for (_, image, bg, key) in levels {

            let completed =
            key != nil
            ? UserDefaults.standard.bool(
                forKey: key!
              )
            : false

            if completed {

                // keep done image
                image.image = UIImage(named: "done")

                bg.backgroundColor =
                    ColorManager.randomColor()

            } else {

                image.image =
                    subscribed ? nil : lockImage

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
        
        toggleViews([viewBG1, viewBG2, viewBG3,viewBG4,viewBG6],
                    expand: isLearningExpanded)
        
        rotateArrow(learningArrowImg,
                    expanded: isLearningExpanded)
    }
    
    
    @IBAction func quizBtn(_ sender: UIButton) {
        
        highlightAnimation(quizView)
        
        isQuizExpanded.toggle()
        
        toggleViews([viewBG7,viewBG8,viewBG9],
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
            withIdentifier: "GlobeVC"
        ) as! GlobeVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "CountryFlagMenuVC"
        ) as! CountryFlagMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "CountryCapitaltMenuVC"
        ) as! CountryCapitaltMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnContinentsShowVC"
        ) as! LearnContinentsShowVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "LearnOceansShowVC"
        ) as! LearnOceansShowVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level7TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessFlagMenuVC"
        ) as! GuessFlagMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level8TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessTheCountryMenuVC"
        ) as! GuessTheCountryMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessTheCountryCapitalsMenuVC"
        ) as! GuessTheCountryCapitalsMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
     
        // 🔥 LEVEL 4 RESET
        image4.image = nil
        UserDefaults.standard.set(false, forKey: "learnContinentsLevel4Completed")
        
        // 🔥 LEVEL 6 RESET
        image6.image = nil
        UserDefaults.standard.set(false, forKey: "learnOceansLevel6Completed")
       
    
        // 🔥 Update reset visibility instantly
        updateResetVisibility()
    }
    
    
}
