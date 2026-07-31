//
//  ScreenRouter.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 16/01/26.
//


import UIKit

struct ScreenRouter {

    static func route(
        from vc: UIViewController,
        item: SubItem,
        level: Int?
    ) {
        
        switch item.screenType {
            
        case .question:
            let qvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "Question"
            ) as! Question
            
            qvc.screenTitle = item.title
            qvc.selectedLevel = level
            qvc.levelRange = level != nil
            ? LevelManager.range(for: level!)
            : nil
            
            qvc.isBiggestNumber = (item.title == "Biggest Number")
            
            vc.navigationController?.pushViewController(qvc, animated: true)
            
        case .findNumber:
            let fvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "FindNumberVC"
            ) as! FindNumberVC
            
            //fvc.level = level
            vc.navigationController?.pushViewController(fvc, animated: true)
            
        case .numberNames:
            let nvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "NumbersNamesMenuVC"
            ) as! NumbersNamesMenuVC
            
            vc.navigationController?.pushViewController(nvc, animated: true)
            
        case .tables:
            let mvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "TablesVC"
            ) as! TablesVC
            mvc.currentTable = level ?? 2
            vc.navigationController?.pushViewController(mvc, animated: true)
            
        case .counting:
            let cvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "CountVC"
            ) as! CountVC
            
            //cvc.level = level
            vc.navigationController?.pushViewController(cvc, animated: true)
            
        case .beforeAfter:
            let qvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "AfterBefore"
            ) as! AfterBefore
            
            qvc.screenTitle = item.title
            qvc.isBeforeNumber = (item.title == "Before Number")
            
            vc.navigationController?.pushViewController(qvc, animated: true)
        case .compareNumbers:
            let cnovc = vc.storyboard?.instantiateViewController(
                withIdentifier: "CompareNo"
            ) as! CompareNo
            
            vc.navigationController?.pushViewController(cnovc, animated: true)
        case .plusminus:
            let pmcvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "AdditionSubstraction"
            ) as! AdditionSubstraction
            
            pmcvc.screenTitle = item.title
            pmcvc.isPlus = (item.title == "Addition")
            vc.navigationController?.pushViewController(pmcvc, animated: true)
        case .fraction:
            let favc = vc.storyboard?.instantiateViewController(
                withIdentifier: "Fraction"
            ) as! Fraction
            
            vc.navigationController?.pushViewController(favc, animated: true)
        case .wordMath:
            let wmvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "WordMath"
            ) as! WordMath
            
            vc.navigationController?.pushViewController(wmvc, animated: true)
            //        case .Money:
            //            let mmvc = vc.storyboard?.instantiateViewController(
            //                withIdentifier: "Money"
            //            ) as! Money
            //            mmvc.selectedLevel = level ?? 1 
            //            vc.navigationController?.pushViewController(mmvc, animated: true)
        case .FTMV:
            let ftmvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "FindMissingValue"
            ) as! FindMissingValue
           // ftmvc.selectedLevel = level ?? 1
            vc.navigationController?.pushViewController(ftmvc, animated: true)
        case .MatchShape:
            let mshvc = vc.storyboard?.instantiateViewController(
                withIdentifier: "MatchShape"
            ) as! MatchShape
            mshvc.selectedLevel = level ?? 1
            vc.navigationController?.pushViewController(mshvc, animated: true)
        case .OrderShape:
            let oshvc = vc.storyboard?.instantiateViewController(withIdentifier: "OrderShape") as! OrderShape
            oshvc.selectedLevel = level ?? 1
            vc.navigationController?.pushViewController(oshvc, animated: true)
        case .PatternRepeat:
            let prvc = vc.storyboard?.instantiateViewController(withIdentifier: "PatternRepeat") as! PatternRepeat
            prvc.selectedLevel = level ?? 1
            vc.navigationController?.pushViewController(prvc, animated: true)
        case .Drawing:
            let dmvc = vc.storyboard?.instantiateViewController(withIdentifier: "Drawing") as! Drawing
            vc.navigationController?.pushViewController(dmvc, animated: true)
        case .WcomeNext:
            let wvc = vc.storyboard?.instantiateViewController(withIdentifier: "WhatComeNextJD") as! WhatComeNextJD
            vc.navigationController?.pushViewController(wvc, animated: true)
        case .CapitalLetters:
            let clvc = vc.storyboard?.instantiateViewController(withIdentifier: "DrawLetters") as! DrawLetters
            vc.navigationController?.pushViewController(clvc, animated: true)
        case .identifyNumbers:
            let invc = vc.storyboard?.instantiateViewController(withIdentifier: "NumLett") as! NumLett
            invc.selectedLevel = level ?? 1
            invc.levelRange = level != nil
            ? NumberLevelManager.range(for: level!)
            : nil
            vc.navigationController?.pushViewController(invc, animated: true)
        case .identifyLetters:
            let illvc = vc.storyboard?.instantiateViewController(withIdentifier: "IdentityLetter") as! IdentityLetter
            vc.navigationController?.pushViewController(illvc, animated: true)
        case .cursiveCapital:
            let clvc = vc.storyboard?.instantiateViewController(withIdentifier: "DrawLetters") as! DrawLetters
            clvc.letterStyle = .cursive
            vc.navigationController?.pushViewController(clvc, animated: true)
        case .numbers:
            let nvc = vc.storyboard?.instantiateViewController(withIdentifier: "Numbers") as! Numbers
            vc.navigationController?.pushViewController(nvc, animated: true)
        }
    }
}
enum ScreenType {
    case question
    case findNumber
    case numberNames
    case tables
    case counting
    case beforeAfter
    case compareNumbers
    case plusminus
    case fraction
    case wordMath
    //case Money
    case FTMV
    case MatchShape
    case OrderShape
    case PatternRepeat
    case Drawing
    case WcomeNext
    case CapitalLetters
    case cursiveCapital
    case identifyNumbers
    case identifyLetters
    case numbers
//    case Maze
}
