//
//  MathsMenuVC.swift
//  New
//
//  Created by Koshal Singh on 15/04/26.
//

import UIKit
import LanguageManager_iOS

class MathsMenuVC: BaseViewController {

    // MARK: Images
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
    @IBOutlet weak var image14: UIImageView!
    @IBOutlet weak var image15: UIImageView!
    @IBOutlet weak var image16: UIImageView!
    @IBOutlet weak var image17: UIImageView!
    @IBOutlet weak var image18: UIImageView!
    @IBOutlet weak var image19: UIImageView!
    @IBOutlet weak var image20: UIImageView!
    
    // MARK: Labels
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
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label16: UILabel!
    @IBOutlet weak var label17: UILabel!
    @IBOutlet weak var label18: UILabel!
    @IBOutlet weak var label19: UILabel!
    @IBOutlet weak var label20: UILabel!
    

    // MARK: Background Views
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
    @IBOutlet weak var viewBG14: UIView!
    @IBOutlet weak var viewBG15: UIView!
    @IBOutlet weak var viewBG16: UIView!
    @IBOutlet weak var viewBG17: UIView!
    @IBOutlet weak var viewBG18: UIView!
    @IBOutlet weak var viewBG19: UIView!
    @IBOutlet weak var viewBG20: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    
    var isLearningExpanded = false
    var isQuizExpanded = false
    
    var selectedItem: SubItem?
    var isBiggestMode: Bool = true
    
    var didTapLockedLevel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setup()
        applyTheme()
        setupForRestBtn()
        
        let views = [
            viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,
            viewBG6, viewBG7, viewBG8, viewBG9, viewBG10,
            viewBG11, viewBG12, viewBG13, viewBG14, viewBG15,
            viewBG16, viewBG17, viewBG18, viewBG19, viewBG20
        ]

        views.forEach {
            $0?.layer.cornerRadius = 10
        }
    
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        applyTheme()
        setupAgeWiseUI()
        
        updateScrollHeight()
        
        if UserDefaults.standard.bool(forKey: "mathsLevel3Completed") {
            image3.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "mathsLevel3Percentage")
            label3.text = "\(percentage)%"
        } else {
            image3.image = nil
            label3.text = ""
        }
        
        if UserDefaults.standard.bool(forKey: "mathsLevel4Completed") {
            image4.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "mathsLevel4Percentage")
            label4.text = "\(percentage)%"
        } else {
            image4.image = nil
            label4.text = ""
        }
        
        // LEVEL 5
        if UserDefaults.standard.bool(forKey: "mathsLevel5Completed") {
            image5.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "mathsLevel5Percentage")
            label5.text = "\(percentage)%"
        } else {
            image5.image = nil
            label5.text = ""
        }
        
        // LEVEL 6
        if UserDefaults.standard.bool(forKey: "mathsLevel6Completed") {
            image6.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "mathsLevel6Percentage")
            label6.text = "\(percentage)%"
        } else {
            image6.image = nil
            label6.text = ""
        }
        
        // LEVEL 10
        if UserDefaults.standard.bool(forKey: "mathsLevel10Completed") {
            image10.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "mathsLevel10Percentage")
            label10.text = "\(percentage)%"
        } else {
            image10.image = nil
            label10.text = ""
        }
        
        // LEVEL 11
        if UserDefaults.standard.bool(forKey: "mathsLevel11Completed") {
            image11.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "mathsLevel11Percentage")
            label11.text = "\(percentage)%"
        } else {
            image11.image = nil
            label11.text = ""
        }
            
        // ✅ LEVEL 12 (Find Value)
        if UserDefaults.standard.bool(forKey: "mathsLevel12Completed") {
            
            image12.image = UIImage(named: "done")
            
            let percentage = UserDefaults.standard.integer(forKey: "mathsLevel12Percentage")
            label12.text = "\(percentage)%"
            
        } else {
            image12.image = nil
            label12.text = ""
        }
            
            
        // LEVEL 17
        if UserDefaults.standard.bool(forKey: "mathsLevel17Completed") {
            image17.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(forKey: "mathsLevel17Percentage")
            label17.text = "\(percentage)%"
        } else {
            image17.image = nil
            label17.text = ""
        }
            
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    func updateLevel(level: Int, percentage: Int) {

        switch level {

        case 3:
            image3.image = UIImage(named: "done")
            label3.text = "\(percentage)%"
            
        case 4:
            image4.image = UIImage(named: "done")
            label4.text = "\(percentage)%"

            UserDefaults.standard.set(true, forKey: "mathsLevel4Completed")
            UserDefaults.standard.set(percentage, forKey: "mathsLevel4Percentage")

            
        case 5:
            image5.image = UIImage(named: "done")
            label5.text = "\(percentage)%"

        case 6:
            image6.image = UIImage(named: "done")
            label6.text = "\(percentage)%"
          
        case 10:
            image10.image = UIImage(named: "done")
            label10.text = "\(percentage)%"
            
        case 11:
            image11.image = UIImage(named: "done")
            label11.text = "\(percentage)%"
          
        case 17:
            image17.image = UIImage(named: "done")
            label17.text = "\(percentage)%"
            
        default:
            break
        }
    }
    
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "mathsLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "mathsLevel4Completed") ||
        UserDefaults.standard.bool(forKey: "mathsLevel5Completed") ||
        UserDefaults.standard.bool(forKey: "mathsLevel6Completed") ||
        UserDefaults.standard.bool(forKey: "mathsLevel10Completed") ||
        UserDefaults.standard.bool(forKey: "mathsLevel11Completed") ||
        UserDefaults.standard.bool(forKey: "mathsLevel12Completed") ||
        UserDefaults.standard.bool(forKey: "mathsLevel17Completed")

        
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

        let normalViews = [
            viewBG1,
            viewBG2,
            viewBG8
        ]

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            normalViews.forEach {
                $0?.backgroundColor = .white
            }

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            normalViews.forEach {
                $0?.backgroundColor = ColorManager.randomColor()
            }
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

        let levelImages: [(Int, UIImageView?)] = [
            (3,image3),(4,image4),(5,image5),(6,image6),
            (7,image7),(9,image9),(10,image10),
            (11,image11),(12,image12),(13,image13),
            (14,image14),(15,image15),(16,image16),
            (17,image17),(18,image18),(19,image19),
            (20,image20)
        ]

        for (level,imageView) in levelImages {

            let completed =
            UserDefaults.standard.bool(
                forKey: "mathsLevel\(level)Completed"
            )

            if completed {

                // done sabse highest priority
                imageView?.image =
                UIImage(named:"done")

            } else {

                imageView?.image =
                subscribed ? nil : lock
            }
        }

        let views = [
            viewBG3,viewBG4,viewBG5,viewBG6,viewBG7,
            viewBG9,viewBG10,viewBG11,viewBG12,
            viewBG13,viewBG14,viewBG15,viewBG16,
            viewBG17,viewBG18,viewBG19,viewBG20
        ]

        let whiteTheme = UserDefaults.standard.bool(forKey: "WhiteTheme")

        views.forEach {

            if subscribed {

                $0?.backgroundColor = whiteTheme
                    ? .white
                    : ColorManager.randomColor()

            } else {

                $0?.backgroundColor = .systemGray4
            }
        }
    }
    
    func setupAgeWiseUI() {

        let selectedAge = UserDefaults.standard.string(
            forKey: "userAge"
        ) ?? ""

        // Pehle sab hide
        let allViews = [
            viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,
            viewBG6, viewBG7, viewBG8, viewBG9, viewBG10,
            viewBG11, viewBG12, viewBG13, viewBG14, viewBG15,
            viewBG16, viewBG17, viewBG18, viewBG19, viewBG20
        ]

        allViews.forEach {
            $0?.isHidden = true
        }

        if selectedAge == "1 - 6 yrs" {

            // show only 1–7
            let visibleViews = [
                viewBG1, viewBG2, viewBG3,
                viewBG4, viewBG5, viewBG6,
                viewBG7
            ]

            visibleViews.forEach {
                $0?.isHidden = false
            }

        } else if selectedAge == "7 - 12 yrs" {

            // show 2 + 8–20
            let visibleViews = [
                viewBG2,
                viewBG8, viewBG9, viewBG10,
                viewBG11, viewBG12, viewBG13,
                viewBG14, viewBG15, viewBG16,
                viewBG17, viewBG18, viewBG19,
                viewBG20
            ]

            visibleViews.forEach {
                $0?.isHidden = false
            }
        }
    }
    
    func updateScrollHeight() {

        let allViews = [
            viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,
            viewBG6, viewBG7, viewBG8, viewBG9, viewBG10,
            viewBG11, viewBG12, viewBG13, viewBG14, viewBG15,
            viewBG16, viewBG17, viewBG18, viewBG19, viewBG20
        ]

        let visibleCount = allViews.filter {
            $0?.isHidden == false
        }.count

        let oneViewHeight: CGFloat = 70
        let spacing: CGFloat = 15
        let extraPadding: CGFloat = 100

        let totalHeight =
        (CGFloat(visibleCount) * oneViewHeight) +
        (CGFloat(max(visibleCount - 1, 0)) * spacing) +
        extraPadding

        scrollViewHeightConstraint.constant = totalHeight

        self.view.layoutIfNeeded()
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
//        guard let item = selectedItem else { return }
//
//        ScreenRouter.route(
//            from: self,
//            item: item,
//            level: 1   // 👈 level pass karo
//        )
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "NumbersNamesMenuVC"
        ) as? NumbersNamesMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FindTheNumberMenuVC"
        ) as? FindTheNumberMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "CountVC"

        ) as? CountVC {

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "CompareNo"

        ) as? CompareNo {

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "AfterBefore"

        ) as? AfterBefore {

            vc.isBeforeNumber = false

            vc.screenTitle = "After Number".localiz()

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "AfterBefore"

        ) as? AfterBefore {

            vc.isBeforeNumber = true

            vc.screenTitle = "Before Number".localiz()

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level7TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "CountArithmeticMenuVC"

        ) as? CountArithmeticMenuVC {

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level8TapBtn(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "TablesMenuVC"
        ) as? TablesMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level9TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "CalculateMoneyMenuVC"

        ) as? CalculateMoneyMenuVC {

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level10TapBtn(_ sender: UIButton) {

       guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "AdditionSubstraction"

        ) as? AdditionSubstraction {

            vc.isPlus = true

            vc.screenTitle = "Addition".localiz()

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level11TapBtn(_ sender: UIButton) {

       guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "AdditionSubstraction"

        ) as? AdditionSubstraction {

            vc.isPlus = false

            vc.screenTitle = "Subtraction".localiz()

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level12TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "FindValueVC"

        ) as? FindValueVC {

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level13TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "BiggestNumberNewMenuVC"

        ) as? BiggestNumberNewMenuVC {

            vc.isBiggestMode = true

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level14TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "BiggestNumberNewMenuVC"

        ) as? BiggestNumberNewMenuVC {

            vc.isBiggestMode = false

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level15TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "AscendingAndDescendingMenuVC"

        ) as? AscendingAndDescendingMenuVC {

            vc.isAscendingMode = true

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level16TapBtn(_ sender: UIButton) {

       guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "AscendingAndDescendingMenuVC"

        ) as? AscendingAndDescendingMenuVC {

            vc.isAscendingMode = false

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level17TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "Fraction"

        ) as? Fraction {

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level18TapBtn(_ sender: UIButton) {

       guard checkSubscription() else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "WordMathMenuVC"

        ) as? WordMathMenuVC {

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func level19TapBtn(_ sender: UIButton) {

       guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "MathOperationsMenuVC"
        ) as? MathOperationsMenuVC {
            navigationController?.pushViewController(vc, animated: true)
        }

    }

    @IBAction func level20TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let vc = storyboard.instantiateViewController(

            withIdentifier: "BodmasMenuVC"

        ) as? BodmasMenuVC {

            navigationController?.pushViewController(vc, animated: true)

        }

    }

    @IBAction func restTapBtn(_ sender: UIButton) {

        image3.image = nil
        label3.text = ""
        UserDefaults.standard.set(false, forKey: "mathsLevel3Completed")
        UserDefaults.standard.removeObject(forKey: "mathsLevel3Percentage")
        
        image4.image = nil
        label4.text = ""
        UserDefaults.standard.set(false, forKey: "mathsLevel4Completed")
        UserDefaults.standard.removeObject(forKey: "mathsLevel4Percentage")
        
        image5.image = nil
        label5.text = ""
        UserDefaults.standard.set(false, forKey: "mathsLevel5Completed")
        UserDefaults.standard.removeObject(forKey: "mathsLevel5Percentage")
        
        image6.image = nil
        label6.text = ""
        UserDefaults.standard.set(false, forKey: "mathsLevel6Completed")
        UserDefaults.standard.removeObject(forKey: "mathsLevel6Percentage")
        
        image10.image = nil
        label10.text = ""
        UserDefaults.standard.set(false, forKey: "mathsLevel10Completed")
        UserDefaults.standard.removeObject(forKey: "mathsLevel10Percentage")
        
        image12.image = nil
        label12.text = ""
        UserDefaults.standard.set(false, forKey: "mathsLevel12Completed")
        UserDefaults.standard.removeObject(forKey: "mathsLevel12Percentage")
        
        image11.image = nil
        label11.text = ""
        UserDefaults.standard.set(false, forKey: "mathsLevel11Completed")
        UserDefaults.standard.removeObject(forKey: "mathsLevel11Percentage")
    
        image17.image = nil
        label17.text = ""
        UserDefaults.standard.set(false, forKey: "mathsLevel17Completed")
        UserDefaults.standard.removeObject(forKey: "mathsLevel17Percentage")
        
        updateResetVisibility()
    }
    
    
}
