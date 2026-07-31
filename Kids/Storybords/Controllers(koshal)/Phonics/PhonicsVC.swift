//
//  PhonicsVC.swift
//  KSchool
//
//  Created by Koshal Singh on 24/03/26.
//


import UIKit
import AVFoundation

class PhonicsVC: BaseViewController {

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
    @IBOutlet weak var viewBG21: UIView!
    @IBOutlet weak var viewBG22: UIView!
    @IBOutlet weak var viewBG23: UIView!
    @IBOutlet weak var viewBG24: UIView!
    @IBOutlet weak var viewBG25: UIView!
    @IBOutlet weak var viewBG26: UIView!
    
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
    @IBOutlet weak var barView21: UIView!
    @IBOutlet weak var barView22: UIView!
    @IBOutlet weak var barView23: UIView!
    @IBOutlet weak var barView24: UIView!
    @IBOutlet weak var barView25: UIView!
    @IBOutlet weak var barView26: UIView!
    
    
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
    @IBOutlet weak var label21: UILabel!
    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var label23: UILabel!
    @IBOutlet weak var label24: UILabel!
    @IBOutlet weak var label25: UILabel!
    @IBOutlet weak var label26: UILabel!
    
    
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
    @IBOutlet weak var imageView21: UIImageView!
    @IBOutlet weak var imageView22: UIImageView!
    @IBOutlet weak var imageView23: UIImageView!
    @IBOutlet weak var imageView24: UIImageView!
    @IBOutlet weak var imageView25: UIImageView!
    @IBOutlet weak var imageView26: UIImageView!

    @IBOutlet weak var pdfBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var speechSynthesizer = AVSpeechSynthesizer()

    let phonicsData: [PhonicsModel] = [
        PhonicsModel(
            image: "apple",
            title: "A",
            speech: "eh... eh... eh... Apple"
        ),
        PhonicsModel(image: "beach-ball", title: "B", speech: "b... b... b... Ball"),
        PhonicsModel(image: "cat_and_kitten", title: "C", speech: "k... k... k... Cat"),
        PhonicsModel(image: "dog_and_puppy", title: "D", speech: "d... d... d... Dog"),
        PhonicsModel(image: "elephant", title: "E", speech: "eh... eh... eh... Elephant"),
        PhonicsModel(image: "clown-fish", title: "F", speech: "f... f... f... Fish"),
        PhonicsModel(image: "goat_and_kid", title: "G", speech: "g... g... g... Goat"),
        PhonicsModel(image: "HatImg", title: "H", speech: "h... h... h... Hat"),
        PhonicsModel(image: "ink", title: "I", speech: "i... i... i... Ink"),
        PhonicsModel(image: "jug", title: "J", speech: "juh... juh... juh... Jug"),
        PhonicsModel(image: "kite", title: "K", speech: "k... k... k... Kite"),
        PhonicsModel(image: "lion_and_cub", title: "L", speech: "l... l... l... Lion"),
        PhonicsModel(image: "mango", title: "M", speech: "m... m... m... Mango"),
        PhonicsModel(image: "nest", title: "N", speech: "n... n... n... Nest"),
        PhonicsModel(
            image: "orange",
            title: "O",
            speech: "ah... ah... ah... Orange"
        ),
        PhonicsModel(image: "nature", title: "P", speech: "p... p... p... Peacock"),
        PhonicsModel(image: "queen", title: "Q", speech: "k... k... k... Queen"),
        PhonicsModel(image: "RatImg", title: "R", speech: "r... r... r... Rat"),
        PhonicsModel(image: "sun", title: "S", speech: "s... s... s... Sun"),
        PhonicsModel(image: "tap", title: "T", speech: "t... t... t... Tap"),
        PhonicsModel(image: "umbrella", title: "U", speech: "uh... uh... uh... Umbrella"),
        PhonicsModel(image: "vanNew", title: "V", speech: "v... v... v... Van"),
        PhonicsModel(
            image: "watch",
            title: "W",
            speech: "w... w... w... Watch"
        ),
        PhonicsModel(image: "xylophone", title: "X", speech: "z... z... z... Xylophone"),
        PhonicsModel(image: "yak", title: "Y", speech: "y... y... y... Yak"),
        PhonicsModel(image: "zebra_and_baby", title: "Z", speech: "z... z... z... Zebra")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        speechSynthesizer = AVSpeechSynthesizer()
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
        viewBG6.layer.cornerRadius = 10
        viewBG7.layer.cornerRadius = 10
        viewBG8.layer.cornerRadius = 10
        viewBG9.layer.cornerRadius = 10
        viewBG10.layer.cornerRadius = 10
        viewBG11.layer.cornerRadius = 10
        viewBG12.layer.cornerRadius = 10
        viewBG13.layer.cornerRadius = 10
        viewBG14.layer.cornerRadius = 10
        viewBG15.layer.cornerRadius = 10
        viewBG16.layer.cornerRadius = 10
        viewBG17.layer.cornerRadius = 10
        viewBG18.layer.cornerRadius = 10
        viewBG19.layer.cornerRadius = 10
        viewBG20.layer.cornerRadius = 10
        viewBG21.layer.cornerRadius = 10
        viewBG22.layer.cornerRadius = 10
        viewBG23.layer.cornerRadius = 10
        viewBG24.layer.cornerRadius = 10
        viewBG25.layer.cornerRadius = 10
        viewBG26.layer.cornerRadius = 10
        
        barView1.backgroundColor = ColorManager.randomColor()
        barView2.backgroundColor = ColorManager.randomColor()
        barView3.backgroundColor = ColorManager.randomColor()
        barView4.backgroundColor = ColorManager.randomColor()
        barView5.backgroundColor = ColorManager.randomColor()
        barView6.backgroundColor = ColorManager.randomColor()
        barView7.backgroundColor = ColorManager.randomColor()
        barView8.backgroundColor = ColorManager.randomColor()
        barView9.backgroundColor = ColorManager.randomColor()
        barView10.backgroundColor = ColorManager.randomColor()
        barView11.backgroundColor = ColorManager.randomColor()
        barView12.backgroundColor = ColorManager.randomColor()
        barView13.backgroundColor = ColorManager.randomColor()
        barView14.backgroundColor = ColorManager.randomColor()
        barView15.backgroundColor = ColorManager.randomColor()
        barView16.backgroundColor = ColorManager.randomColor()
        barView17.backgroundColor = ColorManager.randomColor()
        barView18.backgroundColor = ColorManager.randomColor()
        barView19.backgroundColor = ColorManager.randomColor()
        barView20.backgroundColor = ColorManager.randomColor()
        barView21.backgroundColor = ColorManager.randomColor()
        barView22.backgroundColor = ColorManager.randomColor()
        barView23.backgroundColor = ColorManager.randomColor()
        barView24.backgroundColor = ColorManager.randomColor()
        barView25.backgroundColor = ColorManager.randomColor()
        barView26.backgroundColor = ColorManager.randomColor()
        
        
        imageView1.image = UIImage(named: phonicsData[0].image)
        imageView2.image = UIImage(named: phonicsData[1].image)
        imageView3.image = UIImage(named: phonicsData[2].image)
        imageView4.image = UIImage(named: phonicsData[3].image)
        imageView5.image = UIImage(named: phonicsData[4].image)
        imageView6.image = UIImage(named: phonicsData[5].image)
        imageView7.image = UIImage(named: phonicsData[6].image)
        imageView8.image = UIImage(named: phonicsData[7].image)
        imageView9.image = UIImage(named: phonicsData[8].image)
        imageView10.image = UIImage(named: phonicsData[9].image)
        imageView11.image = UIImage(named: phonicsData[10].image)
        imageView12.image = UIImage(named: phonicsData[11].image)
        imageView13.image = UIImage(named: phonicsData[12].image)
        imageView14.image = UIImage(named: phonicsData[13].image)
        imageView15.image = UIImage(named: phonicsData[14].image)
        imageView16.image = UIImage(named: phonicsData[15].image)
        imageView17.image = UIImage(named: phonicsData[16].image)
        imageView18.image = UIImage(named: phonicsData[17].image)
        imageView19.image = UIImage(named: phonicsData[18].image)
        imageView20.image = UIImage(named: phonicsData[19].image)
        imageView21.image = UIImage(named: phonicsData[20].image)
        imageView22.image = UIImage(named: phonicsData[21].image)
        imageView23.image = UIImage(named: phonicsData[22].image)
        imageView24.image = UIImage(named: phonicsData[23].image)
        imageView25.image = UIImage(named: phonicsData[24].image)
        imageView26.image = UIImage(named: phonicsData[25].image)

        label1.text = phonicsData[0].title
        label2.text = phonicsData[1].title
        label3.text = phonicsData[2].title
        label4.text = phonicsData[3].title
        label5.text = phonicsData[4].title
        label6.text = phonicsData[5].title
        label7.text = phonicsData[6].title
        label8.text = phonicsData[7].title
        label9.text = phonicsData[8].title
        label10.text = phonicsData[9].title
        label11.text = phonicsData[10].title
        label12.text = phonicsData[11].title
        label13.text = phonicsData[12].title
        label14.text = phonicsData[13].title
        label15.text = phonicsData[14].title
        label16.text = phonicsData[15].title
        label17.text = phonicsData[16].title
        label18.text = phonicsData[17].title
        label19.text = phonicsData[18].title
        label20.text = phonicsData[19].title
        label21.text = phonicsData[20].title
        label22.text = phonicsData[21].title
        label23.text = phonicsData[22].title
        label24.text = phonicsData[23].title
        label25.text = phonicsData[24].title
        label26.text = phonicsData[25].title
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

        // agar pehle se bol raha hai to stop karo
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
        }

        // thoda delay do taaki previous speech properly stop ho
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
          let item = phonicsData[sender.tag]
          speak(text: item.speech)
      }
    
}


