//
//  LearnColorsShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 31/03/26.
//

import UIKit
import AVFoundation
import LanguageManager_iOS

class LearnColorsShowVC: BaseViewController,AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var imgBGView: UIView!
   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var repeatBtn: UIButton!
    
    @IBOutlet weak var allViewDrop: UIView!
    
    @IBOutlet weak var LevelLabel: UILabel!
    
    var colors: [LearnColorItem] = []
    
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
        
        colors.shuffle()
        
        LevelLabel.text = String(
            format: "# Level %d".localiz(),
            levelNumber
        )
        
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
        label.text = "Swipe up to change color".localiz()
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

        let currentItem = colors[currentIndex]

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

            // ✅ Last item check
            if self.currentIndex >= self.colors.count {
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

        // jo cards already dekh liye unko same rakho
        let viewedColors = Array(colors.prefix(currentIndex + 1))

        // jo remaining hai unko random kar do
        var remainingColors = Array(colors.dropFirst(currentIndex + 1))
        remainingColors.shuffle()

        // final array
        colors = viewedColors + remainingColors

        imgBGView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        imgBGView.alpha = 0

        updateUI()

        UIView.animate(withDuration: 0.3) {
            self.imgBGView.transform = .identity
            self.imgBGView.alpha = 1
        }
    }
    
    func addCardToDropView(with item: LearnColorItem) {

        // ✅ Smaller size like screenshot
        let cardWidth: CGFloat = 150
        let cardHeight: CGFloat = 140

        let x = (allViewDrop.bounds.width - cardWidth) / 2
        let y = (allViewDrop.bounds.height - cardHeight) / 2

        let smallCard = UIView(
            frame: CGRect(
                x: x,
                y: y,
                width: cardWidth,
                height: cardHeight
            )
        )

        // ✅ Clean white card
        smallCard.backgroundColor = .white

        // ✅ Soft corner
      //  smallCard.layer.cornerRadius = 16

        // ❌ Remove border completely
      //  smallCard.layer.borderWidth = 3

        // ✅ Soft beige border like screenshot
        smallCard.backgroundColor = .white
        smallCard.layer.cornerRadius = 16
        smallCard.layer.borderWidth = 5
        smallCard.layer.borderColor =
            ColorManager.randomColor()
                .withAlphaComponent(1)
                .cgColor

        smallCard.clipsToBounds = true
        smallCard.clipsToBounds = true

        // ✅ Tag
        smallCard.tag = currentIndex

        let pan = UIPanGestureRecognizer(
            target: self,
            action: #selector(handleSmallCardPan(_:))
        )

        smallCard.addGestureRecognizer(pan)
        smallCard.isUserInteractionEnabled = true

        // ✅ Slight rotation like screenshot
        smallCard.transform =
            CGAffineTransform(rotationAngle: CGFloat.random(in: -0.12...0.12))

        // ✅ Small color box
        let colorView = UIView(
            frame: CGRect(
                x: 22,                  // ✅ width thodi kam
                y: 16,
                width: cardWidth - 44, // ✅ side spacing zyada
                height: 72             // ✅ height thodi badi
            )
        )

        colorView.backgroundColor = item.color

        // ✅ Soft corners
      //  colorView.layer.cornerRadius = 4

        colorView.backgroundColor = item.color
        //colorView.layer.cornerRadius = 6

        // ✅ Label
        let titleLabel = UILabel(
            frame: CGRect(
                x: 5,
                y: 92,                 // ✅ niche kiya
                width: cardWidth - 10,
                height: 24
            )
        )

        titleLabel.text = item.name
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        titleLabel.textColor = .darkGray

        smallCard.addSubview(colorView)
        smallCard.addSubview(titleLabel)

        allViewDrop.addSubview(smallCard)
        allViewDrop.bringSubviewToFront(smallCard)
    }
    
    
    func updateUI() {

        guard currentIndex < colors.count else { return }

        let item = colors[currentIndex]

        // ✅ Text
        label.text = item.name

        // ✅ Background color (MAIN CHANGE)
        imgBGView.backgroundColor = item.color

        // Optional styling
        imgBGView.layer.cornerRadius = 20
        imgBGView.layer.borderWidth = 0   // remove border

        // Text styling
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 28, weight: .regular)

        speak(text: item.name)
    }
    
    func showIntroScreen() {

        // ✅ colors use karo
        let introItem = colors[0]

        // ✅ text
        label.text = introItem.name

        // ✅ background color (IMPORTANT)
        imgBGView.backgroundColor = introItem.color

        // 🎨 optional styling
        imgBGView.layer.cornerRadius = 20
        imgBGView.layer.borderWidth = 0

        // 🔇 Audio disable
        speechSynthesizer.stopSpeaking(at: .immediate)

        // 🚫 Swipe disable
        imgBGView.isUserInteractionEnabled = false

        // ⏱ 2 sec baad start
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.startMainFlow()
        }
    }
    func startMainFlow() {
        currentIndex = 1
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

            if self.currentIndex < self.colors.count {

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
            withIdentifier: "LearnColorsResultVC"
        ) as? LearnColorsResultVC {

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
    
    
    @IBAction func repeatTapBtn(_ sender: UIButton) {
        speak(text: colors[currentIndex].name)
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
 
}
