//
//  GuessTheWarningSignsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 04/04/26.
//

import UIKit

class GuessTheWarningSignsMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
   
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
   
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var didTapLockedLevel = false
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Speed Hump Ahead",
            imageName: "speed_breaker_ahead"
        ),
        
        LearnPlanetsItem(
            text: "Road Narrows Ahead",
            imageName: "road_narrow_ahead"
        ),
        
        LearnPlanetsItem(
            text: "Steep Ascent Ahead",
            imageName: "steep_ascent_ahead"
        ),
        
        LearnPlanetsItem(
            text: "Curve Ahead",
            imageName: "curve_ahead"
        ),
        
        LearnPlanetsItem(
            text: "Pedestrian Crossing",
            imageName: "pedestrian_crossing"
        ),
        
        LearnPlanetsItem(
            text: "Cattle Crossing",
            imageName: "cattle_crossing"
        ),
        
        LearnPlanetsItem(
            text: "Slippery Road",
            imageName: "slippery_road"
        ),
        
        LearnPlanetsItem(
            text: "School Ahead",
            imageName: "school_ahead"
        ),
        
        LearnPlanetsItem(
            text: "Steep Descent Ahead",
            imageName: "steep_descent_ahead"
        ),
        
        LearnPlanetsItem(
            text: "Sharp Bend (Left / Right)",
            imageName: "sharp_turn"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Side Road (Left)",
            imageName: "side_road_left"
        ),
        
        LearnPlanetsItem(
            text: "Cross Road Ahead",
            imageName: "cross_road"
        ),
        
        LearnPlanetsItem(
            text: "Road Narrows (Right)",
            imageName: "road_narrows_right"
        ),
        
        LearnPlanetsItem(
            text: "Cycle Crossing",
            imageName: "cycle_crossing"
        ),
        
        LearnPlanetsItem(
            text: "Falling Rocks",
            imageName: "falling_rocks"
        ),
        
        LearnPlanetsItem(
            text: "Road Work Ahead",
            imageName: "men_at_work"
        ),
        
        LearnPlanetsItem(
            text: "Roundabout Ahead",
            imageName: "roundabout_ahead"
        ),
        
        LearnPlanetsItem(
            text: "Side Road (Right)",
            imageName: "side_road_right"
        ),
        
        LearnPlanetsItem(
            text: "Road Narrows (Left)",
            imageName: "road_narrows_left"
        ),
        
        LearnPlanetsItem(
            text: "Two-Way Traffic",
            imageName: "two_way_traffic"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Gap in Median",
            imageName: "gap_in_median"
        ),
        
        LearnPlanetsItem(
            text: "Hairpin Bend",
            imageName: "hairpin_bend"
        ),
        
        LearnPlanetsItem(
            text: "Narrow Bridge",
            imageName: "narrow_bridge"
        ),
        
        LearnPlanetsItem(
            text: "Dangerous Dip",
            imageName: "dangerous_dip"
        ),
        
        LearnPlanetsItem(
            text: "End of Dual Carriageway Ahead",
            imageName: "end_of_dual_carriageway"
        ),
        
        LearnPlanetsItem(
            text: "Ferry",
            imageName: "ferry"
        ),
        
        LearnPlanetsItem(
            text: "Rough Road",
            imageName: "rough_road"
        ),
        
        LearnPlanetsItem(
            text: "Uneven Road",
            imageName: "uneven_road"
        ),
        
        LearnPlanetsItem(
            text: "Quayside / River Bank Ahead",
            imageName: "quayside_or_river_bank"
        ),
        
        LearnPlanetsItem(
            text: "Traffic Signal Ahead",
            imageName: "traffic_signal_ahead"
        )
    ]
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Double Bend (Left then Right)",
            imageName: "double_bend_left_right"
        ),
        
        LearnPlanetsItem(
            text: "Level Crossing without Barrier",
            imageName: "level_crossing_without_barrier"
        ),
        
        LearnPlanetsItem(
            text: "Falling Ice or Snow",
            imageName: "falling_ice_snow"
        ),
        
        LearnPlanetsItem(
            text: "Double Bend (Right then Left)",
            imageName: "double_bend_right_left"
        ),
        
        LearnPlanetsItem(
            text: "Low-Flying Aircraft",
            imageName: "low_flying_aircraft"
        ),
        
        LearnPlanetsItem(
            text: "Animals Crossing",
            imageName: "animals_other_than_cattle"
        ),
        
        LearnPlanetsItem(
            text: "Tunnel Ahead",
            imageName: "tunnel_ahead"
        ),
        
        LearnPlanetsItem(
            text: "Level Crossing with Barrier",
            imageName: "level_crossing_with_barrier"
        ),
        
        LearnPlanetsItem(
            text: "Loose Gravel",
            imageName: "loose_chippings"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupForRestBtn()
       
        
        view1.layer.borderColor = UIColor.black.cgColor
        view1.layer.borderWidth = 1
        view1.layer.cornerRadius = 20
        view1.clipsToBounds = true

        view2.layer.borderColor = UIColor.black.cgColor
        view2.layer.borderWidth = 1
        view2.layer.cornerRadius = 20
        view2.clipsToBounds = true

        view3.layer.borderColor = UIColor.black.cgColor
        view3.layer.borderWidth = 1
        view3.layer.cornerRadius = 20
        view3.clipsToBounds = true

        view4.layer.borderColor = UIColor.black.cgColor
        view4.layer.borderWidth = 1
        view4.layer.cornerRadius = 20
        view4.clipsToBounds = true
        
        
        
        
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        for i in 1...4 {
            print("Level \(i) Completed:",
                  UserDefaults.standard.bool(forKey: "guessTheWarningSignsLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheWarningSignsLevelData") as? [String: Int]

        let isAnyCompleted = !(levelData?.isEmpty ?? true)

        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheWarningSignsLevelData") as? [String: Int] ?? [:]

        if let percentage = levelData["\(level)"] {
            imageView.image = UIImage(named: "done")
            label.text = "\(percentage)%"
        } else {
            imageView.image = nil
            label.text = ""
        }
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

        let levelData =
        UserDefaults.standard.dictionary(
            forKey: "guessTheWarningSignsLevelData"
        ) as? [String:Int] ?? [:]

        let levels : [(String,UIImageView,UILabel,UIView)] = [

            ("3",image3,label3,viewBG3),
            ("4",image4,label4,viewBG4)
        ]

        for (level,image,label,bg) in levels {

            if let percentage = levelData[level] {

                // completed
                image.image = UIImage(named:"done")
                label.text = "\(percentage)%"

                bg.backgroundColor =
                ColorManager.randomColor()

            } else {

                // not completed
                image.image =
                subscribed ? nil : lockImage

                label.text = ""

                bg.backgroundColor =
                subscribed
                ? ColorManager.randomColor()
                : .systemGray4
            }
        }
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheWarningSignsShowVC") as! GuessTheWarningSignsShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheWarningSignsShowVC") as! GuessTheWarningSignsShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheWarningSignsShowVC"
        ) as! GuessTheWarningSignsShowVC

        vc.planets = planets3
        vc.levelNumber = 3

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription()
        else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheWarningSignsShowVC"
        ) as! GuessTheWarningSignsShowVC

        vc.planets = planets4
        vc.levelNumber = 4

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        UserDefaults.standard.removeObject(
            forKey: "guessTheWarningSignsLevelData"
        )

        // free levels clear
        image1.image = nil
        image2.image = nil

        label1.text = ""
        label2.text = ""

        updateResetVisibility()

        // lock restore
        setupSubscriptionLock()
    }
    
}
