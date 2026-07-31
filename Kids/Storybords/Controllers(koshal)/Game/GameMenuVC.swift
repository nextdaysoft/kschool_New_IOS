//
//  GameMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 19/01/26.
//

import UIKit

class GameMenuVC: BaseViewController {

    @IBOutlet weak var findPairImage: UIImageView!
    @IBOutlet weak var ballShotGameImage: UIImageView!
    @IBOutlet weak var rememberImage: UIImageView!
    @IBOutlet weak var findMage: UIImageView!
    @IBOutlet weak var shodowMatchGameImage: UIImageView!
    @IBOutlet weak var puzzleImage: UIImageView!
    
    
    @IBOutlet weak var rememberLabel: UILabel!
    @IBOutlet weak var findLabel: UILabel!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
   
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var receivedPercentage3: Int?
    var receivedPercentage4: Int?
    
    var level3Completed = false
    var level4Completed = false

   
    
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


        viewBG5.layer.cornerRadius = 10
        viewBG5.backgroundColor = ColorManager.randomColor()
        viewBG5.layer.borderColor = UIColor.black.cgColor
     
        
        viewBG6.layer.cornerRadius = 10
        viewBG6.backgroundColor = ColorManager.randomColor()
        viewBG6.layer.borderColor = UIColor.black.cgColor
        
        setupSubscriptionLock()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupAgeWiseUI()

        // refresh lock state every time
        setupSubscriptionLock()

        let subscribed = SubscriptionManager.shared.isSubscribed()

        if UserDefaults.standard.bool(forKey: "gameLevel3Completed") {

            rememberImage.image = UIImage(named: "done")
            let percentage = UserDefaults.standard.integer(
                forKey: "gameLevel3Percentage"
            )

            rememberLabel.text = "\(percentage)%"

        } else {

            // only remove image if subscribed
            if subscribed {
                rememberImage.image = nil
            }

            rememberLabel.text = ""
        }


        if UserDefaults.standard.bool(forKey: "gameLevel4Completed") {

            findMage.image = UIImage(named: "done")

            let percentage = UserDefaults.standard.integer(
                forKey: "gameLevel4Percentage"
            )

            findLabel.text = "\(percentage)%"

        } else {

            // only remove image if subscribed
            if subscribed {
                findMage.image = nil
            }

            findLabel.text = ""
        }

        updateResetVisibility()
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()

        if subscribed {

            // remove lock
            findPairImage.image = nil
            ballShotGameImage.image = nil
            rememberImage.image = nil
            findMage.image = nil

            // keep normal colors
            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
            viewBG3.backgroundColor = ColorManager.randomColor()
            viewBG4.backgroundColor = ColorManager.randomColor()

        } else {

            let lockImage = UIImage(named: "lock")

            // locked only these
            findPairImage.image = lockImage
            ballShotGameImage.image = lockImage
            rememberImage.image = lockImage
            findMage.image = lockImage

            // gray background for locked items
            viewBG1.backgroundColor = .systemGray4
            viewBG2.backgroundColor = .systemGray4
            viewBG3.backgroundColor = .systemGray4
            viewBG4.backgroundColor = .systemGray4

            // keep these unlocked
            shodowMatchGameImage.image = nil
            puzzleImage.image = nil
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
    
    func setupAgeWiseUI() {

        let selectedAge = UserDefaults.standard.string(forKey: "userAge") ?? ""

        if selectedAge == "1 - 6 yrs" {

            viewBG1.isHidden = true
            viewBG2.isHidden = true
            viewBG3.isHidden = true
            viewBG4.isHidden = true

        } else {

            viewBG1.isHidden = false
            viewBG2.isHidden = false
            viewBG3.isHidden = false
            viewBG4.isHidden = false
        }
    }
    
    func updateResetVisibility() {
        
        let isAnyLevelCompleted =
        UserDefaults.standard.bool(forKey: "gameLevel3Completed") ||
        UserDefaults.standard.bool(forKey: "gameLevel4Completed")
        
        restBtn.isHidden = !isAnyLevelCompleted
        restLabel.isHidden = !isAnyLevelCompleted
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
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
  
    @IBAction func level1TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FindPairLevelsMenu"
        ) as? FindPairLevelsMenu {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "BallShortGameVC"
        ) as? BallShortGameVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "RememberShapeAndColorVC"
        ) as? RememberShapeAndColorVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "FindTheOrderVC"
        ) as? FindTheOrderVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func level5TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "ShadowMatchGameMenuVC"
        ) as? ShadowMatchGameMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "PuzzleCategoryMenuVC"
        ) as? PuzzleCategoryMenuVC {

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        rememberImage.image = nil
        rememberLabel.text = ""
        UserDefaults.standard.set(false, forKey: "gameLevel3Completed")
        UserDefaults.standard.removeObject(forKey: "gameLevel3Percentage")
        
        findMage.image = nil
        findLabel.text = ""
        UserDefaults.standard.set(false, forKey: "gameLevel4Completed")
        UserDefaults.standard.removeObject(forKey: "gameLevel4Percentage")
    
        updateResetVisibility()
    }
    
}
