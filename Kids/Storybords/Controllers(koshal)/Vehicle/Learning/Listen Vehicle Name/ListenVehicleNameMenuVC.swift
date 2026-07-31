//
//  ListenVehicleNameMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 01/04/26.
//

import UIKit

class ListenVehicleNameMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
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
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Bike",
            imageName: "motorcycle"
        ),
        
        LearnPlanetsItem(
            text: "Bicycle",
            imageName: "bicycle"
        ),
        
        LearnPlanetsItem(
            text: "Car",
            imageName: "car"
        ),
        
        LearnPlanetsItem(
            text: "Bus",
            imageName: "busLane"
        ),
        
        LearnPlanetsItem(
            text: "Fire Truck",
            imageName: "fireBrigade"
        ),
        
        LearnPlanetsItem(
            text: "Tractor",
            imageName: "tractor"
        ),
        
        LearnPlanetsItem(
            text: "Scooter",
            imageName: "deliver"
        ),
        
        LearnPlanetsItem(
            text: "Dump Truck",
            imageName: "dumpTruck"
        ),
        
        LearnPlanetsItem(
            text: "Ambulance",
            imageName: "ambulance"
        ),
        
        LearnPlanetsItem(
            text: "Auto Rickshaw",
            imageName: "autoRickshaw"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Parachute",
            imageName: "parachute"
        ),
        
        LearnPlanetsItem(
            text: "Helicopter",
            imageName: "helicopter"
        ),
        
        LearnPlanetsItem(
            text: "Rocket",
            imageName: "rocket"
        ),
        
        LearnPlanetsItem(
            text: "Seaplane",
            imageName: "seaplane"
        ),
        
        LearnPlanetsItem(
            text: "Glider",
            imageName: "glider"
        ),
        
        LearnPlanetsItem(
            text: "Jet",
            imageName: "fighterJet"
        ),
        
        LearnPlanetsItem(
            text: "Aeroplane",
            imageName: "travelling"
        ),
        
        LearnPlanetsItem(
            text: "Hot Air Balloon",
            imageName: "hotAirBalloon"
        ),
        
        LearnPlanetsItem(
            text: "Drone",
            imageName: "drone"
        ),
        
        LearnPlanetsItem(
            text: "Airship",
            imageName: "airship"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Yacht",
            imageName: "yacht"
        ),
        
        LearnPlanetsItem(
            text: "Snowmobile",
            imageName: "snowmobile"
        ),
        
        LearnPlanetsItem(
            text: "Ship",
            imageName: "cruiseShip"
        ),
        
        LearnPlanetsItem(
            text: "Hovercraft",
            imageName: "hovercraft"
        ),
        
        LearnPlanetsItem(
            text: "Canoe",
            imageName: "canoe"
        ),
        
        LearnPlanetsItem(
            text: "Speedboat",
            imageName: "speedboat"
        ),
        
        LearnPlanetsItem(
            text: "Jet Ski",
            imageName: "jetSki"
        ),
        
        LearnPlanetsItem(
            text: "Submarine",
            imageName: "submarine"
        ),
        
        LearnPlanetsItem(
            text: "Kayak",
            imageName: "kayak"
        ),
        
        LearnPlanetsItem(
            text: "Cruise Ship",
            imageName: "cruise_ship"
        )
    ]
    
    let planets4: [LearnPlanetsItem] = [

        LearnPlanetsItem(
            text: "ATV (All-Terrain Vehicle)",
            imageName: "atv"
        ),

        LearnPlanetsItem(
            text: "Van",
            imageName: "vanNew" 
        ),

        LearnPlanetsItem(
            text: "Military Jeep",
            imageName: "military_jeep"
        ),

        LearnPlanetsItem(
            text: "Go-Kart",
            imageName: "go_kart"
        ),

        LearnPlanetsItem(
            text: "Tow Truck",
            imageName: "tow_truck"
        ),

        LearnPlanetsItem(
            text: "Fuel Tanker",
            imageName: "fuel_tanker"
        ),

        LearnPlanetsItem(
            text: "Pickup Truck",
            imageName: "pickup_truck"
        ),

        LearnPlanetsItem(
            text: "Cement Pump Truck",
            imageName: "cement_pump_truck"
        ),

        LearnPlanetsItem(
            text: "Flatbed Truck",
            imageName: "flatbed_truck"
        ),

        LearnPlanetsItem(
            text: "Car Carrier Truck",
            imageName: "car_carrier_truck"
        )
    ]
    
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Container Truck",
            imageName: "container_truck"
        ),
        
        LearnPlanetsItem(
            text: "Tank",
            imageName: "tank"
        ),
        
        LearnPlanetsItem(
            text: "Tow Crane Truck",
            imageName: "tow_crane_truck"
        ),
        
        LearnPlanetsItem(
            text: "Crane",
            imageName: "crane"
        ),
        
        LearnPlanetsItem(
            text: "Bulldozer",
            imageName: "bulldozer"
        ),
        
        LearnPlanetsItem(
            text: "Police Car",
            imageName: "policeCar"
        ),
        
        LearnPlanetsItem(
            text: "Mixer Truck",
            imageName: "mixerTruck"
        ),
        
        LearnPlanetsItem(
            text: "Snow Plow Truck",
            imageName: "snow_plow_truck"
        ),
        
        LearnPlanetsItem(
            text: "Segway",
            imageName: "segway"
        ),
        
        LearnPlanetsItem(
            text: "Road Roller",
            imageName: "roadRoller"
        )
    ]
    
    
    let planets6: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Excavator",
            imageName: "excavator"
        ),
        
        LearnPlanetsItem(
            text: "Forklift",
            imageName: "forklift"
        ),
        
        LearnPlanetsItem(
            text: "Paddle Boat",
            imageName: "paddle_boat"
        ),
        
        LearnPlanetsItem(
            text: "Limousine",
            imageName: "limousine"
        ),
        
        LearnPlanetsItem(
            text: "Asphalt Paver",
            imageName: "asphalt_paver"
        ),
        
        LearnPlanetsItem(
            text: "Trench Digger",
            imageName: "trench_digger"
        ),
        
        LearnPlanetsItem(
            text: "Motor Grader",
            imageName: "grader"
        ),
        
        LearnPlanetsItem(
            text: "Snow Blower Truck",
            imageName: "snow_blower_truck"
        ),
        
        LearnPlanetsItem(
            text: "Combine Harvester",
            imageName: "combine_harvester"
        ),
        
        LearnPlanetsItem(
            text: "Pile Driver",
            imageName: "pile_driver"
        )
    ]
    
    var didTapLockedLevel = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        applyTheme()
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

        view5.layer.borderColor = UIColor.black.cgColor
        view5.layer.borderWidth = 1
        view5.layer.cornerRadius = 20
        view5.clipsToBounds = true
        
        view6.layer.borderColor = UIColor.black.cgColor
        view6.layer.borderWidth = 1
        view6.layer.cornerRadius = 20
        view6.clipsToBounds = true
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "listenVehicleNameLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "listenVehicleNameLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "listenVehicleNameLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "listenVehicleNameLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "listenVehicleNameLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "listenVehicleNameLevel6Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)
        updateLevelUI(level: 3, imageView: image3)
        updateLevelUI(level: 4, imageView: image4)
        updateLevelUI(level: 5, imageView: image5)
        updateLevelUI(level: 6, imageView: image6)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView) {
        let completedKey = "listenVehicleNameLevel\(level)Completed"
        
        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
        } else {
            imageView.image = nil  // Explicitly set to nil when not completed
        }
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

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            viewBG1.backgroundColor = ColorManager.randomColor()
            viewBG2.backgroundColor = ColorManager.randomColor()
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
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()
        let whiteTheme = UserDefaults.standard.bool(forKey: "WhiteTheme")

        let lockImage = UIImage(named: "lock")

        for level in 3...6 {

            let completed = UserDefaults.standard.bool(
                forKey: "listenVehicleNameLevel\(level)Completed"
            )

            let imageView: UIImageView
            let bgView: UIView

            switch level {

            case 3:
                imageView = image3
                bgView = viewBG3

            case 4:
                imageView = image4
                bgView = viewBG4

            case 5:
                imageView = image5
                bgView = viewBG5

            default:
                imageView = image6
                bgView = viewBG6
            }

            if completed {

                imageView.image = UIImage(named: "done")

                if whiteTheme {
                    bgView.backgroundColor = .white
                } else {
                    bgView.backgroundColor = ColorManager.randomColor()
                }

            } else if subscribed {

                imageView.image = nil

                if whiteTheme {
                    bgView.backgroundColor = .white
                } else {
                    bgView.backgroundColor = ColorManager.randomColor()
                }

            } else {

                imageView.image = lockImage
                bgView.backgroundColor = .systemGray4
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

        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "SubscriptionVC") as! SubscriptionVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenVehicleNameShowVC") as! ListenVehicleNameShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListenVehicleNameShowVC") as! ListenVehicleNameShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ListenVehicleNameShowVC"
        ) as! ListenVehicleNameShowVC

        vc.planets = planets3
        vc.levelNumber = 3

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ListenVehicleNameShowVC"
        ) as! ListenVehicleNameShowVC

        vc.planets = planets4
        vc.levelNumber = 4

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ListenVehicleNameShowVC"
        ) as! ListenVehicleNameShowVC

        vc.planets = planets5
        vc.levelNumber = 5

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ListenVehicleNameShowVC"
        ) as! ListenVehicleNameShowVC

        vc.planets = planets6
        vc.levelNumber = 6

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...6 {
            defaults.set(
                false,
                forKey: "listenVehicleNameLevel\(i)Completed"
            )
        }

        defaults.synchronize()

        // done image clear
        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
        image5.image = nil
        image6.image = nil

        // labels clear agar use ho rahe ho
        label1.text = ""
        label2.text = ""
        label3.text = ""
        label4.text = ""
        label5.text = ""
        label6.text = ""

        // lock image wapas set karega
        setupSubscriptionLock()

        updateResetVisibility()
    }
    
}
