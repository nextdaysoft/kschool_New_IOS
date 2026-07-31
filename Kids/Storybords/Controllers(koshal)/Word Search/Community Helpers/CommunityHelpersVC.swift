//
//  CommunityHelpersVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 07/01/26.
//

import UIKit
import LanguageManager_iOS

// MARK: - STRUCT
struct CommunityLetterItem {
    let view: UIView
    let label: UILabel
}

class CommunityHelpersVC: BaseViewController {

    // MARK: - GRID LABELS (1–100)
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
    @IBOutlet weak var label46: UILabel!
    @IBOutlet weak var label47: UILabel!
    @IBOutlet weak var label48: UILabel!
    @IBOutlet weak var label49: UILabel!
    @IBOutlet weak var label50: UILabel!
    @IBOutlet weak var label51: UILabel!
    @IBOutlet weak var label52: UILabel!
    @IBOutlet weak var label53: UILabel!
    @IBOutlet weak var label54: UILabel!
    @IBOutlet weak var label55: UILabel!
    @IBOutlet weak var label56: UILabel!
    @IBOutlet weak var label57: UILabel!
    @IBOutlet weak var label58: UILabel!
    @IBOutlet weak var label59: UILabel!
    @IBOutlet weak var label60: UILabel!
    @IBOutlet weak var label61: UILabel!
    @IBOutlet weak var label62: UILabel!
    @IBOutlet weak var label63: UILabel!
    @IBOutlet weak var label64: UILabel!
    @IBOutlet weak var label65: UILabel!
    @IBOutlet weak var label66: UILabel!
    @IBOutlet weak var label67: UILabel!
    @IBOutlet weak var label68: UILabel!
    @IBOutlet weak var label69: UILabel!
    @IBOutlet weak var label70: UILabel!
    @IBOutlet weak var label71: UILabel!
    @IBOutlet weak var label72: UILabel!
    @IBOutlet weak var label73: UILabel!
    @IBOutlet weak var label74: UILabel!
    @IBOutlet weak var label75: UILabel!
    @IBOutlet weak var label76: UILabel!
    @IBOutlet weak var label77: UILabel!
    @IBOutlet weak var label78: UILabel!
    @IBOutlet weak var label79: UILabel!
    @IBOutlet weak var label80: UILabel!
    @IBOutlet weak var label81: UILabel!
    @IBOutlet weak var label82: UILabel!
    @IBOutlet weak var label83: UILabel!
    @IBOutlet weak var label84: UILabel!
    @IBOutlet weak var label85: UILabel!
    @IBOutlet weak var label86: UILabel!
    @IBOutlet weak var label87: UILabel!
    @IBOutlet weak var label88: UILabel!
    @IBOutlet weak var label89: UILabel!
    @IBOutlet weak var label90: UILabel!
    @IBOutlet weak var label91: UILabel!
    @IBOutlet weak var label92: UILabel!
    @IBOutlet weak var label93: UILabel!
    @IBOutlet weak var label94: UILabel!
    @IBOutlet weak var label95: UILabel!
    @IBOutlet weak var label96: UILabel!
    @IBOutlet weak var label97: UILabel!
    @IBOutlet weak var label98: UILabel!
    @IBOutlet weak var label99: UILabel!
    @IBOutlet weak var label100: UILabel!

    // MARK: - GRID VIEWS (1–100)
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
    @IBOutlet weak var view13: UIView!
    @IBOutlet weak var view14: UIView!
    @IBOutlet weak var view15: UIView!
    @IBOutlet weak var view16: UIView!
    @IBOutlet weak var view17: UIView!
    @IBOutlet weak var view18: UIView!
    @IBOutlet weak var view19: UIView!
    @IBOutlet weak var view20: UIView!
    @IBOutlet weak var view21: UIView!
    @IBOutlet weak var view22: UIView!
    @IBOutlet weak var view23: UIView!
    @IBOutlet weak var view24: UIView!
    @IBOutlet weak var view25: UIView!
    @IBOutlet weak var view26: UIView!
    @IBOutlet weak var view27: UIView!
    @IBOutlet weak var view28: UIView!
    @IBOutlet weak var view29: UIView!
    @IBOutlet weak var view30: UIView!
    @IBOutlet weak var view31: UIView!
    @IBOutlet weak var view32: UIView!
    @IBOutlet weak var view33: UIView!
    @IBOutlet weak var view34: UIView!
    @IBOutlet weak var view35: UIView!
    @IBOutlet weak var view36: UIView!
    @IBOutlet weak var view37: UIView!
    @IBOutlet weak var view38: UIView!
    @IBOutlet weak var view39: UIView!
    @IBOutlet weak var view40: UIView!
    @IBOutlet weak var view41: UIView!
    @IBOutlet weak var view42: UIView!
    @IBOutlet weak var view43: UIView!
    @IBOutlet weak var view44: UIView!
    @IBOutlet weak var view45: UIView!
    @IBOutlet weak var view46: UIView!
    @IBOutlet weak var view47: UIView!
    @IBOutlet weak var view48: UIView!
    @IBOutlet weak var view49: UIView!
    @IBOutlet weak var view50: UIView!
    @IBOutlet weak var view51: UIView!
    @IBOutlet weak var view52: UIView!
    @IBOutlet weak var view53: UIView!
    @IBOutlet weak var view54: UIView!
    @IBOutlet weak var view55: UIView!
    @IBOutlet weak var view56: UIView!
    @IBOutlet weak var view57: UIView!
    @IBOutlet weak var view58: UIView!
    @IBOutlet weak var view59: UIView!
    @IBOutlet weak var view60: UIView!
    @IBOutlet weak var view61: UIView!
    @IBOutlet weak var view62: UIView!
    @IBOutlet weak var view63: UIView!
    @IBOutlet weak var view64: UIView!
    @IBOutlet weak var view65: UIView!
    @IBOutlet weak var view66: UIView!
    @IBOutlet weak var view67: UIView!
    @IBOutlet weak var view68: UIView!
    @IBOutlet weak var view69: UIView!
    @IBOutlet weak var view70: UIView!
    @IBOutlet weak var view71: UIView!
    @IBOutlet weak var view72: UIView!
    @IBOutlet weak var view73: UIView!
    @IBOutlet weak var view74: UIView!
    @IBOutlet weak var view75: UIView!
    @IBOutlet weak var view76: UIView!
    @IBOutlet weak var view77: UIView!
    @IBOutlet weak var view78: UIView!
    @IBOutlet weak var view79: UIView!
    @IBOutlet weak var view80: UIView!
    @IBOutlet weak var view81: UIView!
    @IBOutlet weak var view82: UIView!
    @IBOutlet weak var view83: UIView!
    @IBOutlet weak var view84: UIView!
    @IBOutlet weak var view85: UIView!
    @IBOutlet weak var view86: UIView!
    @IBOutlet weak var view87: UIView!
    @IBOutlet weak var view88: UIView!
    @IBOutlet weak var view89: UIView!
    @IBOutlet weak var view90: UIView!
    @IBOutlet weak var view91: UIView!
    @IBOutlet weak var view92: UIView!
    @IBOutlet weak var view93: UIView!
    @IBOutlet weak var view94: UIView!
    @IBOutlet weak var view95: UIView!
    @IBOutlet weak var view96: UIView!
    @IBOutlet weak var view97: UIView!
    @IBOutlet weak var view98: UIView!
    @IBOutlet weak var view99: UIView!
    @IBOutlet weak var view100: UIView!

    // MARK: - UI
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreLabelBGView: UIView!
    @IBOutlet weak var hintAndNextBtn: UIButton!
    @IBOutlet weak var hintAndNextBtnBGView: UIView!

    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameLabel3: UILabel!
    @IBOutlet weak var nameLabel4: UILabel!
    @IBOutlet weak var nameLabel5: UILabel!
    @IBOutlet weak var nameLabel6: UILabel!
    @IBOutlet weak var nameLabel7: UILabel!
    @IBOutlet weak var nameLabel8: UILabel!
    @IBOutlet weak var nameLabel9: UILabel!
    @IBOutlet weak var nameLabel10: UILabel!

    @IBOutlet weak var nameView1: UIView!
    @IBOutlet weak var nameView2: UIView!
    @IBOutlet weak var nameView3: UIView!
    @IBOutlet weak var nameView4: UIView!
    @IBOutlet weak var nameView5: UIView!
    @IBOutlet weak var nameView6: UIView!
    @IBOutlet weak var nameView7: UIView!
    @IBOutlet weak var nameView8: UIView!
    @IBOutlet weak var nameView9: UIView!
    @IBOutlet weak var nameView10: UIView!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    // MARK: - DATA
    let helpers = [
        "TAILOR".localiz(),
        "PILOT".localiz(),
        "FARMER".localiz(),
        "NURSE".localiz(),
        "COOK".localiz(),
        "DRIVER".localiz(),
        "POLICE".localiz(),
        "TEACHER".localiz(),
        "SCIENTIST".localiz(),
        "DOCTOR".localiz()
    ]

    var letterItems: [CommunityLetterItem] = []
    var selectedItems: [CommunityLetterItem] = []
    var formedWord = ""
    var foundWords: Set<String> = []
    var lockedItems: Set<UIView> = []
    var wordIndexes: [String:[Int]] = [:]
    var helperToViewMap: [String:UIView] = [:]

    var currentWordColor: UIColor?
    var usedColorIndex = 0
    var score = 0
    var didCompleteGame = false
    
    let selectionColors: [UIColor] = [
        .systemRed,.systemOrange,.systemYellow,
        .systemGreen,.systemBlue,.systemPurple,.systemPink
    ]
    
    let customPurpleColor = UIColor(
        red: 94/255,
        green: 76/255,
        blue: 164/255,
        alpha: 1
    )

    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        nameView1.layer.cornerRadius = 6
        nameView1.backgroundColor = ColorManager.randomColor()
        nameView1.layer.borderColor = UIColor.black.cgColor
       

        nameView2.layer.cornerRadius = 6
        nameView2.backgroundColor = ColorManager.randomColor()
        nameView2.layer.borderColor = UIColor.black.cgColor
       

        nameView3.layer.cornerRadius = 6
        nameView3.backgroundColor = ColorManager.randomColor()
        nameView3.layer.borderColor = UIColor.black.cgColor
  

        nameView4.layer.cornerRadius = 10
        nameView4.backgroundColor = ColorManager.randomColor()
        nameView4.layer.borderColor = UIColor.black.cgColor
        

        nameView5.layer.cornerRadius = 6
        nameView5.backgroundColor = ColorManager.randomColor()
        nameView5.layer.borderColor = UIColor.black.cgColor
       

        nameView6.layer.cornerRadius = 6
        nameView6.backgroundColor = ColorManager.randomColor()
        nameView6.layer.borderColor = UIColor.black.cgColor
        

        nameView7.layer.cornerRadius = 6
        nameView7.backgroundColor = ColorManager.randomColor()
        nameView7.layer.borderColor = UIColor.black.cgColor
        

        nameView8.layer.cornerRadius = 6
        nameView8.backgroundColor = ColorManager.randomColor()
        nameView8.layer.borderColor = UIColor.black.cgColor
      

        nameView9.layer.cornerRadius = 6
        nameView9.backgroundColor = ColorManager.randomColor()
        nameView9.layer.borderColor = UIColor.black.cgColor
      

        nameView10.layer.cornerRadius = 6
        nameView10.backgroundColor = ColorManager.randomColor()
        nameView10.layer.borderColor = UIColor.black.cgColor
  
        
        
        scoreLabelBGView.layer.cornerRadius = 6
       

        setupNames()
        setupGrid()

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view.addGestureRecognizer(pan)

        scoreLabel.text = "\("Score".localiz()): 0 / \(helpers.count)"
    }

    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        hintAndNextBtnBGView.layer.cornerRadius = 6
        hintAndNextBtnBGView.backgroundColor = color
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - SETUP
    func setupNames() {
        let labels = [nameLabel1,nameLabel2,nameLabel3,nameLabel4,nameLabel5,
                      nameLabel6,nameLabel7,nameLabel8,nameLabel9,nameLabel10]
        let views = [nameView1,nameView2,nameView3,nameView4,nameView5,
                     nameView6,nameView7,nameView8,nameView9,nameView10]

        let shuffled = helpers.shuffled()
        for i in 0..<helpers.count {
            labels[i]?.text = shuffled[i]
            helperToViewMap[shuffled[i]] = views[i]
            views[i]?.layer.cornerRadius = 10
        }
    }

    func setupGrid() {
        let labels = [label1,label2,label3,label4,label5,label6,label7,label8,label9,label10,
                      label11,label12,label13,label14,label15,label16,label17,label18,label19,label20,
                      label21,label22,label23,label24,label25,label26,label27,label28,label29,label30,
                      label31,label32,label33,label34,label35,label36,label37,label38,label39,label40,
                      label41,label42,label43,label44,label45,label46,label47,label48,label49,label50,
                      label51,label52,label53,label54,label55,label56,label57,label58,label59,label60,
                      label61,label62,label63,label64,label65,label66,label67,label68,label69,label70,
                      label71,label72,label73,label74,label75,label76,label77,label78,label79,label80,
                      label81,label82,label83,label84,label85,label86,label87,label88,label89,label90,
                      label91,label92,label93,label94,label95,label96,label97,label98,label99,label100]

        let views = [view1,view2,view3,view4,view5,view6,view7,view8,view9,view10,
                     view11,view12,view13,view14,view15,view16,view17,view18,view19,view20,
                     view21,view22,view23,view24,view25,view26,view27,view28,view29,view30,
                     view31,view32,view33,view34,view35,view36,view37,view38,view39,view40,
                     view41,view42,view43,view44,view45,view46,view47,view48,view49,view50,
                     view51,view52,view53,view54,view55,view56,view57,view58,view59,view60,
                     view61,view62,view63,view64,view65,view66,view67,view68,view69,view70,
                     view71,view72,view73,view74,view75,view76,view77,view78,view79,view80,
                     view81,view82,view83,view84,view85,view86,view87,view88,view89,view90,
                     view91,view92,view93,view94,view95,view96,view97,view98,view99,view100]

        letterItems = zip(views, labels).compactMap {
            guard let v = $0.0, let l = $0.1 else { return nil }
            return CommunityLetterItem(view: v, label: l)
        }

        let letters = generateGridLetters()
        for (i,item) in letterItems.enumerated() {
            item.label.text = letters[i]
            item.view.backgroundColor = .white
        }
    }

    // MARK: - WORD LOGIC
    func generateGridLetters() -> [String] {

        let rows = 10, cols = 10
        var grid = Array(repeating: "", count: rows * cols)
        wordIndexes.removeAll()

        var startRow = 0

        for word in helpers {
            let chars = Array(word)

            if chars.count > cols {
                fatalError("Word too long for grid")
            }

            let colStart = Int.random(in: 0...(cols - chars.count))

            var indexes: [Int] = []

            for i in 0..<chars.count {
                let index = startRow * cols + colStart + i
                grid[index] = String(chars[i])
                indexes.append(index)
            }

            wordIndexes[word] = indexes
            startRow += 1
        }

        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"

        let randomCharacters: String

        if selectedLanguage == "zhHans" {

            randomCharacters = """
            的一是在不了有人和国中大为上个这我以要他时来用们生到作地于出就分对成会可主发年动同工也能下过子说产种面而方后多定行学法所民得经十三之进着等部度家电力里如水化高自二理起小物现实加量都两体制机当使点从业本去把性好应开它合还因由其些然前外天政四日那社义事平形相全表间样与关各重新线内数正心反你明看原又么利比或但质气第向道命此变条只没结解问意建月公无系军很情者最立代想已通并提直题党程展五果料象员革位入常文总次品式活设及管特件长求老头基资边流路级少图山统接知较将组见计别她手角期根论运农指几九区强放决西被干做必战先回则任取据处理世车价
            """
        } else {

            randomCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        }

        for i in 0..<grid.count {
            if grid[i].isEmpty {
                grid[i] = String(randomCharacters.randomElement()!)
            }
        }

        return grid
    }

    // MARK: - PAN
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let loc = gesture.location(in: view)

        for item in letterItems {
            let p = item.view.convert(loc, from: view)
            if item.view.bounds.contains(p),
               !selectedItems.contains(where: {$0.view == item.view}),
               !lockedItems.contains(item.view) {

                if currentWordColor == nil {
                    currentWordColor = customPurpleColor
                }

                selectedItems.append(item)
                formedWord += item.label.text ?? ""
                item.view.backgroundColor = currentWordColor!
                item.label.textColor = .white
            }
        }

        if gesture.state == .ended {
            checkWord()
        }
    }
    func showCompletionState() {

        hintAndNextBtn.setTitle("Next".localiz(), for: .normal)

        scoreLabel.text = "Good Job!".localiz()
        scoreLabel.textColor = .white
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 20)

        let colors: [UIColor] = [
            .systemGreen,
            .systemBlue,
            .systemOrange,
            .systemPurple,
            .systemPink,
            .systemTeal
        ]

        scoreLabelBGView.backgroundColor = colors.randomElement()
    }
    
    func checkWord() {

        let word = formedWord.uppercased()
        let reversedWord = String(word.reversed())

        if (helpers.contains(word) || helpers.contains(reversedWord)),
           !(foundWords.contains(word) || foundWords.contains(reversedWord)) {

            let correctWord = helpers.contains(word)
                ? word
                : reversedWord

            foundWords.insert(correctWord)

            let finalColor =
                selectionColors[
                    usedColorIndex % selectionColors.count
                ]

            selectedItems.forEach {
                lockedItems.insert($0.view)
                $0.view.backgroundColor = finalColor
                $0.label.textColor = .white
            }

            if let v = helperToViewMap[correctWord] {
                v.isHidden = true
            }

            score += 1
            usedColorIndex += 1
            scoreLabel.text = "\("Score".localiz()): \(score) / \(helpers.count)"

        } else {

            selectedItems.forEach {
                $0.view.backgroundColor = .white
                $0.label.textColor = .black
            }
        }

        formedWord = ""
        selectedItems.removeAll()
        currentWordColor = nil

        if foundWords.count == helpers.count {

            didCompleteGame = true

            UserDefaults.standard.set(
                true,
                forKey: "wordSearchLevel5Completed"
            )

            showCompletionState()
        }
    }
    
    func flashItem(_ item: CommunityLetterItem, color: UIColor) {
        UIView.animate(withDuration: 0.25, animations: {
            item.view.backgroundColor = color
            item.label.textColor = .white
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 0.4, options: [], animations: {
                if !self.lockedItems.contains(item.view) {
                    item.view.backgroundColor = .white
                    item.label.textColor = .black
                }
            })
        }
    }
    
    // MARK: - BUTTON
    @IBAction func hintAndNextTapBtn(_ sender: UIButton) {
        
        if didCompleteGame {

            if let menuVC = navigationController?.viewControllers.first(
                where: { $0 is WordSearchMenuVC }
            ) as? WordSearchMenuVC {

                menuVC.level5Completed = true
            }

            navigationController?.popViewController(animated: true)
            return
        }

        guard let currentHelper = helpers.first(where: { !foundWords.contains($0) }),
              let indexes = wordIndexes[currentHelper],
              let firstIndex = indexes.first,
              firstIndex < letterItems.count else { return }

        let item = letterItems[firstIndex]

       
        if !lockedItems.contains(item.view) {
            flashItem(item, color: customPurpleColor)
        }
    }
}
