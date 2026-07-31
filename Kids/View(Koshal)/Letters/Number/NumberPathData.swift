//
//  NumberPathData.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 28/01/26.
//


import UIKit

struct NumberPathData {
    let paths: [UIBezierPath]
    let isLoop: Bool
}

final class HandwrittenNumberPathProvider {

    // MARK: Public API

    static func strokeData(for number: Int) -> NumberPathData {

        let digits = Array(String(number))
        var combined: [UIBezierPath] = []

        var xOffset: CGFloat = 0
        let spacing: CGFloat = 0.18

        for (index,d) in digits.enumerated() {

            guard let digitPaths = digitMap[d] else {
                continue
            }

            let normalizedDigit = normalize(paths: digitPaths)

            let bounds = normalizedDigit
                .map { $0.bounds }
                .reduce(CGRect.null) { $0.union($1) }

            let digitWidth = min(
                max(bounds.width, 0.48),
                0.62
            )

            var extraGap: CGFloat = 0

            // normal 8 spacing
            if d == "8" {
                extraGap += 0.15
            }

            if index + 1 < digits.count,
               digits[index + 1] == "8" {

                extraGap += 0.15
            }

            // MASSIVE spacing only for 58
            if index > 0,
               digits[index - 1] == "5",
               d == "8" {

                extraGap += 1.20
            }

            for path in normalizedDigit {

                let p = path.copy() as! UIBezierPath

                p.apply(
                    CGAffineTransform(
                        translationX: xOffset,
                        y: 0
                    )
                )

                combined.append(p)
            }

            xOffset += digitWidth + spacing + extraGap
        }

        return NumberPathData(
            paths: combined,
            isLoop: false
        )
    }

    // MARK: Normalize Utility
    private static func normalize(paths: [UIBezierPath]) -> [UIBezierPath] {
        guard let bounds = paths
            .map({ $0.bounds })
            .reduce(nil, { $0?.union($1) ?? $1 }) else {
            return paths
        }

        let scale = 1 / max(bounds.width, bounds.height)

        let scaledWidth = bounds.width * scale
        let scaledHeight = bounds.height * scale

        // Center horizontally + vertically
        let xOffset = (1 - scaledWidth) / 2
        let yOffset = (1 - scaledHeight) / 2

        return paths.map {
            let p = $0.copy() as! UIBezierPath

            p.apply(
                CGAffineTransform(translationX: -bounds.minX,
                                  y: -bounds.minY)
                    .scaledBy(x: scale, y: scale)
                    .translatedBy(x: xOffset, y: yOffset)
            )
            
            return p
        }
    }

    // MARK: Digit Map
    private static let digitMap: [Character: [UIBezierPath]] = [
        "0": digit0(),
        "1": digit1(),
        "2": digit2(),
        "3": digit3(),
        "4": digit4(),
        "5": digit5(),
        "6": digit6(),
        "7": digit7(),
        "8": digit8(),
        "9": digit9()
    ]

    // MARK: Handwritten Digits (Corrected)

    private static func digit0() -> [UIBezierPath] {
        let p = UIBezierPath()

        // start from top-left instead
        p.move(to: CGPoint(x: 0.55, y: 0.08))

        // go down left side first
        p.addCurve(
            to: CGPoint(x: 0.55, y: 0.92),
            controlPoint1: CGPoint(x: 0.25, y: 0.18),
            controlPoint2: CGPoint(x: 0.25, y: 0.82)
        )

        // return upward from right side
        p.addCurve(
            to: CGPoint(x: 0.55, y: 0.08),
            controlPoint1: CGPoint(x: 0.85, y: 0.82),
            controlPoint2: CGPoint(x: 0.85, y: 0.18)
        )

        return [p]
    }

    private static func digit1() -> [UIBezierPath] {
        let p = UIBezierPath()

        // slim straight 1
        p.move(to: CGPoint(x: 0.35, y: 0.08))
        p.addLine(to: CGPoint(x: 0.35, y: 0.92))

        return [p]
    }

    private static func digit2() -> [UIBezierPath] {
        let p = UIBezierPath()

        // start top-left
        p.move(to: CGPoint(x: 0.28, y: 0.12))

        // smooth top curve
        p.addQuadCurve(
            to: CGPoint(x: 0.70, y: 0.24),
            controlPoint: CGPoint(x: 0.62, y: -0.02)
        )

        // less wide + more straight
        p.addQuadCurve(
            to: CGPoint(x: 0.34, y: 0.78),
            controlPoint: CGPoint(x: 0.74, y: 0.48)
        )

        // bottom line
        p.addLine(to: CGPoint(x: 0.78, y: 0.78))

        return [p]
    }

    private static func digit3() -> [UIBezierPath] {
        let p = UIBezierPath()

        // start from top-left
        p.move(to: CGPoint(x: 0.30, y: 0.15))

        // upper curve
        p.addQuadCurve(
            to: CGPoint(x: 0.74, y: 0.39),
            controlPoint: CGPoint(x: 0.88, y: 0.08)
        )

        // center pinch
        p.addQuadCurve(
            to: CGPoint(x: 0.46, y: 0.50),
            controlPoint: CGPoint(x: 0.70, y: 0.48)
        )

        // lower curve
        p.addQuadCurve(
            to: CGPoint(x: 0.74, y: 0.79),
            controlPoint: CGPoint(x: 0.90, y: 0.62)
        )

        // ending tail
        p.addQuadCurve(
            to: CGPoint(x: 0.38, y: 0.82),
            controlPoint: CGPoint(x: 0.58, y: 0.92)
        )

        return [p]
    }


    private static func digit4() -> [UIBezierPath] {

        // left vertical + bottom curve
        let p1 = UIBezierPath()
        p1.move(to: CGPoint(x: 0.48, y: 0.08))
        p1.addLine(to: CGPoint(x: 0.48, y: 0.52))

        p1.addQuadCurve(
            to: CGPoint(x: 0.72, y: 0.45),
            controlPoint: CGPoint(x: 0.58, y: 0.58)
        )

        // right vertical line
        let p2 = UIBezierPath()
        p2.move(to: CGPoint(x: 0.72, y: 0.12))
        p2.addLine(to: CGPoint(x: 0.72, y: 0.92))

        return [p1, p2]
    }

    private static func digit5() -> [UIBezierPath] {

        let p = UIBezierPath()

        // top horizontal line
        p.move(to: CGPoint(x: 0.72, y: 0.12))
        p.addLine(to: CGPoint(x: 0.38, y: 0.12))

        // left short vertical line
        p.addLine(to: CGPoint(x: 0.38, y: 0.45))

        // smooth lower round curve
        p.addQuadCurve(
            to: CGPoint(x: 0.70, y: 0.78),
            controlPoint: CGPoint(x: 0.92, y: 0.36)
        )

        p.addQuadCurve(
            to: CGPoint(x: 0.38, y: 0.80),
            controlPoint: CGPoint(x: 0.58, y: 0.88)
        )

        return [p]
    }


    private static func digit6() -> [UIBezierPath] {

        let p = UIBezierPath()

        // start from top-right
        p.move(to: CGPoint(x: 0.68, y: 0.08))

        // smoother and less tilted
        p.addQuadCurve(
            to: CGPoint(x: 0.42, y: 0.52),
            controlPoint: CGPoint(x: 0.50, y: 0.22)
        )
        // longer downward stroke then turn right
        p.addCurve(
            to: CGPoint(x: 0.66, y: 0.92),
            controlPoint1: CGPoint(x: 0.42, y: 0.70),
            controlPoint2: CGPoint(x: 0.52, y: 0.95)
        )

        // go further ahead, then curl more upward-left
        p.addCurve(
            to: CGPoint(x: 0.42, y: 0.54),
            controlPoint1: CGPoint(x: 0.92, y: 0.95), // aage
            controlPoint2: CGPoint(x: 0.82, y: 0.40)  // aur upar leke gol turn
        )

        return [p]
    }


    private static func digit7() -> [UIBezierPath] {

        let p1 = UIBezierPath()

        // smaller top line
        p1.move(to: CGPoint(x: 0.35, y: 0.05))
        p1.addLine(to: CGPoint(x: 0.72, y: 0.05))

        let p2 = UIBezierPath()

        p2.move(to: CGPoint(x: 0.72, y: 0.05))

        // slightly straighter downward line
        p2.addLine(to: CGPoint(x: 0.52, y: 0.95))

        return [p1, p2]
    }


    private static func digit8() -> [UIBezierPath] {
        let p1 = UIBezierPath()
        p1.move(to: CGPoint(x: 0.5, y: 0.05))
        p1.addCurve(
            to: CGPoint(x: 0.5, y: 0.45),
            controlPoint1: CGPoint(x: 0.95, y: 0.15),
            controlPoint2: CGPoint(x: 0.95, y: 0.4)
        )
        p1.addCurve(
            to: CGPoint(x: 0.5, y: 0.05),
            controlPoint1: CGPoint(x: 0.05, y: 0.4),
            controlPoint2: CGPoint(x: 0.05, y: 0.15)
        )

        let p2 = UIBezierPath()
        p2.move(to: CGPoint(x: 0.5, y: 0.45))
        p2.addCurve(
            to: CGPoint(x: 0.5, y: 0.95),
            controlPoint1: CGPoint(x: 0.95, y: 0.55),
            controlPoint2: CGPoint(x: 0.95, y: 0.85)
        )
        p2.addCurve(
            to: CGPoint(x: 0.5, y: 0.45),
            controlPoint1: CGPoint(x: 0.05, y: 0.85),
            controlPoint2: CGPoint(x: 0.05, y: 0.55)
        )

        return [p1, p2]
    }


    private static func digit9() -> [UIBezierPath] {
        let p = UIBezierPath()

        p.move(to: CGPoint(x: 0.54, y: 0.08))

        // bigger left rounded top
        p.addCurve(
            to: CGPoint(x: 0.50, y: 0.62),
            controlPoint1: CGPoint(x: 0.18, y: 0.16),
            controlPoint2: CGPoint(x: 0.10, y: 0.52)
        )

        p.addCurve(
            to: CGPoint(x: 0.56, y: 0.10),
            controlPoint1: CGPoint(x: 0.62, y: 0.52),
            controlPoint2: CGPoint(x: 0.58, y: 0.18)
        )

        p.addCurve(
            to: CGPoint(x: 0.58, y: 0.95),
            controlPoint1: CGPoint(x: 0.58, y: 0.45),
            controlPoint2: CGPoint(x: 0.58, y: 0.78)
        )

        return [p]
    }
}
