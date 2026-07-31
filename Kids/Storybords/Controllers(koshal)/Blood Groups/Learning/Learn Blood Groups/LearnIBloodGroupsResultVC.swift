//
//  LearnIBloodGroupsResultVC.swift
//  New
//
//  Created by Koshal Singh on 09/04/26.
//

import UIKit
import AVFoundation

class LearnIBloodGroupsResultVC: BaseViewController {

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
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    @IBOutlet weak var titalLabel: UILabel!
    
    var speechSynthesizer = AVSpeechSynthesizer()

    var selectedIndex: Int = 0
    var isDonating: Bool = true
    
    var showList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        let group = bloodGroups[selectedIndex]

        if isDonating {
            titalLabel.text = "\(group.name) Can Donate To"
            showList = group.donatesTo
        } else {
            titalLabel.text = "\(group.name) Can Receive From"
            showList = group.receivesFrom
        }

        let allBGViews = [
            viewBG1, viewBG2, viewBG3, viewBG4,
            viewBG5, viewBG6, viewBG7, viewBG8
        ]
        
        let allLabels = [
            label1,label2,label3,label4,
            label5,label6,label7,label8
        ]

        // ✅ Sab hide karo
        for view in allBGViews {
            view?.isHidden = true
            view?.layer.cornerRadius = 12
            view?.alpha = 1
        }

        // ✅ Data show karo (Blood Groups)
        for i in 0..<showList.count {
            allBGViews[i]?.isHidden = false
            allLabels[i]?.text = showList[i]
        }

        // ✅ Agar odd count ho to layout fix
        if showList.count % 2 != 0 {
            let lastIndex = showList.count - 1
            
            if lastIndex + 1 < allBGViews.count {
                allBGViews[lastIndex + 1]?.isHidden = false
                allLabels[lastIndex + 1]?.text = ""
                allBGViews[lastIndex + 1]?.alpha = 0
            }
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
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        speechSynthesizer.speak(utterance)
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func bodyPartTapped(_ sender: UIButton) {
        let text = showList[sender.tag]
        let readable = getReadableText(text)
        speak(text: readable)
    }
    
}
