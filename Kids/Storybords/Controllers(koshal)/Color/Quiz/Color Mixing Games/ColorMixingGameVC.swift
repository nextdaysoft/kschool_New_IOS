//
//  ColorMixingGameVC.swift
//  KSchool
//
//  Created by Koshal Singh on 01/04/26.
//

import UIKit

class ColorMixingGameVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var colorsBGView: UIView!
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var selectedColorNames: [String] = []
    
    var selectedColors: [UIColor] = []
    
    var colorButtons: [UIButton] = []
    var allColors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemYellow,
        .systemGreen,
        .systemPink,
        .systemBrown,
        .systemPurple,
        .systemGray,
        .systemOrange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupColors()
        resetBtn.isHidden = true
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if colorsBGView.subviews.isEmpty {
            setupColors()
        }
    }
    
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        resetBtn.layer.cornerRadius = 6
        resetBtn.backgroundColor = color
    }
    
    func createCircle(color: UIColor, text: String, xPosition: CGFloat) -> UIView {
        
        // ✅ Bigger container
        let container = UIView(
            frame: CGRect(
                x: xPosition,
                y: bgView.center.y - 90,
                width: 170,
                height: 210
            )
        )
        
        // ✅ Bigger circle
        let circle = UIView(
            frame: CGRect(
                x: 10,
                y: 0,
                width: 150,
                height: 150
            )
        )
        
        circle.backgroundColor = color
        circle.layer.cornerRadius = 75
        
        // ✅ Label position updated
        let label = UILabel(
            frame: CGRect(
                x: 0,
                y: 160,
                width: 170,
                height: 30
            )
        )
        
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        container.addSubview(circle)
        container.addSubview(label)
        
        return container
    }
    
    @objc func colorTapped(_ sender: UIButton) {

        guard let color = sender.backgroundColor else { return }

        let name = colorName(color)

        // FIRST COLOR
        if selectedColors.isEmpty {

            selectedColors.append(color)
            selectedColorNames.append(name)

            let firstView = createCircle(
                color: color,
                text: name,
                xPosition: (bgView.frame.width - 140) / 2
            )

            bgView.addSubview(firstView)

            // show only possible colors
            let possible = possibleMixColors(for: color)

            setupColors(showColors: possible)

            return
        }

        // SECOND COLOR
        if selectedColors.count == 1 {

            selectedColors.append(color)
            selectedColorNames.append(name)

            colorsBGView.isHidden = true

            if let firstView = bgView.subviews.first {

                UIView.animate(withDuration: 0.3) {
                    firstView.frame.origin.x = 20
                }
            }

            let secondView = createCircle(
                color: color,
                text: name,
                xPosition: bgView.frame.width - 190
            )

            bgView.addSubview(secondView)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                self.animateAndMix()
            }
        }
    }
    
    func possibleMixColors(for color: UIColor) -> [UIColor] {

        let name = colorName(color)

        switch name {

        case "Yellow":
            return [
                .systemBlue,
                .systemRed,
                .systemGreen,
                .systemBrown,
                .systemOrange
            ]
            
        case "Blue":
            return [
                .systemRed,
                .systemYellow,
                .systemGreen,
                .systemPurple,
                .systemGray
            ]

        case "Red":
            return [
                .systemBlue,
                .systemYellow,
                .systemPink,
                .systemBrown,
                .systemPurple,
                .systemOrange
            ]

        case "Green":
            return [
                .systemBlue,
                .systemYellow,
                .systemBrown
            ]
            
        case "Pink":
            return [
                .systemRed,
                .systemPurple,
                .systemGray,
                .systemOrange
            ]
            
        case "Brown":
            return [
                .systemRed,
                .systemYellow,
                .systemGreen,
                .systemGray,
                .systemOrange
            ]
            
        case "Purple":
            return [
                .systemRed,
                .systemBlue,
                .systemPink
            ]
            
        case "Gray":
            return [
                .systemBlue,
                .systemPink,
                .systemBrown
            ]

        case "Orange":
            return [
                .systemRed,
                .systemYellow,
                .systemPink,
                .systemBrown
            ]
            
        default:
            return allColors
        }
    }
    
    func detectColorName(from color: UIColor) -> String {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        // basic detection
        if r > 0.8 && g < 0.3 && b < 0.3 {
            return "Red"
        }
        
        if r < 0.3 && g < 0.3 && b > 0.8 {
            return "Blue"
        }
        
        if r > 0.8 && g > 0.8 && b < 0.3 {
            return "Yellow"
        }
        
        if r < 0.3 && g > 0.7 && b < 0.3 {
            return "Green"
        }
        
        if r > 0.5 && b > 0.5 {
            return "Purple"
        }
        
        // ✅ Mustard
        if r > 0.9 && g > 0.6 && g < 0.75 && b < 0.1 {
            return "Mustard"
        }
        
        // ✅ Orange
        if r > 0.8 && g > 0.5 && b < 0.2 {
            return "Orange"
        }
        
        if r > 0.5 && g > 0.3 && b < 0.2 {
            return "Brown"
        }
        
        if r > 0.5 && g > 0.5 && b > 0.5 {
            return "Gray"
        }
        
        return "Color"
    }
    
    func setupColors(showColors: [UIColor]? = nil) {

        colorsBGView.subviews.forEach { $0.removeFromSuperview() }
        colorButtons.removeAll()

        let buttonWidth: CGFloat = 65
        let buttonHeight: CGFloat = 50
        let spacing: CGFloat = 0

        let displayColors = showColors ?? allColors

        // ✅ Fixed rows like screenshot
        // ✅ Always maintain original row positions
        let firstRowColors = allColors.prefix(5).filter {
            displayColors.contains($0)
        }

        let secondRowColors = allColors.dropFirst(5).prefix(3).filter {
            displayColors.contains($0)
        }

        let thirdRowColors = allColors.dropFirst(8).filter {
            displayColors.contains($0)
        }

        let rows: [[UIColor]] = [
            Array(firstRowColors),
            Array(secondRowColors),
            Array(thirdRowColors)
        ]

        let startY: CGFloat = 20

        for (rowIndex, rowColors) in rows.enumerated() {

            guard !rowColors.isEmpty else { continue }

            let totalWidth =
                CGFloat(rowColors.count) * buttonWidth +
                CGFloat(rowColors.count - 1) * spacing

            let startX = (colorsBGView.frame.width - totalWidth) / 2

            for (colIndex, color) in rowColors.enumerated() {

                let button = UIButton(
                    frame: CGRect(
                        x: startX + CGFloat(colIndex) * (buttonWidth + spacing),
                        y: startY + CGFloat(rowIndex) * (buttonHeight + 5),
                        width: buttonWidth,
                        height: buttonHeight
                    )
                )

                button.backgroundColor = color
                button.layer.cornerRadius = 14

                button.addTarget(
                    self,
                    action: #selector(colorTapped(_:)),
                    for: .touchUpInside
                )

                colorsBGView.addSubview(button)
                colorButtons.append(button)
            }
        }
    }
    
    func colorName(_ color: UIColor) -> String {

        if color == .systemRed {
            return "Red"
        }

        if color == .systemBlue {
            return "Blue"
        }

        if color == .systemYellow {
            return "Yellow"
        }

        if color == .systemGreen {
            return "Green"
        }

        if color == .systemPink {
            return "Pink"
        }

        if color == .systemBrown {
            return "Brown"
        }

        if color == .systemPurple {
            return "Purple"
        }

        if color == .systemGray {
            return "Gray"
        }

        if color == .systemOrange {
            return "Orange"
        }

        return detectColorName(from: color)
    }
    
    
    func animateAndMix() {
        
        let views = bgView.subviews
        
        guard views.count >= 2 else { return }
        
        let leftView = views[0]
        let rightView = views[1]
        
        // ✅ Directly merge from current touching position
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                
                // ✅ Slowly overlap
                leftView.center = self.bgView.center
                rightView.center = self.bgView.center
                
                leftView.alpha = 0.4
                rightView.alpha = 0.4
                
            }) { _ in
                
                self.showMixedResult()
            }
    }
    
    func mixColors() {
        
        let color1 = selectedColors[0]
        let color2 = selectedColors[1]
        
        let mixedColor = blend(color1: color1, color2: color2)
        
        bgView.subviews.forEach { $0.removeFromSuperview() }
        
        let finalView = createCircle(
            color: mixedColor,
            text: "\(colorName(color1)) + \(colorName(color2))",
            xPosition: (bgView.frame.width - 140) / 2
        )
        
        bgView.addSubview(finalView)
        
        selectedColors.removeAll()
    }
    
    func blend(color1: UIColor, color2: UIColor) -> UIColor {
        
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return UIColor(
            red: (r1 + r2) / 2,
            green: (g1 + g2) / 2,
            blue: (b1 + b2) / 2,
            alpha: 1
        )
    }
    
    func showMixedResult() {

        let result = mixedColorName(color1: selectedColors[0], color2: selectedColors[1])

        let mixedColor = result.0
        let name = result.1

        bgView.subviews.forEach { $0.removeFromSuperview() }

        let finalView = createCircle(
            color: mixedColor,
            text: name,
            xPosition: (bgView.frame.width - 140) / 2
        )

        bgView.addSubview(finalView)

        resetBtn.isHidden = false

        selectedColors.removeAll()
        selectedColorNames.removeAll()
    }
    
    func mixedColorName(color1: UIColor, color2: UIColor) -> (UIColor, String) {

        // convert to simple names
        let c1 = colorName(color1)
        let c2 = colorName(color2)

        let combination = [c1, c2].sorted().joined(separator: "-")

        switch combination {

        case "Blue-Yellow":
            return (
                UIColor(
                    red: 0/255,
                    green: 158/255,
                    blue: 0/255,
                    alpha: 1
                ),
                "Green"
            )

        case "Red-Yellow":
            return (.orange, "Orange")

        // ✅ NEW
        case "Pink-Red":
            return (
                UIColor(
                    red: 255/255,
                    green: 0/255,
                    blue: 144/255,
                    alpha: 1
                ),
                "Magenta"
            )

        // ✅ NEW
        case "Brown-Red":
            return (
                UIColor(
                    red: 170/255,
                    green: 35/255,
                    blue: 0/255,
                    alpha: 1
                ),
                "Brick"
            )

            // ✅ Red + Orange = Coral
            case "Orange-Red":
                return (
                    UIColor(
                        red: 255/255,
                        green: 127/255,
                        blue: 80/255,
                        alpha: 1
                    ),
                    "Coral"
                )

            // ✅ Red + Purple = Maroon
            case "Purple-Red":
                return (
                    UIColor(
                        red: 128/255,
                        green: 0/255,
                        blue: 0/255,
                        alpha: 1
                    ),
                    "Maroon"
                )

        // ✅ UPDATED → Purple
        case "Blue-Red":
            return (
                UIColor(
                    red: 128/255,
                    green: 0/255,
                    blue: 128/255,
                    alpha: 1
                ),
                "Purple"
            )

        case "Green-Yellow":
            return (
                UIColor(
                    red: 128/255,
                    green: 128/255,
                    blue: 0,
                    alpha: 1
                ),
                "Olive"
            )

        case "Brown-Yellow":
            return (
                UIColor(
                    red: 245/255,
                    green: 168/255,
                    blue: 0/255,
                    alpha: 1
                ),
                "Mustard"
            )

        case "Orange-Yellow":
            return (
                UIColor(
                    red: 255/255,
                    green: 191/255,
                    blue: 0,
                    alpha: 1
                ),
                "Amber"
            )
            
            // ✅ Blue + Green = Cyan
            case "Blue-Green":
                return (
                    UIColor(
                        red: 25/255,
                        green: 195/255,
                        blue: 220/255,
                        alpha: 1
                    ),
                    "Cyan"
                )

            // ✅ Brown + Green = Forest
            case "Brown-Green":
                return (
                    UIColor(
                        red: 34/255,
                        green: 139/255,
                        blue: 34/255,
                        alpha: 1
                    ),
                    "Forest"
                )
            
            // ✅ Pink + Purple = Violet
            case "Pink-Purple":
                return (
                    UIColor(
                        red: 180/255,
                        green: 85/255,
                        blue: 220/255,
                        alpha: 1
                    ),
                    "Violet"
                )

        case "Green-Blue":
            return (
                UIColor(
                    red: 0,
                    green: 128/255,
                    blue: 128/255,
                    alpha: 1
                ),
                "Teal"
            )

        case "Red-Green":
            return (
                UIColor(
                    red: 165/255,
                    green: 42/255,
                    blue: 42/255,
                    alpha: 1
                ),
                "Brown"
            )

            // ✅ Gray + Pink = Smoky Pink
            case "Gray-Pink":
                return (
                    UIColor(
                        red: 196/255,
                        green: 143/255,
                        blue: 153/255,
                        alpha: 1
                    ),
                    "Smoky Pink"
                )
            
            // ✅ Orange + Pink = Peach
            case "Orange-Pink":
                return (
                    UIColor(
                        red: 230/255,
                        green: 170/255,
                        blue: 160/255,
                        alpha: 1
                    ),
                    "Peach"
                )
            
            // ✅ Brown + Gray = Charcoal
            case "Brown-Gray":
                return (
                    UIColor(
                        red: 54/255,
                        green: 69/255,
                        blue: 79/255,
                        alpha: 1
                    ),
                    "Charcoal"
                )
            
            // ✅ Brown + Orange = Chocolate
            case "Brown-Orange":
                return (
                    UIColor(
                        red: 125/255,
                        green: 85/255,
                        blue: 75/255,
                        alpha: 1
                    ),
                    "Chocolate"
                )
            
            // ✅ Blue + Purple = Indigo
            case "Blue-Purple":
                return (
                    UIColor(
                        red: 45/255,
                        green: 75/255,
                        blue: 220/255,
                        alpha: 1
                    ),
                    "Indigo"
                )
            
            // ✅ Blue + Gray = Steel Blue
            case "Blue-Gray":
                return (
                    UIColor(
                        red: 90/255,
                        green: 120/255,
                        blue: 245/255,
                        alpha: 1
                    ),
                    "Steel Blue"
                )
            
        default:
            let mixed = blend(color1: color1, color2: color2)
            let name = detectColorName(from: mixed)
            return (mixed, name)
        }
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetTapBtn(_ sender: UIButton) {

        // ✅ Clear selected colors
        selectedColors.removeAll()

        // ✅ Remove mixed result views
        bgView.subviews.forEach { $0.removeFromSuperview() }

        // ✅ Show all colors again
        setupColors(showColors: allColors)

        // ✅ Show color selection area
        colorsBGView.isHidden = false

        // ✅ Hide reset button
        resetBtn.isHidden = true
    }
}

