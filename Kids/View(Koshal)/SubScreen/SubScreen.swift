//
//  SubScreen.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 18/12/25.
//

import UIKit
import LanguageManager_iOS

protocol SubItem {
    var title: String { get }
    var imageName: String { get }
    var screenType: ScreenType { get }
    var levelConfig: LevelConfigurable? { get }
    var levelDisplayType: LevelDisplayType { get }
    var coloringItems: [ColoringItem]? { get }
    
    var percentage: Int? { get }
    
 
}

class SubScreen: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
//    @IBOutlet weak var restLabel: UILabel!
//    @IBOutlet weak var restBtn: UIButton!
    
    var didTapLockedLevel = false
    
    var isCompleted: Bool = false   // 👈 ADD THIS
   // var completedType: ScreenType?
    
    // MARK: Variable
     var Htitle = ""
    var category: HomeCategory!
    var dataSource: [SubItem] = []
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
      //  setupForRestBtn()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        applyTheme()
        loadDataByCategory()
        tblView.reloadData()
    }
    // MARK: Function
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
       // let img = UIImage(systemName: "arrow.backward.circle")
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        lblTitle.text = Htitle
    }
    
    func checkSubscription() -> Bool {

        if SubscriptionManager.shared.isSubscribed() {
            return true
        }

        goToSubscription()
        return false
    }

    func goToSubscription() {

        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier: "SubscriptionVC"
        ) as! SubscriptionVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
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
    
    func loadDataByCategory() {

        switch category {
        case .letter:
            dataSource = Variable.Shared.Letter
        case .maths:
            dataSource = Variable.Shared.Maths
        case .sound:
            dataSource = Variable.Shared.Sound
        case .funcorner:
            dataSource = Variable.Shared.FunColor
        case .game:
            dataSource = Variable.Shared.Game
        case .clock:
            dataSource = Variable.Shared.clock
        case .reading:
            dataSource = Variable.Shared.reading
        case .vocabulary:
            dataSource = Variable.Shared.vocabulary
        case .grammar:
            dataSource = Variable.Shared.Grammar
        case .science:
            dataSource = Variable.Shared.Science
        case .wordsearch:
            dataSource = Variable.Shared.WordSearch
        case .picture:

            let selectedAge = UserDefaults.standard.string(
                forKey: "userAge"
            ) ?? ""

            if selectedAge == "1 - 6 yrs" {

                dataSource = [
                    Variable.Shared.Picture[0], // Name The Picture
                    Variable.Shared.Picture[2]  // Match Image With Letter
                ]

            } else {

                dataSource = [
                    Variable.Shared.Picture[1], // Fill Missing Letter
                    Variable.Shared.Picture[3]  // Hear and Find
                ]
            }
        default:
            dataSource = []
        }

        tblView.reloadData()
    }
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
//    @IBAction func restTapBtn(_ sender: UIButton) {
//    }
    
}
// MARK: Extension
extension SubScreen: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubSCell", for: indexPath) as! SubSCell
        cell.cView.layer.cornerRadius = 10
        cell.cView.backgroundColor =
        UserDefaults.standard.bool(forKey: "WhiteTheme")
        ? .white
        : ColorManager.randomColor()
        cell.cView.layer.borderColor = UIColor.black.cgColor
      //  cell.cView.layer.borderWidth = 0.4
      
        let item = dataSource[indexPath.row]

        cell.subImg.isHidden = true
        cell.subImgWidthConstraint.constant = 0

        // reset default state
        // reset default state
        cell.cView.backgroundColor =
        UserDefaults.standard.bool(forKey: "WhiteTheme")
        ? .white
        : ColorManager.randomColor()

        cell.cView.alpha = 1


        // VOCABULARY lock UI
        if category == .vocabulary && indexPath.row > 2 {

            if !SubscriptionManager.shared.isSubscribed() {

                cell.subImg.isHidden = false
                cell.subImg.image = UIImage(named: "lock")
                cell.subImgWidthConstraint.constant = 30

                cell.cView.backgroundColor = .systemGray4
                cell.cView.alpha = 0.85
            }
        }


        // completed image (lock ko overwrite nahi karega)
        if !(category == .vocabulary &&
             indexPath.row > 2 &&
             !SubscriptionManager.shared.isSubscribed()) {

            if item.screenType == .WcomeNext {

                let percentage = UserDefaults.standard.integer(
                    forKey: "WcomeNextPercentage"
                )

                if percentage > 0 {

                    cell.subImg.isHidden = false
                    cell.subImg.image = UIImage(named: "done")
                    cell.subImgWidthConstraint.constant = 30

                } else {

                    cell.subImg.isHidden = true
                    cell.subImgWidthConstraint.constant = 0
                }
            }
        }

        // ✅ ADD THIS BLOCK
        if let percentage = item.percentage {
            cell.subLabel?.isHidden = false
            cell.subLabel?.text = "\(percentage)%"
        } else {
            cell.subLabel?.isHidden = true
        }
        print("ScreenType:", item.screenType)
        print("Percentage:", item.percentage)

        cell.lblTitle.text = item.title
        cell.imgView.image = UIImage(named: item.imageName)
        
        cell.numView.isHidden = true
        cell.lblTitle.text = dataSource[indexPath.row].title
        cell.imgView.image = UIImage(named: dataSource[indexPath.row].imageName)
        
        cell.onTap = { [weak self] in
            guard let self = self else { return }

            let item = self.dataSource[indexPath.row]

            // ✅ MATCH SHAPE / ORDER SHAPE → DIRECT MENU
            if item.screenType == .MatchShape {
                self.openMatchShapeMenu()
                return
            }
            
            if item.screenType == .PatternRepeat {
                self.openPatternRepeatMenu()
                return
            }
            
            // ---------- VOCABULARY ----------
            if self.category == .maths {
                switch indexPath.row {
                case 0:
                    self.openNumbersNamesOption()
                case 1:
                    self.openFindTheNumberOption()
                default:
                    self.routeToScreen(item: item, level: nil)
                }
                return
            }
            
            // ---------- PICTURE ----------
            if self.category == .picture {

                let selectedAge = UserDefaults.standard.string(
                    forKey: "userAge"
                ) ?? ""

                if selectedAge == "1 - 6 yrs" {

                    switch indexPath.row {

                    case 0:
                        self.openNameThePictureMenu()

                    case 1:
                        self.openMatchTheImageWithLetterMenu()

                    default:
                        break
                    }

                } else {

                    switch indexPath.row {

                    case 0:
                        self.openFillTheMissingLetterMenu()

                    case 1:
                        self.hearAndFindMenu()

                    default:
                        break
                    }
                }

                return
            }

            // ---------- VOCABULARY ----------
            // ---------- VOCABULARY ----------
            if self.category == .vocabulary {

                // case 0,1,2 free
                if indexPath.row > 2 {

                    guard self.checkSubscription() else {
                        return
                    }
                }

                switch indexPath.row {

                case 0:
                    self.openPickTheCorrectOption()

                case 1:
                    self.threeLetterWordOption()

                case 2:
                    self.openPickTheCorrectSpellingMenu()

                case 3:
                    self.matchAntonymsOption()

                case 4:
                    self.fourLetterWordOption()

                case 5:
                    self.pluralFormOption()

                case 6:
                    self.rhymingWordsOption()

                case 7:
                    self.matchSynonymsOption()

                case 8:
                    self.animalMovementOption()

                case 9:
                    self.openConfusingWordsOption()

                default:
                    self.routeToScreen(item: item, level: nil)
                }

                return
            }
            
            // ---------- बाकी सब ----------
            if let levelConfig = item.levelConfig, levelConfig.hasLevels {
                self.openContentScreen(item: item)
            } else {
                self.routeToScreen(item: item, level: nil)
            }
        }

        return cell
    }
    func openContentScreen(item: SubItem) {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ContentScreen"
        ) as! ContentScreen

        vc.Htitle = item.title
        vc.subItem = item

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToScreen(item: SubItem, level: Int?) {

        // ✅ MATCH SHAPE + ORDER SHAPE → SAME MENU
        switch item.screenType {
            
        case .MatchShape, .OrderShape:
            let vc = storyboard?.instantiateViewController(
                withIdentifier: "MatchshapeMenuVC"
            ) as! MatchshapeMenuVC
            
            navigationController?.pushViewController(vc, animated: true)
            return
            
        default:
            break
        }

        // बाकी screens same
        ScreenRouter.route(
            from: self,
            item: item,
            level: level
        )
    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
    func openMatchShapeMenu() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "MatchshapeMenuVC"
        ) as! MatchshapeMenuVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openPatternRepeatMenu() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "PatternRepeatMenuVC"
        ) as! PatternRepeatMenuVC

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openNameThePictureMenu() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "NameThePictureMenuVC"
        ) as! NameThePictureMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }

    func openFillTheMissingLetterMenu() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "FillTheMissingLetterMenuVC"
        ) as! FillTheMissingLetterMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }

    func openMatchTheImageWithLetterMenu() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "MatchTheImageWithLetterMenuVC"
        ) as! MatchTheImageWithLetterMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }

    func hearAndFindMenu() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "HearAndFindMenu"
        ) as! HearAndFindMenu
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openPickTheCorrectOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "PickTheCorrectOptionMenuVC"
        ) as! PickTheCorrectOptionMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }

    func openPickTheCorrectSpellingMenu() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "PickTheCorrectSpellingMenuVC"
        ) as! PickTheCorrectSpellingMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openConfusingWordsOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ConfusingWordsMenuVC"
        ) as! ConfusingWordsMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func matchAntonymsOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "MatchAntonymsLevelMenuVC"
        ) as! MatchAntonymsLevelMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func rhymingWordsOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "RhymingWordsMenuVC"
        ) as! RhymingWordsMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func matchSynonymsOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "MatchSynonymsMenuVC"
        ) as! MatchSynonymsMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func animalMovementOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "AnimalMovementMenuVC"
        ) as! AnimalMovementMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pluralFormOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "PluralFormMenuVC"
        ) as! PluralFormMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func threeLetterWordOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ThreeLetterWordMenuVC"
        ) as! ThreeLetterWordMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fourLetterWordOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "FourLetterWordMenuVC"
        ) as! FourLetterWordMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }

    func openNumbersNamesOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "NumbersNamesMenuVC"
        ) as! NumbersNamesMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openFindTheNumberOption() {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "FindTheNumberMenuVC"
        ) as! FindTheNumberMenuVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: Function
    func openContentScreen(title: String, category: Any, levelCount: Int) {

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "ContentScreen"
        ) as! ContentScreen
        vc.Htitle = title
        vc.selectedCategory = category
        vc.levelCount = levelCount
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openQuestionScreen(title: String, category: Any, level: Any?) {
        // Replace 'QuestionScreen' with your actual question screen class name if different
         let vc = storyboard?.instantiateViewController(
            withIdentifier: "Question"
        ) as! Question
        vc.screenTitle = title
        vc.selectedCategory = category
        vc.selectedLevel = level as? Int
        navigationController?.pushViewController(vc, animated: true)
    }
  

}
enum LevelDisplayType {
    case number                 // 1, 2, 3
    case numberWithWord         // 2 → Two (Tables)
    case range(Int)             // 1–10, 11–20 (step)
}
struct ColoringItem {
    let title: String
    let imageName: String
    let coloringImageName: String
}


extension Item: SubItem {
    var coloringItems: [ColoringItem]? {
        guard let color = category as? FunColorCategory,
              color == .coloring else {
                return nil
            }
        return [
            ColoringItem(title: "Rooster".localiz(), imageName: "rooster", coloringImageName: "rooster_1"),
            ColoringItem(title: "Monkey".localiz(), imageName: "monkey", coloringImageName: "monkey_1"),
            ColoringItem(title: "Snake".localiz(), imageName: "snake", coloringImageName: "snake_1"),
            ColoringItem(title: "Eagle".localiz(), imageName: "eagle", coloringImageName: "eagle_1"),
            ColoringItem(title: "Camel".localiz(), imageName: "camel", coloringImageName: "camel_1"),
            ColoringItem(title: "Rhinoceros".localiz(), imageName: "rhinoceros", coloringImageName: "rhinoceros_1"),
            ColoringItem(title: "Turtle".localiz(), imageName: "turtle", coloringImageName: "turtle_1"),
            ColoringItem(title: "Fish".localiz(), imageName: "fish", coloringImageName: "fish_1"),
            ColoringItem(title: "Snow Man".localiz(), imageName: "snowman", coloringImageName: "snowman_1"),
            ColoringItem(title: "Dog".localiz(), imageName: "dog", coloringImageName: "dog_1"),
            ColoringItem(title: "Cat".localiz(), imageName: "cat", coloringImageName: "cat_1"),
            ColoringItem(title: "Elephant".localiz(), imageName: "elephant", coloringImageName: "elephant_1"),
            ColoringItem(title: "Tiger".localiz(), imageName: "tiger", coloringImageName: "tiger_1"),
            ColoringItem(title: "Panda".localiz(), imageName: "panda", coloringImageName: "panda_1"),
            ColoringItem(title: "Lion".localiz(), imageName: "lion", coloringImageName: "lion_1"),
            ColoringItem(title: "Peacock".localiz(), imageName: "nature", coloringImageName: "peacock_1"),
            ColoringItem(title: "Frog".localiz(), imageName: "frog", coloringImageName: "frog_1"),
            ColoringItem(title: "Cow".localiz(), imageName: "cow", coloringImageName: "cow_1"),
            ColoringItem(title: "Donkey".localiz(), imageName: "donkey", coloringImageName: "donkey_1"),
            ColoringItem(title: "Pig".localiz(), imageName: "pig", coloringImageName: "pig_1"),
            ColoringItem(title: "Kangaroo".localiz(), imageName: "kangaroo", coloringImageName: "kangaroo_1"),
            ColoringItem(title: "Rabbit".localiz(), imageName: "rabbit", coloringImageName: "rabbit_1"),
            ColoringItem(title: "Giraffe".localiz(), imageName: "jiraaf", coloringImageName: "giraffe_1"),
            ColoringItem(title: "Penguin".localiz(), imageName: "penguin", coloringImageName: "penguin_1"),
            ColoringItem(title: "Dolphin".localiz(), imageName: "dolphin", coloringImageName: "dolphin_1"),
            ColoringItem(title: "Butterfly".localiz(), imageName: "butterfly", coloringImageName: "butterfly_1"),
            ColoringItem(title: "Crocodile".localiz(), imageName: "crocodile", coloringImageName: "crocodile_1"),
            ColoringItem(title: "Mouse".localiz(), imageName: "RatImg", coloringImageName: "mouse_1"),
            ColoringItem(title: "Ball".localiz(), imageName: "beach-ball", coloringImageName: "ball_1"),
            ColoringItem(title: "Duck".localiz(), imageName: "duck", coloringImageName: "duck_1"),
            ColoringItem(title: "Flower".localiz(), imageName: "sunflower 1", coloringImageName: "flower_1"),
            ColoringItem(title: "Umbrella".localiz(), imageName: "umbrella", coloringImageName: "umbrella_1"),
            ColoringItem(title: "Santa Claus".localiz(), imageName: "santa_claus", coloringImageName: "santa_claus_1")
        ]
    }
    
    var percentage: Int? {
        switch screenType {

        case .compareNumbers:
            let value = UserDefaults.standard.integer(forKey: "compareNumbersPercentage")
            return value == 0 ? nil : value

        case .MatchShape:
            let value = UserDefaults.standard.integer(forKey: "MatchShapePercentage")
            return value == 0 ? nil : value
            
        case .WcomeNext:
            let value = UserDefaults.standard.integer(forKey: "WcomeNextPercentage")
            return value == 0 ? nil : value

        case .beforeAfter:
            let value = UserDefaults.standard.integer(forKey: "afterBeforePercentage")
            return value == 0 ? nil : value
            
        default:
            return nil
        }
    }
    
    var levelDisplayType: LevelDisplayType {

        // ---------- MATHS ----------
        if let math = category as? MathsCategory {

            switch math {
            case .tables:
                // 2, 3, 4 with words
                return .numberWithWord
            default:
                return .number
            }
        }
        // ---------- Letter ----------
        if let letter = category as? LetterCategory {

            switch letter {
            case .identifiyNumber:
                // 2, 3, 4 with words
                return .range(10)
            default:
                return .number
            }
        }

        // ---------- DEFAULT ----------
        return .number
    }
    var levelConfig: LevelConfigurable? {
        return category as? LevelConfigurable
    }

    var screenType: ScreenType {

        // ---------- MATHS ----------
        if let math = category as? MathsCategory {
            switch math {
            case .ascendingOrder,
                    .descendingOrder:
                return .question
            case .findNumber:
                return .findNumber
            case .count, .countArithmetic:
                return .counting
            case .numberNames:
                return .numberNames
            case .afterNumber, .beforeNumber:
                return .beforeAfter
            case .compareNumber:
                return .compareNumbers
            case .addition,.subtraction:
                return .plusminus
            case .fractions:
                return .fraction
            case .tables:
                return .tables
            case .wordmath:
                return .wordMath
            case .calculateMoney:
                return .question
            case .filltheMissingNumber:
                return .FTMV
            default:
                return .question
            }
        }

        // ---------- LETTER ----------
        if let letter = category as? LetterCategory {
            switch letter {
            case .capitalLetters:
                return .CapitalLetters
            case .smallLetters:
                return .question
            case .capitalCursive:
                return .cursiveCapital
            case .smallCursive:
                return .question
            case .alphabetRhymes:
                return .question
            case .connectVowel:
                return .question
            case .identifiyLetter:
                return .identifyLetters
            case .identifiyNumber:
                return .identifyNumbers
            case .numbers:
                return .numbers
            default:
                return .question
            }
        }

        // ---------- SOUND ----------
//        if category is SoundCategory {
//            return .game
//        }
//
        // ---------- FUN COLOR ----------
        if let funcolor = category as? FunColorCategory {
            switch funcolor{
            case .coloring:
                print("")
            case .matchShape:
                return .MatchShape
            case .maze:
                return .MatchShape
            case .orderShape:
                return .OrderShape
            case .repeatShape:
                return .PatternRepeat
            case .drawing:
                return .Drawing
            case .whatcomeNext:
                return .WcomeNext
            }
        }
//
//        // ---------- GAME ----------
//        if category is GameCategory {
//            return .game
//        }

        // ---------- CLOCK ----------
        if category is clockCategory {
            return .question
        }

        // ---------- READING ----------
//        if category is readingCategory {
//            return .picture
//        }

        // ---------- VOCABULARY ----------
        if category is vocabularyCategory {
            return .question
        }

        // ---------- GRAMMAR ----------
        if category is GrammarCategory {
            return .question
        }

        // ---------- SCIENCE ----------
//        if category is ScienceCategory {
//            return .picture
//        }
//
//        // ---------- WORD SEARCH ----------
//        if category is WordSearchCategory {
//            return .wordSearch
//        }

        // ---------- PICTURE ----------
//        if category is PictureCategory {
//            return .picture
//        }

        return .question
    }
}


