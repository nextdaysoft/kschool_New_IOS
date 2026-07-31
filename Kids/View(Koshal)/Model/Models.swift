//
//  Item.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 18/12/25.
//

// Home screen
struct Category {
    let title: String
    let imageName: String
}
enum HomeCategory {
    case maths
    case letter
    case vehicle
    case color
    case sound
    case grammar
    case science
    case funcorner
    case reading
    case vocabulary
    case clock
    case picture
    case game
    case wordsearch
    case solarSystem
    case animals
    case frutisAndVegetables
    case country
    case phonics
    case guitar
    case calendar
    case measurement
    case roadSignsAndSignals
    case internalBodyParts
    case shapes
    case romanNumerals
    case seasons
    case idioms
    case vitamin
    case bloodGroup
    case directions
    case externalBodyParts
    case animalEatingStyle
    case animalFamilies
    case listenAndWatch

}

struct ItemOne {
    let title: String
    let imageName: String
}
struct Item<CategoryType> {
    let title: String
    let imageName: String
    let category: CategoryType
}
// MARK: MATH
enum MathsCategory {
    case numberNames
    case findNumber
    case tables
    case count
    case compareNumber
    case afterNumber
    case beforeNumber
    case countArithmetic
    case calculateMoney
    case addition
    case subtraction
    case findvalue
    case biggestNumber
    case smallestNumber
    case ascendingOrder
    case descendingOrder
    case fractions
    case wordmath
    case filltheMissingNumber
    
   
}
// MARK: LETTER
enum LetterCategory {
    case capitalLetters
    case smallLetters
    case numbers
    case capitalCursive
    case smallCursive
    case identifiyLetter
    case identifiyNumber
    case alphabetRhymes
    case connectVowel
}
enum SoundCategory {
    case LisLearn
    case GTSound
    case LTASound
    case GTASound
    case LVNSound
    case GVSound
}
enum FunColorCategory {
    case coloring
    case matchShape
    case maze
    case orderShape
    case repeatShape
    case drawing
    case whatcomeNext
}
enum GameCategory {
    case findPair
    case ballshortGame
    case remembershapeandcolor
    case findtheorder
    case shadowmatchgame
}
enum clockCategory {
    case SetTime
    case WriteTime
    case SetTimeQuarter
    case WriteTimeQuarter
    case SetTimeMinute
    case WriteTimeMinute
}
enum readingCategory {
    case apple
    case Dog
    case Cat
    case Ball
    case sun
    case Fish
    case Bird
    case car
    case Tree
    case Banana
}
enum vocabularyCategory {
    case ptco
    case tlw
    case pcs
    case ma
    case flw
    case pf
    case rw
    case ms
    case mam
    case cw
}
enum GrammarCategory {
    case matchWords
    case orderSentence
    case sentenceType
    case isAmAre
    case wasWere
    case identifyActionVerb
    case article
    case properNoun
}
enum ScienceCategory {
    case healthyFoodHabits
    case partsOfDog
    case partsOfFace
    case partsOfHuman
    case partsOfTree
    case rainbow
    case partsOfFish
    case lighterAndHeavier
    case planets
    case ListenHealthFoodHabits
    case HealthyandUnhealthyFood
    case partsOfplant
    case partsOfcomputer
    case domasticAnimals
}
enum WordSearchCategory {
    case daysOfWeek
    case animalsAroundWorld
    case monthsOfYear
    case planets
    case communityHelpers
    case colors
    case vehicles
    case kitchen
    case vegetables
}
enum PictureCategory {
    case nameThePicture
    case fillTheMissingLetter
    case matchImageWithLetter
}


