//
//  LetterStrokeData.swift
//  tracing
//
//  Created by NextDay Sotware Solution on 27/01/26.
//


import UIKit

struct LetterStrokeData {
    let paths: [UIBezierPath]
    let isLoop: Bool
}
enum LetterStyle {
    case normal
    case cursive
}

final class AlphabetPathProvider {
    
    static func strokeData(
        for letter: Character,
        style: LetterStyle = .normal
    ) -> LetterStrokeData {

        switch style {
        case .normal:
            return normalStrokeData(for: letter)
        case .cursive:
            return cursiveStrokeData(for: letter)
        }
    }

    static func normalStrokeData(for letter: Character) -> LetterStrokeData {
        switch letter {
        case "A":  return strokeA()
        case "B":  return strokeB()
        case "C":  return strokeC()
        case "D":  return strokeD()
        case "E":  return strokeE()
        case "F":  return strokeF()
        case "G":  return strokeG()
        case "H":  return strokeH()
        case "I":  return strokeI()
        case "J":  return strokeJ()
        case "K":  return strokeK()
        case "L":  return strokeL()
        case "M":  return strokeM()
        case "N":  return strokeN()
        case "O":  return strokeO()
        case "P":  return strokeP()
        case "Q":  return strokeQ()
        case "R":  return strokeR()
        case "S":  return strokeS()
        case "T":  return strokeT()
        case "U":  return strokeU()
        case "V":  return strokeV()
        case "W":  return strokeW()
        case "X":  return strokeX()
        case "Y":  return strokeY()
        case "Z":  return strokeZ()
        default:
            return LetterStrokeData(paths: [], isLoop: false)
        }
    }

    private static func p(_ build: (UIBezierPath) -> Void) -> UIBezierPath {
        let path = UIBezierPath()
        build(path)
        return path
    }

    // MARK: A–Z Definitions

    private static func strokeA() -> LetterStrokeData {
        let left = p { $0.move(to: .init(x: 0.5, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let right = p { $0.move(to: .init(x: 0.5, y: 0)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        let mid = p { $0.move(to: .init(x: 0.375, y: 0.5)); $0.addLine(to: .init(x: 0.625, y: 0.5)) }
        return LetterStrokeData(paths: [left, right, mid], isLoop: false)
    }

    private static func strokeB() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let s2 = p {
            $0.move(to: .init(x: 0.25, y: 0))
            $0.addCurve(to: .init(x: 0.25, y: 0.5),
                        controlPoint1: .init(x: 0.75, y: 0),
                        controlPoint2: .init(x: 0.75, y: 0.5))
        }
        let s3 = p {
            $0.move(to: .init(x: 0.25, y: 0.5))
            $0.addCurve(to: .init(x: 0.25, y: 1),
                        controlPoint1: .init(x: 0.75, y: 0.5),
                        controlPoint2: .init(x: 0.75, y: 1))
        }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }

    private static func strokeC() -> LetterStrokeData {
        let s1 = p {
            $0.move(to: .init(x: 0.75, y: 0))
            $0.addCurve(to: .init(x: 0.75, y: 1),
                        controlPoint1: .init(x: 0.25, y: 0),
                        controlPoint2: .init(x: 0.25, y: 1))
        }
        return LetterStrokeData(paths: [s1], isLoop: false)
    }

    private static func strokeD() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let s2 = p {
            $0.move(to: .init(x: 0.25, y: 0))
            $0.addCurve(to: .init(x: 0.25, y: 1),
                        controlPoint1: .init(x: 0.75, y: 0),
                        controlPoint2: .init(x: 0.75, y: 1))
        }
        return LetterStrokeData(paths: [s1, s2], isLoop: false)
    }

    private static func strokeE() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let s2 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        let s3 = p { $0.move(to: .init(x: 0.25, y: 0.5)); $0.addLine(to: .init(x: 0.65, y: 0.5)) }
        let s4 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [s1, s2, s3, s4], isLoop: false)
    }

    private static func strokeF() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let s2 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        let s3 = p { $0.move(to: .init(x: 0.25, y: 0.5)); $0.addLine(to: .init(x: 0.65, y: 0.5)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }

    private static func strokeG() -> LetterStrokeData {

        let g = p {

            // Start top-right
            // thoda chhota kiya
            $0.move(to: CGPoint(x: 0.63, y: 0.14))

            // Big outer curve
            $0.addCurve(
                to: CGPoint(x: 0.24, y: 0.88),
                controlPoint1: CGPoint(x: 0.14, y: 0.03),
                controlPoint2: CGPoint(x: 0.02, y: 0.70)
            )

            // Bottom round
            $0.addCurve(
                to: CGPoint(x: 0.52, y: 0.78),
                controlPoint1: CGPoint(x: 0.34, y: 0.96),
                controlPoint2: CGPoint(x: 0.52, y: 0.92)
            )

            // Inside turn - more straight
            $0.addCurve(
                to: CGPoint(x: 0.50, y: 0.52),
                controlPoint1: CGPoint(x: 0.56, y: 0.62),
                controlPoint2: CGPoint(x: 0.54, y: 0.58)
            )

            // Top inner hook
            $0.addCurve(
                to: CGPoint(x: 0.67, y: 0.50),
                controlPoint1: CGPoint(x: 0.42, y: 0.44),
                controlPoint2: CGPoint(x: 0.60, y: 0.47)
            )

            // Vertical line
            // aur lambi + dashed line touch
            $0.addLine(to: CGPoint(x: 0.67, y: 0.90))
        }

        return LetterStrokeData(
            paths: [g],
            isLoop: true
        )
    }

    private static func strokeH() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let s2 = p { $0.move(to: .init(x: 0.75, y: 0)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        let s3 = p { $0.move(to: .init(x: 0.25, y: 0.5)); $0.addLine(to: .init(x: 0.75, y: 0.5)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }

    private static func strokeI() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        let s2 = p { $0.move(to: .init(x: 0.5, y: 0)); $0.addLine(to: .init(x: 0.5, y: 1)) }
        let s3 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }

    private static func strokeJ() -> LetterStrokeData {
        let s1 = p {
            $0.move(to: .init(x: 0.75, y: 0))
            $0.addLine(to: .init(x: 0.75, y: 0.75))
            $0.addCurve(to: .init(x: 0.25, y: 0.75),
                        controlPoint1: .init(x: 0.75, y: 1),
                        controlPoint2: .init(x: 0.25, y: 1))
        }
        return LetterStrokeData(paths: [s1], isLoop: false)
    }

    private static func strokeK() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let s2 = p { $0.move(to: .init(x: 0.25, y: 0.5)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        let s3 = p { $0.move(to: .init(x: 0.25, y: 0.5)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }

    private static func strokeL() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let s2 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [s1, s2], isLoop: false)
    }

    private static func strokeM() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.25, y: 0)) }
        let s2 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.5, y: 0.5)) }
        let s3 = p { $0.move(to: .init(x: 0.5, y: 0.5)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        let s4 = p { $0.move(to: .init(x: 0.75, y: 0)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [s1, s2, s3, s4], isLoop: false)
    }

    private static func strokeN() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.25, y: 0)) }
        let s2 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        let s3 = p { $0.move(to: .init(x: 0.75, y: 1)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }

    private static func strokeO() -> LetterStrokeData {
        let s1 = p {
            $0.move(to: .init(x: 0.5, y: 0))
            $0.addCurve(to: .init(x: 0.5, y: 1),
                        controlPoint1: .init(x: 0.25, y: 0),
                        controlPoint2: .init(x: 0.25, y: 1))
            $0.addCurve(to: .init(x: 0.5, y: 0),
                        controlPoint1: .init(x: 0.75, y: 1),
                        controlPoint2: .init(x: 0.75, y: 0))
        }
        return LetterStrokeData(paths: [s1], isLoop: true)
    }

    private static func strokeP() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.25, y: 0)) }
        let s2 = p {
            $0.move(to: .init(x: 0.25, y: 0))
            $0.addCurve(to: .init(x: 0.25, y: 0.5),
                        controlPoint1: .init(x: 0.75, y: 0),
                        controlPoint2: .init(x: 0.75, y: 0.5))
        }
        return LetterStrokeData(paths: [s1, s2], isLoop: false)
    }

    private static func strokeQ() -> LetterStrokeData {
        let o = strokeO().paths[0]
        let tail = p { $0.move(to: .init(x: 0.55, y: 0.55)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [o, tail], isLoop: true)
    }

    private static func strokeR() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.25, y: 0)) }
        let s2 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addCurve(to: .init(x: 0.25, y: 0.5),
                                controlPoint1: .init(x: 0.75, y: 0),
                                controlPoint2: .init(x: 0.75, y: 0.5)) }
        let s3 = p { $0.move(to: .init(x: 0.25, y: 0.5)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }
    
    private static func strokeS() -> LetterStrokeData {

        let s = p {

            // Start top-right
            $0.move(to: CGPoint(x: 0.62, y: 0.18))

            // Upper smooth curve
            $0.addCurve(
                to: CGPoint(x: 0.34, y: 0.48),
                controlPoint1: CGPoint(x: 0.50, y: 0.08),
                controlPoint2: CGPoint(x: 0.18, y: 0.28)
            )

            // Middle turn - smoother & more natural
            // 🔥 yaha sharp bend hata diya
            $0.addCurve(
                to: CGPoint(x: 0.65, y: 0.68),
                controlPoint1: CGPoint(x: 0.44, y: 0.56),
                controlPoint2: CGPoint(x: 0.66, y: 0.60)
            )

            // Bottom rounded curve
            $0.addCurve(
                to: CGPoint(x: 0.24, y: 0.86),
                controlPoint1: CGPoint(x: 0.70, y: 0.96),
                controlPoint2: CGPoint(x: 0.42, y: 1.02)
            )
        }

        return LetterStrokeData(
            paths: [s],
            isLoop: false
        )
    }

    private static func strokeT() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        let s2 = p { $0.move(to: .init(x: 0.5, y: 0)); $0.addLine(to: .init(x: 0.5, y: 1)) }
        return LetterStrokeData(paths: [s1, s2], isLoop: false)
    }

    private static func strokeU() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.25, y: 0.75)) }
        let s2 = p { $0.move(to: .init(x: 0.75, y: 0)); $0.addLine(to: .init(x: 0.75, y: 0.75)) }
        let s3 = p { $0.move(to: .init(x: 0.25, y: 0.75)); $0.addCurve(to: .init(x: 0.75, y: 0.75), controlPoint1: .init(x: 0.25, y: 1), controlPoint2: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }

    private static func strokeV() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.5, y: 1)) }
        let s2 = p { $0.move(to: .init(x: 0.5, y: 1)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        return LetterStrokeData(paths: [s1, s2], isLoop: false)
    }

    private static func strokeW() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.375, y: 1)) }
        let s2 = p { $0.move(to: .init(x: 0.375, y: 1)); $0.addLine(to: .init(x: 0.5, y: 0.5)) }
        let s3 = p { $0.move(to: .init(x: 0.5, y: 0.5)); $0.addLine(to: .init(x: 0.625, y: 1)) }
        let s4 = p { $0.move(to: .init(x: 0.625, y: 1)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        return LetterStrokeData(paths: [s1, s2, s3, s4], isLoop: false)
    }

    private static func strokeX() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        let s2 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        return LetterStrokeData(paths: [s1, s2], isLoop: false)
    }

    private static func strokeY() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.5, y: 0.5)) }
        let s2 = p { $0.move(to: .init(x: 0.75, y: 0)); $0.addLine(to: .init(x: 0.5, y: 0.5)) }
        let s3 = p { $0.move(to: .init(x: 0.5, y: 0.5)); $0.addLine(to: .init(x: 0.5, y: 1)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }

    private static func strokeZ() -> LetterStrokeData {
        let s1 = p { $0.move(to: .init(x: 0.25, y: 0)); $0.addLine(to: .init(x: 0.75, y: 0)) }
        let s2 = p { $0.move(to: .init(x: 0.75, y: 0)); $0.addLine(to: .init(x: 0.25, y: 1)) }
        let s3 = p { $0.move(to: .init(x: 0.25, y: 1)); $0.addLine(to: .init(x: 0.75, y: 1)) }
        return LetterStrokeData(paths: [s1, s2, s3], isLoop: false)
    }
    // MARK: Cursive - Not Working
    private static func norm(_ v: CGFloat, _ min: CGFloat, _ max: CGFloat) -> CGFloat {
        (v - min) / (max - min)
    }
    private static func cursiveStrokeData(for letter: Character) -> LetterStrokeData {
        switch letter {
        case "A": return cursiveA()
        case "B": return cursiveB()
        case "C": return cursiveC()
        case "D": return cursiveD()
        case "E": return cursiveE()
        case "F": return cursiveF()
        case "G": return cursiveG()
        case "H": return cursiveH()
        case "I": return cursiveI()
        case "J": return cursiveJ()
        case "K": return cursiveK()
        case "L": return cursiveL()
        case "M": return cursiveM()
        case "N": return cursiveN()
        case "O": return cursiveO()
        case "P": return cursiveP()
        case "Q": return cursiveQ()
        case "R": return cursiveR()
        case "S": return cursiveS()
        case "T": return cursiveT()
        case "U": return cursiveU()
        case "V": return cursiveV()
        case "W": return cursiveW()
        case "X": return cursiveX()
        case "Y": return cursiveY()
        case "Z": return cursiveZ()
        // ...
        default:
            return LetterStrokeData(paths: [], isLoop: false)
        }
    }
    private static func cursiveA() -> LetterStrokeData {

        let minX: CGFloat = 227.9209
        let maxX: CGFloat = 373.08554
        let minY: CGFloat = 423.6543
        let maxY: CGFloat = 582.99133

        let path = p { path in
            path.move(
                to: CGPoint(
                    x: norm(229.1709, minX, maxX),
                    y: norm(562.13184, minY, maxY)
                )
            )

            let points: [(CGFloat, CGFloat)] = [
                (228.01161,566.9393),(227.9209,571.9365),(228.47241,576.8567),
                (230.91945,581.1256),(235.38005,582.99133),(240.25269,582.29474),
                (243.96661,579.08826),(246.47377,574.7747),(248.5655,570.2354),
                (250.43762,565.5999),(252.02097,560.86383),(253.3557,556.0455),
                (254.61484,551.2066),(256.0144,546.4067),(257.3508,541.58923),
                (258.61548,536.75183),(259.92105,531.9253),(261.06247,527.05884),
                (262.07346,522.1627),(262.95706,517.24146),(263.87573,512.3266),
                (264.8336,507.41946),(265.87326,502.52875),(266.83322,497.6221),
                (267.75415,492.70764),(268.8419,487.8278),(269.95828,482.95404),
                (271.13165,478.0937),(272.3543,473.2459),(273.65448,468.4179),
                (274.9812,463.5971),(276.38422,458.7982),(277.9769,454.0617),
                (279.74988,449.38672),(281.5599,444.72583),(283.27805,440.03146),
                (285.00043,435.3382),(287.14572,430.8271),(289.64563,426.50717),
                (293.3176,423.6543),(296.70337,427.0615),(298.8763,431.56317),
                (301.03305,436.07147),(303.15067,440.5905),(304.83606,445.29654),
                (306.31183,450.0738),(307.60452,454.90317),(308.94467,459.71936),
                (310.38455,464.50754),(311.8855,469.2769),(313.32455,474.0646),
                (314.6738,478.87912),(315.90485,483.72507),(317.03934,488.5928),
                (317.9747,493.50455),(318.9084,498.4166),(319.82574,503.3317),
                (320.71246,508.25232),(321.4771,513.1935),(322.1151,518.15137),
                (322.63943,523.12354),(323.02106,528.109),(323.67502,533.06433),
                (324.35843,538.01733),(325.0506,542.9689),(325.83838,547.90607),
                (326.2763,552.88684),(326.7831,557.86096),(327.30066,562.8341),
                (328.00854,567.7833),(328.59302,572.7458),(329.2366,577.6993),
                (330.4586,580.8007),(330.83728,575.8161),(330.84848,570.817),
                (330.5666,565.8293),(329.90872,560.8728),(329.3097,555.9088),
                (328.42438,550.98956),(327.3548,546.107),(326.14722,541.255),
                (324.77618,536.4496),(323.15015,531.72284),(321.34375,527.0613),
                (319.29807,522.4989),(316.8337,518.1524),(314.08704,513.9799),
                (311.19827,509.89893),(308.30933,505.8192),(305.12555,501.9639),
                (301.64215,498.3798),(297.985,494.97147),(294.24683,491.66492),
                (289.9795,489.06003),(285.42804,487.03113),(280.72308,485.383),
                (275.73746,485.14453),(271.9071,488.15936),(269.47385,492.5144),
                (268.2536,497.3589),(267.57947,502.3081),(267.40723,507.301),
                (267.72705,512.286),(269.12677,517.07214),(271.2569,521.58185),
                (274.31143,525.51904),(277.76196,529.1278),(281.71194,532.184),
                (286.14133,534.4553),(290.98163,535.6611),(295.95135,536.08624),
                (300.87933,535.3468),(305.47574,533.41064),(309.54837,530.54596),
                (313.1039,527.03796),(316.40753,523.286),(319.6745,519.501),
                (322.52124,515.40216),(325.2455,511.2096),(328.00803,507.04214),
                (330.80374,502.89682),(333.6093,498.7582),(336.35754,494.5812),
                (339.26752,490.51547),(342.3823,486.60568),(345.59586,482.7752),
                (348.8298,478.96188),(351.94547,475.05313),(355.22705,471.28168),
                (358.7343,467.72992),(362.17117,464.10056),(366.0,460.89102),
                (369.80014,457.64746),(373.08554,454.21872)
            ]

            points.forEach { pt in
                path.addLine(to: CGPoint(x: norm(pt.0, minX, maxX), y: norm(pt.1, minY, maxY)))
            }
        }

        return LetterStrokeData(paths: [path], isLoop: true)
    }
    //B
    private static func cursiveB() -> LetterStrokeData {

        let minX: CGFloat = 293.39844
        let maxX: CGFloat = 403.15582
        let minY: CGFloat = 562.13184
        let maxY: CGFloat = 666.75415

        let path = p { path in
            path.move(
                to: CGPoint(
                    x: norm(306.89355, minX, maxX),
                    y: norm(570.88086, minY, maxY)
                )
            )

            let points: [(CGFloat, CGFloat)] = [
                (307.08994,575.86304),(308.07397,580.7652),(309.12485,585.65216),
                (310.55225,590.44403),(311.9128,595.25476),(312.554,600.2135),
                (313.01993,605.1912),(313.41614,610.1755),(313.95142,615.1457),
                (314.3162,620.1297),(314.38843,625.1286),(314.3367,630.12714),
                (314.15906,635.12286),(313.6061,640.0819),(312.92047,645.0298),
                (312.01416,649.93005),(310.4418,654.676),(308.7115,659.3642),
                (305.9461,663.3294),(301.13785,662.4941),(297.69864,658.93536),
                (295.62158,654.40454),(294.32614,649.5791),(293.44052,644.6648),
                (293.39844,639.66626),(293.39844,634.66626),(293.39844,629.66626),
                (293.6402,624.67566),(294.21893,619.7246),(294.66592,614.74475),
                (294.894,609.75385),(295.1981,604.76434),(295.6309,599.7848),
                (296.26752,594.8471),(297.5005,590.0043),(298.70267,585.15314),
                (300.0743,580.34705),(301.88394,575.69763),(304.55676,571.5091),
                (308.35538,568.27325),(312.5633,565.57837),(316.97095,563.28204),
                (321.8691,562.3786),(326.8482,562.13184),(331.67438,563.13214),
                (336.17093,565.2768),(340.18787,568.2354),(343.53912,571.9283),
                (346.61133,575.86926),(349.1621,580.1682),(350.77176,584.86395),
                (351.12793,589.8382),(350.2259,594.7208),(348.19794,599.2894),
                (345.71814,603.6186),(342.17624,607.123),(337.98758,609.8168),
                (333.42468,611.8512),(328.62946,613.2145),(333.37122,612.0377),
                (338.35333,611.624),(343.35333,611.624),(348.1336,613.0006),
                (352.34805,615.61835),(355.41766,619.4664),(357.277,624.07764),
                (358.17285,628.98883),(358.37598,633.9802),(357.57254,638.88556),
                (355.99606,643.62616),(353.6745,648.04785),(350.97,652.24677),
                (348.02493,656.2781),(344.6181,659.9123),(340.81442,663.1556),
                (336.37802,665.4268),(331.55017,666.6718),(326.56528,666.75415),
                (321.61026,666.13617),(316.76712,664.8989),(312.16144,662.9752),
                (308.7991,659.46216),(308.56775,654.5414),(311.05347,650.2506),
                (314.8482,647.01526),(319.14224,644.49347),(323.87302,642.9033),
                (328.80197,642.1399),(333.7897,641.8701),(338.77615,642.12006),
                (343.54462,643.50586),(347.5139,646.5045),(350.65265,650.38367),
                (353.5859,654.4247),(356.6356,658.36804),(360.6276,661.2429),
                (365.35004,662.78174),(370.27008,663.6162),(375.27008,663.6162),
                (380.20483,663.06976),(384.9672,661.5493),(389.21176,658.9827),
                (392.81952,655.5327),(396.0404,651.7091),(399.27994,647.9105),
                (403.15582,645.86914)
            ]

            points.forEach { pt in
                path.addLine(to: CGPoint(x: norm(pt.0, minX, maxX),
                                         y: norm(pt.1, minY, maxY)))
            }
        }

        return LetterStrokeData(paths: [path], isLoop: true)
    }
    private static func cursiveC() -> LetterStrokeData {

        let minX: CGFloat = 312.1416
        let maxX: CGFloat = 402.2585
        let minY: CGFloat = 769.8496
        let maxY: CGFloat = 869.334

        let path = p { path in
            path.move(
                to: CGPoint(
                    x: norm(312.1416, minX, maxX),
                    y: norm(810.59375, minY, maxY)
                )
            )

            let points: [(CGFloat, CGFloat)] = [
                (317.1339,810.84375),(322.1339,810.84375),(327.1339,810.84375),
                (332.12344,810.5447),(337.10297,810.0946),(342.06723,809.50745),
                (346.9938,808.70233),(351.80234,807.3843),(356.50323,805.71216),
                (361.03818,803.6087),(365.61304,801.59985),(369.84283,798.949),
                (374.01184,796.1949),(377.8739,793.0193),(380.92938,789.11505),
                (383.4919,784.83545),(384.35333,779.96796),(383.9796,775.02155),
                (381.0684,771.0737),(376.29218,769.8496),(371.29532,769.9026),
                (366.41675,770.9637),(361.86142,773.00323),(357.56528,775.5563),
                (353.87283,778.90845),(350.72644,782.7906),(347.7688,786.8203),
                (345.254,791.13965),(342.9127,795.55414),(340.66818,800.02203),
                (338.94638,804.70404),(337.61823,809.52386),(336.80365,814.452),
                (336.1397,819.4077),(335.41742,824.3551),(335.3838,829.3547),
                (335.62427,834.3467),(336.0641,839.32733),(337.28366,844.16034),
                (339.2487,848.74976),(341.77194,853.06396),(344.84482,856.99475),
                (348.2217,860.6778),(352.12427,863.77576),(356.40213,866.34174),
                (361.08212,868.07904),(365.9735,869.10486),(370.96265,869.334),
                (375.939,868.91003),(380.68048,867.34436),(385.09445,864.99756),
                (389.2407,862.2182),(392.89243,858.80676),(396.20364,855.07526),
                (398.86636,850.84625),(401.0138,846.3353),(402.2585,841.51135),
                (402.1289,836.5413),(400.5557,831.8342),(397.5906,827.8197),
                (393.27115,825.3886),(388.6275,823.7475),(383.67093,823.3418),
                (378.67093,823.3418)
            ]

            points.forEach { pt in
                path.addLine(to: CGPoint(x: norm(pt.0, minX, maxX), y: norm(pt.1, minY, maxY)))
            }
        }

        return LetterStrokeData(paths: [path], isLoop: true)
    }
    private static func cursiveD() -> LetterStrokeData {

        let minX: CGFloat = 257.9098   // 272.9098 - 15
        let maxX: CGFloat = 360.62634  // 345.62634 + 15
        let minY: CGFloat = 835.33984
        let maxY: CGFloat = 945.32227

        let path = p { path in
            path.move(
                to: CGPoint(
                    x: norm(299.8955, minX, maxX),
                    y: norm(836.58887, minY, maxY)
                )
            )

            let points: [(CGFloat, CGFloat)] = [
                (298.901,841.48724),(298.39648,846.4476),(298.41214,851.4475),
                (298.64395,856.4366),(298.91144,861.4213),(298.89648,866.42126),
                (298.89648,871.42126),(298.8461,876.4197),(298.65445,881.4142),
                (298.64648,886.4142),(298.64648,891.4142),(298.6995,896.4124),
                (298.89648,901.40436),(298.89648,906.40436),(298.89648,911.40436),
                (298.80054,916.398),(298.39648,921.3722),(297.91425,926.3351),
                (297.2854,931.2729),(296.1916,936.13464),(293.45374,940.26697),
                (289.9196,943.7564),(285.4072,945.32227),(280.6331,944.4629),
                (276.8284,941.2495),(274.0858,937.0963),(272.9098,932.2607),
                (273.74634,927.4386),(276.85455,923.68445),(281.50186,921.90894),
                (286.26733,920.3987),(291.1893,919.6831),(296.16232,919.3262),
                (301.03662,920.2785),(305.38156,922.7099),(309.72638,925.1761),
                (314.19702,927.39813),(318.93018,928.8252),(323.89462,928.5181),
                (328.32483,926.30194),(332.1976,923.1436),(335.62186,919.518),
                (338.41434,915.3809),(340.79037,910.9991),(342.7625,906.40533),
                (344.19296,901.6235),(345.1475,896.72473),(345.62634,891.7536),
                (345.2079,886.78937),(343.81387,881.9929),(342.23895,877.25024),
                (340.28763,872.65027),(338.13162,868.14166),(335.61813,863.82587),
                (333.17325,859.4701),(330.9833,854.9797),(328.21298,850.8204),
                (325.33255,846.7624),(321.93243,843.161),(318.04736,840.04285),
                (313.72583,837.5296),(308.97818,836.03754),(304.01694,835.5275),
                (299.028,835.33984),(294.124,835.9905),(289.51443,837.8924),
                (285.58783,840.9063),(283.15433,845.1691),(282.15234,849.9783),
                (283.01044,854.8039),(285.96506,858.7632),(289.9787,861.63324),
                (294.78027,862.83453),(299.7616,862.62427),(304.36307,860.70355),
                (308.30594,857.65436)
            ]

            points.forEach { pt in
                path.addLine(
                    to: CGPoint(
                        x: norm(pt.0, minX, maxX),
                        y: norm(pt.1, minY, maxY)
                    )
                )
            }
        }

        return LetterStrokeData(paths: [path], isLoop: true)
    }
    
    private static func cursiveE() -> LetterStrokeData {

        let minX: CGFloat = 270
        let maxX: CGFloat = 360
        let minY: CGFloat = 710
        let maxY: CGFloat = 860

        let path = p { path in

            // START FROM LEFT TOP
            // little higher start for longer top entry stroke
            path.move(to: CGPoint(
                x: norm(292, minX, maxX),
                y: norm(730, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [

                // ========= FLOW INTO LOOP =========

                (294,733),
                (296,736),
                (299,739),
                (302,743),
                (305,747),
                (309,751),
                (314,754),

                // ========= TOP LOOP =========

                (319,756),
                (323,755),
                (326,752),
                (328,748),
                (329,743),
                (329,738),

                (328,734),
                (325,731),
                (321,729),
                (316,727),
                (311,727),
                (306,729),
                (302,733),
                (300,737),
                (300,742),

                // ========= EXIT LOOP =========

                (301,745),
                (302,748),
                (303,752),
                (305,756),
                (307,760),
                (309,765),
                (312,770),
                (316,774),
                (320,777),
                (324,779),
                (328,781),
                (332,782),

                // ========= SMALL MIDDLE HOOK =========

                (331,783),
                (329,783),
                (326,784),
                (323,784),
                (319,785),

                // ========= LONG CURSIVE CURVE =========

                (316,787),
                (313,790),
                (310,794),
                (307,799),
                (305,804),
                (303,810),
                (302,816),
                (301,822),
                (301,829),

                (302,835),
                (304,840),
                (307,845),
                (311,849),
                (315,852),
                (319,854),
                (323,856),
                (327,857),
                (330,857)
            ]

            points.forEach {
                path.addLine(
                    to: CGPoint(
                        x: norm($0.0, minX, maxX),
                        y: norm($0.1, minY, maxY)
                    )
                )
            }
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    private static func cursiveF() -> LetterStrokeData {

        let minX: CGFloat = 386.24847 - 20
        let maxX: CGFloat = 482.56683 + 50
        let minY: CGFloat = 903.10834
        let maxY: CGFloat = 1013.0615

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(400.36133, minX, maxX),
                y: norm(941.07324, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [

                // 👇 upper part SAME as before
                (395.99945,938.6592),(392.0954,935.55536),(388.47574,932.1226),
                (386.24847,927.6872),(387.8426,923.1623),(391.87256,920.28174),
                (396.61063,918.70233),(401.55792,918.07715),(406.55786,918.08856),
                (411.50122,918.7448),(416.3422,919.9651),(421.16223,921.2602),
                (425.92636,922.76086),(430.72208,924.1752),(435.56073,925.431),
                (440.46335,926.34686),(445.4432,926.699),(450.42065,927.0752),
                (455.39902,927.3252),(460.3329,926.733),(464.8882,924.6961),
                (468.62967,921.4793),(471.31592,917.3013),(472.58594,912.54193),
                (471.17413,907.8329),(467.3269,904.7188),(462.57104,903.3209),
                (457.5839,903.10834),

                // 👇 yaha se sirf niche wala part fix
                (455.5839,920.10834),
                (454.5839,935.10834),
                (454.5839,950.10834),

                // 👇 straight body
                (454.5839,965.10834),
                (454.5839,980.10834),

                // 👇 bottom smooth loop
                (452.5839,992.10834),
                (447.5839,1000.10834),
                (440.5839,1005.10834),

                (433.5839,1001.10834),
                (430.5839,993.10834),
                (430.5839,984.10834),

                // 👇 upward smooth turn
                (434.5839,977.10834),
                (442.5839,973.10834),
                (452.5839,972.10834),

                // 👇 small right tail
                (468.56683,966.81854),
                (474.56683,964.81854),
                (480.56683,962.81854)
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
    
    private static func cursiveG() -> LetterStrokeData {

        let path = p { path in

            // Entry stroke
            path.move(to: CGPoint(x: 0.12, y: 0.48))

            path.addLine(to: CGPoint(x: 0.22, y: 0.12))

            // Top loop
            path.addCurve(
                to: CGPoint(x: 0.54, y: 0.18),
                controlPoint1: CGPoint(x: 0.08, y: 0.58),
                controlPoint2: CGPoint(x: 0.62, y: 0.50)
            )

            // Direct down stroke
            path.addCurve(
                to: CGPoint(x: 0.46, y: 0.54),
                controlPoint1: CGPoint(x: 0.58, y: 0.28),
                controlPoint2: CGPoint(x: 0.52, y: 0.44)
            )

            // Large lower left oval loop
            path.addCurve(
                to: CGPoint(x: 0.12, y: 0.82),
                controlPoint1: CGPoint(x: 0.38, y: 0.78),
                controlPoint2: CGPoint(x: 0.14, y: 0.92)
            )

            // Return upward
            path.addCurve(
                to: CGPoint(x: 0.46, y: 0.54),
                controlPoint1: CGPoint(x: 0.10, y: 0.56),
                controlPoint2: CGPoint(x: 0.30, y: 0.50)
            )

            // Exit stroke
            path.addCurve(
                to: CGPoint(x: 0.78, y: 0.52),
                controlPoint1: CGPoint(x: 0.58, y: 0.58),
                controlPoint2: CGPoint(x: 0.70, y: 0.54)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    

    private static func cursiveH() -> LetterStrokeData {

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
                (356.0,486.0),
                (349.0,485.0),
                (342.0,489.0),

                // curve down
                (338.0,500.0),
                (336.0,515.0),
                (336.0,530.0),

                // keep more space from first stroke
                (338.0,545.0),
                (341.0,560.0),

                // straighter downward stroke
                (344.0,570.0),
                (346.0,578.0)
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
    
    //            // 6. Right arch
    //            path.addCurve(
    //                to: CGPoint(x: 0.68, y: 0.15),
    //                controlPoint1: CGPoint(x: 0.75, y: 0.38),
    //                controlPoint2: CGPoint(x: 0.74, y: 0.22)
    //            )
    //
    //            // 7. Right stem
    //            path.addCurve(
    //                to: CGPoint(x: 0.68, y: 0.82),
    //                controlPoint1: CGPoint(x: 0.66, y: 0.25),
    //                controlPoint2: CGPoint(x: 0.68, y: 0.60)
    //            )
    
    
    private static func cursiveI() -> LetterStrokeData {

        let path = p { path in

            // Start near center
            path.move(to: CGPoint(x: 0.80, y: 0.25))

            // Much bigger upper sweep
            path.addCurve(
                to: CGPoint(x: 0.58, y: 0.06),
                controlPoint1: CGPoint(x: -0.30, y: 0.78),
                controlPoint2: CGPoint(x: 0.58, y: -0.08)
            )

            // Top se almost straight downward
            path.addCurve(
                to: CGPoint(x: 0.58, y: 0.50),
                controlPoint1: CGPoint(x: 0.58, y: 0.16),
                controlPoint2: CGPoint(x: 0.58, y: 0.34)
            )

            // Cross center and move down
            path.addCurve(
                to: CGPoint(x: 0.50, y: 0.84),
                controlPoint1: CGPoint(x: 0.58, y: 0.68),
                controlPoint2: CGPoint(x: 0.55, y: 0.78)
            )

            // Bottom hook
            path.addCurve(
                to: CGPoint(x: 0.26, y: 0.76),
                controlPoint1: CGPoint(x: 0.42, y: 0.95),
                controlPoint2: CGPoint(x: 0.22, y: 0.90)
            )

        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    private static func cursiveJ() -> LetterStrokeData {

        let padding: CGFloat = 25
        let minX: CGFloat = 310.90155 - padding
        let maxX: CGFloat = 394.48425 + padding
        let minY: CGFloat = 791.5898 - padding
        let maxY: CGFloat = 885.33203

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(345.12988, minX, maxX),
                y: norm(805.09375, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [
                (340.5512,807.101),(335.9388,809.03094),(331.29935,810.89044),
                (326.4694,812.1083),(321.52112,812.8161),(316.5291,812.6431),
                (312.44913,809.9542),(310.90155,805.31586),
                (310.9752,800.3721),(312.88757,795.8073),(315.5687,791.5898),
                (318.74033,787.7319),(322.27972,784.20264),(325.83206,780.6845),
                (329.23074,777.0185),(332.63602,773.3587),(335.737,769.44476),
                (338.33154,765.18036),(339.47174,768.85706),
                (339.94464,773.83435),(340.2851,778.8218),(340.56366,783.814),
                (340.63025,788.8132),(340.413,793.8082),(339.81635,798.77234),
                (339.28247,803.7438),(338.82352,808.72125),
                (338.48587,813.7098),(338.01175,818.68665),
                (337.62512,823.6711),(337.14923,828.6435),
                (336.99854,833.6396),(336.70554,838.631),
                (336.16226,843.59937),(335.58054,848.5637),
                (334.96725,853.5224),(334.57785,858.5063),
                (333.9466,863.46155),(332.46497,868.22955),
                (330.60944,872.86835),(328.39197,877.3422),
                (325.25342,881.2123),(320.98816,883.7368),
                (316.16565,884.9816),(311.1874,885.33203),
                (306.27054,884.70764),(302.2382,881.84827),
                (299.633,877.5995),(298.6902,872.7049),
                (298.64648,867.70825),(299.55157,862.822),
                (300.8181,858.02527),(303.67987,853.9615),
                (307.21713,850.47003),(311.50937,847.9318),
                (315.9849,845.705),(320.81998,844.55),
                (325.79178,844.0908),(330.79175,844.0879),
                (335.79175,844.0879),(340.77692,843.8695),
                (345.74002,843.39545),(350.42056,841.69214),
                (355.061,839.8714),(359.24802,837.15955),
                (363.27774,834.21564),(367.03265,830.93024),
                (370.43893,827.2777),(373.83945,823.622),
                (376.93536,819.724),(380.1201,815.88715),
                (383.37354,812.13965),(386.90112,808.65796),
                (390.7292,805.4669),(394.48425,802.2787)
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
    private static func cursiveK() -> LetterStrokeData {

        let minX: CGFloat = 386 + 50
        let maxX: CGFloat = 520 - 50
        let minY: CGFloat = 903 + 35
        let maxY: CGFloat = 1035 - 50

        let rawPath1: [(CGFloat, CGFloat)] = [
            (428.10156,953.8213),(429.7533,949.2838),(432.82706,945.34485),
            (436.29224,941.7594),(440.08203,938.52246),(444.4052,936.28094),
            (448.0925,939.0365),(450.38776,943.46063),(452.17697,948.0809),
            (453.30002,952.94934),(453.8161,957.91724),
            (454.34012,962.8866),(454.90714,967.8541),
            (455.0918,972.8467),(455.0918,977.8467),(455.0918,982.8467),
            (455.0918,987.8467),(455.0918,992.8467),(455.0918,997.8467),
            (455.0918,1002.8467),(454.41953,1007.7723),
            (453.32382,1012.6469),(452.08322,1017.47064),
            (450.11667,1022.0529),(448.02426,1026.5908),
            (444.75937,1030.3181),(440.25473,1032.3572),
            (435.4017,1031.9069),(431.97705,1028.3534),
            (429.46014,1024.044),(427.02267,1019.7068),
            (425.85254,1014.89954)
        ]

        let rawPath2: [(CGFloat, CGFloat)] = [
            (497.32715,955.0713),(495.05118,959.4183),(493.03244,963.9028),
            (490.30072,968.08325),(488.153,972.55853),(485.73572,976.8087),
            (482.85538,980.8912),(480.36508,985.1901),
            (477.14865,988.98773),(473.3104,992.1677),
            (469.25278,994.4606),(464.65628,996.39716),
            (459.8755,997.81445),(456.21997,999.1863),
            (456.4956,1003.20386),(459.8196,1006.93384),
            (462.9937,1010.7966),(466.46094,1014.3927),
            (470.4609,1017.36127),(474.39432,1020.4136),
            (478.67325,1022.992),(483.03888,1025.3939),
            (487.6017,1027.388),(492.52582,1028.0596),
            (497.49695,1027.6998),(502.15747,1025.9514),
            (506.28558,1023.1384),(509.98102,1019.79736),
            (512.0903,1015.2764)
        ]

        let path1 = p { path in
            path.move(to: CGPoint(
                x: norm(rawPath1[0].0, minX, maxX),
                y: norm(rawPath1[0].1, minY, maxY)
            ))
            rawPath1.dropFirst().forEach {
                path.addLine(to: CGPoint(
                    x: norm($0.0, minX, maxX),
                    y: norm($0.1, minY, maxY)
                ))
            }
        }

        let path2 = p { path in
            path.move(to: CGPoint(
                x: norm(rawPath2[0].0, minX, maxX),
                y: norm(rawPath2[0].1, minY, maxY)
            ))
            rawPath2.dropFirst().forEach {
                path.addLine(to: CGPoint(
                    x: norm($0.0, minX, maxX),
                    y: norm($0.1, minY, maxY)
                ))
            }
        }

        return LetterStrokeData(paths: [path1, path2], isLoop: true)
    }
    
    private static func cursiveL() -> LetterStrokeData {

        let minX: CGFloat = 386.24847 - 20
        let maxX: CGFloat = 482.56683 + 50
        let minY: CGFloat = 903.10834
        let maxY: CGFloat = 1013.0615

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(411.50122, minX, maxX),
                y: norm(918.7448, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [

                (411.50122,918.7448),
                (416.3422,919.9651),
                (421.16223,921.2602),
                (425.92636,922.76086),
                (430.72208,924.1752),
                (435.56073,925.431),
                (440.46335,926.34686),
                (445.4432,926.699),
                (450.42065,927.0752),
                (455.39902,927.3252),
                (460.3329,926.733),
                (464.8882,924.6961),
                (468.62967,921.4793),
                (471.31592,917.3013),
                (472.58594,912.54193),
                (471.17413,907.8329),
                (467.3269,904.7188),
                (462.57104,903.3209),
                (457.5839,903.10834),
           
                // 👇 bottom round loop
                (452.5839,992.10834),

                // left curve
                (447.5839,1002.10834),
                (439.5839,1007.10834),

                // bottom round
                (430.5839,1004.10834),
                (425.5839,996.10834),
                (425.5839,988.10834),

                // 👇 instead of going too much upward,
                // make a side smooth circular exit
                (428.5839,982.10834),
                (434.5839,978.10834),
                (442.5839,977.10834),

                // 👇 side flow (lower + much longer curve)
                (450.5839,980.10834),
                (462.56683,986.81854),
                (476.56683,992.81854),

                // 👇 extended smooth cursive tail
                (490.56683,995.81854),
                (505.56683,994.81854),
                (518.56683,990.81854),

                // 👇 soft ending
                (528.56683,986.81854),
                (536.56683,982.81854)

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
    
    private static func cursiveM() -> LetterStrokeData {

        let padding: CGFloat = 25
        let minX: CGFloat = 255.41113 - padding
        let maxX: CGFloat = 374.8666 + padding
        let minY: CGFloat = 774.74243
        let maxY: CGFloat = 862.08417

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(255.41113, minX, maxX),
                y: norm(855.0869, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [
                (257.57144,859.4934),(261.98636,861.7395),
                (266.90598,862.08417),(271.5149,860.284),
                (275.28693,857.00476),(278.61212,853.283),
                (281.4888,849.2026),(283.78333,844.767),
                (285.89026,840.23724),(287.2727,835.43304),
                (288.52972,830.5942),(289.9039,825.7868),
                (291.01428,820.91876),(292.05844,816.0306),
                (293.25278,811.1754),(294.45517,806.3241),
                (295.68753,801.4815),(296.8717,796.62445),
                (298.1431,791.78937),(299.57568,787.0267),
                (301.3251,782.349),(304.0194,778.1949),
                (306.78012,781.21277),(308.77554,785.7732),
                (310.20554,790.5572),(311.10507,795.47144),
                (311.5817,800.44666),(311.84436,805.4395),
                (312.54736,815.4147),(313.56525,830.3797),
                (316.2211,845.10376),(320.3728,847.691),
                (323.32367,843.6686),(325.45975,839.15094),
                (327.08923,834.425),(329.8083,824.80505),
                (332.71518,815.24854),(335.7415,805.7177),
                (339.45346,796.4461),(343.52478,787.3193),
                (348.35477,778.581),(351.41556,774.74243),
                (353.43494,778.95264),(354.192,783.8923),
                (354.37177,788.88416),(355.08087,798.85406),
                (356.37598,823.7953),(356.62598,838.79065),
                (357.6234,853.6884),(359.76822,858.17145),
                (363.59332,860.58594),(367.95145,858.2876),
                (371.48666,854.76685),(374.8666,851.1202)
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
    
    
    private static func cursiveN() -> LetterStrokeData {

        let minX: CGFloat = 241.92792
        let maxX: CGFloat = 344.97897
        let minY: CGFloat = 818.4148
        let maxY: CGFloat = 895.25616

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(246.91406, minX, maxX),
                y: norm(873.084, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [
                (243.74828,876.8696),(242.2993,881.5414),(241.92792,886.52155),
                (244.73824,890.25616),(249.5467,889.7362),
                (253.76236,887.05176),(257.36343,883.59924),
                (260.33322,879.5819),(263.0404,875.38434),
                (265.44873,871.00287),(267.47757,866.44165),
                (269.0394,861.6929),(270.5785,856.93604),
                (272.2668,852.2299),(273.91794,847.5112),
                (275.30222,842.7081),(276.36792,837.82355),
                (277.45218,832.9425),(278.5714,828.07074),
                (279.57822,823.174),(280.96872,818.4148),
                (284.50604,818.8325),(286.6008,823.3334),
                (287.9498,828.1444),(289.209,832.9829),
                (290.45203,837.8235),(291.582,842.6879),
                (292.24094,847.6417),(293.01614,852.5799),
                (294.04733,857.47235),(294.85233,862.4051),
                (295.5836,867.3429),(296.65552,872.22485),
                (297.85568,877.078),(299.68396,881.70386),
                (302.2457,885.9918),(304.45428,889.96423),
                (306.63504,885.5464),(308.65594,880.97595),
                (310.11823,876.1976),(311.41046,871.3722),
                (312.51004,866.50336),(313.99146,861.728),
                (314.92245,856.81714),(316.2783,852.01),
                (318.07327,847.3465),(320.13895,842.8074),
                (322.22546,838.26587),(324.3889,833.76733),
                (326.82693,829.4027),(329.64023,825.2769),
                (332.93726,821.52576),(336.37576,817.9055),
                (340.40137,814.98346),(344.97897,813.1442)
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
    
    private static func cursiveO() -> LetterStrokeData {

        let path = p { path in

            // Start top center
            path.move(to: CGPoint(x: 0.50, y: 0.16))

            // Top → LEFT
            path.addCurve(
                to: CGPoint(x: 0.26, y: 0.50),
                controlPoint1: CGPoint(x: 0.34, y: 0.16),
                controlPoint2: CGPoint(x: 0.26, y: 0.30)
            )

            // Left → Bottom
            path.addCurve(
                to: CGPoint(x: 0.50, y: 0.84),
                controlPoint1: CGPoint(x: 0.26, y: 0.70),
                controlPoint2: CGPoint(x: 0.34, y: 0.84)
            )

            // Bottom → Right
            path.addCurve(
                to: CGPoint(x: 0.74, y: 0.50),
                controlPoint1: CGPoint(x: 0.66, y: 0.84),
                controlPoint2: CGPoint(x: 0.74, y: 0.70)
            )

            // Right → Top
            path.addCurve(
                to: CGPoint(x: 0.50, y: 0.16),
                controlPoint1: CGPoint(x: 0.74, y: 0.30),
                controlPoint2: CGPoint(x: 0.66, y: 0.16)
            )


            // Inner stroke (left → down → right outside)

            path.move(to: CGPoint(x: 0.46, y: 0.18))

            // Slightly downward inside
            path.addCurve(
                to: CGPoint(x: 0.52, y: 0.34),
                controlPoint1: CGPoint(x: 0.42, y: 0.22),
                controlPoint2: CGPoint(x: 0.44, y: 0.32)
            )

            // Exit toward right outside
            path.addCurve(
                to: CGPoint(x: 0.80, y: 0.22),
                controlPoint1: CGPoint(x: 0.60, y: 0.30),
                controlPoint2: CGPoint(x: 0.72, y: 0.20)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    private static func cursiveP() -> LetterStrokeData {

        let minX: CGFloat = 250.0371 - 25
        let maxX: CGFloat = 340.0 + 40
        let minY: CGFloat = 745.0
        let maxY: CGFloat = 870.0

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(270.0, minX, maxX),
                y: norm(760.0, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [

                // MARK: - Top left arch

                (270.0,746.0),
                (272.0,742.0),
                (276.0,740.0),
                (281.0,741.0),
                (286.0,746.0),

                // MARK: - Fall into stem

                (288.0,752.0),
                (290.0,760.0),
                (291.0,770.0),
                (291.0,784.0),
                (291.0,798.0),
                (290.0,812.0),

                // MARK: - Long left stroke

                (289.0,824.0),
                (286.0,838.0),
                (284.0,850.0),
                (282.0,860.0),
                (280.0,870.0),
                (278.0,876.0),

                // MARK: - Bottom rounded turn

                (276.0,880.0),
                (272.0,882.0),
                (268.0,880.0),
                (266.0,876.0),
                (264.0,870.0),
                (264.0,862.0),

                // MARK: - Smooth upward return

                (264.0,854.0),
                (265.0,846.0),
                (266.0,836.0),
                (268.0,826.0),
                (270.0,816.0),
                (273.0,806.0),
                (276.0,798.0),
                (278.0,790.0),

                // MARK: - Crossing center

                (282.0,780.0),
                (286.0,772.0),

                // MARK: - Top of right loop

                (292.0,762.0),
                (298.0,756.0),
                (306.0,752.0),
                (315.0,752.0),
                (323.0,756.0),
                (329.0,764.0),

                // MARK: - Outer egg curve

                (333.0,774.0),
                (335.0,786.0),
                (335.0,798.0),
                (333.0,810.0),
                (331.0,818.0),
                (328.0,824.0),
                (324.0,829.0),

                // MARK: - Bottom rounded bowl (smoother)

                (320.0,833.0),
                (315.0,836.0),
                (310.0,837.0),
                (305.0,836.0),
                (301.0,834.0),
                (298.0,831.0),

                // MARK: - Inner return curve

                (297.0,826.0),
                (297.0,820.0),
                (298.0,813.0),
                (300.0,806.0),
                (303.0,799.0),
                (307.0,793.0),
                (313.0,789.0),
            ]

            points.forEach {
                path.addLine(to: CGPoint(
                    x: norm($0.0, minX, maxX),
                    y: norm($0.1, minY, maxY)
                ))
            }
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    private static func cursiveQ() -> LetterStrokeData {

        let path = p { path in

            // 🔥 thoda aur niche start
            path.move(to: CGPoint(x: 0.34, y: 0.86))

            // left side up
            path.addCurve(
                to: CGPoint(x: 0.45, y: 0.08),
                controlPoint1: CGPoint(x: 0.20, y: 0.66),
                controlPoint2: CGPoint(x: 0.26, y: 0.18)
            )

            // top
            path.addCurve(
                to: CGPoint(x: 0.62, y: 0.16),
                controlPoint1: CGPoint(x: 0.50, y: 0.02),
                controlPoint2: CGPoint(x: 0.58, y: 0.05)
            )

            // right side down
            path.addCurve(
                to: CGPoint(x: 0.55, y: 0.80),
                controlPoint1: CGPoint(x: 0.72, y: 0.28),
                controlPoint2: CGPoint(x: 0.70, y: 0.62)
            )

            // 🔥 niche touch
            path.addCurve(
                to: CGPoint(x: 0.34, y: 0.86),
                controlPoint1: CGPoint(x: 0.48, y: 0.90),
                controlPoint2: CGPoint(x: 0.40, y: 0.92)
            )

            // 🔥 pehle halka gol upar
            path.addCurve(
                to: CGPoint(x: 0.50, y: 0.70),
                controlPoint1: CGPoint(x: 0.34, y: 0.76),
                controlPoint2: CGPoint(x: 0.44, y: 0.66)
            )

            // 🔥 ab niche aake right niklo
            path.addCurve(
                to: CGPoint(x: 0.75, y: 0.72),
                controlPoint1: CGPoint(x: 0.58, y: 0.82),
                controlPoint2: CGPoint(x: 0.68, y: 0.74)
            )
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: false
        )
    }
  
    private static func cursiveR() -> LetterStrokeData {

        let minX: CGFloat = 250.0371 - 25
        let maxX: CGFloat = 340.0 + 40
        let minY: CGFloat = 745.0
        let maxY: CGFloat = 910.0

        let path = p { path in

            path.move(to: CGPoint(
                x: norm(258.0, minX, maxX),
                y: norm(760.0, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [

                // MARK: - Top left arch

                (258.0,760.0),
                (258.0,752.0),
                (259.0,744.0),
                (262.0,736.0),
                (267.0,728.0),
                (274.0,722.0),
                (282.0,720.0),
                (288.0,723.0),
                (292.0,730.0),

                // MARK: - Fall into stem

                (294.0,740.0),
                (294.0,748.0),
                (293.0,758.0),
                (292.0,770.0),

                // MARK: - Downward flow

                (291.0,776.0),
                (290.0,784.0),
                (289.0,794.0),
                (288.0,804.0),
                (287.0,816.0),
                (286.0,830.0),
                (285.0,842.0),
                (284.0,854.0),
                (282.0,866.0),
                (280.0,876.0),
                (278.0,882.0),

                // MARK: - Bottom turn (tighter)

                (276.0,887.0),
                (274.0,891.0),
                (271.0,894.0),
                (267.0,896.0),
                (263.0,895.0),
                (260.0,892.0),
                (258.0,888.0),

                // MARK: - Upward return into right loop

                (258.0,882.0),
                (259.0,874.0),
                (260.0,866.0),
                (262.0,856.0),
                (264.0,846.0),
                (266.0,836.0),
                (268.0,826.0),
                (271.0,816.0),
                (274.0,806.0),
                (278.0,796.0),
                (282.0,786.0),
                (286.0,778.0),
                (290.0,772.0),

                // Swing directly into upper right loop

                (296.0,762.0),
                (304.0,750.0),
                (312.0,742.0),
                (320.0,740.0),
                (328.0,744.0),
                (334.0,752.0),

                // Top of loop

                (338.0,760.0),
                (341.0,774.0),
                (342.0,790.0),
                (342.0,806.0),

                // Downward side of loop

                (339.0,820.0),
                (333.0,830.0),
                (324.0,836.0),
                (314.0,838.0),
                (306.0,836.0),

                // MARK: - Inner loop (smaller)

                (298.0,832.0),
                (293.0,830.0),
                (290.0,826.0),
                (288.0,821.0),
                (287.0,816.0),
                (287.0,810.0),

                (288.0,805.0),
                (291.0,802.0),
                (295.0,800.0),
                (299.0,800.0),
                (303.0,802.0),
                (305.0,805.0),

                // MARK: - Lower tail

                (309.0,810.0),
                (310.0,818.0),
                (311.0,828.0),
                (312.0,838.0),
                (313.0,850.0),
                (314.0,860.0),
                (315.0,872.0),
                (316.0,882.0),

                // Less curved, more rightward ending

                (320.0,886.0),
                (326.0,888.0),
                (332.0,887.0),
                (338.0,882.0),
                (342.0,874.0),
                (344.0,866.0)
            ]

            points.forEach {
                path.addLine(to: CGPoint(
                    x: norm($0.0, minX, maxX),
                    y: norm($0.1, minY, maxY)
                ))
            }
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    private static func cursiveS() -> LetterStrokeData {

        let minX: CGFloat = 245.91504 - 25
        let maxX: CGFloat = 377.86914 + 25
        let minY: CGFloat = 839.43854 - 70
        let maxY: CGFloat = 923.8158

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(273.15527, minX, maxX),
                y: norm(923.3262, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [
                (276.24423,919.3949),(279.28354,915.4256),
                (282.43066,911.545),(285.2572,907.4208),
                (288.01276,903.24866),(290.77457,899.08093),
                (293.50552,894.89514),(296.0989,890.62036),
                (298.7535,886.38354),(301.39703,882.14026),
                (303.9787,877.85846),(306.55322,873.5733),
                (308.9629,869.1924),(311.2909,864.7674),
                (313.4382,860.25195),(315.4302,855.6661),
                (317.51822,851.1232),(319.33417,846.4665),
                (321.07843,841.79065),(322.41238,836.97375),
                (323.78677,832.16754),(325.17233,827.3652),
                (326.21866,822.477),(327.1775,817.5765),
                (327.61676,812.5983),(327.86252,807.60516),
                (327.88574,802.6052),(327.88574,797.6052),
                (327.88574,792.6052),(327.88574,787.6052),
                (327.6489,782.6174),(326.55078,777.7554),
                (324.6306,773.14044),(322.01187,768.9007),
                (317.74167,766.8506),(313.86505,769.56464),
                (312.39505,774.30615),(311.92264,779.28375),
                (311.8916,784.28235),(312.57697,789.218),
                (314.1163,793.96423),(316.55997,798.3179),
                (319.72098,802.16284),(323.24936,805.7054),
                (326.84433,809.17914),(330.65155,812.4145),
                (334.60464,815.4759),(338.43118,818.6899),
                (342.55237,821.52106),(346.67285,824.3489),
                (350.51215,827.5519),(354.33014,830.78033),
                (357.87796,834.2923),(361.0446,838.1583),
                (364.20703,842.0306),(367.21216,846.02606),
                (369.99442,850.1768),(372.3783,854.5682),
                (374.45547,859.112),(375.95212,863.87885),
                (377.24722,868.7075),(377.82837,873.6652),
                (377.86914,878.66486),(377.86914,883.66486),
                (377.24692,888.6171),(375.90088,893.4228),
                (373.9598,898.0276),(371.34058,902.2766),
                (368.5527,906.4182),(365.0352,909.9599),
                (361.2195,913.1911),(357.304,916.2986),

                (353.01486,918.8525),
                (348.35068,919.6463),
                (343.5497,920.0339),
                (338.6476,919.99554),
                (333.68942,918.629),
                (328.6984,916.8158),

                // same flow me long smooth curve
                (318.0,912.0),
                (306.0,904.0),
                (292.0,892.0),
                (280.0,876.0),
                (274.0,858.0),
//                (276.0,840.0),
//                (286.0,824.0)
              
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
    
    
    
    private static func cursiveT() -> LetterStrokeData {

        let minX: CGFloat = 326.06424 - 35
        let maxX: CGFloat = 428.00577 + 35
        let minY: CGFloat = 681.8633
        let maxY: CGFloat = 842.58887

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(351.62793, minX, maxX),
                y: norm(717.8574, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [
                (346.66537,718.35394),(341.66537,718.3574),
                (336.78885,717.3856),(332.54614,714.75885),
                (329.45557,710.83563),(327.45236,706.2865),
                (326.8101,701.3487),(327.24554,696.41766),
                (329.0323,691.7529),(332.05197,687.85516),
                (336.00705,684.8182),(340.6662,683.04205),
                (345.555,682.0536),(350.54468,681.8633),
                (355.53925,681.9801),(360.40146,683.079),
                (365.27603,684.18243),(370.15378,685.2696),
                (375.06882,686.186),(380.00928,686.9445),
                (384.98517,687.4347),(389.9647,687.85156),
                (394.9426,687.576),(399.9053,686.9676),
                (404.61813,685.3719),(409.31967,683.7003),
                (414.07642,682.16833),(418.7113,680.3099),
                (423.4223,678.6689),(428.00577,676.86426),

                // downward stroke
                (424.5,690.0),
                (423.0,705.0),
                (421.0,720.0),
                (418.5,736.0),
                (415.5,752.0),
                (412.0,768.0),
                (407.5,784.0),
                (402.0,798.0),
                (395.5,810.0),
                (388.0,820.0),

                // bigger bottom curve
               (381.0,829.0),
               (374.0,836.0),
               (362.0,837.5),
               (351.0,833.5),
               (344.5,825.0),

            ]

            points.forEach {
                path.addLine(to: CGPoint(
                    x: norm($0.0, minX, maxX),
                    y: norm($0.1, minY, maxY)
                ))
            }
        }

        return LetterStrokeData(paths: [path], isLoop: false)
    }
    
    
    private static func cursiveU() -> LetterStrokeData {

        let minX: CGFloat = 262.90918 - 25
        let maxX: CGFloat = 370.25897 + 25
        let minY: CGFloat = 375.49603 - 5
        let maxY: CGFloat = 463.56903

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(262.90918, minX, maxX),
                y: norm(388.15918, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [

                // top small left hook
                (264.57404,383.4995),
                (267.412,379.39578),
                (271.02515,375.94373),
                (275.34097,373.59003),
                (279.5,373.8),
                (282.8,376.5),
                (284.8,381.0),

                // first down stroke
                (285.8,387.5),
                (286.0,395.5),
                (285.6,404.5),
                (284.8,414.0),
                (283.8,423.5),
                (282.9,433.0),
                (282.4,442.5),

                // bottom left curve
                (282.8,450.5),
                (285.5,456.5),
                (290.5,460.5),
                (296.5,461.5),
                (302.5,458.5),

                // going upward center
               (307.5,451.0),
               (311.5,440.5),
               (315.0,427.5),
               (318.0,413.0),
               (320.5,398.0),
               (322.5,384.0),

               // tall right stroke
               (324.5,374.5),
               (327.0,372.5),
               (329.0,378.0),

                // down again right side shifted slightly LEFT
                (326.5,389.5),
                (325.8,403.5),
                (324.5,417.5),
                (322.8,430.5),
                (320.8,441.5),

                // bottom right curve
                (320.2,449.5),
                (321.8,455.0),
                (325.0,458.0),
                (329.0,457.5),
                (333.0,454.0),

                // exit tail
                (337.0,447.5),
                (341.0,439.5),
                (345.0,430.5)
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
    
    
    private static func cursiveV() -> LetterStrokeData {

        let minX: CGFloat = 211.67676 - 25
        let maxX: CGFloat = 299.39447 + 35
        let minY: CGFloat = 661.44525
        let maxY: CGFloat = 750.65094

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(211.67676, minX, maxX),
                y: norm(687.6123, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [

                // MARK: - Left top hook

                (213.5,676.0),
                (215.0,674.0),
                (216.5,672.5),
                (219.0,669.5),
                (222.5,667.0),
                (226.0,665.8),
                (230.0,666.0),
                (233.0,669.0),

                // MARK: - Long down stroke

                (234.0,672.0),
                (234.5,676.0),
                (235.0,683.0),
                (235.0,690.0),
                (235.0,698.0),
                (234.5,706.0),
                (234.0,714.0),
                (233.5,722.0),
                (232.5,730.0),
                (231.5,737.0),
                (230.5,741.0),

                // MARK: - Bottom rounded turn

                (230.5,744.0),
                (231.0,746.5),
                (232.5,748.0),
                (235.0,749.0),
                (238.0,748.5),
                (241.5,746.5),
                (245.5,741.0),

                // MARK: - Smooth upward stroke

                (249.5,736.0),
                (254.0,731.0),
                (258.0,724.5),
                (262.0,717.5),
                (266.0,710.5),
                (269.0,703.5),
                (272.0,696.5),
                (275.0,689.5),
                (278.0,682.5),
                (281.0,676.0),

                // MARK: - Rounded top loop

                (284.0,670.0),
                (286.5,666.0),
                (288.0,661.0),
                (288.0,655.0),

                (287.0,651.0),
                (284.5,648.0),
                (281.5,646.0),
                (278.5,644.5),
                (275.0,644.5),
                (271.5,645.5),

                // MARK: - Go around loop

                (268.5,647.0),
                (266.5,650.0),
                (265.0,654.0),
                (264.5,658.0),
                (264.8,662.5),
                (265.5,667.0),
                (267.0,671.5),
                (270.0,675.5),
                (273.5,679.0),
                (277.0,681.5),

                // MARK: - Exit stroke

                (281.0,683.5),
                (285.0,684.0),
                (289.0,683.5),
                (293.0,682.5),
                (297.0,680.5),
                (300.0,678.0),
                (303.0,675.5),
                (306.0,672.0)
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
    
    
    
    private static func cursiveW() -> LetterStrokeData {

        let minX: CGFloat = 235.0
        let maxX: CGFloat = 380.0
        let minY: CGFloat = 750.0
        let maxY: CGFloat = 860.0

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(245.0, minX, maxX),
                y: norm(770.0, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [

                // MARK: - Left top hook

                (245.5,770.0),
                (246.0,768.0),
                (246.5,766.0),
                (247.0,764.0),
                (248.0,761.5),
                (249.0,759.0),
                (250.5,757.0),
                (252.0,755.0),
                (254.0,753.5),
                (256.0,752.5),
                (258.0,752.0),
                (260.0,752.5),
                (261.5,753.5),
                (263.0,755.0),
                (264.0,757.5),

                // MARK: - First down stroke

                (265.0,764.0),
                (266.0,775.0),
                (266.5,786.0),
                (267.0,798.0),
                (267.5,810.0),
                (268.0,824.0),
                (268.5,838.0),
                (269.0,850.0),

                // MARK: - First rise

                (271.0,846.0),
                (273.0,840.0),
                (276.0,832.0),
                (280.0,820.0),
                (284.0,806.0),
                (288.0,792.0),
                (292.0,780.0),

                // MARK: - Second down stroke

                (294.0,786.0),
                (296.0,792.0),
                (298.0,798.0),
                (300.0,806.0),
                (302.0,814.0),
                (304.0,822.0),
                (306.0,832.0),
                (309.0,842.0),

                // MARK: - Smooth rise into loop

                (309.5,840.0),
                (310.0,838.0),
                (310.5,835.0),
                (311.0,832.0),
                (311.8,828.0),
                (312.5,824.0),
                (313.5,820.0),
                (314.5,815.0),
                (315.5,810.0),
                (316.5,804.0),
                (317.5,798.0),
                (318.5,793.0),
                (319.2,788.0),
                (320.0,783.0),
                (320.5,778.0),
                (321.0,774.0),
                (321.3,770.0),
                (321.5,767.0),

                // MARK: - Top rounded loop

                (321.8,763.0),
                (322.0,758.0),
                (321.0,756.0),
                (318.0,754.0),
                (315.5,753.2),
                (313.0,753.0),
                (311.0,754.0),
                (309.0,756.0),

                // MARK: - Compact inner turn

                (307.8,759.0),
                (307.0,762.0),
                (307.0,765.5),
                (308.0,769.0),
                (309.5,772.0),
                (312.0,775.0),

                // MARK: - Exit curve

                (314.5,777.5),
                (317.0,780.0),
                (320.0,781.5),
                (323.0,782.0),
                (326.0,781.5),
                (329.0,780.0)
            ]

            points.forEach {
                path.addLine(to: CGPoint(
                    x: norm($0.0, minX, maxX),
                    y: norm($0.1, minY, maxY)
                ))
            }
        }

        return LetterStrokeData(
            paths: [path],
            isLoop: true
        )
    }
    
    private static func cursiveX() -> LetterStrokeData {

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
                (320.0,519.0),
                (321.0,533.0),

                // lower round
                (326.0,547.0),
                (333.0,559.0),
                (341.0,568.0),

                // extend right and curve upward
                (351.0,574.0),
                (363.0,578.0),
                (376.0,580.0),

                // upward sweep
                (388.0,578.0),
                (399.0,573.0),
                (408.0,566.0)
               
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
    
    private static func cursiveY() -> LetterStrokeData {

        let stroke1 = p {

            // Start left (small hook, not leaning left)
            $0.move(to: CGPoint(x: 0.30, y: 0.36))

            // First peak
            $0.addCurve(
                to: CGPoint(x: 0.38, y: 0.16),
                controlPoint1: CGPoint(x: 0.33, y: 0.24),
                controlPoint2: CGPoint(x: 0.38, y: 0.10)
            )

            // Down into smaller U
            $0.addCurve(
                to: CGPoint(x: 0.46, y: 0.50),
                controlPoint1: CGPoint(x: 0.42, y: 0.30),
                controlPoint2: CGPoint(x: 0.42, y: 0.50)
            )

            // Up right side of U (starts earlier)
            $0.addCurve(
                to: CGPoint(x: 0.62, y: 0.12),
                controlPoint1: CGPoint(x: 0.52, y: 0.50),
                controlPoint2: CGPoint(x: 0.60, y: 0.26)
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
    
  
    private static func cursiveZ() -> LetterStrokeData {

        let minX: CGFloat = 301.3955 - 35
        let maxX: CGFloat = 406.99084 + 35
        let minY: CGFloat = 494.82275
        let maxY: CGFloat = 656.588

        let path = p { path in
            path.move(to: CGPoint(
                x: norm(301.3955, minX, maxX),
                y: norm(496.89258, minY, maxY)
            ))

            let points: [(CGFloat, CGFloat)] = [
                (301.6603,501.87158),(302.83875,506.72165),
                (304.74954,511.3243),(307.77567,515.27234),
                (311.65607,518.4047),(316.33954,519.91833),
                (321.32666,520.1387),(326.32666,520.1387),
                (331.2642,519.4629),(336.08414,518.1595),
                (340.6496,516.1365),(344.95383,513.59424),
                (349.02176,510.6914),(352.704,507.3122),
                (356.10095,503.66165),(358.55307,499.3237),
                (360.7052,494.82275),(361.61673,496.09415),
                (361.62402,501.09412),(361.11273,506.05823),
                (360.26752,510.9696),(359.2517,515.8648),
                (357.98657,520.6977),(356.33313,525.4154),
                (354.47733,530.05634),(352.54236,534.6664),
                (350.63458,539.28784),(348.59277,543.8515),
                (346.5539,548.4162),(344.66803,553.0469),
                (342.4956,557.5466),(340.12354,561.9468),
                (338.78162,565.17944),(342.69565,562.2047),
                (347.55466,561.091),(352.53754,560.8828),
                (357.44516,561.5719),(361.50894,564.4077),
                (363.94955,568.7492),(365.70596,573.4216),
                (366.64474,578.326),(367.62207,593.2746),
                (366.6407,608.2159),(365.7186,613.13),
                (364.61777,618.00494),(363.48267,622.87305),
                (362.1066,627.6792),(360.38797,632.3725),
                (358.23297,636.8748),(355.69223,641.18097),
                (352.81882,645.2678),(349.60776,649.0969),
                
                (346.0663,652.595),

                // bigger smooth bottom loop
                (343.0,656.5),
                (338.0,659.0),
                (332.0,659.5),
                (326.0,657.0),
                (321.0,652.0),

                // smooth bottom turn
                (319.0,646.0),
                (317.5,639.0),
                (318.5,631.0),

                // natural flowing upward curve
                (322.0,622.0),
                (329.0,612.0),
                (339.0,601.0),
                (351.0,590.0),
                (365.0,579.0),
                (381.0,569.0),
                (398.0,561.0),
                (406.0,558.0)           ]

            points.forEach {
                path.addLine(to: CGPoint(
                    x: norm($0.0, minX, maxX),
                    y: norm($0.1, minY, maxY)
                ))
            }
        }

        return LetterStrokeData(paths: [path], isLoop: true)
    }

}
