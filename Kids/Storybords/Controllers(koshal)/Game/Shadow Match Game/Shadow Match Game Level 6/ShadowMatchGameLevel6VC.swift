//
//  ShadowMatchGameLevel6VC.swift
//  Kids
//
//  Created by Koshal Singh on 22/01/26.
//

import UIKit
import LanguageManager_iOS

class ShadowMatchGameLevel6VC: BaseViewController {

    @IBOutlet weak var dropImageView: UIImageView!
    @IBOutlet weak var dropImageBGView: UIView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!

    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!

    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var rightOrWrongImg: UIImageView!
    @IBOutlet weak var scoreBGView: UIView!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var score = 0

    // MARK: - Game Data
    let animals = [
        (name: "whale", tag: 1),
        (name: "strawberry", tag: 2),
        (name: "dumpTruck", tag: 3),
        (name: "fries", tag: 4),
        (name: "dog", tag: 5),
        (name: "banana", tag: 6),
        (name: "busLane", tag: 7),
        (name: "candies", tag: 8),
        (name: "shark", tag: 9),
        (name: "pineapple", tag: 10),
        (name: "ambulance", tag: 11),
        (name: "monkey", tag: 12),
        (name: "helicopter", tag: 13),
        (name: "mango", tag: 14),
        (name: "almond", tag: 15),
        (name: "cat2", tag: 16),
        (name: "bicycle", tag: 17),
        (name: "lemon", tag: 18),
        (name: "parrot", tag: 19),
        (name: "car", tag: 20),
        (name: "snack", tag: 21),
        (name: "apple", tag: 22),
        (name: "zebra", tag: 23),
        (name: "orange", tag: 24),
        (name: "deliver", tag: 25),
        (name: "grapes", tag: 26),
        (name: "tiger", tag: 27),
        (name: "boat", tag: 28),
        (name: "nature", tag: 29),
        (name: "lion", tag: 30),
        (name: "chocolate-bar", tag: 31),
        (name: "goat", tag: 32),
        (name: "watermelon", tag: 33),
        (name: "fireBrigade", tag: 34)
    ]
    
    var usedAnimals: [(name: String, tag: Int)] = []
    var currentQuestion = 1
    let totalQuestions = 10
    
    var originalCenters: [UIImageView: CGPoint] = [:]
    
    var originalImages: [UIImageView: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        
        dropImageBGView.layer.cornerRadius = 10
        scoreBGView.layer.cornerRadius = 10
       
        questionLabel.text = "\("Question".localiz()) \(currentQuestion)"
        scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestion)"

        nextBtn.isHidden = true

        setupDragDrop()
        loadRandomShadow()

        [img1, img2, img3, img4].forEach { img in
            guard let img = img else { return }
            img.isUserInteractionEnabled = true
            originalCenters[img] = img.center
            originalImages[img] = img.image

            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            img.addGestureRecognizer(pan)
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
        nextBtn.backgroundColor = color
        nextBtn.layer.cornerRadius = 6
    }

       // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func resetAllImagesWithRandom() {

        var shuffledAnimals = animals.shuffled().prefix(4)
        let imageViews = [img1, img2, img3, img4]

        for (imgView, animal) in zip(imageViews, shuffledAnimals) {
            guard let imgView = imgView else { continue }
            imgView.image = UIImage(named: animal.name)
            imgView.tag = animal.tag
            imgView.isHidden = false
        }
    }

    // MARK: - Setup Images
    func setupImages() {
        img1.image = UIImage(named: "apple")
        img2.image = UIImage(named: "avocado")
        img3.image = UIImage(named: "strawberry")
        img4.image = UIImage(named: "lemon")

        img1.tag = 1
        img2.tag = 2
        img3.tag = 3
        img4.tag = 4
    }

    // MARK: - Drag & Drop Setup
    func setupDragDrop() {

        [img1, img2, img3, img4].forEach { img in
            img?.isUserInteractionEnabled = true
            img?.addInteraction(UIDragInteraction(delegate: self))
        }

        dropImageView.isUserInteractionEnabled = true
        dropImageView.contentMode = .scaleAspectFit
        dropImageView.backgroundColor = .clear
        dropImageView.addInteraction(UIDropInteraction(delegate: self))
    }

    // MARK: - Load Random Shadow
    func loadRandomShadow() {

        if currentQuestion > totalQuestions {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ShadowMatchGameLevel6ResultVC"
            ) as! ShadowMatchGameLevel6ResultVC

            vc.finalScore = score

            navigationController?.pushViewController(vc, animated: false)

            return
        }

        var remainingAnimals = animals.filter { animal in
            !usedAnimals.contains { $0.tag == animal.tag }
        }

        if remainingAnimals.isEmpty {
            remainingAnimals = animals
            usedAnimals.removeAll()
        }

        let correctAnimal = remainingAnimals.randomElement()!
        usedAnimals.append(correctAnimal)

        if let image = UIImage(named: correctAnimal.name) {
            dropImageView.image = makeShadowImage(from: image)
            dropImageView.tag = correctAnimal.tag
        }

        setupFourOptions(correct: correctAnimal)
    }
    
    func setupFourOptions(correct: (name: String, tag: Int)) {

        var options = animals.filter { $0.tag != correct.tag }
        options.shuffle()
        options = Array(options.prefix(3))
        options.append(correct)
        options.shuffle()

        let imageViews = [img1, img2, img3, img4]

        for i in 0..<4 {
            imageViews[i]?.image = UIImage(named: options[i].name)
            imageViews[i]?.tag = options[i].tag
            imageViews[i]?.isHidden = false
            if let imgView = imageViews[i] {
                originalImages[imgView] = imgView.image
            }
        }
    }
    

    func setAllImagesInteraction(_ enabled: Bool) {
        [img1, img2, img3, img4].forEach {
            $0?.isUserInteractionEnabled = enabled
        }
    }
    
    // MARK: - Make Shadow Image
    func makeShadowImage(from image: UIImage) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: image.size)

        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: image.size)
            image.draw(in: rect)

            context.cgContext.setBlendMode(.sourceAtop)
            context.cgContext.setFillColor(UIColor.black.cgColor)
            context.cgContext.fill(rect)
        }
    }
    
    func makeBlurImage(from image: UIImage) -> UIImage {

        guard let ciImage = CIImage(image: image),
              let filter = CIFilter(name: "CIGaussianBlur") else {
            return image
        }

        filter.setValue(ciImage, forKey: kCIInputImageKey)
        filter.setValue(8.0, forKey: kCIInputRadiusKey)

        let context = CIContext()
        guard let outputImage = filter.outputImage,
              let cgImage = context.createCGImage(
                  outputImage,
                  from: ciImage.extent
              ) else {
            return image
        }

        return UIImage(cgImage: cgImage)
    }
    
    
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let imageView = gesture.view as? UIImageView else { return }

        let translation = gesture.translation(in: view)

        switch gesture.state {

        case .changed:
            imageView.center = CGPoint(
                x: imageView.center.x + translation.x,
                y: imageView.center.y + translation.y
            )
            gesture.setTranslation(.zero, in: view)

        case .ended:
            handleDrop(imageView)

        default:
            break
        }
    }
    
    func handleDrop(_ imageView: UIImageView) {

        // dragged image ka frame → main view me
        let imageFrame = imageView.superview?.convert(imageView.frame, to: view) ?? imageView.frame

        // ✅ dropImageBGView ka frame → main view me
        let dropFrame = dropImageBGView.convert(dropImageBGView.bounds, to: view)

        // thoda forgiving area
        let expandedDropFrame = dropFrame.insetBy(dx: -40, dy: -40)

        let didDrop = expandedDropFrame.intersects(imageFrame)

        if didDrop {

            setAllImagesInteraction(false)
            nextBtn.isHidden = false

            if imageView.tag == dropImageView.tag {

                rightOrWrongImg.image = UIImage(named: "check mark")
                score += 1
                
                scoreLabel.text = "\("Score".localiz()): \(score) / \(currentQuestion)"

                dropImageView.image = imageView.image
                imageView.isHidden = true

            } else {
                rightOrWrongImg.image = UIImage(named: "close")
            }

            if let point = originalCenters[imageView] {
                UIView.animate(withDuration: 0.3) {
                    imageView.center = point
                }
            }

        } else {
            if let point = originalCenters[imageView] {
                UIView.animate(withDuration: 0.3) {
                    imageView.center = point
                }
            }
        }
    }
    
    // MARK: - Next Button
    @IBAction func nextTapBtn(_ sender: UIButton) {

        currentQuestion += 1
        questionLabel.text = "\("Question".localiz()) \(currentQuestion)"
        

        nextBtn.isHidden = true
        rightOrWrongImg.image = nil
        setAllImagesInteraction(true)

        [img1, img2, img3, img4].forEach { img in
            guard let img = img else { return }
            if let point = originalCenters[img] {
                img.center = point
            }
            img.isHidden = false
        }

        loadRandomShadow()
    }
}

// MARK: - Drag Delegate
extension ShadowMatchGameLevel6VC: UIDragInteractionDelegate {

    func dragInteraction(_ interaction: UIDragInteraction,
                         itemsForBeginning session: UIDragSession) -> [UIDragItem] {

        guard let imageView = interaction.view as? UIImageView,
              let image = imageView.image,
              !nextBtn.isHidden else { return [] }

        let item = UIDragItem(itemProvider: NSItemProvider(object: image))
        item.localObject = imageView
        return [item]
    }

    func dragInteraction(_ interaction: UIDragInteraction,
                         previewForLifting item: UIDragItem,
                         session: UIDragSession) -> UITargetedDragPreview? {

        guard let imageView = interaction.view as? UIImageView,
              let image = imageView.image else { return nil }

        let blurImage = makeBlurImage(from: image)
        let previewView = UIImageView(image: blurImage)
        previewView.contentMode = .scaleAspectFit

        let parameters = UIDragPreviewParameters()
        parameters.backgroundColor = .clear

        return UITargetedDragPreview(view: previewView, parameters: parameters)
    }
}

extension ShadowMatchGameLevel6VC: UIDropInteractionDelegate {

    func dropInteraction(_ interaction: UIDropInteraction,
                         canHandle session: UIDropSession) -> Bool {
        return nextBtn.isHidden
    }

    func dropInteraction(_ interaction: UIDropInteraction,
                         performDrop session: UIDropSession) {

        guard let sourceImageView =
                session.items.first?.localObject as? UIImageView else { return }

        nextBtn.isHidden = false
        setAllImagesInteraction(false)

        if sourceImageView.tag == dropImageView.tag {
            score += 1
            
            scoreLabel.text = "\("Score".localiz()): \(score)"
            rightOrWrongImg.image = UIImage(named: "check mark")
            dropImageView.image = sourceImageView.image
        } else {
            rightOrWrongImg.image = UIImage(named: "close")
        }
    }
}

