//
//  GuessVehicleMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 01/04/26.
//

import UIKit

class GuessVehicleMenuVC: BaseViewController {

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
    
    
    let level1fruits: [FruitsQuestions] = [
        FruitsQuestions(
            name: "Bike",
            imageName: "motorcycle"
        ),
        
        FruitsQuestions(
            name: "Bicycle",
            imageName: "bicycle"
        ),
        
        FruitsQuestions(
            name: "Car",
            imageName: "car"
        ),
        
        FruitsQuestions(
            name: "Bus",
            imageName: "busLane"
        ),
        
        FruitsQuestions(
            name: "Fire Truck",
            imageName: "fireBrigade"
        ),
        
        FruitsQuestions(
            name: "Tractor",
            imageName: "tractor"
        ),
        
        FruitsQuestions(
            name: "Scooter",
            imageName: "deliver"
        ),
        
        FruitsQuestions(
            name: "Dump Truck",
            imageName: "dumpTruck"
        ),
        
        FruitsQuestions(
            name: "Ambulance",
            imageName: "ambulance"
        ),
        
        FruitsQuestions(
            name: "Auto Rickshaw",
            imageName: "autoRickshaw"
        )
    ]
    
    let level2fruits: [FruitsQuestions] = [
        FruitsQuestions(
            name: "Parachute",
            imageName: "parachute"
        ),
        
        FruitsQuestions(
            name: "Helicopter",
            imageName: "helicopter"
        ),
        
        FruitsQuestions(
            name: "Rocket",
            imageName: "rocket"
        ),
        
        FruitsQuestions(
            name: "Seaplane",
            imageName: "seaplane"
        ),
        
        FruitsQuestions(
            name: "Glider",
            imageName: "glider"
        ),
        
        FruitsQuestions(
            name: "Jet",
            imageName: "fighterJet"
        ),
        
        FruitsQuestions(
            name: "Aeroplane",
            imageName: "travelling"
        ),
        
        FruitsQuestions(
            name: "Hot Air Balloon",
            imageName: "hotAirBalloon"
        ),
        
        FruitsQuestions(
            name: "Drone",
            imageName: "drone"
        ),
        
        FruitsQuestions(
            name: "Airship",
            imageName: "airship"
        )
    ]
    
    let level3fruits: [FruitsQuestions] = [
        FruitsQuestions(
            name: "Yacht",
            imageName: "yacht"
        ),
        
        FruitsQuestions(
            name: "Snowmobile",
            imageName: "snowmobile"
        ),
        
        FruitsQuestions(
            name: "Ship",
            imageName: "cruiseShip"
        ),
        
        FruitsQuestions(
            name: "Hovercraft",
            imageName: "hovercraft"
        ),
        
        FruitsQuestions(
            name: "Canoe",
            imageName: "canoe"
        ),
        
        FruitsQuestions(
            name: "Speedboat",
            imageName: "speedboat"
        ),
        
        FruitsQuestions(
            name: "Jet Ski",
            imageName: "jetSki"
        ),
        
        FruitsQuestions(
            name: "Submarine",
            imageName: "submarine"
        ),
        
        FruitsQuestions(
            name: "Kayak",
            imageName: "kayak"
        ),
        
        FruitsQuestions(
            name: "Cruise Ship",
            imageName: "cruise_ship"
        )
    ]
    
    let level4fruits: [FruitsQuestions] = [
        FruitsQuestions(
            name: "ATV (All-Terrain Vehicle)",
            imageName: "atv"
        ),

        FruitsQuestions(
            name: "Van",
            imageName: "vanNew"
        ),

        FruitsQuestions(
            name: "Military Jeep",
            imageName: "military_jeep"
        ),

        FruitsQuestions(
            name: "Go-Kart",
            imageName: "go_kart"
        ),

        FruitsQuestions(
            name: "Tow Truck",
            imageName: "tow_truck"
        ),

        FruitsQuestions(
            name: "Fuel Tanker",
            imageName: "fuel_tanker"
        ),

        FruitsQuestions(
            name: "Pickup Truck",
            imageName: "pickup_truck"
        ),

        FruitsQuestions(
            name: "Cement Pump Truck",
            imageName: "cement_pump_truck"
        ),

        FruitsQuestions(
            name: "Flatbed Truck",
            imageName: "flatbed_truck"
        ),

        FruitsQuestions(
            name: "Car Carrier Truck",
            imageName: "car_carrier_truck"
        )
    ]
    
    let level5fruits: [FruitsQuestions] = [
        FruitsQuestions(
            name: "Container Truck",
            imageName: "container_truck"
        ),
        
        FruitsQuestions(
            name: "Tank",
            imageName: "tank"
        ),
        
        FruitsQuestions(
            name: "Tow Crane Truck",
            imageName: "tow_crane_truck"
        ),
        
        FruitsQuestions(
            name: "Crane",
            imageName: "crane"
        ),
        
        FruitsQuestions(
            name: "Bulldozer",
            imageName: "bulldozer"
        ),
        
        FruitsQuestions(
            name: "Police Car",
            imageName: "policeCar"
        ),
        
        FruitsQuestions(
            name: "Mixer Truck",
            imageName: "mixerTruck"
        ),
        
        FruitsQuestions(
            name: "Snow Plow Truck",
            imageName: "snow_plow_truck"
        ),
        
        FruitsQuestions(
            name: "Segway",
            imageName: "segway"
        ),
        
        FruitsQuestions(
            name: "Road Roller",
            imageName: "roadRoller"
        )
    ]
    
    let level6fruits: [FruitsQuestions] = [
        FruitsQuestions(
            name: "Excavator",
            imageName: "excavator"
        ),
        
        FruitsQuestions(
            name: "Forklift",
            imageName: "forklift"
        ),
        
        FruitsQuestions(
            name: "Paddle Boat",
            imageName: "paddle_boat"
        ),
        
        FruitsQuestions(
            name: "Limousine",
            imageName: "limousine"
        ),
        
        FruitsQuestions(
            name: "Asphalt Paver",
            imageName: "asphalt_paver"
        ),
        
        FruitsQuestions(
            name: "Trench Digger",
            imageName: "trench_digger"
        ),
        
        FruitsQuestions(
            name: "Motor Grader",
            imageName: "grader"
        ),
        
        FruitsQuestions(
            name: "Snow Blower Truck",
            imageName: "snow_blower_truck"
        ),
        
        FruitsQuestions(
            name: "Combine Harvester",
            imageName: "combine_harvester"
        ),
        
        FruitsQuestions(
            name: "Pile Driver",
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
        
        for i in 1...6 {
            print("Level \(i) Completed:",
                  UserDefaults.standard.bool(forKey: "guessVehicleLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
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
    
    func updateResetVisibility() {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessVehicleLevelData") as? [String: Int]

        let isAnyCompleted = !(levelData?.isEmpty ?? true)

        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
        updateLevelUI(level: 5, imageView: image5, label: label5)
        updateLevelUI(level: 6, imageView: image6, label: label6)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessVehicleLevelData") as? [String: Int] ?? [:]

        if let percentage = levelData["\(level)"] {
            imageView.image = UIImage(named: "done")
            label.text = "\(percentage)%"
        } else {
            imageView.image = nil
            label.text = ""
        }
    }
    
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
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

        let levelData = UserDefaults.standard.dictionary(
            forKey: "guessVehicleLevelData"
        ) as? [String:Int] ?? [:]

        let lockImage = UIImage(named: "lock")

        let imageViews = [
            image3,
            image4,
            image5,
            image6
        ]

        let labels = [
            label3,
            label4,
            label5,
            label6
        ]

        let bgViews = [
            viewBG3,
            viewBG4,
            viewBG5,
            viewBG6
        ]

        for (index, imageView) in imageViews.enumerated() {

            let level = index + 3

            if let percentage = levelData["\(level)"] {

                imageView?.image = UIImage(named: "done")
                labels[index]?.text = "\(percentage)%"

                bgViews[index]?.backgroundColor = whiteTheme
                    ? .white
                    : ColorManager.randomColor()

            } else if subscribed {

                imageView?.image = nil
                labels[index]?.text = ""

                bgViews[index]?.backgroundColor = whiteTheme
                    ? .white
                    : ColorManager.randomColor()

            } else {

                imageView?.image = lockImage
                labels[index]?.text = ""

                bgViews[index]?.backgroundColor = .systemGray4
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
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessVehicleShowVC") as! GuessVehicleShowVC
        vc.fruits = level1fruits
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessVehicleShowVC") as! GuessVehicleShowVC
        vc.fruits = level2fruits
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessVehicleShowVC"
        ) as! GuessVehicleShowVC

        vc.fruits = level3fruits
        vc.levelNumber = 3

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessVehicleShowVC"
        ) as! GuessVehicleShowVC

        vc.fruits = level4fruits
        vc.levelNumber = 4

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessVehicleShowVC"
        ) as! GuessVehicleShowVC

        vc.fruits = level5fruits
        vc.levelNumber = 5

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level6TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessVehicleShowVC"
        ) as! GuessVehicleShowVC

        vc.fruits = level6fruits
        vc.levelNumber = 6

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        UserDefaults.standard.removeObject(
            forKey: "guessVehicleLevelData"
        )

        // done image clear
        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
        image5.image = nil
        image6.image = nil

        // labels clear
        label1.text = ""
        label2.text = ""
        label3.text = ""
        label4.text = ""
        label5.text = ""
        label6.text = ""

        // lock image wapas set karega
        setupSubscriptionLock()

        // reset button hide/show
        updateResetVisibility()
    }
    
}
