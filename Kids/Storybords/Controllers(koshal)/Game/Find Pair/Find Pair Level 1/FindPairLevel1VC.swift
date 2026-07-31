//
//  FindPairLevel1VC.swift
//  Find Pair
//
//  Created by Koshal Singh on 16/01/26.
//

import UIKit

class FindPairLevel1VC: BaseViewController {

    @IBOutlet weak var numberLale: UILabel!

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var img10: UIImageView!
    @IBOutlet weak var img11: UIImageView!
    @IBOutlet weak var img12: UIImageView!

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: UIView!

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var countBGView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var backBtn: UIButton!
    
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    var imageViews: [UIImageView] = []
    var cardViews: [UIView] = []
    var gameImages: [UIImage] = []

    var firstIndex: Int?
    var clickCount = 0

    let fruitVegNames = [
        "apple","avocado","banana","carrot","cooking","mango",
        "grapes","lemon","orange","pineapple","strawberry","watermelon"
    ]

    lazy var fruitVegPool: [UIImage] = {
        fruitVegNames.compactMap { UIImage(named: $0) }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        nextBtn.isHidden = true  

        countBGView.layer.cornerRadius = 10
        countBGView.backgroundColor = ColorManager.randomColor()
        countBGView.layer.borderColor = UIColor.black.cgColor
        
        imageViews = [
            img1,img2,img3,img4,img5,img6,
            img7,img8,img9,img10,img11,img12
        ]

        cardViews = [
            view1,view2,view3,view4,view5,view6,
            view7,view8,view9,view10,view11,view12
        ]

        for v in cardViews {
            v.layer.cornerRadius = 12
            v.layer.masksToBounds = true
        }

        numberLale.text = "0"

        setupGameImages()

        for img in imageViews {
            img.image = nil
        }
    }

    // MARK: Function
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
    
    func isGameCompleted() -> Bool {
        return buttons.allSatisfy { !$0.isEnabled }
    }

    func setupGameImages() {
        gameImages.removeAll()
        let selectedSix = Array(fruitVegPool.shuffled().prefix(6))
        selectedSix.forEach {
            gameImages.append($0)
            gameImages.append($0)
        }
        gameImages.shuffle()
    }

    func flipCardToFront(cardView: UIView, imageView: UIImageView, image: UIImage) {
        UIView.transition(
            with: cardView,
            duration: 0.5,
            options: .transitionFlipFromRight,
            animations: { imageView.image = image }
        )
    }

    func flipCardToBack(cardView: UIView, imageView: UIImageView) {
        UIView.transition(
            with: cardView,
            duration: 0.5,
            options: .transitionFlipFromLeft,
            animations: { imageView.image = nil }
        )
    }
   
    func levelCompleted() {

        // 🔐 SAVE LEVEL 1 COMPLETION
        UserDefaults.standard.set(true, forKey: "findPairLevel1Completed")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is FindPairLevelsMenu }
        ) as? FindPairLevelsMenu {

            menuVC.level1Completed = true
        }

        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {

        clickCount += 1
        numberLale.text = "\(clickCount)"

        let index = sender.tag
        guard index < gameImages.count else { return }

        flipCardToFront(
            cardView: cardViews[index],
            imageView: imageViews[index],
            image: gameImages[index]
        )

        sender.isEnabled = false

        if firstIndex == nil {
            firstIndex = index
            return
        }

        let previousIndex = firstIndex!

        if gameImages[previousIndex] == gameImages[index] {
            firstIndex = nil

            
            if isGameCompleted() {
                nextBtn.isHidden = false
            }

        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {

                self.flipCardToBack(
                    cardView: self.cardViews[previousIndex],
                    imageView: self.imageViews[previousIndex]
                )

                self.flipCardToBack(
                    cardView: self.cardViews[index],
                    imageView: self.imageViews[index]
                )

                self.buttons[previousIndex].isEnabled = true
                self.buttons[index].isEnabled = true
            }
            firstIndex = nil
        }
    }

    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        levelCompleted()
    }
}
