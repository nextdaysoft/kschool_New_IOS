//
//  VitaminsSourcesVC.swift
//  New
//
//  Created by Koshal Singh on 08/04/26.
//

import UIKit
import AVFoundation

class VitaminsSourcesVC: BaseViewController {

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
    
    
    @IBOutlet weak var pdfBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titalLabel: UILabel!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    
    
    var speechSynthesizer = AVSpeechSynthesizer()

    var selectedIndex: Int = 0
    
    let allSources: [VitaminSource] = [

        VitaminSource(
            title: "Vitamin A Sources",
            items: [
                BodyPart(name: "Carrot", image: "carrot"),
                BodyPart(name: "Sweet Potato", image: "sweetPotato"),
                BodyPart(name: "Spinach", image: "spinach"),
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Milk", image: "milk"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Mango", image: "mango"),
                BodyPart(name: "Pumpkin", image: "pumpkin"),
                BodyPart(name: "Yam", image: "yam"),
                BodyPart(name: "Papaya", image: "papaya"),
                BodyPart(name: "Apricot", image: "apricot")
            ]
        ),

        VitaminSource(
            title: "Vitamin B1 Sources",
            items: [
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Rice", image: "rice"),
                BodyPart(name: "Wheat", image: "vitaminB1"),
                BodyPart(name: "Beans", image: "french_beans"),
                BodyPart(name: "Peanuts", image: "peanuts"),
                BodyPart(name: "Corn", image: "corn"),
                BodyPart(name: "Oats", image: "oats"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Yeast", image: "yeast"),
                BodyPart(name: "Beans", image: "greenPeas")
                
            ]
        ),
        
        VitaminSource(
            title: "Vitamin B2 Sources",
            items: [
                BodyPart(name: "Milk", image: "milk"),
                BodyPart(name: "Egg", image: "rice"),
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Spinach", image: "spinach"),
                BodyPart(name: "Broccoli", image: "broccoli"),
                BodyPart(name: "Almond", image: "almond"),
                BodyPart(name: "Mushroom", image: "mushroom")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin B3 Sources",
            items: [
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Fish", image: "clown-fish"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Peanuts", image: "peanuts"),
                BodyPart(name: "Wheat", image: "vitaminB1"),
                BodyPart(name: "Mushroom", image: "mushroom"),
                BodyPart(name: "Rice", image: "rice")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin B5 Sources",
            items: [
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Fish", image: "clown-fish"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Broccoli", image: "broccoli"),
                BodyPart(name: "Wheat", image: "vitaminB1"),
                BodyPart(name: "Rice", image: "rice"),
                BodyPart(name: "Oats", image: "oats"),
                BodyPart(name: "Peanuts", image: "peanuts"),
                BodyPart(name: "Avocado", image: "avocado"),
                BodyPart(name: "Sunflower Seeds", image: "vitaminE")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin B6 Sources",
            items: [
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Fish", image: "clown-fish"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Wheat", image: "vitaminB1"),
                BodyPart(name: "Rice", image: "rice"),
                BodyPart(name: "Oats", image: "oats"),
                BodyPart(name: "Banana", image: "banana"),
                BodyPart(name: "Potato", image: "potato"),
                BodyPart(name: "Avocado", image: "avocado"),
                BodyPart(name: "Spinach", image: "spinach"),
                BodyPart(name: "Broccoli", image: "broccoli"),
                BodyPart(name: "Peanuts", image: "peanuts"),
                BodyPart(name: "Sunflower Seeds", image: "vitaminE"),
                BodyPart(name: "Beans", image: "greenPeas"),
                BodyPart(name: "Chickpeas", image: "green_chickpeas")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin B7 Sources",
            items: [
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Milk", image: "milk"),
                BodyPart(name: "Fish", image: "clown-fish"),
                BodyPart(name: "Sunflower Seeds", image: "vitaminE"),
                BodyPart(name: "Almond", image: "almond"),
                BodyPart(name: "Soybean", image: "soyabean"),
                BodyPart(name: "Peanuts", image: "peanuts"),
                BodyPart(name: "Pea", image: "greenPeas"),
                BodyPart(name: "Spinach", image: "spinach"),
                BodyPart(name: "Broccoli", image: "broccoli"),
                BodyPart(name: "Sweet Potato", image: "sweetPotato"),
                BodyPart(name: "Banana", image: "banana")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin B9 Sources",
            items: [
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Spinach", image: "spinach"),
                BodyPart(name: "Broccoli", image: "broccoli"),
                BodyPart(name: "Orange", image: "orange"),
                BodyPart(name: "Beans", image: "french_beans"),
                BodyPart(name: "Chickpeas", image: "green_chickpeas"),
                BodyPart(name: "Avocado", image: "avocado"),
                BodyPart(name: "Peas", image: "greenPeas")
            
            ]
        ),
        
        VitaminSource(
            title: "Vitamin B12 Sources",
            items: [
                BodyPart(name: "Fish", image: "clown-fish"),
                BodyPart(name: "Meat", image: "vitaminB3"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Milk", image: "milk")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin C Sources",
            items: [
                BodyPart(name: "Orange", image: "orange"),
                BodyPart(name: "Lemon", image: "lemon"),
                BodyPart(name: "Guava", image: "guava"),
                BodyPart(name: "Tomato", image: "tomato"),
                BodyPart(name: "Tomato", image: "tomato"),
                BodyPart(name: "Papaya", image: "papaya"),
                BodyPart(name: "Capsicum", image: "capsicum"),
                BodyPart(name: "Strawberry", image: "strawberry")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin D Sources",
            items: [
                BodyPart(name: "Sunlight", image: "sun"),
                BodyPart(name: "Fish", image: "clown-fish"),
                BodyPart(name: "Egg", image: "vitaminB7"),
                BodyPart(name: "Milk", image: "milk"),
                BodyPart(name: "Mushroom", image: "mushroom")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin E Sources",
            items: [
                BodyPart(name: "Almond", image: "almond"),
                BodyPart(name: "Sunflower Seeds", image: "vitaminE"),
                BodyPart(name: "Spinach", image: "spinach"),
                BodyPart(name: "Vegetable Oil", image: "vegetable-oil"),
                BodyPart(name: "Avocado", image: "avocado"),
                BodyPart(name: "Broccoli", image: "broccoli")
            ]
        ),
        
        VitaminSource(
            title: "Vitamin K Sources",
            items: [
                BodyPart(name: "Spinach", image: "spinach"),
                BodyPart(name: "Broccoli", image: "broccoli"),
                BodyPart(name: "Cabbage", image: "cabbage"),
                BodyPart(name: "Lettuce", image: "lettuce"),
                BodyPart(name: "Soybean", image: "soyabean")
            ]
        ),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

       
        let data = allSources[selectedIndex]
        
        titalLabel.text = data.title
        
        
        let allBGViews = [
            viewBG1, viewBG2, viewBG3, viewBG4,
            viewBG5, viewBG6, viewBG7, viewBG8,
            viewBG9, viewBG10, viewBG11, viewBG12,
            viewBG13, viewBG14, viewBG15, viewBG16
        ]
        
        let allBGViewscornerRadius: [UIView] = [
            viewBG1, viewBG2, viewBG3, viewBG4,
            viewBG5, viewBG6, viewBG7, viewBG8,
            viewBG9, viewBG10, viewBG11, viewBG12,
            viewBG13, viewBG14, viewBG15, viewBG16

        ]
        
        allBGViewscornerRadius.forEach {
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
        }
        
        let allLabels = [
            label1,label2,label3,label4,label5,label6,label7,label8,
            label9,label10,label11,label12,label13,label14,label15,label16
        ]
        
        let allImages = [
            imageView1,imageView2,imageView3,imageView4,imageView5,imageView6,imageView7,imageView8,
            imageView9,imageView10,imageView11,imageView12,imageView13,imageView14,imageView15,imageView16
        ]
        
        // 👉 Sab hide
        for view in allBGViews {
            view?.isHidden = true
            view?.alpha = 1   // reset
        }

        let count = data.items.count

        // 👉 Data show
        for i in 0..<count {
            allBGViews[i]?.isHidden = false
            allLabels[i]?.text = data.items[i].name
            allImages[i]?.image = UIImage(named: data.items[i].image)
        }

        // 👉 FIX: Agar odd number hai (11, 13...)
        if count % 2 != 0 {
            let lastIndex = count - 1

            if lastIndex + 1 < allBGViews.count {
                allBGViews[lastIndex + 1]?.isHidden = false
                allLabels[lastIndex + 1]?.text = ""
                allImages[lastIndex + 1]?.image = nil
                allBGViews[lastIndex + 1]?.alpha = 0
            }
        }
        
        updateScrollHeight()

        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
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
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateScrollHeight()
    }
    
    func updateScrollHeight() {

        let itemCount = allSources[selectedIndex].items.count

        // 2 column layout
        let rowCount = Int(ceil(Double(itemCount) / 2.0))

        let oneRowHeight: CGFloat = 185
        let spacing: CGFloat = 15
        let topBottomSpace: CGFloat = 30

        let totalHeight =
            (CGFloat(rowCount) * oneRowHeight) +
            (CGFloat(max(rowCount - 1, 0)) * spacing) +
            topBottomSpace

        scrollViewHeightConstraint.constant = totalHeight

        view.layoutIfNeeded()
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

    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func bodyPartTapped(_ sender: UIButton) {
        let data = allSources[selectedIndex]
        let part = data.items[sender.tag]
        speak(text: part.name)
    }
    
}
