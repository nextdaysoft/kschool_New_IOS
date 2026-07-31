//
//  LearnVitaminsVC.swift
//  KSchool
//
//  Created by Koshal Singh on 08/04/26.
//

struct VitaminSource {
    let title: String
    let items: [BodyPart]
}

import UIKit
import AVFoundation

class LearnVitaminsVC: BaseViewController {

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

    
    @IBOutlet weak var mainView: UIView!
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
        
        LearnIdioms(name: "Vitamin A", image: "carrot"),
        LearnIdioms(name: "Vitamin Bl", image: "vitaminB1"),
        LearnIdioms(name: "Vitamin B2", image: "milk"),
        LearnIdioms(name: "Vitamin B3", image: "vitaminB3"),
        LearnIdioms(name: "Vitamin B5", image: "avocado"),
        LearnIdioms(name: "Vitamin B6", image: "banana"),
        LearnIdioms(name: "Vitamin B7", image: "vitaminB7"),
        LearnIdioms(name: "Vitamin B9", image: "spinach"),
        LearnIdioms(name: "Vitamin B12", image: "clown-fish"),
        LearnIdioms(name: "Vitamin C", image: "vitaminC"),
        LearnIdioms(name: "Vitamin D", image: "sun"),
        LearnIdioms(name: "Vitamin E", image: "vitaminE"),
        LearnIdioms(name: "Vitamin K", image: "spinach")
    ]
    
    let showExample: [LearnIdioms] = [
        
        LearnIdioms(name: "Vitamin A helps our eyes see clearly", image: "vitamin_a_ex"),
        LearnIdioms(name: "Vitamin B1 gives the body energy and keeps the nervous system healthy", image: "vitamin_b_ex"),
        LearnIdioms(name: "Vitamin B2 keeps skin, eyes, and mouth healthy", image: "vitamin_b2_ex"),
        LearnIdioms(name: "Vitamin B3 keeps skin, nerves, and digestion healthy", image: "vitamin_b3_ex"),
        LearnIdioms(name: "Vitamin B5 helps the body grow and produce energy", image: "vitamin_b5_ex"),
        LearnIdioms(name: "Vitamin B6 keeps the nervous system and brain healthy", image: "vitamin_b6_ex"),
        LearnIdioms(name: "Vitamin B7 helps keep hair, skin, and nails healthy", image: "vitamin_b7_ex"),
        LearnIdioms(name: "Vitamin B9 helps make healthy red blood cells", image: "vitamin_b9_ex"),
        LearnIdioms(name: "Vitamin B12 helps make red blood cells and keeps nerves healthy", image: "vitamin_b12_ex"),
        LearnIdioms(name: "Vitamin C helps us stay strong and healthy", image: "vitamin_c_ex"),
        LearnIdioms(name: "Vitamin D makes our bones and teeth strong", image: "viramin_d_ex"),
        LearnIdioms(name: "Vitamin E keeps our skin healthy", image: "vitamin_e_ex"),
        LearnIdioms(name: "Vitamin K helps our blood stop bleeding", image: "vitamin_k_ex")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        bgViews = [
            viewBG1,viewBG2,viewBG3,viewBG4,viewBG5,
            viewBG6,viewBG7,viewBG8,viewBG9,viewBG10,
            viewBG11,viewBG12,viewBG13
        ]
        
        for view in bgViews {
               view.layer.cornerRadius = 10
               view.clipsToBounds = true
           }
        
        imageViews = [
               imageView1,imageView2,imageView3,imageView4,imageView5,
               imageView6,imageView7,imageView8,imageView9,imageView10,
               imageView11,imageView12,imageView13
           ]

           labels = [
               label1,label2,label3,label4,label5,
               label6,label7,label8,label9,label10,
               label11,label12,label13
           ]

           barViews = [
               barView1,barView2,barView3,barView4,barView5,
               barView6,barView7,barView8,barView9,barView10,
               barView11,barView12,barView13
           ]

           loadData(data: learnIdioms)
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

    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("LearnVitamins.pdf")

        let pageWidth = mainView.bounds.width
        let pageHeight: CGFloat = 800

        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0,
                           y: 0,
                           width: pageWidth,
                           height: pageHeight)
        )

        do {

            try renderer.writePDF(to: pdfURL) { context in

                let totalHeight = mainView.bounds.height

                var currentY: CGFloat = 0

                while currentY < totalHeight {

                    context.beginPage()

                    context.cgContext.saveGState()

                    context.cgContext.translateBy(
                        x: 0,
                        y: -currentY
                    )

                    mainView.layer.render(
                        in: context.cgContext
                    )

                    context.cgContext.restoreGState()

                    currentY += pageHeight
                }
            }

            return pdfURL

        } catch {

            print(error)
            return nil
        }
    }
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        guard let pdfURL = createPDF() else { return }

        let activityVC = UIActivityViewController(
            activityItems: [pdfURL],
            applicationActivities: nil
        )

        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = sender
        }

        present(activityVC, animated: true)
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
    
    @IBAction func sourcesTapBtn(_ sender: UIButton) {
        
        let index = sender.tag   // jo vitamin click hua
        
        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "VitaminsSourcesVC") as? VitaminsSourcesVC {
            vc.selectedIndex = index
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
