//
//  MusicalInstrumentsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 02/04/26.
//

import UIKit

class MusicalInstrumentsMenuVC: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var didTapLockedLevel = false
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(text: "Tambourine", imageName: "tambourine"),
        LearnPlanetsItem(text: "Piano", imageName: "piano"),
        LearnPlanetsItem(text: "Cowbell", imageName: "cowbell"),
        LearnPlanetsItem(text: "Jingle Bell", imageName: "jingle_bell"),
        LearnPlanetsItem(text: "Flute", imageName: "flute"),
        LearnPlanetsItem(text: "Drum", imageName: "drum"),
        LearnPlanetsItem(text: "Guitar", imageName: "guitar"),
        LearnPlanetsItem(text: "Cymbals", imageName: "cymbals"),
        LearnPlanetsItem(text: "Violin", imageName: "violin"),
        LearnPlanetsItem(text: "Triangle", imageName: "triangle")
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(text: "Maracas", imageName: "maracas"),
        LearnPlanetsItem(text: "Castanets", imageName: "castanets"),
        LearnPlanetsItem(text: "Djembe", imageName: "djembe"),
        LearnPlanetsItem(text: "Bongos", imageName: "bongos"),
        LearnPlanetsItem(text: "Guiro", imageName: "guiro"),
        LearnPlanetsItem(text: "Tabla", imageName: "tabla"),
        LearnPlanetsItem(text: "Conga", imageName: "conga"),
        LearnPlanetsItem(text: "Dhol", imageName: "dhol"),
        LearnPlanetsItem(text: "Xylophone", imageName: "xylophone"),
        LearnPlanetsItem(text: "Cajon", imageName: "cajon")
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(text: "Recorder", imageName: "recorder"),
        LearnPlanetsItem(text: "Pan Flute", imageName: "pan_flute"),
        LearnPlanetsItem(text: "Kazoo", imageName: "kazoo"),
        LearnPlanetsItem(text: "Mandolin", imageName: "mandolin"),
        LearnPlanetsItem(text: "Harmonica", imageName: "harmonica"),
        LearnPlanetsItem(text: "Melodica", imageName: "melodica"),
        LearnPlanetsItem(text: "Accordion", imageName: "accordion"),
        LearnPlanetsItem(text: "Ukulele", imageName: "ukulele"),
        LearnPlanetsItem(text: "Banjo", imageName: "banjo"),
        LearnPlanetsItem(text: "Ocarina", imageName: "ocarina")
    ]
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(text: "Bassoon", imageName: "bassoon"),
        LearnPlanetsItem(text: "Trumpet", imageName: "trumpet"),
        LearnPlanetsItem(text: "Keyboard", imageName: "piano_keyboard"),
        LearnPlanetsItem(text: "Trombone", imageName: "trombone"),
        LearnPlanetsItem(text: "Harp", imageName: "harp"),
        LearnPlanetsItem(text: "Clarinet", imageName: "clarinet"),
        LearnPlanetsItem(text: "French Horn", imageName: "french_horn"),
        LearnPlanetsItem(text: "Timpani", imageName: "timpani"),
        LearnPlanetsItem(text: "Saxophone", imageName: "saxophone"),
        LearnPlanetsItem(text: "Tuba", imageName: "tuba")
    ]
    
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(text: "Duff", imageName: "duff"),
        LearnPlanetsItem(text: "Veena", imageName: "veena"),
        LearnPlanetsItem(text: "Drum Set", imageName: "drum_set"),
        LearnPlanetsItem(text: "Chimta", imageName: "chimta"),
        LearnPlanetsItem(text: "Sitar", imageName: "sitar"),
        LearnPlanetsItem(text: "Ghatam", imageName: "ghatam"),
        LearnPlanetsItem(text: "Santoor", imageName: "santoor"),
        LearnPlanetsItem(text: "Erhu", imageName: "erhu"),
        LearnPlanetsItem(text: "Shehnai", imageName: "shehnai"),
        LearnPlanetsItem(text: "Bagpipes", imageName: "bagpipes")
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

        view5.layer.borderColor = UIColor.black.cgColor
        view5.layer.borderWidth = 1
        view5.layer.cornerRadius = 20
        view5.clipsToBounds = true
        
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lock = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?)] = [

            (3,image3,viewBG3),
            (4,image4,viewBG4),
            (5,image5,viewBG5)
        ]

        for (level,image,bg) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "musicalInstrumentsLevel\(level)Completed"
            )

            if completed {

                image?.image = UIImage(named: "done")

                bg?.backgroundColor =
                    ColorManager.randomColor()

            } else {

                image?.image =
                    subscribed ? nil : lock

                bg?.backgroundColor =
                    subscribed
                    ? ColorManager.randomColor()
                    : .systemGray4
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

        let vc = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "SubscriptionVC"
        ) as! SubscriptionVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "musicalInstrumentsLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "musicalInstrumentsLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "musicalInstrumentsLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "musicalInstrumentsLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "musicalInstrumentsLevel5Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)
        updateLevelUI(level: 3, imageView: image3)
        updateLevelUI(level: 4, imageView: image4)
        updateLevelUI(level: 5, imageView: image5)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView) {
        let completedKey = "musicalInstrumentsLevel\(level)Completed"

        if UserDefaults.standard.bool(forKey: completedKey) {
            imageView.image = UIImage(named: "done")
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "MusicalInstrumentsShowVC") as! MusicalInstrumentsShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MusicalInstrumentsShowVC") as! MusicalInstrumentsShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "MusicalInstrumentsShowVC"
        ) as! MusicalInstrumentsShowVC

        vc.planets = planets3
        vc.levelNumber = 3

        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "MusicalInstrumentsShowVC"
        ) as! MusicalInstrumentsShowVC

        vc.planets = planets4
        vc.levelNumber = 4

        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "MusicalInstrumentsShowVC"
        ) as! MusicalInstrumentsShowVC

        vc.planets = planets5
        vc.levelNumber = 5

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...5 {

            defaults.set(
                false,
                forKey: "musicalInstrumentsLevel\(i)Completed"
            )
        }

        defaults.synchronize()

        image1.image = nil
        image2.image = nil

        updateResetVisibility()
        setupSubscriptionLock()
    }
    
}

