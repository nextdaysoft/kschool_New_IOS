//
//  FindPairLevel2VC.swift
//  Find Pair
//
//  Created by Koshal Singh on 29/12/25.
//

import UIKit

class FindPairLevel2VC: BaseViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var numberLale: UILabel!
    @IBOutlet weak var countBGView: UIView!

    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var cardViews: [UIView]!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
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
        numberLale.text = "0"

        countBGView.layer.cornerRadius = 10
        countBGView.backgroundColor = ColorManager.randomColor()
        countBGView.layer.borderColor = UIColor.black.cgColor

        cardViews.forEach {
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }

        setupGameImages()

        imageViews.forEach { $0.image = nil }

       
        for (index, btn) in buttons.enumerated() {
            btn.tag = index
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
    
    func isGameCompleted() -> Bool {
        return buttons.allSatisfy { !$0.isEnabled }
    }

    func setupGameImages() {
        gameImages.removeAll()

        // 🔥 12 unique images → 24 cards
        let selectedTwelve = Array(fruitVegPool.shuffled().prefix(12))

        selectedTwelve.forEach {
            gameImages.append($0)
            gameImages.append($0)
        }

        gameImages.shuffle()
    }

    func flipCardToFront(index: Int) {
        UIView.transition(
            with: cardViews[index],
            duration: 0.5,
            options: .transitionFlipFromRight,
            animations: {
                self.imageViews[index].image = self.gameImages[index]
            }
        )
    }

    func flipCardToBack(index: Int) {
        UIView.transition(
            with: cardViews[index],
            duration: 0.5,
            options: .transitionFlipFromLeft,
            animations: {
                self.imageViews[index].image = nil
            }
        )
    }

    func levelCompleted() {

        // 🔐 SAVE FIND PAIR LEVEL 2 COMPLETION
        UserDefaults.standard.set(true, forKey: "findPairLevel2Completed")

        if let menuVC = navigationController?.viewControllers.first(
            where: { $0 is FindPairLevelsMenu }
        ) as? FindPairLevelsMenu {

            menuVC.level2Completed = true
        }

        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        clickCount += 1
        numberLale.text = "\(clickCount)"

        let index = sender.tag
        guard index < gameImages.count else { return }

        flipCardToFront(index: index)
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

                self.flipCardToBack(index: previousIndex)
                self.flipCardToBack(index: index)

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
