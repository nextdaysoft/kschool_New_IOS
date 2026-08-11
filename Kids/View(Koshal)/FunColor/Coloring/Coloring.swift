//
//  Coloring.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 21/01/26.
//

import UIKit
import LanguageManager_iOS

class Coloring: BaseViewController {
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var purple: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var pink: UIButton!
    @IBOutlet weak var brown: UIButton!
    @IBOutlet weak var orange: UIButton!
    @IBOutlet weak var jobLbl: UILabel!
    @IBOutlet weak var jobLblView: UIView!
    @IBOutlet weak var mainJobbgView: UIView!
    @IBOutlet weak var HbtnView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var paintImageView: PaintImageView!
    // MARK: Variable
    var coloringItem = ""
    var coloringItems: [ColoringItem] = []// list of image names
    var currentIndex: Int = 0
    var Htitle: String = ""
    
    
    var onColoringFinished: ((UIImage?) -> Void)?
    
    private var colorButtons: [UIButton] {
        return [red, orange, yellow, green, blue, purple, pink, brown]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        
        paintImageView.contentMode = .scaleAspectFit
        if !coloringItems.isEmpty {
            
            titleLabel.text = coloringItems[currentIndex].title
            
            paintImageView.image = UIImage(
                named: coloringItems[currentIndex].coloringImageName
            )
        }
        // Do any additional setup after loading the view.

        [red, yellow, orange, pink, blue, brown, green, purple].forEach { button in
            button?.layer.cornerRadius = 10
            button?.clipsToBounds = true
            button?.backgroundColor = button?.backgroundColor ?? .systemGray // 👈 ADD THIS
        }
        
        // ✅ IMPORTANT (ye missing hai)
        paintImageView.calculateInitialWhitePixels()
        paintImageView.onColoringCompleted = { [weak self] in
            guard let self = self else { return }

            self.nextBtn.isHidden = false
            self.jobLblView.isHidden = false
            self.jobLbl.text = "Good Job!".localiz()
        }
        
        DispatchQueue.main.async {
            self.selectDefaultColor()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        colorButtons.forEach { button in
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
        }
    }
    
    // MARK: Function
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        titleLabel.text = Htitle
        nextBtn.layer.cornerRadius = 5
        jobLblView.backgroundColor = ColorManager.randomColor()
        jobLblView.layer.cornerRadius = 8
        jobLblView.isHidden = true
        nextBtn.isHidden = true
        mainJobbgView.backgroundColor = .clear
        HbtnView.backgroundColor = .clear
        [red,yellow,orange,pink,blue,brown,green,purple].forEach { uiButton in
            uiButton?.layer.cornerRadius = 10
        }
        
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white

            jobLblView.backgroundColor = .white
            jobLbl.textColor = .black

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color

            jobLblView.backgroundColor = ColorManager.randomColor()
            jobLbl.textColor = .white
        }
    }
    
    private func resetColorSelection() {
        for button in colorButtons {
            button.layer.borderWidth = 0
            button.layer.borderColor = UIColor.clear.cgColor
            
            // 👇 size normal
            button.transform = .identity
        }
    }
  
    func selectDefaultColor() {
        
        let defaultIndex = 0 // 🔴 red button (tag = 0)

        let colors: [UIColor] = [
            .systemRed,
            .systemOrange,
            .systemYellow,
            .systemGreen,
            .systemBlue,
            .systemPurple,
            .systemPink,
            .systemBrown
        ]

        guard defaultIndex < colorButtons.count else { return }

        let defaultButton = colorButtons[defaultIndex]

        // 🎨 default color set
        paintImageView.fillColor = colors[defaultIndex]

        // reset sab
        resetColorSelection()

        // ⭐ highlight
        defaultButton.layer.borderWidth = 3
        defaultButton.layer.borderColor = UIColor.black.cgColor

        // ⭐ width increase (same as click)
        defaultButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.0)
    }
    
    // MARK: Action
    @IBAction func colorButtonTapped(_ sender: UIButton) {

        let colors: [UIColor] = [
            .systemRed,
            .systemOrange,
            .systemYellow,
            .systemGreen,
            .systemBlue,
            .systemPurple,
            .systemPink,
            .systemBrown
        ]

        let index = sender.tag
        guard index < colors.count else { return }

        paintImageView.fillColor = colors[index]

        resetColorSelection()

        // ⭐ border highlight
        sender.layer.borderWidth = 3
        sender.layer.borderColor = UIColor.black.cgColor

        // ⭐ size increase (STACK FRIENDLY)
        UIView.animate(withDuration: 0.2) {
               sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.0)
           }
        print("Selected color:", colors[index])
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {

        // ✅ done image
        let doneImage = UIImage(named: "done")

        // save completion callback
        onColoringFinished?(doneImage)

        // Free users → only first 4
        let maxAllowedIndex: Int

        if SubscriptionManager.shared.isSubscribed() {
            maxAllowedIndex = coloringItems.count - 1
        } else {
            maxAllowedIndex = 3   // index 0,1,2,3 = first 4
        }

        // next available item
        if currentIndex < maxAllowedIndex {

            currentIndex += 1

            let nextItem = coloringItems[currentIndex]

            // load next image
            paintImageView.image = UIImage(
                named: nextItem.coloringImageName
            )

            // title
            titleLabel.text = nextItem.title

            // reset UI
            nextBtn.isHidden = true
            jobLblView.isHidden = true

            // reset fill
            paintImageView.resetColoring()

            // recalculate pixels
            paintImageView.calculateInitialWhitePixels()

        } else {

            // ✅ free user reached limit
            // subscription screen nahi, back
            navigationController?.popViewController(
                animated: true
            )
        }
    }

}
