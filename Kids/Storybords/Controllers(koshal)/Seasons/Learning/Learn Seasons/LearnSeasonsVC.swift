//
//  LearnSeasonsVC.swift
//  KSchool
//
//  Created by Koshal Singh on 07/04/26.
//

struct AllSeasons {
    let name: String
    let image: String
}

import UIKit
import AVFoundation

class LearnSeasonsVC: BaseViewController {

    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    
    @IBOutlet weak var barView1: UIView!
    @IBOutlet weak var barView2: UIView!
    @IBOutlet weak var barView3: UIView!
    @IBOutlet weak var barView4: UIView!
    @IBOutlet weak var barView5: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pdfBtn: UIButton!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var speechSynthesizer = AVSpeechSynthesizer()

    let seasons: [AllSeasons] = [

        AllSeasons(name: "Spring Season", image: "season_spring"),
        AllSeasons(name: "Summer Season", image: "season_summer"),
        AllSeasons(name: "Rainy Season", image: "season_rainy"),
        AllSeasons(name: "Autumn Season", image: "season_autumn"),
        AllSeasons(name: "Winter Season", image: "season_winter"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        viewBG4.layer.cornerRadius = 10
        viewBG5.layer.cornerRadius = 10
      
        
        barView1.backgroundColor = ColorManager.randomColor()
        barView2.backgroundColor = ColorManager.randomColor()
        barView3.backgroundColor = ColorManager.randomColor()
        barView4.backgroundColor = ColorManager.randomColor()
        barView5.backgroundColor = ColorManager.randomColor()

        
        imageView1.image = UIImage(named: seasons[0].image)
        imageView2.image = UIImage(named: seasons[1].image)
        imageView3.image = UIImage(named: seasons[2].image)
        imageView4.image = UIImage(named: seasons[3].image)
        imageView5.image = UIImage(named: seasons[4].image)
        
        label1.text = seasons[0].name
        label2.text = seasons[1].name
        label3.text = seasons[2].name
        label4.text = seasons[3].name
        label5.text = seasons[4].name
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

    
    func captureView(_ view: UIView) -> UIImage {

        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)

        return renderer.image { context in
            view.layer.render(in: context.cgContext)
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("LearnSeason.pdf")

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
        let part = seasons[sender.tag]
        speak(text: part.name)
    }
    
}
