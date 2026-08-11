//
//  ListenVehicleNameShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 01/04/26.
//

import UIKit
import AVFoundation
import LanguageManager_iOS

class ListenVehicleNameShowVC: BaseViewController,AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var imgBGView: UIView!
   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var repeatBtn: UIButton!
    
    @IBOutlet weak var allViewDrop: UIView!
    
    @IBOutlet weak var LevelLabel: UILabel!
    
    @IBOutlet weak var pdfBtn: UIButton!
    
    var planets: [LearnPlanetsItem] = []
    
    var speechSynthesizer = AVSpeechSynthesizer()
    var currentIndex = 0
    var score = 0
    var isAudioCompleted = false
  
 
    var levelNumber: Int = 1
    var swipeHintView: UIView?
    var swipeHintLabel: UILabel?
    var swipeHintImageView: UIImageView?

    var hasShownUpHint = false
    var hasShownDownHint = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        
        LevelLabel.text = "# \("Level".localiz()) \(levelNumber)"
        
        planets.shuffle()
        
        speechSynthesizer.delegate = self
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        imgBGView.isUserInteractionEnabled = true
        imgBGView.addGestureRecognizer(panGesture)

       
        updateUI()
     
        // 👇 ONLY FIRST CARD PE
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
               self.showSwipeUpHint()
           }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
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
        label.text = "Swipe up to change vehicle".localiz()
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

        // ✅ UP ANIMATION
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

        // ✅ showSwipeDownHint() me sirf image change karo

        let imageView = UIImageView()

        // 👇 YE NEW DOWN ARROW IMAGE USE KARO
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

        // ✅ DOWN ANIMATION
        animateDownArrow(imageView)
    }
    
    
    func removeSwipeHint() {

        swipeHintImageView?.layer.removeAllAnimations()

        swipeHintView?.removeFromSuperview()

        swipeHintView = nil
        swipeHintLabel = nil
        swipeHintImageView = nil
    }
    
    
    func animateFloatingArrow(
        _ imageView: UIImageView,
        moveUp: Bool
    ) {

        func startAnimation() {

            if moveUp {

                // ✅ UP ANIMATION

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

            } else {
                
                // ✅ DOWN ANIMATION

                // 👇 Arrow DOWN side face karega
                imageView.transform = CGAffineTransform(rotationAngle: .pi)

                // 👇 TOP se start
                imageView.alpha = 0

                imageView.transform =
                    CGAffineTransform(rotationAngle: .pi)
                    .translatedBy(x: 0, y: -40)
                    .scaledBy(x: 0.7, y: 0.7)

                UIView.animate(
                    withDuration: 1.2,
                    delay: 0,
                    options: [.curveEaseInOut],
                    animations: {

                        imageView.alpha = 1

                        // 👇 SIRF NICHE move karega
                        imageView.transform =
                            CGAffineTransform(rotationAngle: .pi)
                            .translatedBy(x: 0, y: 40)
                            .scaledBy(x: 1.05, y: 1.05)

                    }) { _ in

                        UIView.animate(
                            withDuration: 0.4,
                            animations: {

                                // 👇 NICHE fade hoga
                                imageView.alpha = 0

                                imageView.transform =
                                    CGAffineTransform(rotationAngle: .pi)
                                    .translatedBy(x: 0, y: 70)
                                    .scaledBy(x: 1.2, y: 1.2)

                            }) { _ in

                                // 👇 Direct TOP pe reset
                                imageView.transform =
                                    CGAffineTransform(rotationAngle: .pi)
                                    .translatedBy(x: 0, y: -40)

                                startAnimation()
                            }
                    }
            }
        }

        startAnimation()
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
    
    // ✅ animateDownArrow() me pura function replace karo

    func animateDownArrow(_ imageView: UIImageView) {

        func startAnimation() {

            // 👇 TOP se start
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

                    // 👇 NICHE move
                    imageView.transform =
                        CGAffineTransform(translationX: 0, y: 35)
                        .scaledBy(x: 1.05, y: 1.05)

                }) { _ in

                    UIView.animate(
                        withDuration: 0.4,
                        animations: {

                            // 👇 NICHE fade
                            imageView.alpha = 0

                            imageView.transform =
                                CGAffineTransform(translationX: 0, y: 65)
                                .scaledBy(x: 1.2, y: 1.2)

                        }) { _ in

                            // 👇 FIRSE TOP se
                            startAnimation()
                        }
                }
        }

        startAnimation()
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

            self.removeSwipeHint()
            
            // 🔥 Disable interaction during animation
            card.isUserInteractionEnabled = false
            
            // 🔥 Animate small card towards imgBGView center (only position, not resize)
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

        // Jo vehicles already dikh chuke hain
        let viewedVehicles = Array(planets.prefix(currentIndex + 1))

        // Jo baaki bache hain unko dubara random karo
        var remainingVehicles = Array(planets.dropFirst(currentIndex + 1))
        remainingVehicles.shuffle()

        // Final sequence
        planets = viewedVehicles + remainingVehicles

        // Animation
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
        isAudioCompleted = false

        speechSynthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
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

    func animateCardOut() {

        let currentItem = planets[currentIndex]

        // 👇 SECOND image se hint hide hoga
        // First swipe pe down hint show hoga
        // Second swipe pe remove hoga
        if currentIndex >= 1 {
            removeSwipeHint()
        }

        UIView.animate(withDuration: 0.4, animations: {

            self.imgBGView.transform =
                CGAffineTransform(translationX: -120, y: -250)
                .scaledBy(x: 0.3, y: 0.3)

            self.imgBGView.alpha = 0

        }) { _ in

            // 🔥 Add small card to drop area
            self.addCardToDropView(with: currentItem)

            // 👇 ONLY FIRST TIME
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
            withIdentifier: "ListenVehicleNameResultVC"
        ) as? ListenVehicleNameResultVC {

            resultVC.levelNumber = self.levelNumber   // 👈 IMPORTANT

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
            .appendingPathComponent("ListenVehicleName.pdf")

        let pageWidth: CGFloat = 595
        let pageHeight: CGFloat = 842

        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(
                x: 0,
                y: 0,
                width: pageWidth,
                height: pageHeight
            )
        )

        do {

            try renderer.writePDF(to: pdfURL) { context in

                // MARK: - PDF Settings

                let marginX: CGFloat = 35
                let topMargin: CGFloat = 90

                let cardWidth: CGFloat = 250
                let cardHeight: CGFloat = 175

                let horizontalSpacing: CGFloat = 25
                let verticalSpacing: CGFloat = 25

                let imageAreaHeight: CGFloat = 120
                let barHeight: CGFloat = 45

                let columns = 2

                var currentColumn = 0
                var currentRow = 0

                // MARK: - Start First Page

                context.beginPage()

                // MARK: - Title

                let title = "Listen Vehicle Name"

                let titleAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 28),
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

                // MARK: - Helper: Aspect Fit Image

                func aspectFitRect(
                    imageSize: CGSize,
                    inside rect: CGRect
                ) -> CGRect {

                    guard imageSize.width > 0 && imageSize.height > 0 else {
                        return rect
                    }

                    let widthRatio = rect.width / imageSize.width
                    let heightRatio = rect.height / imageSize.height

                    let scale = min(widthRatio, heightRatio)

                    let newWidth = imageSize.width * scale
                    let newHeight = imageSize.height * scale

                    return CGRect(
                        x: rect.midX - newWidth / 2,
                        y: rect.midY - newHeight / 2,
                        width: newWidth,
                        height: newHeight
                    )
                }

                // MARK: - Draw Cards

                for (index, item) in planets.enumerated() {

                    // Calculate position

                    let x = marginX +
                        CGFloat(currentColumn) *
                        (cardWidth + horizontalSpacing)

                    let y = topMargin +
                        CGFloat(currentRow) *
                        (cardHeight + verticalSpacing)

                    let cardRect = CGRect(
                        x: x,
                        y: y,
                        width: cardWidth,
                        height: cardHeight
                    )

                    // MARK: - Card Background

                    let cardPath = UIBezierPath(
                        roundedRect: cardRect,
                        cornerRadius: 12
                    )

                    UIColor.white.setFill()
                    cardPath.fill()

                    UIColor.lightGray.setStroke()
                    cardPath.lineWidth = 1
                    cardPath.stroke()

                    // MARK: - Image Area

                    let imageArea = CGRect(
                        x: cardRect.minX + 15,
                        y: cardRect.minY + 8,
                        width: cardRect.width - 30,
                        height: imageAreaHeight
                    )

                    if let image = UIImage(named: item.imageName) {

                        // Preserve original image ratio
                        let imageRect = aspectFitRect(
                            imageSize: image.size,
                            inside: imageArea
                        )

                        image.draw(in: imageRect)
                    }

                    // MARK: - Bottom Color Bar

                    let barRect = CGRect(
                        x: cardRect.minX,
                        y: cardRect.maxY - barHeight,
                        width: cardRect.width,
                        height: barHeight
                    )

                    let barPath = UIBezierPath(
                        roundedRect: barRect,
                        byRoundingCorners: [.bottomLeft, .bottomRight],
                        cornerRadii: CGSize(width: 12, height: 12)
                    )

                    ColorManager.randomColor().setFill()
                    barPath.fill()

                    // MARK: - Vehicle Name

                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.alignment = .center
                    paragraphStyle.lineBreakMode = .byWordWrapping

                    let textAttributes: [NSAttributedString.Key: Any] = [
                        .font: UIFont.boldSystemFont(ofSize: 15),
                        .foregroundColor: UIColor.black,
                        .paragraphStyle: paragraphStyle
                    ]

                    let textRect = CGRect(
                        x: barRect.minX + 8,
                        y: barRect.minY + 5,
                        width: barRect.width - 16,
                        height: barRect.height - 10
                    )

                    (item.text as NSString).draw(
                        in: textRect,
                        withAttributes: textAttributes
                    )

                    // MARK: - Next Card Position

                    currentColumn += 1

                    if currentColumn >= columns {

                        currentColumn = 0
                        currentRow += 1
                    }

                    // MARK: - New Page

                    if currentRow >= 3 && index < planets.count - 1 {

                        context.beginPage()

                        // Reset position
                        currentColumn = 0
                        currentRow = 0
                    }
                }
            }

            return pdfURL

        } catch {

            print("PDF Error: \(error)")
            return nil
        }
    }
    
    
    @IBAction func repeatTapBtn(_ sender: UIButton) {
        speak(text: planets[currentIndex].text)
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
 
}
