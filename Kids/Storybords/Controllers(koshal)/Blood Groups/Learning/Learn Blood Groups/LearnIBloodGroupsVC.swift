//
//  LearnIBloodGroupsVC.swift
//  New
//
//  Created by Koshal Singh on 09/04/26.
//


import UIKit
import AVFoundation

class LearnIBloodGroupsVC: BaseViewController {

    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
  
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pdfBtn: UIButton!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    var speechSynthesizer = AVSpeechSynthesizer()

    var imageViews: [UIImageView] = []
    var labels: [UILabel] = []
    var bgViews: [UIView] = []
    
    var isShowingExample = false
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        bgViews = [
            viewBG1,viewBG2,viewBG3,viewBG4,viewBG5,
            viewBG6,viewBG7,viewBG8
        ]
        
        for view in bgViews {
            view.layer.cornerRadius = 10
            view.clipsToBounds = true
        }
        
        labels = [
            label1,label2,label3,label4,label5,
            label6,label7,label8
        ]

        // ✅ YAHI ADD KARNA HAI
        for i in 0..<bloodGroups.count {
            labels[i].text = bloodGroups[i].name
        }
    }
    
    
    func loadData(data: [LearnIdioms]) {
        for i in 0..<data.count {
            imageViews[i].image = UIImage(named: data[i].image)
            labels[i].text = data[i].name
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
    
    func speak(text: String) {

        // Agar pehle se bol raha hai to turant stop karo
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
        }

        // Chhota sa delay taaki previous speech completely stop ho jaye
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {

            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.35
            utterance.pitchMultiplier = 1.2
            utterance.preUtteranceDelay = 0
            utterance.postUtteranceDelay = 0

            self.speechSynthesizer.speak(utterance)
        }
    }

    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func bodyPartTapped(_ sender: UIButton) {
        let index = sender.tag
        let group = bloodGroups[index]
        let readable = getReadableText(group.name)
        speak(text: readable)
    }

    
    @IBAction func donatesTapBtn(_ sender: UIButton) {
        
        let index = sender.tag
        
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "LearnIBloodGroupsResultVC") as? LearnIBloodGroupsResultVC {
            
            vc.selectedIndex = index
            vc.isDonating = true   // 👈 important
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func receivesTapBtn(_ sender: UIButton) {
        
        let index = sender.tag
        
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "LearnIBloodGroupsResultVC") as? LearnIBloodGroupsResultVC {
            
            vc.selectedIndex = index
            vc.isDonating = false   // 👈 important
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
struct BloodGroup {
    let name: String
    let donatesTo: [String]
    let receivesFrom: [String]
}
func getReadableText(_ text: String) -> String {
    
    switch text {
    case "A+":
        return "A positive"
    case "A-":
        return "A negative"
    case "B+":
        return "B positive"
    case "B-":
        return "B negative"
    case "AB+":
        return "A B positive"
    case "AB-":
        return "A B negative"
    case "O+":
        return "O positive"
    case "O-":
        return "O negative"
    case "All":
        return "All blood groups"
    default:
        return text
    }
}
let bloodGroups: [BloodGroup] = [

    BloodGroup(name: "A+",
               donatesTo: ["A+", "AB+"],
               receivesFrom: ["A+", "A-", "O+", "O-"]),

    BloodGroup(name: "A-",
               donatesTo: ["A+", "A-", "AB+", "AB-"],
               receivesFrom: ["A-", "O-"]),

    BloodGroup(name: "B+",
               donatesTo: ["B+", "AB+"],
               receivesFrom: ["B+", "B-", "O+", "O-"]),

    BloodGroup(name: "B-",
               donatesTo: ["B+", "B-", "AB+", "AB-"],
               receivesFrom: ["B-", "O-"]),

    BloodGroup(name: "AB+",
               donatesTo: ["AB+"],
               receivesFrom: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]),

    BloodGroup(name: "AB-",
               donatesTo: ["AB+", "AB-"],
               receivesFrom: ["A-", "B-", "AB-", "O-"]),

    BloodGroup(name: "O+",
               donatesTo: ["A+", "B+", "AB+", "O+"],
               receivesFrom: ["O+", "O-"]),

    BloodGroup(name: "O-",
               donatesTo: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"],
               receivesFrom: ["O-"])
]
