//
//  Variable.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 18/12/25.
//

import Foundation
import UIKit
import LanguageManager_iOS
class Variable {
    static let Shared = Variable()
    //MARK: Home
    var category: [Item<HomeCategory>]  { [
        Item(title: "Phonics".localiz(), imageName: "phonicsIcon", category: .phonics),
        Item(title: "Listen and Watch".localiz(), imageName: "listenanimal", category: .listenAndWatch),
        Item(title: "Letter".localiz(), imageName: "Letter", category: .letter),
        Item(title: "Vehicle".localiz(), imageName: "dumpTruck", category: .vehicle),
        Item(title: "Color".localiz(), imageName: "rainbow_Menu", category: .color),
        Item(title: "Maths".localiz(), imageName: "Maths", category: .maths),
        Item(title: "Fun Corner".localiz(), imageName: "paint", category: .funcorner),
        Item(title: "Grammar".localiz(), imageName: "Grammar", category: .grammar),
        Item(title: "Vocabulary".localiz(), imageName: "Vocabulary", category: .vocabulary),
        Item(title: "Reading".localiz(), imageName: "Reading", category: .reading),
        Item(title: "Clock".localiz(), imageName: "Clock", category: .clock),
        Item(title: "Picture".localiz(), imageName: "Picture", category: .picture),
        Item(title: "Science".localiz(), imageName: "Science", category: .science),
        Item(title: "Word Search".localiz(), imageName: "Word Search", category: .wordsearch),
        Item(title: "Game".localiz(), imageName: "Game", category: .game),
        Item(title: "Solar System".localiz(), imageName: "saturn", category: .solarSystem),
        Item(title: "Animals".localiz(), imageName: "lion", category: .animals),
        Item(title: "Fruits & Vegetables".localiz(), imageName: "apple", category: .frutisAndVegetables),
        Item(title: "Country".localiz(), imageName: "countryFlag", category: .country),
        Item(title: "External Body Parts".localiz(), imageName: "ic_parts_of_human", category: .externalBodyParts),
        Item(title: "Music".localiz(), imageName: "guitarIcon", category: .guitar),
        Item(title: "Calendar".localiz(), imageName: "calendar", category: .calendar),
        Item(title: "Measurement".localiz(), imageName: "measuring_tape", category: .measurement),
        Item(title: "Road Signs And Signals".localiz(), imageName: "trafficLight", category: .roadSignsAndSignals),
        Item(title: "Directions".localiz(), imageName: "north", category: .directions),
        Item(title: "Internal Body Parts".localiz(), imageName: "brainNew", category: .internalBodyParts),
        Item(title: "Shapes".localiz(), imageName: "shape_triangle", category: .shapes),
        Item(title: "Vitamin".localiz(), imageName: "vitamin", category: .vitamin),
        Item(title: "Idioms".localiz(), imageName: "idiom_piece_of_cake", category: .idioms),
        Item(title: "Roman Numerals".localiz(), imageName: "romanNumerals", category: .romanNumerals),
        Item(title: "Seasons".localiz(), imageName: "season", category: .seasons),
        Item(title: "Blood Group".localiz(), imageName: "blood", category: .bloodGroup),
        Item(title: "Animal Eating Style".localiz(), imageName: "dog-food", category: .animalEatingStyle),
        Item(title: "Animal Families".localiz(), imageName: "kangaroo", category: .animalFamilies)
    ]}
    
    
    // MARK: Maths
    var Maths: [Item<MathsCategory>] = [Item(title: "Number Names", imageName: "Number Names", category: .numberNames),Item(title: "Find the Number", imageName: "Find the Number", category: .findNumber),Item(title: "Tables", imageName: "Tables", category: .tables),Item(title: "Count", imageName: "Count",category: .count),Item(title: "Compare Number", imageName: "Compare Number", category: .compareNumber),Item(title: "After Number", imageName: "After Number", category: .afterNumber),Item(title: "Before Number", imageName: "Before Number", category: .beforeNumber),Item(title: "Count Arithmetic", imageName: "Count Arithmetic", category: .countArithmetic),Item(title: "Calculate Money", imageName: "Calculate Money",category: .calculateMoney),Item(title: "Addition", imageName: "Addition", category: .addition),Item(title: "Subtraction", imageName: "Subtraction", category: .subtraction),Item(title: "Find Value", imageName: "Find Value", category: .findvalue),Item(title: "Biggest Number", imageName: "Biggest Number", category: .biggestNumber),Item(title: "Smallest Number", imageName: "Smallest Number", category: .smallestNumber),Item(title: "Ascending Order", imageName: "Ascending Order", category: .ascendingOrder),Item(title: "Descending Order", imageName: "Descending Order", category: .descendingOrder),Item(title: "Fraction", imageName: "Fraction", category: .fractions),Item(title: "Word Math", imageName: "Word Math",category: .wordmath),Item(title: "Fill the Missing Value", imageName: "Fill the Missing Value", category: .filltheMissingNumber)]
    
    // MARK: Letter
    var Letter:[Item<LetterCategory>] = [Item(title: "Capital Letters", imageName: "cpitalLetter", category: .capitalLetters), Item(title: "Small Letters", imageName: "smalLetter", category: .smallLetters), Item(title: "Number", imageName: "number", category: .numbers), Item(title: "Capital Cursive Letter", imageName: "capitalcursive", category: .capitalCursive), Item(title: "Small Cursive Letter", imageName: "smallcursive", category: .smallCursive),Item(title: "Identify Letter", imageName: "listenLetter", category: .identifiyLetter), Item(title: "Identify Number", imageName: "listenNumber", category: .identifiyNumber), Item(title: "Connect the Vowels", imageName: "vowels", category: .connectVowel)]
    // MARK: Sound
    var Sound: [Item<SoundCategory>] = [Item(title: "Listen and Learn", imageName: "listenlearn", category: .LisLearn), Item(title: "Guess the Sound", imageName: "guesssound", category: .GTSound), Item(title: "Listen Animal Sound", imageName: "listenanimal", category: .LTASound), Item(title: "Guess the Animal Sound", imageName: "guessanimal", category: .GTASound), Item(title: "Listen Vehicle Name", imageName: "bulldozer", category: .LVNSound), Item(title: "Guess Vehicle", imageName: "tractor", category: .GVSound)]
    // MARK: FunColor
    var FunColor:[Item<FunColorCategory>] = [Item(title: "Coloring", imageName: "paint", category: .coloring), Item(title: "Match shape", imageName: "matchshape", category: .matchShape), Item(title: "Maze", imageName: "maze", category: .maze), Item(title: "Order Shape", imageName: "ordershape", category: .orderShape), Item(title: "Repeat Pattern", imageName: "repeatpattern", category: .repeatShape), Item(title: "Drawing", imageName: "drawing", category: .drawing),Item(title: "What Comes Next", imageName: "guesssound", category: .whatcomeNext)]
    // MARK: Game
    var Game: [Item<GameCategory>] = [Item(title: "Find Pair", imageName: "pairs", category: .findPair),/*,Item(title: "Ball Shot Game", imageName: "BallShot", category: .ballshortGame),*/Item(title: "Remember Shape And Color", imageName: "remember", category: .remembershapeandcolor),Item(title: "Find the Order", imageName: "order", category: .findtheorder),Item(title: "Shadow Match Game", imageName: "crow", category: .shadowmatchgame)]
    // MARK: Clock
    var clock: [Item<clockCategory>] = [Item(title: "Set Time - Hours", imageName: "sethours", category: .SetTime),Item(title: "Write Time - Hours", imageName: "writetimehours", category: .WriteTime),Item(title: "Set Time - Quaters", imageName: "setquaters", category: .SetTimeQuarter),Item(title: "Write Time - Quaters ", imageName: "writetimequaters", category: .WriteTimeQuarter),Item(title: "Set Time - Minutes", imageName: "setminutes", category: .SetTimeMinute),Item(title: "Write Time - Minutes", imageName: "writeminutes", category: .WriteTimeMinute)]
    // MARK: Reading
    var reading: [Item<readingCategory>] = [Item(title: "Apple", imageName: "apple", category: .apple),Item(title: "Banana", imageName: "banana", category: .Banana),Item(title: "Ball", imageName: "ball", category: .Ball ),Item(title: "Cat", imageName: "cat", category:.Cat ),Item(title: "Sun", imageName: "sun", category: .sun),Item(title: "Fish", imageName: "fish", category: .Fish),Item(title: "Bird", imageName: "bird", category: .Bird),Item(title: "Car", imageName: "car", category: .car),Item(title: "Tree", imageName: "tree", category: .Tree),Item(title: "Dog", imageName: "dog", category: .Dog)]
    // MARK: vocabulary
    var vocabulary: [Item<vocabularyCategory>] = [
        
        Item(title: "Pick The Correct Option".localiz(),
             imageName: "pickCorrect",
             category: .ptco),
        
        Item(title: "Three Letter Words".localiz(),
             imageName: "three",
             category: .tlw),
        
        Item(title: "Pick Correct Spelling".localiz(),
             imageName: "correctspelling",
             category: .pcs),
        
        Item(title: "Match Antonyms".localiz(),
             imageName: "antonyms",
             category: .ma),
        
        Item(title: "Four Letter Words".localiz(),
             imageName: "four",
             category: .flw),
        
        Item(title: "Pluar Form".localiz(),
             imageName: "plural",
             category: .pf),
        
        Item(title: "Rhyming Words".localiz(),
             imageName: "rhyming",
             category: .rw),
        
        Item(title: "Match Synonyms".localiz(),
             imageName: "synonyms",
             category: .ms),
        
        Item(title: "Match Animal Movement".localiz(),
             imageName: "matchanimal",
             category: .mam),
        
        Item(title: "Confusing Words".localiz(),
             imageName: "confusingwords",
             category: .cw)
    ]
    
    // MARK: Grammar
    let Grammar: [Item<GrammarCategory>] = [

        Item(
            title: "Match Words",
            imageName: "Number Names",
            category: .matchWords
        ),

        Item(
            title: "Order Sentence",
            imageName: "ordersentence",
            category: .orderSentence
        ),

        Item(
            title: "Sentence Type",
            imageName: "type",
            category: .sentenceType
        ),

        Item(
            title: "is / am / are",
            imageName: "is_am_are",
            category: .isAmAre
        ),

        Item(
            title: "was / were",
            imageName: "icwaswere",
            category: .wasWere
        ),

        Item(
            title: "Identify action verb",
            imageName: "verb",
            category: .identifyActionVerb
        ),

        Item(
            title: "Article",
            imageName: "article",
            category: .article
        ),

        Item(
            title: "Proper Noun",
            imageName: "propernoun",
            category: .properNoun
        )
    ]
    // MARK: Science
    let Science: [Item<ScienceCategory>] = [
        Item(
            title: "Domestic and Wild Animal",
            imageName: "domesticAnimal",
            category: .domasticAnimals
        ),
        Item(
            title: "Parts of Computer",
            imageName: "computer",
            category: .partsOfcomputer
        ),
        Item(
            title: "Parts of Plant",
            imageName: "plant",
            category: .partsOfplant
        ),
        Item(
            title: "Healthy and Unhealthy Food",
            imageName: "junkfood",
            category: .HealthyandUnhealthyFood
        ),
        Item(
            title: "Listen Health Food Habits",
            imageName: "listenlearn",
            category: .ListenHealthFoodHabits
        ),
        
        Item(
            title: "Healthy Food Habit",
            imageName: "eatvegetable",
            category: .healthyFoodHabits
        ),
        Item(
            title: "Parts of Dog",
            imageName: "dog",
            category: .partsOfDog
        ),

        Item(
            title: "Parts of Face",
            imageName: "face",
            category: .partsOfFace
        ),

        Item(
            title: "Parts of Human",
            imageName: "partofhuman",
            category: .partsOfHuman
        ),

        Item(
            title: "Parts of Tree",
            imageName: "tree",
            category: .partsOfTree
        ),

        Item(
            title: "Rainbow",
            imageName: "rainbow",
            category: .rainbow
        ),

        Item(
            title: "Parts of Fish",
            imageName: "fishcolorful",
            category: .partsOfFish
        ),

        Item(
            title: "Lighter and Heavier",
            imageName: "feather",
            category: .lighterAndHeavier
        ),

        Item(
            title: "Planets",
            imageName: "Planets",
            category: .planets
        )
    ]
    // MARK: WordSearch
    let WordSearch: [Item<WordSearchCategory>] = [

        Item(
            title: "Fun Days of the Week!",
            imageName: "weekdays",
            category: .daysOfWeek
        ),

        Item(
            title: "Fun Animals Around the World!",
            imageName: "domesticAnimal",
            category: .animalsAroundWorld
        ),

        Item(
            title: "Fun Months of the Year!",
            imageName: "months",
            category: .monthsOfYear
        ),

        Item(
            title: "Fun Planets of Our Solar System!",
            imageName: "Planets",
            category: .planets
        ),

        Item(
            title: "Community Helpers!",
            imageName: "communityhelper",
            category: .communityHelpers
        ),

        Item(
            title: "Fun Colors!",
            imageName: "rainbow",
            category: .colors
        ),

        Item(
            title: "Fun Vehicles!",
            imageName: "car",
            category: .vehicles
        ),

        Item(
            title: "Fun Kitchen!",
            imageName: "kitchen",
            category: .kitchen
        ),

        Item(
            title: "Fun Vegetables!",
            imageName: "eatvegetable",
            category: .vegetables
        )
    ]
    // MARK: Picture
    let Picture: [Item<PictureCategory>] = [

        Item(
            title: "Name the Picture".localiz(),
            imageName: "Picture",
            category: .nameThePicture
        ),

        Item(
            title: "Fill the Missing Letter".localiz(),
            imageName: "missing",
            category: .fillTheMissingLetter
        ),

        Item(
            title: "Match the Image with Letter".localiz(),
            imageName: "Number Names",
            category: .matchImageWithLetter
        ),
        
        Item(
            title: "Hear and Find".localiz(),
            imageName: "listenlearn",
            category: .matchImageWithLetter
        )
    ]
    
    // MARK: Solar System
    var SolarSystem: [Item<SolarSystemCategory>] = [
        
        Item(
            title: "Planets",
            imageName: "Planets",
            category: .planets
        ),
        
        Item(
            title: "Order of Planets",
            imageName: "order",
            category: .orderOfPlanets
        ),
        
        Item(
            title: "Identify Planet",
            imageName: "identifyplanet",
            category: .identifyPlanet
        )
    ]
}

protocol LevelConfigurable {
    var hasLevels: Bool { get }
    var levelCount: Int { get }
}
extension MathsCategory: LevelConfigurable {

    var hasLevels: Bool {
        switch self {
        case .findNumber, .tables, .numberNames, .countArithmetic, .calculateMoney, .biggestNumber, .smallestNumber, .descendingOrder, .ascendingOrder, .wordmath, .filltheMissingNumber:
            return true
        default:
            return false
        }
    }

    var levelCount: Int {
        switch self {
        case .numberNames:
            return 4
        case .findNumber:
            return 13
        case .countArithmetic:
            return 3
        case .calculateMoney:
                return 6
        case .biggestNumber:
            return 6
        case .smallestNumber:
            return 6
        case .ascendingOrder:
            return 6
        case .descendingOrder:
            return 6
        case .wordmath:
            return 4
        case .filltheMissingNumber:
            return 4
        case .tables:
            return 19
        default:
            return 0
        }
    }
}
extension FunColorCategory: LevelConfigurable {
    var hasLevels: Bool {
        switch self {
        case .coloring, .matchShape,.repeatShape:
            return true
        default:
            return false
        }
    }
    
    var levelCount: Int {
        switch self {
        case .coloring:
            return 10
        case .matchShape:
            return 3
        case .repeatShape:
            return 2
        default:
            return 0
        }
    }
    
    
}
extension LetterCategory: LevelConfigurable {
    var hasLevels: Bool {
        switch self {
        case .identifiyNumber,.numbers:
            return true
        default:
            return false
        }
    }
    
    var levelCount: Int {
        switch self {
        case .identifiyNumber:
            return 10
        case .numbers:
            return 10
        default:
            return 0
        }
    }
    
    
}
extension Item {
    var levelInfo: LevelConfigurable? {
        return category as? LevelConfigurable
    }
}
struct LevelRange {
    let start: Int
    let end: Int
}

struct LevelManager {

    static func range(for level: Int) -> LevelRange {

        switch level {
        case 1:
            return LevelRange(start: 1, end: 150)
        case 2:
            return LevelRange(start: 151, end: 300)
        case 3:
            return LevelRange(start: 301, end: 450)
        case 4:
            return LevelRange(start: 451, end: 650)
        case 5:
            return LevelRange(start: 651, end: 850)
        case 6:
            return LevelRange(start: 851, end: 1000)
        default:
            return LevelRange(start: 1, end: 1000)
        }
    }
}
struct NumberRange {
    let start: Int
    let end: Int
}

struct NumberLevelManager {

    static func range(for level: Int) -> NumberRange {

        switch level {
        case 1:
            return NumberRange(start: 1, end: 10)
        case 2:
            return NumberRange(start: 11, end: 20)
        case 3:
            return NumberRange(start: 21, end: 30)
        case 4:
            return NumberRange(start: 31, end: 40)
        case 5:
            return NumberRange(start: 41, end: 50)
        case 6:
            return NumberRange(start: 51, end: 60)
        case 7:
            return NumberRange(start: 61, end: 70)
            case 8:
            return NumberRange(start: 71, end: 80)
        case 9:
            return NumberRange(start: 81, end: 90)
        case 10:
            return NumberRange(start: 91, end: 100)
//            case 11:
//            return NumberRange(start: 1, end: 100)
        default:
            return NumberRange(start: 1, end: 100)
        }
    }
}
enum SolarSystemCategory {
    case planets
    case orderOfPlanets
    case identifyPlanet
}
extension SolarSystemCategory: LevelConfigurable {
    
    var hasLevels: Bool {
        switch self {
        case .planets, .orderOfPlanets, .identifyPlanet:
            return true
        }
    }
    
    var levelCount: Int {
        switch self {
        case .planets:
            return 5
        case .orderOfPlanets:
            return 3
        case .identifyPlanet:
            return 4
        }
    }
}
