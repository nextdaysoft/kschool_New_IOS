//
//  LearnRomanNumeralsVC.swift
//  New
//
//  Created by Koshal Singh on 06/04/26.
//

import UIKit
import AVFoundation

class LearnRomanNumeralsVC: BaseViewController {

    @IBOutlet var viewBGs: [UIView]!
    @IBOutlet var barViews: [UIView]!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var labelBar: [UILabel]!
    

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pdfBtn: UIButton!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        // Background views corner
          for view in viewBGs {
              view.layer.cornerRadius = 10
          }

          // Set numbers + roman
          for i in 0..<labels.count {
              
              let number = i + 1
              
              // Roman Numerals (I, II, III...)
              labels[i].text = toRoman(number)
              
              // Normal Numbers (1, 2, 3...)
              labelBar[i].text = "\(number)"
          }

        // Random color for all bars
        for bar in barViews {
            bar.backgroundColor = ColorManager.randomColor()
        }

        // Set labels
    }
    
    func toRoman(_ number: Int) -> String {
        let romanValues: [(Int, String)] = [
            (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
            (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
        ]
        
        var num = number
        var result = ""
        
        for (value, roman) in romanValues {
            while num >= value {
                result += roman
                num -= value
            }
        }
        
        return result
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
            .appendingPathComponent("LearnRomanNumerals.pdf")

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
        let number = sender.tag + 1
        let roman = toRoman(number)
        speak(text: "\(number)")
    }
    
}
