//
//  LearnAnimalEatingStyleVC.swift
//  KSchool
//
//  Created by Koshal Singh on 22/04/26.
//

import UIKit
import AVFoundation

class LearnAnimalEatingStyleVC: BaseViewController {

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
   
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pdfBtn: UIButton!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var speechSynthesizer = AVSpeechSynthesizer()

    let bodyParts: [BodyPart] = [

        BodyPart(name: "Lick", image: "dog_licking"),
        BodyPart(name: "Lap", image: "cat_laping"),

        BodyPart(name: "Gnaw", image: "rat_gnawing"),
        BodyPart(name: "Nibble", image: "rabbit_nibbling"),

        BodyPart(name: "Munch", image: "horse_munching"),
        BodyPart(name: "Chomp", image: "crocodile_choming"),

        BodyPart(name: "Peck", image: "sparrow_pecking"),
        BodyPart(name: "Graze", image: "cow_grazing"),

        BodyPart(name: "Forage", image: "pig_foraging"),
        BodyPart(name: "Browse", image: "goat_browsing")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
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
        
        imageView1.image = UIImage(named: bodyParts[0].image)
        imageView2.image = UIImage(named: bodyParts[1].image)
        imageView3.image = UIImage(named: bodyParts[2].image)
        imageView4.image = UIImage(named: bodyParts[3].image)
        imageView5.image = UIImage(named: bodyParts[4].image)
        imageView6.image = UIImage(named: bodyParts[5].image)
        imageView7.image = UIImage(named: bodyParts[6].image)
        imageView8.image = UIImage(named: bodyParts[7].image)
        imageView9.image = UIImage(named: bodyParts[8].image)
        imageView10.image = UIImage(named: bodyParts[9].image)
       
        
        label1.text = bodyParts[0].name
        label2.text = bodyParts[1].name
        label3.text = bodyParts[2].name
        label4.text = bodyParts[3].name
        label5.text = bodyParts[4].name
        label6.text = bodyParts[5].name
        label7.text = bodyParts[6].name
        label8.text = bodyParts[7].name
        label9.text = bodyParts[8].name
        label10.text = bodyParts[9].name
     
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

 
    func drawHeader(pageWidth: CGFloat) {

        if let image = UIImage(named: "dog-food") {

            image.draw(
                in: CGRect(
                    x: 140,
                    y: 10,
                    width: 45,
                    height: 45
                )
            )
        }

        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 26),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraph
        ]

        let rect = CGRect(
            x: 195,
            y: 18,
            width: 350,
            height: 40
        )

        "Animal Eating Style".draw(
            in: rect,
            withAttributes: attributes
        )
    }
    
    func captureView(_ view: UIView) -> UIImage {

        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)

        return renderer.image { context in
            view.layer.render(in: context.cgContext)
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("AnimalEatingStyle.pdf")

        let pageWidth = mainView.bounds.width
        let pageHeight: CGFloat = 800

        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try renderer.writePDF(to: pdfURL) { context in

                let totalHeight = mainView.bounds.height

                var currentY: CGFloat = 0

                while currentY < totalHeight {

                    context.beginPage()

                    context.cgContext.saveGState()

                    context.cgContext.translateBy(x: 0, y: -currentY)

                    mainView.layer.render(in: context.cgContext)

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
        let part = bodyParts[sender.tag]
        speak(text: part.name)
    }
    
}
