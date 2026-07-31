//
//  SolarSystemVC.swift
//  Kids
//
//  Created by Koshal Singh on 21/02/26.
//

import UIKit
import AVFoundation

class SolarSystemVC: BaseViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
   
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        addTapGestures()
        
        if let scrollView = self.view.subviews.first(where: { $0 is UIScrollView }) as? UIScrollView {
            scrollView.bounces = false
            scrollView.alwaysBounceVertical = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startRotation()
    }
    
    func speakPlanet(_ name: String) {

        let utterance = AVSpeechUtterance(string: name)

        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"

        if selectedLanguage == "zhHans" {
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
        } else {
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        }

        utterance.rate = 0.5

        speechSynthesizer.stopSpeaking(at: .immediate)
        speechSynthesizer.speak(utterance)
    }
    
    func addTapGestures() {
        
        let images = [img1,img2,img3,img4,img5,img6,img7,img8,img9]
        
        for image in images {
            image?.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(planetTapped(_:)))
            image?.addGestureRecognizer(tap)
        }
    }
    
    func startRotation() {
        
        // ☀️ Sun (slow but not slowest)
        horizontalRotate(img1, duration: 12)
        
        // ☿ Mercury (very slow)
        horizontalRotate(img2, duration: 18)
        
        // ♀ Venus (slowest)
        horizontalRotate(img3, duration: 25)
        
        // 🌍 Earth
        horizontalRotate(img4, duration: 10)
        
        // 🔴 Mars
        horizontalRotate(img5, duration: 11)
        
        // 🟠 Jupiter (FASTEST)
        horizontalRotate(img6, duration: 4)
        
        // 🪐 Saturn
        horizontalRotate(img7, duration: 5)
        
        // 🔵 Uranus
        horizontalRotate(img8, duration: 7)
        
        // 🔵 Neptune
        horizontalRotate(img9, duration: 6)
    }
    
    func horizontalRotate(_ imageView: UIImageView, duration: Double) {
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: [.repeat, .autoreverse, .curveLinear, .allowUserInteraction],
                       animations: {
            
            imageView.transform = CGAffineTransform(scaleX: -1, y: 1)
            
        }, completion: nil)
    }

    
    func orbitPlanet(_ imageView: UIImageView, radius: CGFloat, duration: Double) {
        
        let orbit = CAKeyframeAnimation(keyPath: "position")
        
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: view.center.x, y: view.center.y),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true
        )
        
        orbit.path = circularPath.cgPath
        orbit.duration = duration
        orbit.repeatCount = .infinity
        orbit.calculationMode = .paced
        
        imageView.layer.add(orbit, forKey: "orbitAnimation")
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
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func planetTapped(_ sender: UITapGestureRecognizer) {

        guard let tag = sender.view?.tag else { return }

        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"

        if selectedLanguage == "zhHans" {

            switch tag {
            case 1: speakPlanet("太阳")
            case 2: speakPlanet("水星")
            case 3: speakPlanet("金星")
            case 4: speakPlanet("地球")
            case 5: speakPlanet("火星")
            case 6: speakPlanet("木星")
            case 7: speakPlanet("土星")
            case 8: speakPlanet("天王星")
            case 9: speakPlanet("海王星")
            default: break
            }

        } else {

            switch tag {
            case 1: speakPlanet("Sun")
            case 2: speakPlanet("Mercury")
            case 3: speakPlanet("Venus")
            case 4: speakPlanet("Earth")
            case 5: speakPlanet("Mars")
            case 6: speakPlanet("Jupiter")
            case 7: speakPlanet("Saturn")
            case 8: speakPlanet("Uranus")
            case 9: speakPlanet("Neptune")
            default: break
            }
        }
    }
}
