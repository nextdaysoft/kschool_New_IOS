//
//  VehicleMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 01/04/26.
//

import UIKit

class VehicleMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
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
        
        learningView.layer.cornerRadius = 10
        quizView.layer.cornerRadius = 10
        
        viewBG1.isHidden = true
        
        viewBG2.isHidden = true
        viewBG3.isHidden = true
        viewBG4.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
        applyTheme()
        
        // 🔥 LEVEL 3
        if UserDefaults.standard.bool(forKey: "vehicleLevel3Completed") {
            image3.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "vehicleLevel3Percentage")
            label3.text = "\(percentage)%"
        } else {
            image3.image = nil
            label3.text = ""
        }
        
        
        
        // 🔥 LEVEL 4
        if UserDefaults.standard.bool(forKey: "vehicleLevel4Completed") {
            image4.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "vehicleLevel4Percentage")
            label4.text = "\(percentage)%"
        } else {
            image4.image = nil
            label4.text = ""
            
        }
        updateResetVisibility()
        setupSubscriptionLock()
        updateAgeBasedUI()
    }
    
    func updateAgeBasedUI() {

        let selectedAge = UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""

        // 1-6 years → only level2 visible
        if selectedAge == "1 - 6 yrs" {

            viewBG3.isHidden = true
            viewBG4.isHidden = true

            // agar quiz expanded hai to sirf level2 show hoga
            if isQuizExpanded {
                viewBG2.isHidden = false
            }

        } else {

            // 7-12 yrs -> sab visible
            if isQuizExpanded {

                viewBG2.isHidden = false
                viewBG3.isHidden = false
                viewBG4.isHidden = false
            }
        }
    }
    
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lockImage = UIImage(named: "lock")

        // LEVEL 3
        if UserDefaults.standard.bool(forKey: "vehicleLevel3Completed") {

            image3.image = UIImage(named: "done")

            let percentage = UserDefaults.standard.integer(
                forKey: "vehicleLevel3Percentage"
            )

            label3.text = "\(percentage)%"

        } else {

            image3.image = subscribed ? nil : lockImage
            label3.text = ""
        }

        // LEVEL 4
        if UserDefaults.standard.bool(forKey: "vehicleLevel4Completed") {

            image4.image = UIImage(named: "done")

            let percentage = UserDefaults.standard.integer(
                forKey: "vehicleLevel4Percentage"
            )

            label4.text = "\(percentage)%"

        } else {

            image4.image = subscribed ? nil : lockImage
            label4.text = ""
        }

        if subscribed {

            if UserDefaults.standard.bool(forKey: "WhiteTheme") {

                viewBG3.backgroundColor = .white
                viewBG4.backgroundColor = .white

            } else {

                viewBG3.backgroundColor = ColorManager.randomColor()
                viewBG4.backgroundColor = ColorManager.randomColor()
            }

        } else {

            // Locked levels हमेशा Gray रहेंगे
            viewBG3.backgroundColor = .systemGray4
            viewBG4.backgroundColor = .systemGray4
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
        UserDefaults.standard.bool(forKey: "vehicleLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "vehicleLevel4Completed")
        
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

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
            viewBG4.backgroundColor = ColorManager.randomColor()
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

        let selectedAge =
            UserDefaults.standard.string(forKey: "userAge") ?? ""

        if selectedAge == "1 - 6 yrs" {

            toggleViews(
                [viewBG2],
                expand: isQuizExpanded
            )

        } else {

            toggleViews(
                [viewBG2, viewBG3, viewBG4],
                expand: isQuizExpanded
            )
        }

        rotateArrow(
            quizArrowImg,
            expanded: isQuizExpanded
        )
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "ListenVehicleNameMenuVC"
        ) as! ListenVehicleNameMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "GuessVehicleMenuVC"
        ) as! GuessVehicleMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "CarPartsOutsideVC"
        ) as! CarPartsOutsideVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "CarPartsInsideVC"
        ) as! CarPartsInsideVC

        navigationController?.pushViewController(vc, animated: true)
    }
  
    
    @IBAction func restTapBtn(_ sender: UIButton) {
     
        // 🔥 LEVEL 3 RESET
        image3.image = nil
        label3.text = ""
        UserDefaults.standard.set(false, forKey: "vehicleLevel3Completed")
        UserDefaults.standard.removeObject(forKey: "vehicleLevel3Percentage")
        
        // 🔥 LEVEL 4 RESET
        image4.image = nil
        label4.text = ""
        UserDefaults.standard.set(false, forKey: "vehicleLevel4Completed")
        UserDefaults.standard.removeObject(forKey: "vehicleLevel4Percentage")
    
        // 🔥 Update reset visibility instantly
        updateResetVisibility()
    }
    
    
}

