//
//  SmallCursiveStrokeData.swift
//  New
//
//  Created by Koshal Singh on 29/05/26.
//

import Foundation
import UIKit

final class SmallCursiveAlphabetPath {

    private static func norm(_ v: CGFloat, _ min: CGFloat, _ max: CGFloat) -> CGFloat {
        (v - min) / (max - min)
    }
    
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

            // Start from left baseline
            $0.move(to: CGPoint(x: 0.25, y: 0.75))

            // Upward entry stroke
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.43),
                controlPoint1: CGPoint(x: 0.34, y: 0.72),
                controlPoint2: CGPoint(x: 0.46, y: 0.46)
            )

            // Down left side of loop
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.72),
                controlPoint1: CGPoint(x: 0.48, y: 0.46),
                controlPoint2: CGPoint(x: 0.34, y: 0.58)
            )

            // Bottom round loop
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.68),
                controlPoint1: CGPoint(x: 0.48, y: 0.78),
                controlPoint2: CGPoint(x: 0.56, y: 0.78)
            )

            // Back up to touch the upper stroke
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.43),
                controlPoint1: CGPoint(x: 0.62, y: 0.62),
                controlPoint2: CGPoint(x: 0.56, y: 0.42)
            )

            // Come back down following the same flow
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.60),
                controlPoint1: CGPoint(x: 0.54, y: 0.42),
                controlPoint2: CGPoint(x: 0.58, y: 0.50)
            )

            // Right exit stroke (left and lower)
            $0.addCurve(
                to: CGPoint(x: 0.68, y: 0.73),
                controlPoint1: CGPoint(x: 0.59, y: 0.64),
                controlPoint2: CGPoint(x: 0.64, y: 0.75)
            )

            // Small upward finish
            $0.addCurve(
                to: CGPoint(x: 0.73, y: 0.62),
                controlPoint1: CGPoint(x: 0.73, y: 0.68),
                controlPoint2: CGPoint(x: 0.73, y: 0.64)
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

            $0.move(to: CGPoint(x: 0.38, y: 0.80))

            $0.addCurve(
                to: CGPoint(x: 0.54, y: 0.16),
                controlPoint1: CGPoint(x: 0.46, y: 0.72),
                controlPoint2: CGPoint(x: 0.58, y: 0.30)
            )
            
            // Come down left side with outward curve
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.62),
                controlPoint1: CGPoint(x: 0.48, y: 0.28),
                controlPoint2: CGPoint(x: 0.38, y: 0.48)
            )
            
            // Bottom round loop
            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.62),
                controlPoint1: CGPoint(x: 0.46, y: 0.82),
                controlPoint2: CGPoint(x: 0.60, y: 0.82)
            )

            // Small left turn
            $0.addCurve(
                to: CGPoint(x: 0.53, y: 0.60),
                controlPoint1: CGPoint(x: 0.60, y: 0.48),
                controlPoint2: CGPoint(x: 0.50, y: 0.52)
            )

            // Exit to right
            $0.addCurve(
                to: CGPoint(x: 0.70, y: 0.60),
                controlPoint1: CGPoint(x: 0.60, y: 0.63),
                controlPoint2: CGPoint(x: 0.70, y: 0.60)
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

            // Start more left & lower
            $0.move(to: CGPoint(x: 0.18, y: 0.72))

            // Same stroke me upar le jao
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.35),
                controlPoint1: CGPoint(x: 0.34, y: 0.80),
                controlPoint2: CGPoint(x: 0.34, y: 0.31)
            )

            // Right side se niche aao
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.74),
                controlPoint1: CGPoint(x: 0.53, y: 0.28),
                controlPoint2: CGPoint(x: 0.20, y: 0.60)
            )

            // Bottom hook
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.65),
                controlPoint1: CGPoint(x: 0.50, y: 0.80),
                controlPoint2: CGPoint(x: 0.60, y: 0.68)
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

            // Start from bottom-left
            $0.move(to: CGPoint(x: 0.25, y: 0.75))

            // Existing curve (same)
            $0.addCurve(
                to: CGPoint(x: 0.57, y: 0.48),
                controlPoint1: CGPoint(x: 0.30, y: 0.65),
                controlPoint2: CGPoint(x: 0.40, y: 0.40)
            )

            // Left side bottom loop
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.82),
                controlPoint1: CGPoint(x: 0.29, y: 0.48),
                controlPoint2: CGPoint(x: 0.34, y: 0.82)
            )

            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.74),
                controlPoint1: CGPoint(x: 0.48, y: 0.82),
                controlPoint2: CGPoint(x: 0.54, y: 0.80)
            )

            // Top se halka sa left ghumao
            $0.addCurve(
                to: CGPoint(x: 0.54, y: 0.20),
                controlPoint1: CGPoint(x: 0.60, y: 0.14),
                controlPoint2: CGPoint(x: 0.56, y: 0.14)
            )

            // Stem ke bilkul paas se niche lao (shorter)
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.72),
                controlPoint1: CGPoint(x: 0.48, y: 0.32),
                controlPoint2: CGPoint(x: 0.50, y: 0.55)
            )

            // Niche cross karke right niklo
            $0.addCurve(
                to: CGPoint(x: 0.68, y: 0.68),
                controlPoint1: CGPoint(x: 0.60, y: 0.79),
                controlPoint2: CGPoint(x: 0.64, y: 0.72)
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

            // Start bottom-left (more left)
            $0.move(to: CGPoint(x: 0.08, y: 0.68))

            // Smooth rise toward top-right
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.24),
                controlPoint1: CGPoint(x: 0.28, y: 0.68),
                controlPoint2: CGPoint(x: 0.56, y: 0.42)
            )

            // Top loop toward left
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.18),
                controlPoint1: CGPoint(x: 0.58, y: 0.16),
                controlPoint2: CGPoint(x: 0.48, y: 0.14)
            )

            // Flow down left side
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.60),
                controlPoint1: CGPoint(x: 0.34, y: 0.28),
                controlPoint2: CGPoint(x: 0.34, y: 0.50)
            )

            // Bottom turn
            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.66),
                controlPoint1: CGPoint(x: 0.46, y: 0.66),
                controlPoint2: CGPoint(x: 0.52, y: 0.68)
            )

            // Exit stroke
            $0.addCurve(
                to: CGPoint(x: 0.70, y: 0.56),
                controlPoint1: CGPoint(x: 0.62, y: 0.64),
                controlPoint2: CGPoint(x: 0.68, y: 0.60)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    
    // MARK: f
    private static func smallF() -> LetterStrokeData {

        let stroke1 = p {

            // Left entry stroke (shifted right)
            $0.move(to: CGPoint(x: 0.28, y: 0.48))

            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.36),
                controlPoint1: CGPoint(x: 0.38, y: 0.48),
                controlPoint2: CGPoint(x: 0.48, y: 0.47)
            )

            // Top narrow loop like screenshot
            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.02),
                controlPoint1: CGPoint(x: 0.58, y: 0.24),
                controlPoint2: CGPoint(x: 0.60, y: 0.08)
            )

            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.03),
                controlPoint1: CGPoint(x: 0.56, y: -0.01),
                controlPoint2: CGPoint(x: 0.50, y: -0.01)
            )

            // Down through center
            $0.addCurve(
                to: CGPoint(x: 0.44, y: 0.52),
                controlPoint1: CGPoint(x: 0.46, y: 0.24),
                controlPoint2: CGPoint(x: 0.48, y: 0.40)
            )

            // Bottom loop
            $0.addCurve(
                to: CGPoint(x: 0.46, y: 0.95),
                controlPoint1: CGPoint(x: 0.42, y: 0.68),
                controlPoint2: CGPoint(x: 0.42, y: 0.88)
            )
            
            // Bottom se upar aao (left shift)
            $0.addCurve(
                to: CGPoint(x: 0.54, y: 0.52),
                controlPoint1: CGPoint(x: 0.54, y: 0.95),
                controlPoint2: CGPoint(x: 0.58, y: 0.70)
            )

            // Chhota gol loop, stem ke paas
            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.60),
                controlPoint1: CGPoint(x: 0.52, y: 0.50),
                controlPoint2: CGPoint(x: 0.46, y: 0.56)
            )

            // Smooth upward exit
            $0.addCurve(
                to: CGPoint(x: 0.72, y: 0.50),
                controlPoint1: CGPoint(x: 0.54, y: 0.66),
                controlPoint2: CGPoint(x: 0.64, y: 0.52)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    
    // MARK: g
    private static func smallG() -> LetterStrokeData {

        let stroke1 = p {

            // Left entry stroke curved upward
            $0.move(to: CGPoint(x: 0.02, y: 0.52))

            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.08),
                controlPoint1: CGPoint(x: 0.20, y: 0.30),
                controlPoint2: CGPoint(x: 0.42, y: 0.06)
            )

            // Left half of upper loop (below entry stroke)
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.34),
                controlPoint1: CGPoint(x: 0.54, y: 0.08),
                controlPoint2: CGPoint(x: 0.32, y: 0.25)
            )

            // Right half of upper loop
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.08),
                controlPoint1: CGPoint(x: 0.50, y: 0.40),
                controlPoint2: CGPoint(x: 0.68, y: 0.38)
            )

            // Long descender starts from the top-right
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.80),
                controlPoint1: CGPoint(x: 0.68, y: 0.28),
                controlPoint2: CGPoint(x: 0.60, y: 0.72)
            )

            // Bottom turn
            $0.addCurve(
                to: CGPoint(x: 0.80, y: 0.26),
                controlPoint1: CGPoint(x: 0.38, y: 0.92),
                controlPoint2: CGPoint(x: 0.40, y: 0.46)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    // MARK: h
    private static func smallH() -> LetterStrokeData {

        let stroke1 = p {

            // Entry stroke
            $0.move(to: CGPoint(x: 0.08, y: 0.74))

            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.52),
                controlPoint1: CGPoint(x: 0.18, y: 0.78),
                controlPoint2: CGPoint(x: 0.32, y: 0.72)
            )

            // Go up into tall loop
            $0.addCurve(
                to: CGPoint(x: 0.54, y: 0.04),
                controlPoint1: CGPoint(x: 0.48, y: 0.34),
                controlPoint2: CGPoint(x: 0.54, y: 0.12)
            )

            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.52),
                controlPoint1: CGPoint(x: 0.38, y: 0.08),
                controlPoint2: CGPoint(x: 0.40, y: 0.34)
            )

            // Down stem
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.82),
                controlPoint1: CGPoint(x: 0.40, y: 0.62),
                controlPoint2: CGPoint(x: 0.40, y: 0.74)
            )

            // Rounded hump
            $0.addCurve(
                to: CGPoint(x: 0.74, y: 0.62),
                controlPoint1: CGPoint(x: 0.48, y: 0.48),
                controlPoint2: CGPoint(x: 0.70, y: 0.42)
            )

            // Ending hook
            $0.addCurve(
                to: CGPoint(x: 0.88, y: 0.70),
                controlPoint1: CGPoint(x: 0.80, y: 0.78),
                controlPoint2: CGPoint(x: 0.86, y: 0.74)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    // MARK: i
    private static func smallI() -> LetterStrokeData {

        // dot
        let stroke1 = p {
            $0.move(to: CGPoint(x: 0.53, y: 0.18))
            $0.addLine(to: CGPoint(x: 0.53, y: 0.20))
        }

        // main stroke
        let stroke2 = p {

            // left foot
            $0.move(to: CGPoint(x: 0.36, y: 0.70))

            // center join point
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.56),
                controlPoint1: CGPoint(x: 0.42, y: 0.67),
                controlPoint2: CGPoint(x: 0.48, y: 0.60)
            )

            // ✅ stem ko aur lamba kiya hai taaki 2nd guide line ko touch/cross kare
            $0.addCurve(
                to: CGPoint(x: 0.54, y: 0.14),
                controlPoint1: CGPoint(x: 0.52, y: 0.44),
                controlPoint2: CGPoint(x: 0.54, y: 0.22)
            )

            // ✅ upar se niche same flow me wapas
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.70),
                controlPoint1: CGPoint(x: 0.54, y: 0.34),
                controlPoint2: CGPoint(x: 0.54, y: 0.60)
            )

            // small right hook
            $0.addCurve(
                to: CGPoint(x: 0.63, y: 0.70),
                controlPoint1: CGPoint(x: 0.60, y: 0.71),
                controlPoint2: CGPoint(x: 0.62, y: 0.71)
            )
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2],
            isLoop: false
        )
    }
    
    // MARK: j
    private static func smallJ() -> LetterStrokeData {

        // Main stroke (trace first)
        let stroke2 = p {

            // Left entry stroke
            $0.move(to: CGPoint(x: 0.28, y: 0.50))

            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.24),
                controlPoint1: CGPoint(x: 0.36, y: 0.48),
                controlPoint2: CGPoint(x: 0.48, y: 0.48)
            )

            // Down through center
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.88),
                controlPoint1: CGPoint(x: 0.52, y: 0.50),
                controlPoint2: CGPoint(x: 0.50, y: 0.76)
            )

            // Bottom loop - left side
            $0.addCurve(
                to: CGPoint(x: 0.26, y: 0.80),
                controlPoint1: CGPoint(x: 0.38, y: 0.96),
                controlPoint2: CGPoint(x: 0.24, y: 0.94)
            )

            // Loop comes back up
            $0.addCurve(
                to: CGPoint(x: 0.59, y: 0.50),
                controlPoint1: CGPoint(x: 0.30, y: 0.62),
                controlPoint2: CGPoint(x: 0.48, y: 0.62)
            )
        }

        // Dot (trace second)
        let stroke1 = p {
            $0.move(to: CGPoint(x: 0.50, y: 0.08))
            $0.addLine(to: CGPoint(x: 0.50, y: 0.12))
        }

        return LetterStrokeData(
            paths: [stroke2, stroke1],   // Main stroke first, dot second
            isLoop: true
        )
    }
    
    // MARK: k
    private static func smallK() -> LetterStrokeData {

        let stroke1 = p {

            // Long entry from left
            $0.move(to: CGPoint(x: 0.08, y: 0.72))

            // Reach center crossing point
            $0.addCurve(
                to: CGPoint(x: 0.44, y: 0.50),
                controlPoint1: CGPoint(x: 0.24, y: 0.72),
                controlPoint2: CGPoint(x: 0.36, y: 0.60)
            )

            // Go almost straight up
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.02),
                controlPoint1: CGPoint(x: 0.56, y: 0.35),
                controlPoint2: CGPoint(x: 0.59, y: 0.10)
            )

            // Rounded top loop and come down from LEFT side
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.84),
                controlPoint1: CGPoint(x: 0.40, y: 0.03),
                controlPoint2: CGPoint(x: 0.46, y: 0.28)
            )

            // Rounded right bowl
            $0.addCurve(
                to: CGPoint(x: 0.74, y: 0.54),
                controlPoint1: CGPoint(x: 0.42, y: 0.30),
                controlPoint2: CGPoint(x: 0.74, y: 0.40)
            )

            // Return inside bowl
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.60),
                controlPoint1: CGPoint(x: 0.74, y: 0.70),
                controlPoint2: CGPoint(x: 0.45, y: 0.70)
            )

            // Small exit stroke
            $0.addCurve(
                to: CGPoint(x: 0.82, y: 0.74),
                controlPoint1: CGPoint(x: 0.70, y: 0.60),
                controlPoint2: CGPoint(x: 0.55, y: 0.90)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    // MARK: l

    private static func smallL() -> LetterStrokeData {

        let stroke1 = p {

            // left tail
            $0.move(to: CGPoint(x: 0.26, y: 0.88))

            // Up right side of loop
            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.12),
                controlPoint1: CGPoint(x: 0.36, y: 0.72),
                controlPoint2: CGPoint(x: 0.58, y: 0.22)
            )

            // Rounded top cap
            $0.addCurve(
                to: CGPoint(x: 0.44, y: 0.12),
                controlPoint1: CGPoint(x: 0.56, y: 0.06),
                controlPoint2: CGPoint(x: 0.44, y: 0.06)
            )

            // Left side down
            $0.addCurve(
                to: CGPoint(x: 0.38, y: 0.72),
                controlPoint1: CGPoint(x: 0.38, y: 0.24),
                controlPoint2: CGPoint(x: 0.26, y: 0.56)
            )

            // Cross point
            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.82),
                controlPoint1: CGPoint(x: 0.40, y: 0.76),
                controlPoint2: CGPoint(x: 0.44, y: 0.80)
            )

            // Smooth U-shaped flow to the right
            $0.addCurve(
                to: CGPoint(x: 0.72, y: 0.74),
                controlPoint1: CGPoint(x: 0.56, y: 0.88),
                controlPoint2: CGPoint(x: 0.66, y: 0.84)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    // MARK: m
    private static func smallM() -> LetterStrokeData {

        let stroke1 = p {

            // Start directly from first stem
            $0.move(to: CGPoint(x: 0.28, y: 0.42))

            // Tall first stem
            $0.addCurve(
                to: CGPoint(x: 0.36, y: 0.08),
                controlPoint1: CGPoint(x: 0.30, y: 0.30),
                controlPoint2: CGPoint(x: 0.30, y: 0.10)
            )

            // Down from first stem
            $0.addCurve(
                to: CGPoint(x: 0.34, y: 0.70),
                controlPoint1: CGPoint(x: 0.42, y: 0.22),
                controlPoint2: CGPoint(x: 0.38, y: 0.56)
            )

            // First hump
            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.16),
                controlPoint1: CGPoint(x: 0.36, y: 0.50),
                controlPoint2: CGPoint(x: 0.40, y: 0.26)
            )

            // Valley
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.66),
                controlPoint1: CGPoint(x: 0.54, y: 0.28),
                controlPoint2: CGPoint(x: 0.52, y: 0.56)
            )

            // Second hump
            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.16),
                controlPoint1: CGPoint(x: 0.52, y: 0.46),
                controlPoint2: CGPoint(x: 0.55, y: 0.26)
            )

            // Final downstroke
            $0.addCurve(
                to: CGPoint(x: 0.64, y: 0.68),
                controlPoint1: CGPoint(x: 0.68, y: 0.28),
                controlPoint2: CGPoint(x: 0.66, y: 0.56)
            )

            // Exit hook
            $0.addCurve(
                to: CGPoint(x: 0.76, y: 0.56),
                controlPoint1: CGPoint(x: 0.66, y: 0.82),
                controlPoint2: CGPoint(x: 0.74, y: 0.66)
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

            // Start
            $0.move(to: CGPoint(x: 0.24, y: 0.48))

            // Left oval top
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.08),
                controlPoint1: CGPoint(x: 0.28, y: 0.28),
                controlPoint2: CGPoint(x: 0.36, y: 0.10)
            )

            // Round over the top
            $0.addCurve(
                to: CGPoint(x: 0.47, y: 0.18),
                controlPoint1: CGPoint(x: 0.46, y: 0.02),
                controlPoint2: CGPoint(x: 0.48, y: 0.10)
            )

            // Straight down stem
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.76),
                controlPoint1: CGPoint(x: 0.46, y: 0.34),
                controlPoint2: CGPoint(x: 0.44, y: 0.62)
            )

            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.16),
                controlPoint1: CGPoint(x: 0.40, y: 0.62),
                controlPoint2: CGPoint(x: 0.48, y: 0.18)
            )
            
            // Down from hump
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.74),
                controlPoint1: CGPoint(x: 0.66, y: 0.24),
                controlPoint2: CGPoint(x: 0.62, y: 0.60)
            )

            // Deep bottom U
            $0.addCurve(
                to: CGPoint(x: 0.78, y: 0.56),
                controlPoint1: CGPoint(x: 0.60, y: 0.92),
                controlPoint2: CGPoint(x: 0.72, y: 0.72)
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

            // Entry stroke from left
            $0.move(to: CGPoint(x: 0.22, y: 0.58))

            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.10),
                controlPoint1: CGPoint(x: 0.34, y: 0.48),
                controlPoint2: CGPoint(x: 0.46, y: 0.18)
            )

            // Left side down
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.78),
                controlPoint1: CGPoint(x: 0.32, y: 0.28),
                controlPoint2: CGPoint(x: 0.30, y: 0.66)
            )

            // Bottom curve
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.78),
                controlPoint1: CGPoint(x: 0.46, y: 0.84),
                controlPoint2: CGPoint(x: 0.54, y: 0.84)
            )

            // Right side up
            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.18),
                controlPoint1: CGPoint(x: 0.70, y: 0.66),
                controlPoint2: CGPoint(x: 0.68, y: 0.26)
            )

            // Close loop at top center
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.10),
                controlPoint1: CGPoint(x: 0.58, y: 0.12),
                controlPoint2: CGPoint(x: 0.54, y: 0.10)
            )

            // Exit stroke - first dip down
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.24),
                controlPoint1: CGPoint(x: 0.50, y: 0.14),
                controlPoint2: CGPoint(x: 0.50, y: 0.22)
            )

            // Then sweep out to the right
            $0.addCurve(
                to: CGPoint(x: 0.84, y: 0.16),
                controlPoint1: CGPoint(x: 0.62, y: 0.30),
                controlPoint2: CGPoint(x: 0.76, y: 0.24)
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

            // Left entry stroke
            $0.move(to: CGPoint(x: 0.22, y: 0.28))

            // Flow into center crossing
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.42),
                controlPoint1: CGPoint(x: 0.40, y: 0.14),
                controlPoint2: CGPoint(x: 0.56, y: 0.24)
            )

            // Long descender loop
            $0.addCurve(
                to: CGPoint(x: 0.36, y: 0.92),
                controlPoint1: CGPoint(x: 0.44, y: 0.62),
                controlPoint2: CGPoint(x: 0.42, y: 0.84)
            )

            // Return upward slightly left
            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.40),
                controlPoint1: CGPoint(x: 0.24, y: 0.92),
                controlPoint2: CGPoint(x: 0.40, y: 0.58)
            )

            // Large right bowl - higher start
            $0.addCurve(
                to: CGPoint(x: 0.76, y: 0.20),
                controlPoint1: CGPoint(x: 0.58, y: 0.22),
                controlPoint2: CGPoint(x: 0.74, y: 0.14)
            )

            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.58),
                controlPoint1: CGPoint(x: 0.84, y: 0.34),
                controlPoint2: CGPoint(x: 0.76, y: 0.58)
            )

            // Exit stroke
            $0.addCurve(
                to: CGPoint(x: 0.88, y: 0.54),
                controlPoint1: CGPoint(x: 0.66, y: 0.68),
                controlPoint2: CGPoint(x: 0.80, y: 0.54)
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

            // Left entry stroke curved upward
            $0.move(to: CGPoint(x: 0.02, y: 0.52))

            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.08),
                controlPoint1: CGPoint(x: 0.20, y: 0.30),
                controlPoint2: CGPoint(x: 0.42, y: 0.06)
            )

            // Left half of upper loop (below entry stroke)
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.34),
                controlPoint1: CGPoint(x: 0.54, y: 0.08),
                controlPoint2: CGPoint(x: 0.22, y: 0.25)
            )

            // Right half of upper loop
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.08),
                controlPoint1: CGPoint(x: 0.50, y: 0.40),
                controlPoint2: CGPoint(x: 0.68, y: 0.18)
            )

            // Long descender starts from the top-right
            $0.addCurve(
                to: CGPoint(x: 0.54, y: 0.88),
                controlPoint1: CGPoint(x: 0.68, y: 0.28),
                controlPoint2: CGPoint(x: 0.60, y: 0.72)
            )

            // Bottom V turn
            $0.addCurve(
                to: CGPoint(x: 0.80, y: 0.56),
                controlPoint1: CGPoint(x: 0.58, y: 0.82),
                controlPoint2: CGPoint(x: 0.70, y: 0.66)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    // MARK: r
    private static func smallR() -> LetterStrokeData {

        let stroke1 = p {

            // Start bottom-left
            $0.move(to: CGPoint(x: 0.30, y: 0.78))

            // Straight upward stroke
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.18),
                controlPoint1: CGPoint(x: 0.40, y: 0.60),
                controlPoint2: CGPoint(x: 0.52, y: 0.32)
            )

            // Top loop (left side)
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.05),
                controlPoint1: CGPoint(x: 0.52, y: 0.12),
                controlPoint2: CGPoint(x: 0.50, y: 0.04)
            )

            $0.addCurve(
                to: CGPoint(x: 0.44, y: 0.26),
                controlPoint1: CGPoint(x: 0.32, y: 0.04),
                controlPoint2: CGPoint(x: 0.34, y: 0.22)
            )

            // Exit toward right shoulder
            $0.addCurve(
                to: CGPoint(x: 0.72, y: 0.10),
                controlPoint1: CGPoint(x: 0.56, y: 0.30),
                controlPoint2: CGPoint(x: 0.68, y: 0.14)
            )

            // Long descending stroke (go further down)
            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.82),
                controlPoint1: CGPoint(x: 0.72, y: 0.30),
                controlPoint2: CGPoint(x: 0.48, y: 0.70)
            )

            // Bottom turn and hook
            $0.addCurve(
                to: CGPoint(x: 0.78, y: 0.68),
                controlPoint1: CGPoint(x: 0.58, y: 0.92),
                controlPoint2: CGPoint(x: 0.72, y: 0.82)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    // MARK: s
    private static func smallS() -> LetterStrokeData {

        let s = p {

            // Start from bottom-left
            $0.move(to: CGPoint(x: 0.22, y: 0.72))

            // Rise into smaller top loop
            $0.addCurve(
                to: CGPoint(x: 0.64, y: 0.16),
                controlPoint1: CGPoint(x: 0.46, y: 0.52),
                controlPoint2: CGPoint(x: 0.76, y: 0.22)
            )

            // Smaller oval loop
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.32),
                controlPoint1: CGPoint(x: 0.62, y: 0.14),
                controlPoint2: CGPoint(x: 0.34, y: 0.18)
            )


            // Large lower sweep
            $0.addCurve(
                to: CGPoint(x: 0.72, y: 0.66),
                controlPoint1: CGPoint(x: 0.50, y: 0.52),
                controlPoint2: CGPoint(x: 0.76, y: 0.58)
            )

            // Bottom rounded turn
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.76),
                controlPoint1: CGPoint(x: 0.70, y: 0.80),
                controlPoint2: CGPoint(x: 0.58, y: 0.82)
            )

            // Inner curl
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.60),
                controlPoint1: CGPoint(x: 0.50, y: 0.60),
                controlPoint2: CGPoint(x: 0.60, y: 0.60)
            )
        }

        return LetterStrokeData(
            paths: [s],
            isLoop: true
        )
    }
    
    
    // MARK: t

    private static func smallT() -> LetterStrokeData {

        let stroke1 = p {

            // Start bottom-left
            $0.move(to: CGPoint(x: 0.22, y: 0.78))

            // Upward main stroke
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.08),
                controlPoint1: CGPoint(x: 0.42, y: 0.58),
                controlPoint2: CGPoint(x: 0.54, y: 0.24)
            )

            // Come down through center
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.68),
                controlPoint1: CGPoint(x: 0.56, y: 0.28),
                controlPoint2: CGPoint(x: 0.42, y: 0.56)
            )

            // Long bottom curve to right
            $0.addCurve(
                to: CGPoint(x: 0.82, y: 0.74),
                controlPoint1: CGPoint(x: 0.56, y: 0.84),
                controlPoint2: CGPoint(x: 0.72, y: 0.74)
            )
        }

        let stroke2 = p {

            // Slightly tilted cross bar
            $0.move(to: CGPoint(x: 0.34, y: 0.40))

            $0.addCurve(
                to: CGPoint(x: 0.72, y: 0.36),
                controlPoint1: CGPoint(x: 0.46, y: 0.40),
                controlPoint2: CGPoint(x: 0.60, y: 0.38)
            )
        }

        return LetterStrokeData(
            paths: [stroke1, stroke2],
            isLoop: false
        )
    }
    
    // MARK: u

    private static func smallU() -> LetterStrokeData {

        let stroke1 = p {

            // Start slightly higher
            $0.move(to: CGPoint(x: 0.26, y: 0.66))

            // Forward curved entry then upstroke
            $0.addCurve(
                to: CGPoint(x: 0.40, y: 0.10),
                controlPoint1: CGPoint(x: 0.36, y: 0.70),
                controlPoint2: CGPoint(x: 0.42, y: 0.26)
            )

            // First valley
            $0.addCurve(
                to: CGPoint(x: 0.48, y: 0.72),
                controlPoint1: CGPoint(x: 0.40, y: 0.42),
                controlPoint2: CGPoint(x: 0.42, y: 0.72)
            )

            // Second upstroke
            $0.addCurve(
                to: CGPoint(x: 0.60, y: 0.12),
                controlPoint1: CGPoint(x: 0.59, y: 0.58),
                controlPoint2: CGPoint(x: 0.60, y: 0.28)
            )

            // Second valley
            $0.addCurve(
                to: CGPoint(x: 0.64, y: 0.72),
                controlPoint1: CGPoint(x: 0.60, y: 0.42),
                controlPoint2: CGPoint(x: 0.60, y: 0.72)
            )

            // Small rounded exit
            $0.addCurve(
                to: CGPoint(x: 0.78, y: 0.66),
                controlPoint1: CGPoint(x: 0.68, y: 0.78),
                controlPoint2: CGPoint(x: 0.74, y: 0.68)
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

            // Start bottom-left
            $0.move(to: CGPoint(x: 0.22, y: 0.72))

            // Up to first peak
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.10),
                controlPoint1: CGPoint(x: 0.30, y: 0.52),
                controlPoint2: CGPoint(x: 0.40, y: 0.22)
            )

            // Down to sharp valley
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.76),
                controlPoint1: CGPoint(x: 0.44, y: 0.36),
                controlPoint2: CGPoint(x: 0.48, y: 0.70)
            )

            // Longer and more curved upstroke
            $0.addCurve(
                to: CGPoint(x: 0.82, y: 0.06),
                controlPoint1: CGPoint(x: 0.69, y: 0.58),
                controlPoint2: CGPoint(x: 0.78, y: 0.18)
            )

            // Small right hook
            $0.addCurve(
                to: CGPoint(x: 0.75, y: 0.16),
                controlPoint1: CGPoint(x: 0.82, y: 0.04),
                controlPoint2: CGPoint(x: 0.68, y: 0.10)
            )

            $0.addCurve(
                to: CGPoint(x: 0.90, y: 0.22),
                controlPoint1: CGPoint(x: 0.82, y: 0.22),
                controlPoint2: CGPoint(x: 0.89, y: 0.22)
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

            // Start bottom-left
            $0.move(to: CGPoint(x: 0.20, y: 0.72))

            // First tall upstroke
            $0.addCurve(
                to: CGPoint(x: 0.38, y: 0.08),
                controlPoint1: CGPoint(x: 0.30, y: 0.56),
                controlPoint2: CGPoint(x: 0.36, y: 0.22)
            )

            // First valley
            $0.addCurve(
                to: CGPoint(x: 0.46, y: 0.74),
                controlPoint1: CGPoint(x: 0.38, y: 0.42),
                controlPoint2: CGPoint(x: 0.40, y: 0.72)
            )

            // Second tall upstroke
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.12),
                controlPoint1: CGPoint(x: 0.54, y: 0.56),
                controlPoint2: CGPoint(x: 0.58, y: 0.28)
            )

            // Second valley
            $0.addCurve(
                to: CGPoint(x: 0.66, y: 0.74),
                controlPoint1: CGPoint(x: 0.58, y: 0.44),
                controlPoint2: CGPoint(x: 0.60, y: 0.74)
            )

            // Third upstroke
            $0.addCurve(
                to: CGPoint(x: 0.80, y: 0.10),
                controlPoint1: CGPoint(x: 0.74, y: 0.58),
                controlPoint2: CGPoint(x: 0.80, y: 0.26)
            )

            // Small right hook - curve left then swing out
            $0.addCurve(
                to: CGPoint(x: 0.76, y: 0.18),
                controlPoint1: CGPoint(x: 0.78, y: 0.08),
                controlPoint2: CGPoint(x: 0.74, y: 0.12)
            )

            $0.addCurve(
                to: CGPoint(x: 0.86, y: 0.24),
                controlPoint1: CGPoint(x: 0.78, y: 0.24),
                controlPoint2: CGPoint(x: 0.84, y: 0.24)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: false
        )
    }
    
    // MARK: x
    private static func smallX() -> LetterStrokeData {

        let minX: CGFloat = 266.90723 - 35
        let maxX: CGFloat = 389.66754 + 35
        let minY: CGFloat = 484.0407 - 5
        let maxY: CGFloat = 577.3531 + 10

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(266.90723, minX, maxX),
                y: norm(509.39062, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [
                (267.55103,504.4877),(270.34283,500.35623),
                (273.71936,496.68146),(277.49103,493.39972),
                (281.42346,490.32086),(285.86255,488.0765),
                (290.65314,486.80246),(295.63565,486.79425),
                (300.25885,488.56342),(304.3609,491.4139),
                (307.37805,495.3068),(309.76776,499.69766),
                (311.44943,504.39893),(312.93875,509.1719),
                (314.18298,514.01434),(314.8153,518.9703),
                (315.1252,523.9607),(314.94458,528.9561),
                (314.37756,533.9203),(313.34268,538.80554),
                (311.9411,543.60034),(310.30756,548.3249),
                (308.31314,552.9099),(306.2323,557.45605),
                (303.97128,561.9111),(301.4645,566.23517),
                (298.61584,570.3443),(295.50333,574.2536),
                (292.10342,577.9134),(288.39075,581.25604),
                (283.9891,583.5951),(279.22467,585.0582),
                (274.25177,585.3789),(269.47787,584.0579),
                (265.338,581.28564),(262.26862,577.3981),
                (261.46344,572.4957),(263.06268,567.7921),
                (266.21774,563.9377),(269.93076,560.591),
                (273.94083,557.6189),(278.2792,555.1555),
                (282.77634,552.9704),(287.28082,550.8008),
                (291.75256,548.56445),(296.3041,546.4948),

                (300.82993,544.36975),(305.37576,542.28827),
                (309.8861,540.1332),(314.3595,537.8996),

                (318.85684,535.7152),(323.2571,533.35345),
                (327.3907,530.54626),(331.387,527.5419),
                (335.34137,524.4821),(339.14532,521.2432),
                (342.82608,517.85913),(346.48444,514.45087),
                (350.1708,511.07297),(353.60257,507.4506),
                (356.3724,503.29587),(358.36935,498.7289),

                (359.79953,493.93866),
                (360.7293,489.03296),

                // Left circular loop
                (355.0,486.0),
                (348.0,484.0),
                (340.0,485.0),
                (332.0,489.0),
                (326.0,496.0),

                // curve down smoothly
                (322.0,506.0),
                (320.0,520.0),
                (320.0,536.0),
                (321.0,550.0),
                (323.0,562.0),

                // stay low a little longer
                (329.0,570.0),
                (338.0,575.0),
                (349.0,578.0),

                // extend right before turning up
                (362.0,579.0),
                (375.0,579.0),
                (388.0,577.0),

                // gradual upward sweep
                (398.0,572.0),
                (406.0,565.0),
                (412.0,556.0)
               
            ]

            points.forEach {
                path.addLine(to: CGPoint(
                    x: norm($0.0, minX, maxX),
                    y: norm($0.1, minY, maxY)
                ))
            }
        }

        return LetterStrokeData(paths: [path], isLoop: true)
    }
   
    // MARK: y

    private static func smallY() -> LetterStrokeData {

        let stroke1 = p {

            // Start left
            $0.move(to: CGPoint(x: 0.22, y: 0.38))

            // First peak
            $0.addCurve(
                to: CGPoint(x: 0.42, y: 0.08),
                controlPoint1: CGPoint(x: 0.30, y: 0.26),
                controlPoint2: CGPoint(x: 0.40, y: 0.14)
            )

            // First valley (rounded U shape)
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.46),
                controlPoint1: CGPoint(x: 0.44, y: 0.34),
                controlPoint2: CGPoint(x: 0.46, y: 0.46)
            )

            // Second peak (smooth rise from U)
            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.18),
                controlPoint1: CGPoint(x: 0.56, y: 0.44),
                controlPoint2: CGPoint(x: 0.62, y: 0.32)
            )

            // Descender down
            $0.addCurve(
                to: CGPoint(x: 0.46, y: 0.88),
                controlPoint1: CGPoint(x: 0.60, y: 0.44),
                controlPoint2: CGPoint(x: 0.56, y: 0.78)
            )

            // Large bottom loop
            $0.addCurve(
                to: CGPoint(x: 0.28, y: 0.78),
                controlPoint1: CGPoint(x: 0.38, y: 0.96),
                controlPoint2: CGPoint(x: 0.24, y: 0.92)
            )

            // Cross through center
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.54),
                controlPoint1: CGPoint(x: 0.34, y: 0.62),
                controlPoint2: CGPoint(x: 0.48, y: 0.58)
            )

            // Long right exit
            $0.addCurve(
                to: CGPoint(x: 0.90, y: 0.30),
                controlPoint1: CGPoint(x: 0.70, y: 0.50),
                controlPoint2: CGPoint(x: 0.82, y: 0.40)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
    
    // MARK: z

    private static func smallZ() -> LetterStrokeData {

        let stroke1 = p {

            // Start left
            $0.move(to: CGPoint(x: 0.22, y: 0.36))

            // Top sweeping curve
            $0.addCurve(
                to: CGPoint(x: 0.58, y: 0.10),
                controlPoint1: CGPoint(x: 0.40, y: 0.38),
                controlPoint2: CGPoint(x: 0.52, y: 0.02)
            )

            // Come down to center
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.50),
                controlPoint1: CGPoint(x: 0.66, y: 0.20),
                controlPoint2: CGPoint(x: 0.62, y: 0.42)
            )

            // Small connector curve
            $0.addCurve(
                to: CGPoint(x: 0.68, y: 0.52),
                controlPoint1: CGPoint(x: 0.58, y: 0.44),
                controlPoint2: CGPoint(x: 0.64, y: 0.46)
            )

            // Smaller bottom loop (smooth flow)
            $0.addCurve(
                to: CGPoint(x: 0.56, y: 0.78),
                controlPoint1: CGPoint(x: 0.74, y: 0.60),
                controlPoint2: CGPoint(x: 0.68, y: 0.76)
            )

            $0.addCurve(
                to: CGPoint(x: 0.44, y: 0.66),
                controlPoint1: CGPoint(x: 0.52, y: 0.82),
                controlPoint2: CGPoint(x: 0.42, y: 0.74)
            )

            // Cross and exit
            $0.addCurve(
                to: CGPoint(x: 0.82, y: 0.34),
                controlPoint1: CGPoint(x: 0.48, y: 0.58),
                controlPoint2: CGPoint(x: 0.70, y: 0.48)
            )
        }

        return LetterStrokeData(
            paths: [stroke1],
            isLoop: true
        )
    }
}
import SwiftUI
import UIKit

final class LetterPreviewView: UIView {

    var letter: Character = "n" {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {

        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        ctx.setLineWidth(4)
        UIColor.systemBlue.setStroke()

        let data = SmallAlphabetPathProvider.strokeData(for: letter)

        for bezierPath in data.paths {

            let path = UIBezierPath(cgPath: bezierPath.cgPath)

            let scale = min(bounds.width, bounds.height)

            let transform = CGAffineTransform(
                scaleX: scale,
                y: scale
            )

            path.apply(transform)

            path.stroke()
        }
    }
}

import SwiftUI

struct LetterPreviewRepresentable: UIViewRepresentable {

    let letter: Character

    func makeUIView(context: Context) -> LetterPreviewView {

        let view = LetterPreviewView()
        view.backgroundColor = .white

        return view
    }

    func updateUIView(
        _ uiView: LetterPreviewView,
        context: Context
    ) {
        uiView.letter = letter
    }
}
struct LetterTesterView: View {

    @State private var letter: Character = "h"

    var body: some View {

        VStack(spacing: 20) {

            LetterPreviewRepresentable(letter: letter)
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
    LetterTesterView()
}
