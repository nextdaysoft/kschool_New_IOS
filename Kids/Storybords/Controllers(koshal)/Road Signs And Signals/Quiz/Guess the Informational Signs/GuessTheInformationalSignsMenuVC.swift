//
//  GuessTheInformationalSignsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 04/04/26.
//

import UIKit

class GuessTheInformationalSignsMenuVC: BaseViewController {

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
            text: "Fuel / Gas Station",
            imageName: "fuel_station"
        ),
        
        LearnPlanetsItem(
            text: "Hospital / First Aid",
            imageName: "hospital"
        ),
        
        LearnPlanetsItem(
            text: "Bus Stop",
            imageName: "bus_stop"
        ),
        
        LearnPlanetsItem(
            text: "Pedestrian Crossing Zone",
            imageName: "pedestrian_crossing_zone"
        ),
        
        LearnPlanetsItem(
            text: "Parking",
            imageName: "parking"
        ),
        
        LearnPlanetsItem(
            text: "Road Name / Route Number",
            imageName: "road_name"
        ),
        
        LearnPlanetsItem(
            text: "Tourist Information",
            imageName: "tourist_information"
        ),
        
        LearnPlanetsItem(
            text: "Advisory Speed Limit",
            imageName: "advisory_speed_limit"
        ),
        
        LearnPlanetsItem(
            text: "City / Town Direction",
            imageName: "city_direction"
        ),
        
        LearnPlanetsItem(
            text: "Rest Area / Service Area",
            imageName: "rest_area"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Ferry Terminal / Crossing",
            imageName: "ferry_terminal_info"
        ),
        
        LearnPlanetsItem(
            text: "Bicycle Route / Cycle Path",
            imageName: "cycle_lane"
        ),
        
        LearnPlanetsItem(
            text: "Railway Station Direction",
            imageName: "railway_station_info"
        ),
        
        LearnPlanetsItem(
            text: "Parking for Disabled",
            imageName: "parking_disabled"
        ),
        
        LearnPlanetsItem(
            text: "End of Speed Limit Zone",
            imageName: "end_speed_limit_zone"
        ),
        
        LearnPlanetsItem(
            text: "One-Way Street Information",
            imageName: "one_way_info"
        ),
        
        LearnPlanetsItem(
            text: "Tunnel Information",
            imageName: "tunnel_info"
        ),
        
        LearnPlanetsItem(
            text: "Bridge Information",
            imageName: "bridge_info"
        ),
        
        LearnPlanetsItem(
            text: "Airport Information",
            imageName: "airport_info"
        ),
        
        LearnPlanetsItem(
            text: "Police Station",
            imageName: "police_station"
        ),
        
        LearnPlanetsItem(
            text: "Dead End / No Through Road",
            imageName: "dead_end_info"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Vehicle Height / Weight Advisory",
            imageName: "vehicle_advisory"
        ),
        
        LearnPlanetsItem(
            text: "Truck Parking",
            imageName: "truck_parking"
        ),
        
        LearnPlanetsItem(
            text: "Camp Site",
            imageName: "camp_site"
        ),
        
        LearnPlanetsItem(
            text: "Picnic Area",
            imageName: "picnic_area"
        ),
        
        LearnPlanetsItem(
            text: "Pedestrian Subway / Underpass",
            imageName: "pedestrian_subway"
        ),
        
        LearnPlanetsItem(
            text: "Scenic Route / Viewpoint",
            imageName: "scenic_route"
        ),
        
        LearnPlanetsItem(
            text: "Emergency Telephone",
            imageName: "emergency_telephone"
        ),
        
        LearnPlanetsItem(
            text: "Car Repair / Garage / Workshop",
            imageName: "car_repair"
        ),
        
        LearnPlanetsItem(
            text: "Camping / Caravan Park",
            imageName: "caravan_park"
        ),
        
        LearnPlanetsItem(
            text: "Toll Road Information",
            imageName: "toll_road_info"
        ),
        
        LearnPlanetsItem(
            text: "Tourist Attraction",
            imageName: "tourist_attraction"
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
                  UserDefaults.standard.bool(forKey: "guessTheInformationalSignsLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheInformationalSignsLevelData") as? [String: Int]

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

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheInformationalSignsLevelData") as? [String: Int] ?? [:]

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
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheInformationalSignsShowVC") as! GuessTheInformationalSignsShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheInformationalSignsShowVC") as! GuessTheInformationalSignsShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheInformationalSignsShowVC") as! GuessTheInformationalSignsShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "guessTheInformationalSignsLevel")
        updateLevelImages()
        updateResetVisibility()
    }
    
}
