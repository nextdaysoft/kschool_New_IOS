////
////  ColorManager.swift
////  Kids
////
////  Created by NextDay Sotware Solution on 18/12/25.
////
//
//

import UIKit

struct ColorManager {

    static let colors: [UIColor] = [
        UIColor(hex: "#007AFF"), // kid_blue
        UIColor(hex: "#FF5E9E"), // kid_magenta
        UIColor(hex: "#A2845E"), // kid_brown
        UIColor(hex: "#FFB6A3"), // kid_peach
        UIColor(hex: "#98FF98"), // kid_mint
        UIColor(hex: "#FFD700"), // kid_gold
        UIColor(hex: "#26A69A"), // secondary
        
        UIColor(hex: "#FF9E85"), // soft_peach
        UIColor(hex: "#7EE8C9"), // soft_mint
        UIColor(hex: "#B287FF"), // soft_lavender
        UIColor(hex: "#69CFFF"), // soft_sky_blue
        UIColor(hex: "#FFF27B"), // soft_lemon
        UIColor(hex: "#FF85A2"), // soft_pink
        UIColor(hex: "#6FFFE9"), // soft_aqua
        UIColor(hex: "#FF8C70"), // soft_coral
        UIColor(hex: "#CFFF6B"), // soft_lime
        UIColor(hex: "#8C85FF"), // soft_periwinkle
        
        UIColor(hex: "#FFB347"), // soft_orange
        UIColor(hex: "#40E0D0"), // soft_turquoise
        UIColor(hex: "#FF66CC"), // soft_magenta
        UIColor(hex: "#FF758F"), // soft_rose
        UIColor(hex: "#66FFFF"), // soft_cyan
        UIColor(hex: "#FFD166"), // soft_saffron
        UIColor(hex: "#A084FF"), // soft_violet
        UIColor(hex: "#FFA884"), // soft_melon
        UIColor(hex: "#3DD5C3"), // soft_teal
        UIColor(hex: "#FFC65B")  // soft_marigold
    ]

    static func randomColor() -> UIColor {
        return colors.randomElement() ?? .systemBlue
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
