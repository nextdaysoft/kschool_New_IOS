//
//  AnimalFamiliesVC.swift
//  New
//
//  Created by Koshal Singh on 23/04/26.
//

struct AnimalFamily {
    let image: String
    let male: String
    let baby: String
    let female: String
}

import UIKit
import AVFoundation
import PDFKit
import UniformTypeIdentifiers

class AnimalFamiliesVC: BaseViewController {

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
    @IBOutlet weak var barView27: UIView!
    @IBOutlet weak var barView28: UIView!
    @IBOutlet weak var barView29: UIView!
    @IBOutlet weak var barView30: UIView!
    @IBOutlet weak var barView31: UIView!
    @IBOutlet weak var barView32: UIView!
    @IBOutlet weak var barView33: UIView!
    @IBOutlet weak var barView34: UIView!
    @IBOutlet weak var barView35: UIView!
    @IBOutlet weak var barView36: UIView!
    @IBOutlet weak var barView37: UIView!
    @IBOutlet weak var barView38: UIView!
    @IBOutlet weak var barView39: UIView!
    @IBOutlet weak var barView40: UIView!
    @IBOutlet weak var barView41: UIView!
    @IBOutlet weak var barView42: UIView!
    @IBOutlet weak var barView43: UIView!
    @IBOutlet weak var barView44: UIView!
    @IBOutlet weak var barView45: UIView!
    
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
    @IBOutlet weak var label27: UILabel!
    @IBOutlet weak var label28: UILabel!
    @IBOutlet weak var label29: UILabel!
    @IBOutlet weak var label30: UILabel!
    @IBOutlet weak var label31: UILabel!
    @IBOutlet weak var label32: UILabel!
    @IBOutlet weak var label33: UILabel!
    @IBOutlet weak var label34: UILabel!
    @IBOutlet weak var label35: UILabel!
    @IBOutlet weak var label36: UILabel!
    @IBOutlet weak var label37: UILabel!
    @IBOutlet weak var label38: UILabel!
    @IBOutlet weak var label39: UILabel!
    @IBOutlet weak var label40: UILabel!
    @IBOutlet weak var label41: UILabel!
    @IBOutlet weak var label42: UILabel!
    @IBOutlet weak var label43: UILabel!
    @IBOutlet weak var label44: UILabel!
    @IBOutlet weak var label45: UILabel!
   
    
    
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
  
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pdfBtn: UIButton!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet var allButtons: [UIButton]!
    
    var speechSynthesizer = AVSpeechSynthesizer()

    var pdfScrollView: UIScrollView?
    
    let animalFamilies: [AnimalFamily] = [
        AnimalFamily(image: "cow_family", male: "Bull", baby: "Calf", female: "Cow"),
        AnimalFamily(image: "goat_family", male: "Buck", baby: "Kid", female: "Doe"),
        AnimalFamily(image: "sheep_family", male: "Ram", baby: "Lamb", female: "Ewe"),
        AnimalFamily(image: "horse_family", male: "Stallion", baby: "Foal", female: "Mare"),
        AnimalFamily(image: "pig_family", male: "Boar", baby: "Piglet", female: "Sow"),
        AnimalFamily(image: "lion_family", male: "Lion", baby: "Cub", female: "Lioness"),
        AnimalFamily(image: "tiger_family", male: "Tiger", baby: "Cub", female: "Tigress"),
        AnimalFamily(image: "deer_family", male: "Stag", baby: "Fawn", female: "Doe"),
        AnimalFamily(image: "chicken_family", male: "Rooster", baby: "Chick", female: "Hen"),
        AnimalFamily(image: "peacock_family", male: "Peacock", baby: "Peachick", female: "Peahen"),
        AnimalFamily(image: "duck_family", male: "Drake", baby: "Duckling", female: "Duck"),
        AnimalFamily(image: "goose_family", male: "Gander", baby: "Gosling", female: "Goose"),
        AnimalFamily(image: "cat_family", male: "Tom", baby: "Kitten", female: "Queen"),
        AnimalFamily(image: "rabbit_family", male: "Buck", baby: "Kit", female: "Doe"),
        AnimalFamily(image: "fox_family", male: "Fox", baby: "Kit", female: "Vixen")
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
        viewBG11.layer.cornerRadius = 10
        viewBG12.layer.cornerRadius = 10
        viewBG13.layer.cornerRadius = 10
        viewBG14.layer.cornerRadius = 10
        viewBG15.layer.cornerRadius = 10
       
        
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
        barView27.backgroundColor = ColorManager.randomColor()
        barView28.backgroundColor = ColorManager.randomColor()
        barView29.backgroundColor = ColorManager.randomColor()
        barView30.backgroundColor = ColorManager.randomColor()
        barView31.backgroundColor = ColorManager.randomColor()
        barView32.backgroundColor = ColorManager.randomColor()
        barView33.backgroundColor = ColorManager.randomColor()
        barView34.backgroundColor = ColorManager.randomColor()
        barView35.backgroundColor = ColorManager.randomColor()
        barView36.backgroundColor = ColorManager.randomColor()
        barView37.backgroundColor = ColorManager.randomColor()
        barView38.backgroundColor = ColorManager.randomColor()
        barView39.backgroundColor = ColorManager.randomColor()
        barView40.backgroundColor = ColorManager.randomColor()
        barView41.backgroundColor = ColorManager.randomColor()
        barView42.backgroundColor = ColorManager.randomColor()
        barView43.backgroundColor = ColorManager.randomColor()
        barView44.backgroundColor = ColorManager.randomColor()
        barView45.backgroundColor = ColorManager.randomColor()
        
        
        
        imageView1.image = UIImage(named: animalFamilies[0].image)
        imageView2.image = UIImage(named: animalFamilies[1].image)
        imageView3.image = UIImage(named: animalFamilies[2].image)
        imageView4.image = UIImage(named: animalFamilies[3].image)
        imageView5.image = UIImage(named: animalFamilies[4].image)
        imageView6.image = UIImage(named: animalFamilies[5].image)
        imageView7.image = UIImage(named: animalFamilies[6].image)
        imageView8.image = UIImage(named: animalFamilies[7].image)
        imageView9.image = UIImage(named: animalFamilies[8].image)
        imageView10.image = UIImage(named: animalFamilies[9].image)
        imageView11.image = UIImage(named: animalFamilies[10].image)
        imageView12.image = UIImage(named: animalFamilies[11].image)
        imageView13.image = UIImage(named: animalFamilies[12].image)
        imageView14.image = UIImage(named: animalFamilies[13].image)
        imageView15.image = UIImage(named: animalFamilies[14].image)
        
        
        // Row 1
        label1.text = animalFamilies[0].male
        label2.text = animalFamilies[0].baby
        label3.text = animalFamilies[0].female

        // Row 2
        label4.text = animalFamilies[1].male
        label5.text = animalFamilies[1].baby
        label6.text = animalFamilies[1].female

        // Row 3
        label7.text = animalFamilies[2].male
        label8.text = animalFamilies[2].baby
        label9.text = animalFamilies[2].female

        // Row 4
        label10.text = animalFamilies[3].male
        label11.text = animalFamilies[3].baby
        label12.text = animalFamilies[3].female

        // Row 5
        label13.text = animalFamilies[4].male
        label14.text = animalFamilies[4].baby
        label15.text = animalFamilies[4].female

        // Row 6
        label16.text = animalFamilies[5].male
        label17.text = animalFamilies[5].baby
        label18.text = animalFamilies[5].female

        // Row 7
        label19.text = animalFamilies[6].male
        label20.text = animalFamilies[6].baby
        label21.text = animalFamilies[6].female

        // Row 8
        label22.text = animalFamilies[7].male
        label23.text = animalFamilies[7].baby
        label24.text = animalFamilies[7].female

        // Row 9
        label25.text = animalFamilies[8].male
        label26.text = animalFamilies[8].baby
        label27.text = animalFamilies[8].female

        // Row 10
        label28.text = animalFamilies[9].male
        label29.text = animalFamilies[9].baby
        label30.text = animalFamilies[9].female

        // Row 11
        label31.text = animalFamilies[10].male
        label32.text = animalFamilies[10].baby
        label33.text = animalFamilies[10].female

        // Row 12
        label34.text = animalFamilies[11].male
        label35.text = animalFamilies[11].baby
        label36.text = animalFamilies[11].female

        // Row 13
        label37.text = animalFamilies[12].male
        label38.text = animalFamilies[12].baby
        label39.text = animalFamilies[12].female

        // Row 14
        label40.text = animalFamilies[13].male
        label41.text = animalFamilies[13].baby
        label42.text = animalFamilies[13].female

        // Row 15
        label43.text = animalFamilies[14].male
        label44.text = animalFamilies[14].baby
        label45.text = animalFamilies[14].female
      
        for (index, button) in allButtons.enumerated() {
            button.tag = index
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

    
    func getAnimalName(from imageName: String) -> String {
        if imageName.contains("cow") { return "cow" }
        if imageName.contains("goat") { return "goat" }
        if imageName.contains("sheep") { return "sheep" }
        if imageName.contains("horse") { return "horse" }
        if imageName.contains("pig") { return "pig" }
        if imageName.contains("lion") { return "lion" }
        if imageName.contains("tiger") { return "tiger" }
        if imageName.contains("deer") { return "deer" }
        if imageName.contains("chicken") { return "chicken" }
        if imageName.contains("peacock") { return "peacock" }
        if imageName.contains("duck") { return "duck" }
        if imageName.contains("goose") { return "goose" }
        if imageName.contains("cat") { return "cat" }
        if imageName.contains("rabbit") { return "rabbit" }
        if imageName.contains("fox") { return "fox" }
        return "animal"
    }
    
    func captureView(_ view: UIView) -> UIImage {

        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)

        return renderer.image { context in
            view.layer.render(in: context.cgContext)
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("AnimalFamilies.pdf")

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        let rowViews: [UIView] = [
            viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,
            viewBG6, viewBG7, viewBG8, viewBG9, viewBG10,
            viewBG11, viewBG12, viewBG13, viewBG14, viewBG15
        ]

        do {

            try renderer.writePDF(to: pdfURL) { context in

                // First Page
                context.beginPage()

                drawHeader(pageWidth: pageWidth)

                var yPosition: CGFloat = 90

                for rowView in rowViews {

                    let cardHeight: CGFloat = 220

                    // New Page
                    if yPosition + cardHeight > pageHeight - 40 {

                        context.beginPage()

                        // Second page onwards title nahi aayega
                        yPosition = 30
                    }

                    let image = captureView(rowView)

                    image.draw(
                        in: CGRect(
                            x: 60,
                            y: yPosition,
                            width: pageWidth - 120,
                            height: cardHeight
                        )
                    )

                    yPosition += cardHeight + 20
                }
            }

            return pdfURL

        } catch {

            print(error)
            return nil
        }
    }
    
    func drawHeader(pageWidth: CGFloat) {

        if let image = UIImage(named: "kangaroo") {

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
            width: 300,
            height: 40
        )

        "Animal Families".draw(
            in: rect,
            withAttributes: attributes
        )
    }

    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {

        if pdfScrollView != nil {
            pdfScrollView?.removeFromSuperview()
            pdfScrollView = nil
            return
        }

        navigationController?.popViewController(animated: true)
    }   
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        guard let pdfURL = createPDF() else { return }

        let vc = UIActivityViewController(
            activityItems: [pdfURL],
            applicationActivities: nil
        )

        present(vc, animated: true)
    }
    
    
    @IBAction func bodyPartTapped(_ sender: UIButton) {
        
        // 👉 jis row view me button hai (viewBG1, viewBG2...)
        guard let rowView = sender.superview else { return }
        
        let allRows = [
            viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,
            viewBG6, viewBG7, viewBG8, viewBG9, viewBG10,
            viewBG11, viewBG12, viewBG13, viewBG14, viewBG15
        ]
        
        guard let row = allRows.firstIndex(of: rowView) else { return }
        
        print("Row:", row)
        
        let part = animalFamilies[row]
        
        let sentence = "A male \(getAnimalName(from: part.image)) is called a \(part.male), a female is called a \(part.female), and the baby is called a \(part.baby)."
        
        speak(text: sentence)
    }
    
}
