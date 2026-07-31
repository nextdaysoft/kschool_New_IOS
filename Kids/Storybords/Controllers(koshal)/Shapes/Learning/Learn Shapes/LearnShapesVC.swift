//
//  LearnShapesVC.swift
//  KSchool
//
//  Created by Koshal Singh on 06/04/26.
//

import UIKit
import AVFoundation

class LearnShapesVC: BaseViewController {

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

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pdfBtn: UIButton!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var speechSynthesizer = AVSpeechSynthesizer()

    let bodyParts: [BodyPart] = [

        // 2D Shapes (Top Section)
        BodyPart(name: "Circle", image: "shape_circle"),
        BodyPart(name: "Square", image: "shape_square"),

        BodyPart(name: "Triangle", image: "shape_triangle"),
        BodyPart(name: "Rectangle", image: "shape_rectangle"),

        BodyPart(name: "Oval", image: "shape_oval"),
        BodyPart(name: "Semi Circle", image: "shape_semicircle"),

        BodyPart(name: "Pentagon", image: "shape_pentagon"),
        BodyPart(name: "Hexagon", image: "shape_hexagon"),

        BodyPart(name: "Octagon", image: "shape_octagon"),
        BodyPart(name: "Rhombus", image: "shape_rhombus"),

        BodyPart(name: "Parallelogram", image: "shape_parallelogram"),
        BodyPart(name: "Trapezium", image: "shape_trapezium"),

        // 3D Shapes (Bottom Section)
        BodyPart(name: "Cube", image: "shape_cube"),
        BodyPart(name: "Cuboid", image: "shape_cuboid"),

        BodyPart(name: "Sphere", image: "shape_sphere"),
        BodyPart(name: "Cone", image: "shape_cone"),

        BodyPart(name: "Cylinder", image: "shape_cylinder"),
        BodyPart(name: "Pyramid", image: "shape_pyramid")
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
        viewBG16.layer.cornerRadius = 10
        viewBG17.layer.cornerRadius = 10
        viewBG18.layer.cornerRadius = 10
        
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
        imageView11.image = UIImage(named: bodyParts[10].image)
        imageView12.image = UIImage(named: bodyParts[11].image)
        imageView13.image = UIImage(named: bodyParts[12].image)
        imageView14.image = UIImage(named: bodyParts[13].image)
        imageView15.image = UIImage(named: bodyParts[14].image)
        imageView16.image = UIImage(named: bodyParts[15].image)
        imageView17.image = UIImage(named: bodyParts[16].image)
        imageView18.image = UIImage(named: bodyParts[17].image)
        
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
        label11.text = bodyParts[10].name
        label12.text = bodyParts[11].name
        label13.text = bodyParts[12].name
        label14.text = bodyParts[13].name
        label15.text = bodyParts[14].name
        label16.text = bodyParts[15].name
        label17.text = bodyParts[16].name
        label18.text = bodyParts[17].name
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
            .appendingPathComponent("LearnShapes.pdf")

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
        let part = bodyParts[sender.tag]
        speak(text: part.name)
    }
    
}
