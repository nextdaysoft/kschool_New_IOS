//
//  GuessTheMusicalInstrumentsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 02/04/26.
//

import UIKit

class GuessTheMusicalInstrumentsMenuVC: BaseViewController {

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
    
    let level1fruits: [FruitsQuestions] = [
        
        FruitsQuestions(name: "Tambourine", imageName: "tambourine"),
        FruitsQuestions(name: "Piano", imageName: "piano"),
        FruitsQuestions(name: "Cowbell", imageName: "cowbell"),
        FruitsQuestions(name: "Jingle Bell", imageName: "jingle_bell"),
        FruitsQuestions(name: "Flute", imageName: "flute"),
        FruitsQuestions(name: "Drum", imageName: "drum"),
        FruitsQuestions(name: "Guitar", imageName: "guitar"),
        FruitsQuestions(name: "Cymbals", imageName: "cymbals"),
        FruitsQuestions(name: "Violin", imageName: "violin"),
        FruitsQuestions(name: "Triangle", imageName: "triangle")
    ]
    
    let level2fruits: [FruitsQuestions] = [
        
        FruitsQuestions(name: "Maracas", imageName: "maracas"),
        FruitsQuestions(name: "Castanets", imageName: "castanets"),
        FruitsQuestions(name: "Djembe", imageName: "djembe"),
        FruitsQuestions(name: "Bongos", imageName: "bongos"),
        FruitsQuestions(name: "Guiro", imageName: "guiro"),
        FruitsQuestions(name: "Tabla", imageName: "tabla"),
        FruitsQuestions(name: "Conga", imageName: "conga"),
        FruitsQuestions(name: "Dhol", imageName: "dhol"),
        FruitsQuestions(name: "Xylophone", imageName: "xylophone"),
        FruitsQuestions(name: "Cajon", imageName: "cajon")
    ]
    
    let level3fruits: [FruitsQuestions] = [
        FruitsQuestions(name: "Recorder", imageName: "recorder"),
        FruitsQuestions(name: "Pan Flute", imageName: "pan_flute"),
        FruitsQuestions(name: "Kazoo", imageName: "kazoo"),
        FruitsQuestions(name: "Mandolin", imageName: "mandolin"),
        FruitsQuestions(name: "Harmonica", imageName: "harmonica"),
        FruitsQuestions(name: "Melodica", imageName: "melodica"),
        FruitsQuestions(name: "Accordion", imageName: "accordion"),
        FruitsQuestions(name: "Ukulele", imageName: "ukulele"),
        FruitsQuestions(name: "Banjo", imageName: "banjo"),
        FruitsQuestions(name: "Ocarina", imageName: "ocarina")
    ]
    
    let level4fruits: [FruitsQuestions] = [
        
        FruitsQuestions(name: "Bassoon", imageName: "bassoon"),
        FruitsQuestions(name: "Trumpet", imageName: "trumpet"),
        FruitsQuestions(name: "Keyboard", imageName: "piano_keyboard"),
        FruitsQuestions(name: "Trombone", imageName: "trombone"),
        FruitsQuestions(name: "Harp", imageName: "harp"),
        FruitsQuestions(name: "Clarinet", imageName: "clarinet"),
        FruitsQuestions(name: "French Horn", imageName: "french_horn"),
        FruitsQuestions(name: "Timpani", imageName: "timpani"),
        FruitsQuestions(name: "Saxophone", imageName: "saxophone"),
        FruitsQuestions(name: "Tuba", imageName: "tuba")
    ]
    
    let level5fruits: [FruitsQuestions] = [
        
        FruitsQuestions(name: "Duff", imageName: "duff"),
        FruitsQuestions(name: "Veena", imageName: "veena"),
        FruitsQuestions(name: "Drum Set", imageName: "drum_set"),
        FruitsQuestions(name: "Chimta", imageName: "chimta"),
        FruitsQuestions(name: "Sitar", imageName: "sitar"),
        FruitsQuestions(name: "Ghatam", imageName: "ghatam"),
        FruitsQuestions(name: "Santoor", imageName: "santoor"),
        FruitsQuestions(name: "Erhu", imageName: "erhu"),
        FruitsQuestions(name: "Shehnai", imageName: "shehnai"),
        FruitsQuestions(name: "Bagpipes", imageName: "bagpipes")
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
        
        
        for i in 1...6 {
            print("Level \(i) Completed:",
                  UserDefaults.standard.bool(forKey: "guessTheMusicalInstrumentsLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lock = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?, UILabel?)] = [

            (3,image3,viewBG3,label3),
            (4,image4,viewBG4,label4),
            (5,image5,viewBG5,label5)
        ]

        let levelData =
        UserDefaults.standard.dictionary(
            forKey: "guessTheMusicalInstrumentsLevelData"
        ) as? [String:Int] ?? [:]

        for (level,image,bg,label) in levels {

            if let percentage = levelData["\(level)"] {

                image?.image = UIImage(named:"done")
                label?.text = "\(percentage)%"

                bg?.backgroundColor =
                    ColorManager.randomColor()

            } else {

                image?.image =
                    subscribed ? nil : lock

                label?.text = ""

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

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheMusicalInstrumentsLevelData") as? [String: Int]

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
    }
    
    func updateLevelUI(
        level: Int,
        imageView: UIImageView,
        label: UILabel
    ) {

        let levelData =
        UserDefaults.standard.dictionary(
            forKey: "guessTheMusicalInstrumentsLevelData"
        ) as? [String:Int] ?? [:]

        if let percentage =
            levelData["\(level)"] {

            imageView.image =
                UIImage(named:"done")

            label.text =
                "\(percentage)%"
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheMusicalInstrumentsShowVC") as! GuessTheMusicalInstrumentsShowVC
        vc.fruits = level1fruits
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheMusicalInstrumentsShowVC") as! GuessTheMusicalInstrumentsShowVC
        vc.fruits = level2fruits
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheMusicalInstrumentsShowVC"
        ) as! GuessTheMusicalInstrumentsShowVC

        vc.fruits = level3fruits
        vc.levelNumber = 3

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func level4TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheMusicalInstrumentsShowVC"
        ) as! GuessTheMusicalInstrumentsShowVC

        vc.fruits = level4fruits
        vc.levelNumber = 4

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {

        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "GuessTheMusicalInstrumentsShowVC"
        ) as! GuessTheMusicalInstrumentsShowVC

        vc.fruits = level5fruits
        vc.levelNumber = 5

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        UserDefaults.standard.removeObject(
            forKey: "guessTheMusicalInstrumentsLevelData"
        )

        image1.image = nil
        image2.image = nil

        label1.text = ""
        label2.text = ""

        updateResetVisibility()
        setupSubscriptionLock()
    }
    
}

