//
//  LearnPrepositionVC.swift
//  KSchool
//
//  Created by Koshal Singh on 04/06/26.
//

import UIKit
import AVFoundation
import LanguageManager_iOS

class LearnPrepositionVC: BaseViewController {

    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    @IBOutlet weak var viewBG9: UIView!
    @IBOutlet weak var viewBG10: UIView!
    @IBOutlet weak var viewBG11: UIView!
    @IBOutlet weak var viewBG12: UIView!
    @IBOutlet weak var viewBG13: UIView!
    @IBOutlet weak var viewBG14: UIView!
    @IBOutlet weak var viewBG15: UIView!
    @IBOutlet weak var viewBG16: UIView!
    @IBOutlet weak var viewBG17: UIView!
    @IBOutlet weak var viewBG18: UIView!
    @IBOutlet weak var viewBG19: UIView!
    @IBOutlet weak var viewBG20: UIView!
    
    
    @IBOutlet weak var barView1: UIView!
    @IBOutlet weak var barView2: UIView!
    @IBOutlet weak var barView3: UIView!
    @IBOutlet weak var barView4: UIView!
    @IBOutlet weak var barView5: UIView!
    @IBOutlet weak var barView6: UIView!
    @IBOutlet weak var barView7: UIView!
    @IBOutlet weak var barView8: UIView!
    @IBOutlet weak var barView9: UIView!
    @IBOutlet weak var barView10: UIView!
    @IBOutlet weak var barView11: UIView!
    @IBOutlet weak var barView12: UIView!
    @IBOutlet weak var barView13: UIView!
    @IBOutlet weak var barView14: UIView!
    @IBOutlet weak var barView15: UIView!
    @IBOutlet weak var barView16: UIView!
    @IBOutlet weak var barView17: UIView!
    @IBOutlet weak var barView18: UIView!
    @IBOutlet weak var barView19: UIView!
    @IBOutlet weak var barView20: UIView!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label16: UILabel!
    @IBOutlet weak var label17: UILabel!
    @IBOutlet weak var label18: UILabel!
    @IBOutlet weak var label19: UILabel!
    @IBOutlet weak var label20: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView10: UIImageView!
    @IBOutlet weak var imageView11: UIImageView!
    @IBOutlet weak var imageView12: UIImageView!
    @IBOutlet weak var imageView13: UIImageView!
    @IBOutlet weak var imageView14: UIImageView!
    @IBOutlet weak var imageView15: UIImageView!
    @IBOutlet weak var imageView16: UIImageView!
    @IBOutlet weak var imageView17: UIImageView!
    @IBOutlet weak var imageView18: UIImageView!
    @IBOutlet weak var imageView19: UIImageView!
    @IBOutlet weak var imageView20: UIImageView!
    
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var speechSynthesizer = AVSpeechSynthesizer()

    var imageViews: [UIImageView] = []
    var labels: [UILabel] = []
    var barViews: [UIView] = []
    var bgViews: [UIView] = []
    
    var isShowingExample = false
    
    let learnIdioms: [LearnIdioms] = [
        
        // Screen 1
        LearnIdioms(name: "In".localiz(), image: "pre_in"),
        LearnIdioms(name: "At".localiz(), image: "pre_at"),
        LearnIdioms(name: "On".localiz(), image: "pre_on"),
        LearnIdioms(name: "Above".localiz(), image: "pre_above"),
        LearnIdioms(name: "Over".localiz(), image: "pre_over"),
        LearnIdioms(name: "around".localiz(), image: "pre_around"),
        
        // Screen 2
        LearnIdioms(name: "Into".localiz(), image: "pre_into"),
        LearnIdioms(name: "Upon".localiz(), image: "pre_upon"),
        LearnIdioms(name: "Between".localiz(), image: "pre_between"),
        LearnIdioms(name: "Among".localiz(), image: "pre_among"),
        
        // Screen 3
        LearnIdioms(name: "Towards".localiz(), image: "pre_towards"),
        LearnIdioms(name: "Through".localiz(), image: "pre_through"),
        LearnIdioms(name: "Along".localiz(), image: "pre_along"),
        LearnIdioms(name: "Across".localiz(), image: "pre_across"),
        LearnIdioms(name: "From - To".localiz(), image: "pre_from_to"),
        LearnIdioms(name: "Under".localiz(), image: "pre_under"),
        
        // Screen 4
        LearnIdioms(name: "Before".localiz(), image: "pre_before"),
        LearnIdioms(name: "Behind".localiz(), image: "pre_behind"),
        LearnIdioms(name: "Away".localiz(), image: "pre_away"),
        LearnIdioms(name: "Out of".localiz(), image: "pre_out_of"),
    ]

    let showExample: [LearnIdioms] = [
        
        // Screen 1
        LearnIdioms(name: "The ball is in the boxe".localiz(), image: "pre_in_ex"),
        LearnIdioms(name: "She is at the door".localiz(), image: "pre_ex_at"),
        LearnIdioms(name: "Cat is on the table".localiz(), image: "pre_ex_on"),
        LearnIdioms(name: "The bird is above the tree".localiz(), image: "pre_ex_above"),
        LearnIdioms(name: "The plane flies is over the house".localiz(), image: "pre_ex_over"),
        LearnIdioms(name: "The dog runs runs around the tree".localiz(), image: "pre_ex_around"),
        
        // Screen 2
        LearnIdioms(name: "The ball goes into the box".localiz(), image: "pre_ex_into"),
        LearnIdioms(name: "The book is upon the table".localiz(), image: "pre_ex_upon"),
        LearnIdioms(name: "The ball is between two boxes".localiz(), image: "pre_ex_between"),
        LearnIdioms(name: "This cat is among the flowers".localiz(), image: "pre_ex_among"),
        
        // Screen 3
        LearnIdioms(name: "The boy walk towards the door".localiz(), image: "pre_ex_towards"),
        LearnIdioms(name: "The arrow goes through the tube".localiz(), image: "pre_ex_through"),
        LearnIdioms(name: "The ant walk along the line".localiz(), image: "pre_ex_along"),
        LearnIdioms(name: "The boys swam across the river".localiz(), image: "pre_ex_across"),
        LearnIdioms(name: "She walked from home to school".localiz(), image: "pre_ex_from_to"),
        LearnIdioms(name: "That cat is under the table".localiz(), image: "pre_ex_under"),
        
        // Screen 4
        LearnIdioms(name: "Wash hands before eating".localiz(), image: "pre_ex_before"),
        LearnIdioms(name: "That cat is behind the chair".localiz(), image: "pre_ex_behind"),
        LearnIdioms(name: "The bird fly from the tree".localiz(), image: "pre_ex_away"),
        LearnIdioms(name: "The rabbit jumped out of the box".localiz(), image: "pre_ex_out_of"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        
        
        bgViews = [
            viewBG1,viewBG2,viewBG3,viewBG4,viewBG5,
            viewBG6,viewBG7,viewBG8,viewBG9,viewBG10,
            viewBG11,viewBG12,viewBG13,viewBG14,viewBG15,
            viewBG16,viewBG17,viewBG18,viewBG19,viewBG20,
        ]
        
        for view in bgViews {
               view.layer.cornerRadius = 10
               view.clipsToBounds = true
           }
        
        imageViews = [
               imageView1,imageView2,imageView3,imageView4,imageView5,
               imageView6,imageView7,imageView8,imageView9,imageView10,
               imageView11,imageView12,imageView13,imageView14,imageView15,
               imageView16,imageView17,imageView18,imageView19,imageView20,
    
           ]

           labels = [
               label1,label2,label3,label4,label5,
               label6,label7,label8,label9,label10,
               label11,label12,label13,label14,label15,
               label16,label17,label18,label19,label20
           ]

           barViews = [
               barView1,barView2,barView3,barView4,barView5,
               barView6,barView7,barView8,barView9,barView10,
               barView11,barView12,barView13,barView14,barView15,
               barView16,barView17,barView18,barView19,barView20
           ]

           loadData(data: learnIdioms)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    
    func loadData(data: [LearnIdioms]) {
        for i in 0..<data.count {
            imageViews[i].image = UIImage(named: data[i].image)
            labels[i].text = data[i].name
        }

        // Random colors update
        for bar in barViews {
            bar.backgroundColor = ColorManager.randomColor()
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
            
        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
        }
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
        let index = sender.tag
        
        if isShowingExample {
            speak(text: showExample[index].name)   // बोले: Something very easy
        } else {
            speak(text: learnIdioms[index].name)   // बोले: Piece of Cake
        }
    }
    
    @IBAction func showExampleTapBtn(_ sender: UISwitch) {
        isShowingExample = sender.isOn
        
        if isShowingExample {
            // Sirf images change karo
            for i in 0..<showExample.count {
                imageViews[i].image = UIImage(named: showExample[i].image)
            }
        } else {
            // Original images
            for i in 0..<learnIdioms.count {
                imageViews[i].image = UIImage(named: learnIdioms[i].image)
            }
        }
    }
}
