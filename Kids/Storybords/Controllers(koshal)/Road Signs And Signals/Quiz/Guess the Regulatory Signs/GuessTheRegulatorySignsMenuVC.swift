//
//  GuessTheRegulatorySignsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 04/04/26.
//

import UIKit

class GuessTheRegulatorySignsMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
   
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Turn Right Only",
            imageName: "turn_right_only"
        ),
        
        LearnPlanetsItem(
            text: "Give Way / Yield",
            imageName: "give_way"
        ),
        
        LearnPlanetsItem(
            text: "Straight Ahead Only",
            imageName: "straight_only"
        ),
        
        LearnPlanetsItem(
            text: "Stop",
            imageName: "stop"
        ),
        
        LearnPlanetsItem(
            text: "No Entry",
            imageName: "no_entry"
        ),
        
        LearnPlanetsItem(
            text: "No Overtaking",
            imageName: "no_overtaking"
        ),
        
        LearnPlanetsItem(
            text: "Turn Left Only",
            imageName: "turn_left_only"
        ),
        
        LearnPlanetsItem(
            text: "No Parking",
            imageName: "no_parking"
        ),
        
        LearnPlanetsItem(
            text: "One Way",
            imageName: "one_way"
        ),
        
        LearnPlanetsItem(
            text: "Pedestrian Zone",
            imageName: "pedestrian_zone"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "No Horn",
            imageName: "no_horn"
        ),
        
        LearnPlanetsItem(
            text: "No Right Turn",
            imageName: "no_right_turn"
        ),
        
        LearnPlanetsItem(
            text: "No U-Turn",
            imageName: "no_u_turn"
        ),
        
        LearnPlanetsItem(
            text: "Minimum Speed Limit",
            imageName: "min_speed_limit"
        ),
        
        LearnPlanetsItem(
            text: "No Motorcycles",
            imageName: "no_motorcycles"
        ),
        
        LearnPlanetsItem(
            text: "No Pedestrians",
            imageName: "no_pedestrians"
        ),
        
        LearnPlanetsItem(
            text: "No Trucks / Lorries",
            imageName: "no_trucks"
        ),
        
        LearnPlanetsItem(
            text: "No Left Turn",
            imageName: "no_left_turn"
        ),
        
        LearnPlanetsItem(
            text: "No Bicycles",
            imageName: "no_bicycles"
        ),
        
        LearnPlanetsItem(
            text: "No Stopping",
            imageName: "no_stopping"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Bus Lane",
            imageName: "bus_lane"
        ),
        
        LearnPlanetsItem(
            text: "Compulsory Roundabout",
            imageName: "compulsory_roundabout"
        ),
        
        LearnPlanetsItem(
            text: "Vehicle Height / Width / Weight Restriction",
            imageName: "vehicle_restriction"
        ),
        
        LearnPlanetsItem(
            text: "Keep Left",
            imageName: "keep_left"
        ),
        
        LearnPlanetsItem(
            text: "Cycle Lane",
            imageName: "cycle_lane"
        ),
        
        LearnPlanetsItem(
            text: "Parking for Disabled",
            imageName: "parking_disabled"
        ),
        
        LearnPlanetsItem(
            text: "End of Priority Road",
            imageName: "end_of_priority_road"
        ),
        
        LearnPlanetsItem(
            text: "Keep Right",
            imageName: "keep_right"
        ),
        
        LearnPlanetsItem(
            text: "No Motor Vehicles",
            imageName: "no_motor_vehicles"
        ),
        
        LearnPlanetsItem(
            text: "Maximum Speed Limit",
            imageName: "max_speed_limit"
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
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()
        viewBG3.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        for i in 1...3 {
            print("Level \(i) Completed:",
                  UserDefaults.standard.bool(forKey: "guessTheRegulatorySignsLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheRegulatorySignsLevelData") as? [String: Int]

        let isAnyCompleted = !(levelData?.isEmpty ?? true)

        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let isCompleted = UserDefaults.standard.bool(
            forKey: "guessTheRegulatorySignsLevel\(level)Completed"
        )

        let percentage = UserDefaults.standard.integer(
            forKey: "guessTheRegulatorySignsLevel\(level)Percentage"
        )

        if isCompleted {

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
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheRegulatorySignsShowVC") as! GuessTheRegulatorySignsShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheRegulatorySignsShowVC") as! GuessTheRegulatorySignsShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheRegulatorySignsShowVC") as! GuessTheRegulatorySignsShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        UserDefaults.standard.removeObject(
            forKey: "guessTheRegulatorySignsLevelData"
        )

        for i in 1...3 {

            UserDefaults.standard.removeObject(
                forKey: "guessTheRegulatorySignsLevel\(i)Completed"
            )

            UserDefaults.standard.removeObject(
                forKey: "guessTheRegulatorySignsLevel\(i)Percentage"
            )
        }

        UserDefaults.standard.synchronize()

        updateLevelImages()
        updateResetVisibility()
    }
    
}
