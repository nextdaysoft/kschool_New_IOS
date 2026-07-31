//
//  SmallLetterStrokeData.swift
//  KSchool
//
//  Created by Koshal Singh on 02/05/26.
//

import Foundation
import UIKit

final class SmallAlphabetPathProvider {

    static func strokeData(for letter: Character) -> LetterStrokeData {

        switch letter {

        case "a": return smallA()
        case "b": return smallB()
        case "c": return smallC()
        case "d": return smallD()
        case "e": return smallE()
        case "f": return smallF()
        case "g": return smallG()
        case "h": return smallH()
        case "i": return smallI()
        case "j": return smallJ()
        case "k": return smallK()
        case "l": return smallL()
        case "m": return smallM()
        case "n": return smallN()
        case "o": return smallO()
        case "p": return smallP()
        case "q": return smallQ()
        case "r": return smallR()
        case "s": return smallS()
        case "t": return smallT()
        case "u": return smallU()
        case "v": return smallV()
        case "w": return smallW()
        case "x": return smallX()
        case "y": return smallY()
        case "z": return smallZ()
            
            
        default:
            return LetterStrokeData(
                paths: [],
                isLoop: false
            )
        }
    }

    private static func p(
        _ build: (UIBezierPath) -> Void
    ) -> UIBezierPath {

        let path = UIBezierPath()

        build(path)

        return path
    }

    // MARK: a
    private static func smallA() -> LetterStrokeData {

        let path = p {

            // start top center (pointer position)
            $0.move(to: CGPoint(x: 0.60, y: 0.40))

            // left outer curve
            $0.addCurve(
                to: CGPoint(x: 0.35, y: 0.58),
                controlPoint1: CGPoint(x: 0.46, y: 0.34),
                controlPoint2: CGPoint(x: 0.34, y: 0.46)
            )

            // bottom round loop
            $0.addCurve(
                to: CGPoint(x: 0.54, y: 0.74),
                controlPoint1: CGPoint(x: 0.38, y: 0.74),
                controlPoint2: CGPoint(x: 0.48, y: 0.78)
            )

            // go back upward toward top join
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.40),
                controlPoint1: CGPoint(x: 0.66, y: 0.66),
                controlPoint2: CGPoint(x: 0.68, y: 0.48)
            )

            // right tail downward
            $0.addCurve(
                to: CGPoint(x: 0.78, y: 0.75),
                controlPoint1: CGPoint(x: 0.62, y: 0.50),
                controlPoint2: CGPoint(x: 0.68, y: 0.62)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    // MARK: b

    private static func smallB() -> LetterStrokeData {

        let path = p {

            // start top
            $0.move(to: CGPoint(x: 0.52, y: 0.18))

            // straight down stroke
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.72),
                controlPoint1: CGPoint(x: 0.52, y: 0.35),
                controlPoint2: CGPoint(x: 0.48, y: 0.58)
            )

            // bottom small curve
            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.80),
                controlPoint1: CGPoint(x: 0.50, y: 0.78),
                controlPoint2: CGPoint(x: 0.55, y: 0.82)
            )

            // right side loop
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.52),
                controlPoint1: CGPoint(x: 0.75, y: 0.78),
                controlPoint2: CGPoint(x: 0.76, y: 0.55)
            )

        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }

    // MARK: c

    private static func smallC() -> LetterStrokeData {

        let path = p {

            // start top-right
            $0.move(to: CGPoint(x: 0.66, y: 0.34))

            // upper curve
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.52),
                controlPoint1: CGPoint(x: 0.52, y: 0.28),
                controlPoint2: CGPoint(x: 0.40, y: 0.38)
            )

            // lower curve
            $0.addCurve(
                to: CGPoint(x: 0.66, y: 0.70),
                controlPoint1: CGPoint(x: 0.42, y: 0.68),
                controlPoint2: CGPoint(x: 0.54, y: 0.76)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: false
        )
    }

    // MARK: d
    private static func smallD() -> LetterStrokeData {

        let path = p {

            // start top
            $0.move(to: CGPoint(x: 0.60, y: 0.18))

            // straight down
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.76),
                controlPoint1: CGPoint(x: 0.60, y: 0.35),
                controlPoint2: CGPoint(x: 0.60, y: 0.60)
            )

            // bottom left curve
            $0.addCurve(
                to: CGPoint(x: 0.38, y: 0.62),
                controlPoint1: CGPoint(x: 0.56, y: 0.82),
                controlPoint2: CGPoint(x: 0.42, y: 0.80)
            )

            // upper left curve
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.46),
                controlPoint1: CGPoint(x: 0.30, y: 0.46),
                controlPoint2: CGPoint(x: 0.48, y: 0.38)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }

    // MARK: e
    private static func smallE() -> LetterStrokeData {

        let path = p {

            // Start from left
            $0.move(to: CGPoint(x: 0.48, y: 0.52))

            // Slight downward slant
            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.50),
                controlPoint1: CGPoint(x: 0.50, y: 0.54),
                controlPoint2: CGPoint(x: 0.56, y: 0.56)
            )

            // Go upward
            $0.addCurve(
                to: CGPoint(x: 0.61, y: 0.32),
                controlPoint1: CGPoint(x: 0.66, y: 0.46),
                controlPoint2: CGPoint(x: 0.66, y: 0.36)
            )

            // Make circular loop
            $0.addCurve(
                to: CGPoint(x: 0.46, y: 0.41),
                controlPoint1: CGPoint(x: 0.56, y: 0.28),
                controlPoint2: CGPoint(x: 0.46, y: 0.30)
            )

            // Come downward
            $0.addCurve(
                to: CGPoint(x: 0.66, y: 0.65),
                controlPoint1: CGPoint(x: 0.44, y: 0.55),
                controlPoint2: CGPoint(x: 0.50, y: 0.76)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    // MARK: f

    private static func smallF() -> LetterStrokeData {

        // Main vertical stroke
        let stroke1 = p {

            // top hook
            $0.move(to: CGPoint(x: 0.62, y: 0.20))

            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.38),
                controlPoint1: CGPoint(x: 0.52, y: 0.20),
                controlPoint2: CGPoint(x: 0.46, y: 0.28)
            )

            // long down stroke
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.82),
                controlPoint1: CGPoint(x: 0.50, y: 0.50),
                controlPoint2: CGPoint(x: 0.50, y: 0.70)
            )
        }

        // Cross line
        let stroke2 = p {

            $0.move(to: CGPoint(x: 0.40, y: 0.50))

            $0.addLine(to: CGPoint(x: 0.62, y: 0.50))
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2],
            isLoop: false
        )
    }
    
    // MARK: g
    private static func smallG() -> LetterStrokeData {

        let path = p {

            // Start top-right of circular head
            $0.move(to: CGPoint(x: 0.62, y: 0.28))

            // upper-left round
            $0.addCurve(
                to: CGPoint(x: 0.35, y: 0.48),
                controlPoint1: CGPoint(x: 0.46, y: 0.22),
                controlPoint2: CGPoint(x: 0.32, y: 0.34)
            )

            // lower-left
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.68),
                controlPoint1: CGPoint(x: 0.35, y: 0.64),
                controlPoint2: CGPoint(x: 0.42, y: 0.72)
            )

            // close circular head
            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.28),
                controlPoint1: CGPoint(x: 0.72, y: 0.64),
                controlPoint2: CGPoint(x: 0.74, y: 0.36)
            )

            // rounded stem attached to circle
            $0.addCurve(
                to: CGPoint(x: 0.64, y: 0.92),
                controlPoint1: CGPoint(x: 0.72, y: 0.38),
                controlPoint2: CGPoint(x: 0.70, y: 0.78)
            )

            // bottom round turn
            $0.addCurve(
                to: CGPoint(x: 0.39, y: 0.82),
                controlPoint1: CGPoint(x: 0.64, y: 1.02),
                controlPoint2: CGPoint(x: 0.37, y: 0.98)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: false
        )
    }
   
    
    // MARK: h

    private static func smallH() -> LetterStrokeData {

        // first vertical line
        let stroke1 = p {

            $0.move(to: CGPoint(x: 0.48, y: 0.18))

            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.78),
                controlPoint1: CGPoint(x: 0.48, y: 0.36),
                controlPoint2: CGPoint(x: 0.48, y: 0.62)
            )
        }

        // second hump
        let stroke2 = p {

            $0.move(to: CGPoint(x: 0.48, y: 0.48))

            $0.addCurve(
                to: CGPoint(x: 0.66, y: 0.78),
                controlPoint1: CGPoint(x: 0.62, y: 0.42),
                controlPoint2: CGPoint(x: 0.68, y: 0.64)
            )
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2],
            isLoop: false
        )
    }
    
    // MARK: i
    private static func smallI() -> LetterStrokeData {

        // Dot
        let stroke1 = p {

            // Dot

            $0.move(to: CGPoint(x: 0.50, y: 0.14))
            $0.addLine(to: CGPoint(x: 0.50, y: 0.15))
        }

        // Body
        let stroke2 = p {

            // Body
            $0.move(to: CGPoint(x: 0.50, y: 0.38))
            $0.addLine(to: CGPoint(x: 0.50, y: 0.68))
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2],
            isLoop: false
        )
    }

    
    // MARK: j

    private static func smallJ() -> LetterStrokeData {

        // Dot
        let stroke1 = p {

            // Dot first aur second guide ke beech
            $0.move(to: CGPoint(x: 0.52, y: 0.14))
            $0.addLine(to: CGPoint(x: 0.52, y: 0.15))
        }

        // Main stroke
        let stroke2 = p {

            // x-height se start
            $0.move(to: CGPoint(x: 0.52, y: 0.38))

            // Baseline cross karke bottom line tak
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.90),
                controlPoint1: CGPoint(x: 0.52, y: 0.55),
                controlPoint2: CGPoint(x: 0.52, y: 0.78)
            )

            // Bottom hook (bottom guide ko touch kare)
            $0.addCurve(
                to: CGPoint(x: 0.36, y: 0.82),
                controlPoint1: CGPoint(x: 0.50, y: 0.95),
                controlPoint2: CGPoint(x: 0.40, y: 0.92)
            )
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2],
            isLoop: false
        )
    }
    
    // MARK: k
    private static func smallK() -> LetterStrokeData {

        // Main vertical stroke (Top guide -> Baseline)
        let stroke1 = p {

            // Top guide line ko touch
            $0.move(to: CGPoint(x: 0.50, y: 0.12))

            // Baseline tak
            $0.addLine(to: CGPoint(x: 0.50, y: 0.68))
        }

        // Upper diagonal
        let stroke2 = p {

            $0.move(to: CGPoint(x: 0.50, y: 0.45))

            $0.addLine(to: CGPoint(x: 0.68, y: 0.28))
        }

        // Lower diagonal
        let stroke3 = p {

            $0.move(to: CGPoint(x: 0.50, y: 0.45))

            $0.addLine(to: CGPoint(x: 0.70, y: 0.68))
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2, stroke3],
            isLoop: false
        )
    }
    
    // MARK: l

    private static func smallL() -> LetterStrokeData {

        let stroke1 = p {

            // straight vertical line
            $0.move(to: CGPoint(x: 0.50, y: 0.18))

            $0.addLine(to: CGPoint(x: 0.50, y: 0.82))
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    // MARK: m

    private static func smallM() -> LetterStrokeData {

        let stroke1 = p {

            // left vertical start
            $0.move(to: CGPoint(x: 0.40, y: 0.62))

            // first hump
           $0.addCurve(
               to: CGPoint(x: 0.52, y: 0.56),
               controlPoint1: CGPoint(x: 0.40, y: 0.28),
               controlPoint2: CGPoint(x: 0.52, y: 0.28)
           )

           // second hump starts immediately from higher point
           $0.addCurve(
               to: CGPoint(x: 0.66, y: 0.62),
               controlPoint1: CGPoint(x: 0.52, y: 0.28),
               controlPoint2: CGPoint(x: 0.66, y: 0.28)
           )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    // MARK: n
    private static func smallN() -> LetterStrokeData {

        let stroke1 = p {

            // top-left start
            $0.move(to: CGPoint(x: 0.44, y: 0.38))

            // come down first (more tilted right)
            $0.addCurve(
                to: CGPoint(x: 0.53, y: 0.64),
                controlPoint1: CGPoint(x: 0.48, y: 0.46),
                controlPoint2: CGPoint(x: 0.53, y: 0.58)
            )

            // immediately go up and make hump
            $0.addCurve(
                to: CGPoint(x: 0.63, y: 0.64),
                controlPoint1: CGPoint(x: 0.50, y: 0.24),
                controlPoint2: CGPoint(x: 0.63, y: 0.40)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    
    // MARK: o

    private static func smallO() -> LetterStrokeData {

        let stroke1 = p {

            // start top
            $0.move(to: CGPoint(x: 0.52, y: 0.30))

            // left side
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.50),
                controlPoint1: CGPoint(x: 0.42, y: 0.30),
                controlPoint2: CGPoint(x: 0.38, y: 0.40)
            )

            // bottom
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.70),
                controlPoint1: CGPoint(x: 0.40, y: 0.64),
                controlPoint2: CGPoint(x: 0.46, y: 0.70)
            )

            // right side
            $0.addCurve(
                to: CGPoint(x: 0.64, y: 0.50),
                controlPoint1: CGPoint(x: 0.60, y: 0.70),
                controlPoint2: CGPoint(x: 0.64, y: 0.62)
            )

            // close top
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.30),
                controlPoint1: CGPoint(x: 0.64, y: 0.38),
                controlPoint2: CGPoint(x: 0.60, y: 0.30)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    // MARK: p
    private static func smallP() -> LetterStrokeData {

        let stroke1 = p {

            // Start from very bottom
            $0.move(to: CGPoint(x: 0.50, y: 1.00))

            // Go straight up
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.34),
                controlPoint1: CGPoint(x: 0.50, y: 0.86),
                controlPoint2: CGPoint(x: 0.50, y: 0.56)
            )

            // Bigger top bowl
            $0.addCurve(
                to: CGPoint(x: 0.72, y: 0.54),
                controlPoint1: CGPoint(x: 0.66, y: 0.30),
                controlPoint2: CGPoint(x: 0.76, y: 0.40)
            )

            // Close the bigger bowl
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.54),
                controlPoint1: CGPoint(x: 0.70, y: 0.68),
                controlPoint2: CGPoint(x: 0.56, y: 0.58)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    
    // MARK: q
    private static func smallQ() -> LetterStrokeData {

        let stroke1 = p {

            // start from bottom of long line
            $0.move(to: CGPoint(x: 0.56, y: 0.82))

            // go upward
            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.30),
                controlPoint1: CGPoint(x: 0.56, y: 0.68),
                controlPoint2: CGPoint(x: 0.56, y: 0.46)
            )

            // move left and create round shape
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.46),
                controlPoint1: CGPoint(x: 0.46, y: 0.28),
                controlPoint2: CGPoint(x: 0.40, y: 0.36)
            )

            // lower round
            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.52),
                controlPoint1: CGPoint(x: 0.42, y: 0.58),
                controlPoint2: CGPoint(x: 0.48, y: 0.54)
            )

            // very small touch curve
            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.43),
                controlPoint1: CGPoint(x: 0.565, y: 0.44),
                controlPoint2: CGPoint(x: 0.56, y: 0.435)
            )

            // tail at original place
            $0.move(to: CGPoint(x: 0.56, y: 0.82))
            $0.addLine(to: CGPoint(x: 0.68, y: 0.68))
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    
    // MARK: r

    private static func smallR() -> LetterStrokeData {

        let stroke1 = p {

            // start top
            $0.move(to: CGPoint(x: 0.50, y: 0.30))

            // straight down
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.72),
                controlPoint1: CGPoint(x: 0.50, y: 0.45),
                controlPoint2: CGPoint(x: 0.50, y: 0.60)
            )

            // go back slightly up
            $0.move(to: CGPoint(x: 0.50, y: 0.46))

            // small right curve
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.36),
                controlPoint1: CGPoint(x: 0.54, y: 0.40),
                controlPoint2: CGPoint(x: 0.58, y: 0.36)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    // MARK: s
    private static func smallS() -> LetterStrokeData {

        let path = p {

            // Start at x-height
            $0.move(to: CGPoint(x: 0.60, y: 0.36))

            // Upper curve
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.50),
                controlPoint1: CGPoint(x: 0.48, y: 0.30),
                controlPoint2: CGPoint(x: 0.34, y: 0.40)
            )

            // Middle turn
            $0.addCurve(
                to: CGPoint(x: 0.63, y: 0.62),
                controlPoint1: CGPoint(x: 0.46, y: 0.56),
                controlPoint2: CGPoint(x: 0.66, y: 0.54)
            )

            // Bottom curve (baseline tak)
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.72),
                controlPoint1: CGPoint(x: 0.58, y: 0.72),
                controlPoint2: CGPoint(x: 0.48, y: 0.76)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: false
        )
    }
    
    
    // MARK: t

    private static func smallT() -> LetterStrokeData {

        let stroke1 = p {

            // start top
            $0.move(to: CGPoint(x: 0.54, y: 0.24))

            // long down stroke
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.76),
                controlPoint1: CGPoint(x: 0.52, y: 0.44),
                controlPoint2: CGPoint(x: 0.46, y: 0.66)
            )

            // small bottom curve right
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.72),
                controlPoint1: CGPoint(x: 0.52, y: 0.78),
                controlPoint2: CGPoint(x: 0.58, y: 0.76)
            )
        }

        let stroke2 = p {

            // middle cross line
            $0.move(to: CGPoint(x: 0.42, y: 0.42))

            $0.addLine(to: CGPoint(x: 0.60, y: 0.42))
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2],
            isLoop: false
        )
    }
    
    // MARK: u

    private static func smallU() -> LetterStrokeData {

        let stroke1 = p {

            // start left top
            $0.move(to: CGPoint(x: 0.44, y: 0.34))

            // go down
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.70),
                controlPoint1: CGPoint(x: 0.42, y: 0.56),
                controlPoint2: CGPoint(x: 0.44, y: 0.70)
            )

            // go up right
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.34),
                controlPoint1: CGPoint(x: 0.58, y: 0.70),
                controlPoint2: CGPoint(x: 0.60, y: 0.52)
            )

            // small exit tail
            $0.addCurve(
                to: CGPoint(x: 0.66, y: 0.50),
                controlPoint1: CGPoint(x: 0.60, y: 0.42),
                controlPoint2: CGPoint(x: 0.64, y: 0.48)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    // MARK: v

    private static func smallV() -> LetterStrokeData {

        let stroke1 = p {

            // start left top
            $0.move(to: CGPoint(x: 0.44, y: 0.34))

            // go down center
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.70),
                controlPoint1: CGPoint(x: 0.48, y: 0.50),
                controlPoint2: CGPoint(x: 0.50, y: 0.64)
            )

            // go up right
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.34),
                controlPoint1: CGPoint(x: 0.54, y: 0.60),
                controlPoint2: CGPoint(x: 0.58, y: 0.46)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    // MARK: w

    private static func smallW() -> LetterStrokeData {

        let stroke1 = p {

            // start left top
            $0.move(to: CGPoint(x: 0.42, y: 0.34))

            // first down
            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.70),
                controlPoint1: CGPoint(x: 0.44, y: 0.54),
                controlPoint2: CGPoint(x: 0.46, y: 0.66)
            )

            // first up
            $0.addCurve(
                to: CGPoint(x: 0.54, y: 0.46),
                controlPoint1: CGPoint(x: 0.50, y: 0.60),
                controlPoint2: CGPoint(x: 0.52, y: 0.50)
            )

            // second down
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.70),
                controlPoint1: CGPoint(x: 0.56, y: 0.54),
                controlPoint2: CGPoint(x: 0.58, y: 0.66)
            )

            // second up
            $0.addCurve(
                to: CGPoint(x: 0.66, y: 0.34),
                controlPoint1: CGPoint(x: 0.62, y: 0.58),
                controlPoint2: CGPoint(x: 0.64, y: 0.46)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    // MARK: x

    private static func smallX() -> LetterStrokeData {

        // first diagonal
        let stroke1 = p {

            $0.move(to: CGPoint(x: 0.44, y: 0.34))

            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.72),
                controlPoint1: CGPoint(x: 0.50, y: 0.48),
                controlPoint2: CGPoint(x: 0.56, y: 0.60)
            )
        }

        // second diagonal
        let stroke2 = p {

            $0.move(to: CGPoint(x: 0.62, y: 0.34))

            $0.addCurve(
                to: CGPoint(x: 0.44, y: 0.72),
                controlPoint1: CGPoint(x: 0.56, y: 0.48),
                controlPoint2: CGPoint(x: 0.50, y: 0.60)
            )
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2],
            isLoop: false
        )
    }
    
    // MARK: y

    private static func smallY() -> LetterStrokeData {

        let stroke1 = p {

            // start left top
            $0.move(to: CGPoint(x: 0.44, y: 0.34))

            // small left curve down
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.54),
                controlPoint1: CGPoint(x: 0.44, y: 0.48),
                controlPoint2: CGPoint(x: 0.46, y: 0.56)
            )

            // up slightly right
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.34),
                controlPoint1: CGPoint(x: 0.58, y: 0.54),
                controlPoint2: CGPoint(x: 0.60, y: 0.46)
            )

            // long down stroke
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.82),
                controlPoint1: CGPoint(x: 0.60, y: 0.62),
                controlPoint2: CGPoint(x: 0.58, y: 0.76)
            )

            // bottom left hook
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.72),
                controlPoint1: CGPoint(x: 0.48, y: 0.86),
                controlPoint2: CGPoint(x: 0.42, y: 0.80)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    // MARK: z

    private static func smallZ() -> LetterStrokeData {

        let stroke1 = p {

            // top horizontal
            $0.move(to: CGPoint(x: 0.42, y: 0.34))

            $0.addLine(to: CGPoint(x: 0.60, y: 0.34))

            // diagonal down left
            $0.addLine(to: CGPoint(x: 0.44, y: 0.60))

            // bottom horizontal
            $0.addLine(to: CGPoint(x: 0.60, y: 0.60))
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
}
import SwiftUI

struct SmallLetterPreviewRepresentable: UIViewRepresentable {

    let letter: Character

    func makeUIView(context: Context) -> LetterPreviewView {

        let view = LetterPreviewView()
        view.backgroundColor = .white
        return view
    }

    func updateUIView(_ uiView: LetterPreviewView, context: Context) {
        uiView.letter = letter
    }
}
import SwiftUI

struct SmallLetterTesterView: View {

    @State private var letter: Character = "p"

    var body: some View {

        VStack(spacing: 20) {

            SmallLetterPreviewRepresentable(letter: letter)
                .frame(width: 300, height: 300)
                .border(.gray)

            HStack {

                Button("A") {
                    letter = "a"
                }

                Button("B") {
                    letter = "b"
                }

                Button("M") {
                    letter = "m"
                }

                Button("Z") {
                    letter = "z"
                }
            }
        }
        .padding()
    }
}

#Preview {
    SmallLetterTesterView()
}
