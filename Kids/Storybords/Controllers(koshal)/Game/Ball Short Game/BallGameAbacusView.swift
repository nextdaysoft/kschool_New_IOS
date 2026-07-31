//
//  BallGameAbacusView.swift
//  KSchool
//
//  Created by Koshal Singh on 19/03/26.
//

import Foundation
import UIKit

class BallGameAbacusView: UIView {
    
    private var rods: [UIView] = []
    
    private let rodCount = 4
    private let beadsPerRod = 3
    private let beadSize: CGFloat = 30   // 🔥 same as spacing
    
    private var isSetupDone = false
    
    weak var gameViewController: BallShortGameVC?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isSetupDone {
            createAbacus()
            isSetupDone = true
        }
    }
    
    private func createAbacus() {

        rods.removeAll()

        let spacingX = bounds.width / CGFloat(rodCount + 1)

        // MARK: Top Bar
        let topBarY: CGFloat = 80
        let topBarHeight: CGFloat = 6

        let topBar = UIView(frame: CGRect(
            x: 20,
            y: topBarY,
            width: bounds.width - 40,
            height: topBarHeight
        ))

        topBar.backgroundColor = .darkGray
        topBar.layer.cornerRadius = 3
        addSubview(topBar)

        // MARK: Rod Settings
        let rodTop = topBar.frame.maxY
        let rodHeight: CGFloat = 260
        let spacingY: CGFloat = beadSize

        // 🔥 4 UNIQUE RANDOM COLORS
        var randomColors: [UIColor] = []

        while randomColors.count < 4 {

            let color = ColorManager.randomColor()

            if !randomColors.contains(where: { $0.isEqual(color) }) {
                randomColors.append(color)
            }
        }

        // 🔥 EACH COLOR 3 TIMES = TOTAL 12 BALLS
        var ballColors: [UIColor] = []

        for color in randomColors {
            ballColors.append(color)
            ballColors.append(color)
            ballColors.append(color)
        }

        // 🔥 RANDOM ORDER EVERY TIME
        ballColors.shuffle()

        var colorIndex = 0
        var allBeads: [BallGameBeadView] = []

        for i in 0..<rodCount {

            let x = spacingX * CGFloat(i + 1)

            let rod = UIView(frame: CGRect(
                x: x - 3,
                y: rodTop,
                width: 6,
                height: rodHeight
            ))

            rod.backgroundColor = .darkGray
            rod.layer.cornerRadius = 3

            addSubview(rod)
            rods.append(rod)

            for j in 0..<beadsPerRod {

                let y = (rodTop + rodHeight) - (beadSize / 2) - CGFloat(j) * spacingY

                let bead = BallGameBeadView(frame: CGRect(
                    x: 0,
                    y: 0,
                    width: beadSize,
                    height: beadSize
                ))

                bead.center = CGPoint(x: x, y: y)

                bead.backgroundColor = ballColors[colorIndex]
                colorIndex += 1

                bead.rod = rod
                bead.spacingY = spacingY
                bead.rodTop = rodTop
                bead.rodHeight = rodHeight
                bead.gameViewController = gameViewController

                addSubview(bead)
                bringSubviewToFront(bead)

                allBeads.append(bead)
            }
        }

        for bead in allBeads {
            bead.rods = rods
        }
    }
    
    func resetGame() {

        // Purane rods aur beads remove karo
        subviews.forEach { $0.removeFromSuperview() }

        rods.removeAll()
        isSetupDone = false

        // Naya random setup create karo
        createAbacus()
        isSetupDone = true
    }
}
