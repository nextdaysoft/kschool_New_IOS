//
//  LearnPlanetsFactLevel5VC.swift
//  Kids
//
//  Created by Koshal Singh on 23/02/26.
//

import UIKit
import AVFoundation
import LanguageManager_iOS

class LearnPlanetsFactLevel5VC: BaseViewController,AVSpeechSynthesizerDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var imgBGView: UIView!

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var repeatBtn: UIButton!
    
    @IBOutlet weak var allViewDrop: UIView!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    var planets: [LearnPlanetsItem] = [

        LearnPlanetsItem(
            text: "Sunlight reaches Earth in about 8 minutes".localiz(),
            imageName: "image9"
        ),

        LearnPlanetsItem(
            text: "Jupiter is about 778 million kilometers from the Sun".localiz(),
            imageName: "image (4)"
        ),

        LearnPlanetsItem(
            text: "The distance between Earth and Mars keeps changing".localiz(),
            imageName: "image (3)"
        ),

        LearnPlanetsItem(
            text: "Saturn is about 1.4 billion kilometers from the Sun".localiz(),
            imageName: "image (5)"
        ),

        LearnPlanetsItem(
            text: "Venus is closer to the Sun than Earth".localiz(),
            imageName: "image (2)"
        ),

        LearnPlanetsItem(
            text: "Mercury is the closest planet to the Sun".localiz(),
            imageName: "image (1)"
        ),

        LearnPlanetsItem(
            text: "Neptune is the farthest planet from the Sun".localiz(),
            imageName: "image (7)"
        ),

        LearnPlanetsItem(
            text: "Mars is about 225 million kilometers from the Sun".localiz(),
            imageName: "image (3)"
        ),

        LearnPlanetsItem(
            text: "The distance from Earth to the Moon is about 384,400 kilometers".localiz(),
            imageName: "moon"
        ),

        LearnPlanetsItem(
            text: "The distance from the Sun to Earth is about 150 million kilometers".localiz(),
            imageName: "image9"
        )
    ]
    
    
    var speechSynthesizer = AVSpeechSynthesizer()
    var currentIndex = 0
    var score = 0
    var isAudioCompleted = false
   
    var swipeHintView: UIView?
    var swipeHintLabel: UILabel?
    var swipeHintImageView: UIImageView?

    var hasShownUpHint = false
    var hasShownDownHint = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        planets.shuffle()
        speechSynthesizer.delegate = self
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        imgBGView.isUserInteractionEnabled = true
        imgBGView.addGestureRecognizer(panGesture)

       
        updateUI()
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.showSwipeUpHint()
        }
    }
    
    func showSwipeUpHint() {

        guard !hasShownUpHint else { return }

        hasShownUpHint = true

        removeSwipeHint()

        let container = UIView()

        container.frame = CGRect(
            x: 0,
            y: imgBGView.frame.minY - 85,
            width: view.frame.width,
            height: 90
        )

        container.backgroundColor = .clear

        let label = UILabel()
        label.text = "Swipe up to change planets".localiz()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        label.frame = CGRect(
            x: 20,
            y: 0,
            width: container.frame.width - 40,
            height: 25
        )

        let imageView = UIImageView()

        imageView.image = UIImage(named: "arrowUpAndDown")

        imageView.contentMode = .scaleAspectFit

        imageView.frame = CGRect(
            x: (container.frame.width - 60)/2,
            y: 35,
            width: 60,
            height: 60
        )

        container.addSubview(label)
        container.addSubview(imageView)

        view.addSubview(container)

        swipeHintView = container
        swipeHintImageView = imageView
        swipeHintLabel = label

        animateUpArrow(imageView)
    }

    func showSwipeDownHint() {

        guard !hasShownDownHint else { return }

        hasShownDownHint = true

        removeSwipeHint()

        let dropFrame = allViewDrop.superview?.convert(allViewDrop.frame, to: view) ?? allViewDrop.frame

        let container = UIView()

        container.frame = CGRect(
            x: dropFrame.minX,
            y: dropFrame.maxY + 5,
            width: dropFrame.width,
            height: 100
        )

        container.backgroundColor = .clear

        let label = UILabel()

        label.text = "Swipe down for previous".localiz()

        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)

        label.textAlignment = .center

        label.textColor = .black

        label.frame = CGRect(
            x: 0,
            y: 60,
            width: container.frame.width,
            height: 25
        )

        let imageView = UIImageView()

        imageView.image = UIImage(named: "down-arrow")

        imageView.contentMode = .scaleAspectFit

        imageView.frame = CGRect(
            x: (container.frame.width - 55)/2,
            y: 0,
            width: 55,
            height: 55
        )

        container.addSubview(imageView)
        container.addSubview(label)

        view.addSubview(container)

        swipeHintView = container
        swipeHintImageView = imageView
        swipeHintLabel = label

        animateDownArrow(imageView)
    }

    func removeSwipeHint() {

        swipeHintImageView?.layer.removeAllAnimations()

        swipeHintView?.removeFromSuperview()

        swipeHintView = nil
        swipeHintLabel = nil
        swipeHintImageView = nil
    }

    func animateUpArrow(_ imageView: UIImageView) {

        func startAnimation() {

            imageView.alpha = 0

            imageView.transform =
                CGAffineTransform.identity
                .translatedBy(x: 0, y: 20)
                .scaledBy(x: 0.7, y: 0.7)

            UIView.animate(
                withDuration: 1.2,
                delay: 0,
                options: [.curveEaseInOut],
                animations: {

                    imageView.alpha = 1

                    imageView.transform =
                        CGAffineTransform.identity
                        .translatedBy(x: 0, y: -35)
                        .scaledBy(x: 1.05, y: 1.05)

                }) { _ in

                    UIView.animate(
                        withDuration: 0.4,
                        animations: {

                            imageView.alpha = 0

                            imageView.transform =
                                CGAffineTransform.identity
                                .translatedBy(x: 0, y: -55)
                                .scaledBy(x: 1.2, y: 1.2)

                        }) { _ in

                            startAnimation()
                        }
                }
        }

        startAnimation()
    }

    func animateDownArrow(_ imageView: UIImageView) {

        func startAnimation() {

            imageView.alpha = 0

            imageView.transform =
                CGAffineTransform(translationX: 0, y: -45)
                .scaledBy(x: 0.7, y: 0.7)

            UIView.animate(
                withDuration: 1.2,
                delay: 0,
                options: [.curveEaseInOut],
                animations: {

                    imageView.alpha = 1

                    imageView.transform =
                        CGAffineTransform(translationX: 0, y: 35)
                        .scaledBy(x: 1.05, y: 1.05)

                }) { _ in

                    UIView.animate(
                        withDuration: 0.4,
                        animations: {

                            imageView.alpha = 0

                            imageView.transform =
                                CGAffineTransform(translationX: 0, y: 65)
                                .scaledBy(x: 1.2, y: 1.2)

                        }) { _ in

                            startAnimation()
                        }
                }
        }

        startAnimation()
    }
    
    func animateCardOut() {

        let currentItem = planets[currentIndex]

        // 👇 Second image se hint remove
        if currentIndex >= 1 {
            removeSwipeHint()
        }

        UIView.animate(withDuration: 0.4, animations: {

            self.imgBGView.transform =
                CGAffineTransform(translationX: -120, y: -250)
                .scaledBy(x: 0.3, y: 0.3)

            self.imgBGView.alpha = 0

        }) { _ in

            // 🔥 Add small card
            self.addCardToDropView(with: currentItem)

            // 👇 First swipe ke baad down hint show
            if self.currentIndex == 0 {
                self.showSwipeDownHint()
            }

            self.currentIndex += 1

            if self.currentIndex >= self.planets.count {
                self.goToResultScreen()
                return
            }

            self.imgBGView.transform =
                CGAffineTransform(
                    translationX: 0,
                    y: self.imgBGView.frame.height + 200
                )

            self.imgBGView.alpha = 0

            self.updateUI()

            UIView.animate(withDuration: 0.4) {
                self.imgBGView.transform = .identity
                self.imgBGView.alpha = 1
            }
        }
    }
    
    @objc func handleSmallCardPan(_ gesture: UIPanGestureRecognizer) {
        
        guard let card = gesture.view else { return }
        let translation = gesture.translation(in: view)
        
        switch gesture.state {
            
        case .changed:
            card.center = CGPoint(
                x: card.center.x + translation.x,
                y: card.center.y + translation.y
            )
            gesture.setTranslation(.zero, in: view)
            
        case .ended, .cancelled:

            // ✅ Swipe hint remove
            self.removeSwipeHint()

            // 🔥 Disable interaction during animation
            card.isUserInteractionEnabled = false
            
            // 🔥 Animate small card towards imgBGView center
            let targetCenter = imgBGView.superview?.convert(imgBGView.center, to: view)
            
            UIView.animate(withDuration: 0.3, animations: {
                if let target = targetCenter {
                    card.center = target
                }
                card.alpha = 0
            }) { _ in
                
                card.removeFromSuperview()
                self.restoreCardFromSmall(cardTag: card.tag)
            }
            
        default:
            break
        }
    }
    
    func restoreCardFromSmall(cardTag: Int) {

        currentIndex = cardTag

        // Already viewed cards same rahenge
        let viewedPlanets = Array(planets.prefix(currentIndex + 1))

        // Sirf aage wale cards reshuffle
        var remainingPlanets = Array(planets.dropFirst(currentIndex + 1))
        remainingPlanets.shuffle()

        // New order
        planets = viewedPlanets + remainingPlanets

        imgBGView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        imgBGView.alpha = 0

        updateUI()

        UIView.animate(withDuration: 0.3) {
            self.imgBGView.transform = .identity
            self.imgBGView.alpha = 1
        }
    }
    
    func addCardToDropView(with item: LearnPlanetsItem) {

        let cardSize: CGFloat = 150
        let borderWidth: CGFloat = 8
        
        let x = (allViewDrop.bounds.width - cardSize) / 2
        let y = (allViewDrop.bounds.height - cardSize) / 2
        
        let smallCard = UIView(frame: CGRect(x: x, y: y, width: cardSize, height: cardSize))
        
        smallCard.backgroundColor = .white
        smallCard.layer.cornerRadius = 12
        smallCard.layer.borderWidth = borderWidth
        smallCard.layer.borderColor = ColorManager.randomColor().cgColor
        smallCard.clipsToBounds = true
        
        // 🔥 IMPORTANT — yahi add karna hai
        smallCard.tag = currentIndex
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handleSmallCardPan(_:)))
        smallCard.addGestureRecognizer(pan)
        smallCard.isUserInteractionEnabled = true
        
        // 🔥 Stack effect rotation
        smallCard.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -0.2...0.2))
        
        let imageHeight: CGFloat = cardSize * 0.65
        
        let imageView = UIImageView(frame: CGRect(x: 10,
                                                  y: 10,
                                                  width: cardSize - 20,
                                                  height: imageHeight - 10))
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: item.imageName)
        
        let titleLabel = UILabel(frame: CGRect(x: 5,
                                               y: imageHeight,
                                               width: cardSize - 10,
                                               height: cardSize - imageHeight - 5))
        
        titleLabel.text = item.text
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.adjustsFontSizeToFitWidth = true
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.adjustsFontSizeToFitWidth = false
        
        smallCard.addSubview(imageView)
        smallCard.addSubview(titleLabel)
        
        // 👇 Ye line ke just pehle gesture aur tag lagana hai
        allViewDrop.addSubview(smallCard)
        allViewDrop.bringSubviewToFront(smallCard)
    }
    
    
    func updateUI() {

        guard currentIndex < planets.count else { return }

        let item = planets[currentIndex]
        label.text = item.text
        imgView.image = UIImage(named: item.imageName)

        applyRandomCornerStyle()
        speak(text: item.text)
    }
    
    func showIntroScreen() {
        // Intro item (index 0)
        let introItem = planets[0]

        label.text = introItem.text
        imgView.image = UIImage(named: introItem.imageName)
        applyRandomCornerStyle()

        // 🔇 Audio disable
        speechSynthesizer.stopSpeaking(at: .immediate)

        // 🚫 Swipe disable for intro
        imgBGView.isUserInteractionEnabled = false

        // ⏱ 2 seconds baad real content start
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.startMainFlow()
        }
    }
    
    func startMainFlow() {
        // Start from index 1 (skip Listen and Learn)
        currentIndex = 1

        // Swipe enable
        imgBGView.isUserInteractionEnabled = true

        updateUI()
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

        isAudioCompleted = false

        speechSynthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(string: text)

        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"

        switch selectedLanguage {

        case "zhHans":
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")

        case "hi":
            utterance.voice = AVSpeechSynthesisVoice(language: "hi-IN")

        case "fr":
            utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")

        case "es":
            utterance.voice = AVSpeechSynthesisVoice(language: "es-ES")

        case "de":
            utterance.voice = AVSpeechSynthesisVoice(language: "de-DE")

        case "ar":
            utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")

        default:
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        }

        utterance.rate = 0.45

        speechSynthesizer.speak(utterance)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {

        let translation = gesture.translation(in: imgBGView.superview)

        switch gesture.state {

        case .changed:
            if translation.y < 0 {
                let rotation = translation.y / -1000
                imgBGView.transform =
                    CGAffineTransform(translationX: 0, y: translation.y)
                    .rotated(by: rotation)
            }

        case .ended, .cancelled:
            if translation.y < -150 {
                animateCardOut()
            } else {
                resetCardPosition()
            }

        default:
            break
        }
    }
    
    func resetCardPosition() {
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.6,
            options: []
        ) {
            self.imgBGView.transform = .identity
        }
    }
    
    @objc func handleSwipeUp() {

        score += 1

        // 🔥 Swipe animation
        UIView.animate(withDuration: 0.35, animations: {

            self.imgBGView.transform =
                CGAffineTransform(translationX: 0, y: -self.view.frame.height)
                .rotated(by: -.pi / 12)

            self.imgBGView.alpha = 0

        }) { _ in

            self.currentIndex += 1

            if self.currentIndex < self.planets.count {

                // 🔁 Reset position (neeche)
                self.imgBGView.transform =
                    CGAffineTransform(translationX: 0, y: self.view.frame.height)
                self.imgBGView.alpha = 0

                self.updateUI()

                // ⬆️ New card entry animation
                UIView.animate(withDuration: 0.35) {
                    self.imgBGView.transform = .identity
                    self.imgBGView.alpha = 1
                }

            } else {
                self.goToResultScreen()
            }
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                           didFinish utterance: AVSpeechUtterance) {
        isAudioCompleted = true    // 🔓 unlock swipe
    }
    
    func goToResultScreen() {

        let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)

        if let resultVC = storyboard.instantiateViewController(
            withIdentifier: "LearnPlanetsFactResultLevel5VC"
        ) as? LearnPlanetsFactResultLevel5VC {

            resultVC.modalPresentationStyle = .fullScreen

            resultVC.modalTransitionStyle = .crossDissolve

            navigationController?.pushViewController(resultVC, animated: false)
        }
    }
    
    func applyRandomCornerStyle() {
        let randomColor = ColorManager.randomColor()

        imgBGView.layer.cornerRadius = 10
        imgBGView.layer.borderWidth = 10
        imgBGView.layer.borderColor = randomColor.cgColor
    }
    
    func createFruitsPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("PlanetsFact.pdf")

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        )

        do {

            try renderer.writePDF(to: pdfURL) { context in

                context.beginPage()

                // Title
                let title = "Planets Fact"

                let titleAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 30),
                    .foregroundColor: UIColor.black
                ]

                let titleSize = title.size(withAttributes: titleAttributes)

                title.draw(
                    at: CGPoint(
                        x: (pageWidth - titleSize.width) / 2,
                        y: 30
                    ),
                    withAttributes: titleAttributes
                )

                let cardWidth: CGFloat = 220
                let cardHeight: CGFloat = 180

                let startX: CGFloat = 50
                let spacingX: CGFloat = 30

                var xPos = startX
                var yPos: CGFloat = 100

                for (index,item) in planets.enumerated() {

                    let cardRect = CGRect(
                        x: xPos,
                        y: yPos,
                        width: cardWidth,
                        height: cardHeight
                    )

                    // Card Background
                    let bgPath = UIBezierPath(
                        roundedRect: cardRect,
                        cornerRadius: 12
                    )

                    UIColor.white.setFill()
                    bgPath.fill()

                    UIColor.lightGray.setStroke()
                    bgPath.lineWidth = 1
                    bgPath.stroke()

                    // Image
                    if let image = UIImage(named: item.imageName) {

                        image.draw(
                            in: CGRect(
                                x: cardRect.minX + 20,
                                y: cardRect.minY + 10,
                                width: cardWidth - 40,
                                height: 100
                            )
                        )
                    }

                    // Color Bar
                    let barRect = CGRect(
                        x: cardRect.minX,
                        y: cardRect.maxY - 70,
                        width: cardWidth,
                        height: 70
                    )

                    ColorManager.randomColor().setFill()
                    UIBezierPath(rect: barRect).fill()

                    // Planet Fact
                    let text = item.text

                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.alignment = .center
                    paragraphStyle.lineBreakMode = .byWordWrapping

                    let attrs: [NSAttributedString.Key: Any] = [
                        .font: UIFont.boldSystemFont(ofSize: 14),
                        .foregroundColor: UIColor.black,
                        .paragraphStyle: paragraphStyle
                    ]

                    let textRect = CGRect(
                        x: barRect.minX + 8,
                        y: barRect.minY + 5,
                        width: barRect.width - 16,
                        height: barRect.height - 10
                    )

                    (text as NSString).draw(
                        in: textRect,
                        withAttributes: attrs
                    )

                    // Next Position
                    if index % 2 == 0 {

                        xPos += cardWidth + spacingX

                    } else {

                        xPos = startX
                        yPos += cardHeight + 20
                    }

                    // New Page
                    if yPos > pageHeight - 220 {

                        context.beginPage()

                        yPos = 100
                        xPos = startX
                    }
                }
            }

            return pdfURL

        } catch {

            print(error)
            return nil
        }
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        guard let pdfURL = createFruitsPDF() else { return }

        let activityVC = UIActivityViewController(
            activityItems: [pdfURL],
            applicationActivities: nil
        )

        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = sender
        }

        present(activityVC, animated: true)
    }
    
    
    @IBAction func repeatTapBtn(_ sender: UIButton) {
        speak(text: planets[currentIndex].text)
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
 
}
