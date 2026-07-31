//
//  PatternRepeat.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 23/01/26.
//

import UIKit
import LanguageManager_iOS

class PatternRepeat: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var referenceView: GridView!
    @IBOutlet weak var drawingView: GridView!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var rightOrWrongImg: UIImageView!
    
    // MARK: Variable
    var selectedLevel = 1
    private var currentIndex = 0
    private var score = 0
    private var totalQuestions = 10
    private var isAnswerSubmitted = false
    private var currentPattern: Pattern!
    private var currentLevelData: PatternLevel!
    let androidLevel1: PatternLevel = {
            let gridSize = 4
            return PatternLevel(
                level: 1,
                gridSize: gridSize,
                patterns: [
                    // Pattern 1
                    Pattern(gridSize: gridSize, lines: Set([
                        Line.fromIndices(5, 8, gridSize: gridSize), Line.fromIndices(2, 5, gridSize: gridSize),
                        Line.fromIndices(1, 2, gridSize: gridSize), Line.fromIndices(0, 1, gridSize: gridSize),
                        Line.fromIndices(0, 4, gridSize: gridSize), Line.fromIndices(4, 8, gridSize: gridSize),
                        Line.fromIndices(8, 13, gridSize: gridSize), Line.fromIndices(10, 13, gridSize: gridSize),
                        Line.fromIndices(7, 10, gridSize: gridSize), Line.fromIndices(2, 7, gridSize: gridSize)
                    ])),
                    // Pattern 2
                    Pattern(gridSize: gridSize, lines: Set([
                        Line.fromIndices(9, 12, gridSize: gridSize), Line.fromIndices(6, 9, gridSize: gridSize),
                        Line.fromIndices(3, 6, gridSize: gridSize), Line.fromIndices(3, 7, gridSize: gridSize),
                        Line.fromIndices(7, 11, gridSize: gridSize), Line.fromIndices(11, 15, gridSize: gridSize),
                        Line.fromIndices(14, 15, gridSize: gridSize), Line.fromIndices(13, 14, gridSize: gridSize),
                        Line.fromIndices(12, 13, gridSize: gridSize), Line.fromIndices(0, 5, gridSize: gridSize),
                        Line.fromIndices(5, 10, gridSize: gridSize)
                    ])),
                    // Pattern 3
                    Pattern(gridSize: gridSize, lines: Set([
                        Line.fromIndices(0, 4, gridSize: gridSize), Line.fromIndices(0, 1, gridSize: gridSize),
                        Line.fromIndices(1, 4, gridSize: gridSize), Line.fromIndices(5, 8, gridSize: gridSize),
                        Line.fromIndices(2, 5, gridSize: gridSize), Line.fromIndices(8, 12, gridSize: gridSize),
                        Line.fromIndices(9, 12, gridSize: gridSize), Line.fromIndices(6, 9, gridSize: gridSize),
                        Line.fromIndices(3, 6, gridSize: gridSize), Line.fromIndices(2, 3, gridSize: gridSize),
                        Line.fromIndices(4, 8, gridSize: gridSize), Line.fromIndices(1, 2, gridSize: gridSize),
                        Line.fromIndices(5, 10, gridSize: gridSize), Line.fromIndices(10, 15, gridSize: gridSize)
                    ])),
                    // Pattern 4
                    Pattern(gridSize: gridSize, lines: Set([
                        Line.fromIndices(8, 9, gridSize: gridSize), Line.fromIndices(9, 10, gridSize: gridSize),
                        Line.fromIndices(10, 14, gridSize: gridSize), Line.fromIndices(13, 14, gridSize: gridSize),
                        Line.fromIndices(9, 13, gridSize: gridSize), Line.fromIndices(5, 9, gridSize: gridSize),
                        Line.fromIndices(5, 6, gridSize: gridSize), Line.fromIndices(2, 6, gridSize: gridSize),
                        Line.fromIndices(6, 10, gridSize: gridSize), Line.fromIndices(10, 11, gridSize: gridSize),
                        Line.fromIndices(7, 11, gridSize: gridSize), Line.fromIndices(6, 7, gridSize: gridSize),
                        Line.fromIndices(4, 8, gridSize: gridSize), Line.fromIndices(4, 5, gridSize: gridSize),
                        Line.fromIndices(1, 5, gridSize: gridSize), Line.fromIndices(1, 2, gridSize: gridSize),
                        Line.fromIndices(0, 4, gridSize: gridSize), Line.fromIndices(0, 1, gridSize: gridSize),
                        Line.fromIndices(14, 15, gridSize: gridSize), Line.fromIndices(11, 15, gridSize: gridSize)
                    ])),
                    // Pattern 5
                    Pattern(gridSize: gridSize, lines: Set([
                        Line.fromIndices(1, 5, gridSize: gridSize), Line.fromIndices(5, 6, gridSize: gridSize),
                        Line.fromIndices(2, 6, gridSize: gridSize), Line.fromIndices(2, 3, gridSize: gridSize),
                        Line.fromIndices(0, 1, gridSize: gridSize), Line.fromIndices(3, 6, gridSize: gridSize),
                        Line.fromIndices(0, 5, gridSize: gridSize), Line.fromIndices(5, 8, gridSize: gridSize),
                        Line.fromIndices(8, 9, gridSize: gridSize), Line.fromIndices(5, 9, gridSize: gridSize),
                        Line.fromIndices(6, 11, gridSize: gridSize), Line.fromIndices(6, 10, gridSize: gridSize),
                        Line.fromIndices(10, 11, gridSize: gridSize), Line.fromIndices(9, 13, gridSize: gridSize),
                        Line.fromIndices(10, 14, gridSize: gridSize)
                    ])),
                    // Pattern 6
                     Pattern(gridSize: gridSize, lines: Set([
                        Line.fromIndices(5, 6, gridSize: gridSize), Line.fromIndices(5, 9, gridSize: gridSize),
                        Line.fromIndices(6, 10, gridSize: gridSize), Line.fromIndices(9, 10, gridSize: gridSize),
                        Line.fromIndices(3, 6, gridSize: gridSize), Line.fromIndices(10, 15, gridSize: gridSize),
                        Line.fromIndices(9, 12, gridSize: gridSize), Line.fromIndices(8, 12, gridSize: gridSize),
                        Line.fromIndices(4, 8, gridSize: gridSize), Line.fromIndices(0, 4, gridSize: gridSize),
                        Line.fromIndices(0, 1, gridSize: gridSize), Line.fromIndices(1, 2, gridSize: gridSize),
                        Line.fromIndices(2, 3, gridSize: gridSize), Line.fromIndices(12, 13, gridSize: gridSize),
                        Line.fromIndices(13, 14, gridSize: gridSize), Line.fromIndices(14, 15, gridSize: gridSize),
                        Line.fromIndices(11, 15, gridSize: gridSize), Line.fromIndices(7, 11, gridSize: gridSize),
                        Line.fromIndices(3, 7, gridSize: gridSize), Line.fromIndices(0, 5, gridSize: gridSize)
                    ])),
                    // Pattern 7
                    Pattern(gridSize: gridSize, lines: Set([

                        // LEFT SIDE VERTICAL
                        Line.fromIndices(0, 4, gridSize: gridSize),
                        Line.fromIndices(4, 8, gridSize: gridSize),
                        Line.fromIndices(8, 12, gridSize: gridSize),

                        // TOP HORIZONTAL
                        Line.fromIndices(0, 1, gridSize: gridSize),
                        Line.fromIndices(1, 2, gridSize: gridSize),

                        // TOP SLANT
                        Line.fromIndices(0, 5, gridSize: gridSize),
                        Line.fromIndices(1, 6, gridSize: gridSize),
                        Line.fromIndices(2, 7, gridSize: gridSize),

                        // CENTER HORIZONTAL
                        Line.fromIndices(4, 5, gridSize: gridSize),
                        Line.fromIndices(5, 6, gridSize: gridSize),
                        Line.fromIndices(6, 7, gridSize: gridSize),

                        // CENTER VERTICALS
                        Line.fromIndices(5, 9, gridSize: gridSize),
                        Line.fromIndices(6, 10, gridSize: gridSize),
                        Line.fromIndices(7, 11, gridSize: gridSize),

                        // LOWER HORIZONTAL
                        Line.fromIndices(9, 12, gridSize: gridSize),
                        Line.fromIndices(10, 13, gridSize: gridSize),
                        Line.fromIndices(11, 14, gridSize: gridSize),

                        // BOTTOM SLANT
                        Line.fromIndices(8, 9, gridSize: gridSize),
                        Line.fromIndices(9, 10, gridSize: gridSize),
                        Line.fromIndices(10, 11, gridSize: gridSize),

                        // BOTTOM HORIZONTAL
                        Line.fromIndices(12, 13, gridSize: gridSize),
                        Line.fromIndices(13, 14, gridSize: gridSize)

                    ])),
                    // Pattern 8
                    Pattern(gridSize: gridSize, lines: Set([

                        // Top left slant
                        .fromIndices(0, 5, gridSize: gridSize),

                        // Left vertical
                        .fromIndices(4, 8, gridSize: gridSize),
                        .fromIndices(8, 12, gridSize: gridSize),

                        // Left middle horizontal
                        .fromIndices(4, 5, gridSize: gridSize),

                        // Top horizontal
                        .fromIndices(1, 2, gridSize: gridSize),
                        .fromIndices(2, 3, gridSize: gridSize),
                        .fromIndices(1, 5, gridSize: gridSize),

                        // Right vertical
                        .fromIndices(3, 7, gridSize: gridSize),
                        .fromIndices(7, 11, gridSize: gridSize),

                        // Right middle horizontal
                        .fromIndices(10, 11, gridSize: gridSize),

                        // Bottom horizontal
                        .fromIndices(12, 13, gridSize: gridSize),
                        .fromIndices(13, 14, gridSize: gridSize),

                        // Bottom right slant
                        .fromIndices(10, 15, gridSize: gridSize),

                        // Center diagonal
                        .fromIndices(12, 9, gridSize: gridSize),
                        .fromIndices(9, 6, gridSize: gridSize),
                        .fromIndices(6, 3, gridSize: gridSize),
                        .fromIndices(10, 14, gridSize: gridSize)
                        
                        

                    ])),

                    // Pattern 9
                    Pattern(gridSize: gridSize, lines: Set([

                        // Top left square
                        .fromIndices(0, 1, gridSize: gridSize),
                        .fromIndices(1, 5, gridSize: gridSize),
                        .fromIndices(5, 4, gridSize: gridSize),
                        .fromIndices(4, 0, gridSize: gridSize),

                        // Top right square
                        .fromIndices(2, 3, gridSize: gridSize),
                        .fromIndices(3, 7, gridSize: gridSize),
                        .fromIndices(7, 6, gridSize: gridSize),
                        .fromIndices(6, 2, gridSize: gridSize),

                        // Bottom left square
                        .fromIndices(8, 9, gridSize: gridSize),
                        .fromIndices(9, 10, gridSize: gridSize),
                        .fromIndices(9, 13, gridSize: gridSize),
                        .fromIndices(13, 12, gridSize: gridSize),
                        .fromIndices(12, 8, gridSize: gridSize),

                        // Bottom right square
                        .fromIndices(10, 11, gridSize: gridSize),
                        .fromIndices(11, 15, gridSize: gridSize),
                        .fromIndices(15, 14, gridSize: gridSize),
                        .fromIndices(14, 10, gridSize: gridSize),

                        // Center horizontal
                        .fromIndices(5, 6, gridSize: gridSize),
                        .fromIndices(5, 2, gridSize: gridSize),

                        // Center vertical
                        .fromIndices(5, 9, gridSize: gridSize),
                        .fromIndices(6, 10, gridSize: gridSize),

                        // Diagonal top-left to center
                        .fromIndices(8, 5, gridSize: gridSize),

                        // Diagonal center to top-right
                        .fromIndices(10, 7, gridSize: gridSize),

                        // Diagonal bottom-center
                        .fromIndices(13, 10, gridSize: gridSize)

                    ])),

                    // Pattern 10
                    Pattern(gridSize: gridSize, lines: Set([

                        // Top roof left
                        .fromIndices(4, 1, gridSize: gridSize),
                        .fromIndices(1, 5, gridSize: gridSize),

                        // Top roof right
                        .fromIndices(5, 2, gridSize: gridSize),
                        .fromIndices(2, 6, gridSize: gridSize),
                        
                        .fromIndices(1, 6, gridSize: gridSize),
                        .fromIndices(2, 7, gridSize: gridSize),

                        // Top horizontal
                        .fromIndices(4, 5, gridSize: gridSize),
                        .fromIndices(5, 6, gridSize: gridSize),
                        .fromIndices(6, 7, gridSize: gridSize),

                        // Left vertical
                        .fromIndices(4, 8, gridSize: gridSize),

                        // Right vertical
                        .fromIndices(7, 11, gridSize: gridSize),

                        // Middle horizontal
                        .fromIndices(8, 9, gridSize: gridSize),
                        .fromIndices(9, 10, gridSize: gridSize),
                        .fromIndices(10, 11, gridSize: gridSize),

                        // Cross diagonals left
                        .fromIndices(4, 9, gridSize: gridSize),
                        .fromIndices(5, 8, gridSize: gridSize),

                        // Cross diagonals center
                        .fromIndices(5, 10, gridSize: gridSize),
                        .fromIndices(6, 9, gridSize: gridSize),

                        // Cross diagonals right
                        .fromIndices(6, 11, gridSize: gridSize),
                        .fromIndices(7, 10, gridSize: gridSize),

                        // Bottom left diamond
                        .fromIndices(8, 13, gridSize: gridSize),
                        .fromIndices(9, 12, gridSize: gridSize),

                        // Bottom center diamond
                        .fromIndices(9, 14, gridSize: gridSize),
                        .fromIndices(10, 13, gridSize: gridSize),

                        // Bottom right diamond
                        .fromIndices(10, 15, gridSize: gridSize),
                        .fromIndices(11, 14, gridSize: gridSize),

                        // Bottom horizontals
                        .fromIndices(12, 13, gridSize: gridSize),
                        .fromIndices(14, 15, gridSize: gridSize)

                    ]))
                ]
            )
        }()
    let level2: PatternLevel = {
        let g = 5
        return PatternLevel(
            level: 2,
            gridSize: g,
            patterns: [

                // Pattern 1
                Pattern(gridSize: g, lines: Set([

                    // OUTER SQUARE
                    .fromIndices(0, 1, gridSize: g),
                    .fromIndices(1, 2, gridSize: g),
                    .fromIndices(2, 3, gridSize: g),
                    .fromIndices(3, 4, gridSize: g),

                    .fromIndices(0, 5, gridSize: g),
                    .fromIndices(5, 10, gridSize: g),
                    .fromIndices(10, 15, gridSize: g),
                    .fromIndices(15, 20, gridSize: g),

                    .fromIndices(4, 9, gridSize: g),
                    .fromIndices(9, 14, gridSize: g),
                    .fromIndices(14, 19, gridSize: g),
                    .fromIndices(19, 24, gridSize: g),

                    .fromIndices(20, 21, gridSize: g),
                    .fromIndices(21, 22, gridSize: g),
                    .fromIndices(22, 23, gridSize: g),
                    .fromIndices(23, 24, gridSize: g),

                    // TOP LEFT SMALL BOX
                    .fromIndices(0, 1, gridSize: g),
                    .fromIndices(1, 6, gridSize: g),
                    .fromIndices(6, 5, gridSize: g),
                    .fromIndices(5, 0, gridSize: g),

                    // TOP RIGHT SMALL BOX
                    .fromIndices(3, 4, gridSize: g),
                    .fromIndices(4, 9, gridSize: g),
                    .fromIndices(9, 8, gridSize: g),
                    .fromIndices(8, 3, gridSize: g),

                    // BOTTOM LEFT SMALL BOX
                    .fromIndices(15, 16, gridSize: g),
                    .fromIndices(16, 21, gridSize: g),
                    .fromIndices(21, 20, gridSize: g),
                    .fromIndices(20, 15, gridSize: g),

                    // BOTTOM RIGHT SMALL BOX
                    .fromIndices(18, 19, gridSize: g),
                    .fromIndices(19, 24, gridSize: g),
                    .fromIndices(24, 23, gridSize: g),
                    .fromIndices(23, 18, gridSize: g),

                    // BIG CENTER DIAMOND
                    .fromIndices(2, 8, gridSize: g),
                    .fromIndices(22, 16, gridSize: g),

                    // INNER SMALL DIAMOND
                    .fromIndices(7, 11, gridSize: g),
                    .fromIndices(11, 17, gridSize: g),
                    .fromIndices(17, 13, gridSize: g),
                    .fromIndices(13, 7, gridSize: g),
                    .fromIndices(2, 6, gridSize: g),
                    .fromIndices(2, 8, gridSize: g),
                    .fromIndices(6, 10, gridSize: g),
                    .fromIndices(10, 16, gridSize: g),
                    .fromIndices(8, 14, gridSize: g),
                    .fromIndices(14, 18, gridSize: g),
                    .fromIndices(18, 22, gridSize: g),

                ])),
                
                // Pattern 2
                Pattern(gridSize: g, lines: Set([

                    // TOP ROW
                    .fromIndices(1, 2, gridSize: g),
                    .fromIndices(2, 3, gridSize: g),
                    .fromIndices(3, 4, gridSize: g),

                    // TOP VERTICALS
                    .fromIndices(1, 6, gridSize: g),
                    .fromIndices(2, 7, gridSize: g),
                    .fromIndices(3, 8, gridSize: g),
                    .fromIndices(4, 9, gridSize: g),

                    // SECOND ROW
                    .fromIndices(1, 2, gridSize: g),
                    .fromIndices(2, 3, gridSize: g),
                    .fromIndices(3, 4, gridSize: g),

                    // LEFT VERTICAL
                    .fromIndices(5, 10, gridSize: g),
                    .fromIndices(10, 15, gridSize: g),
                    .fromIndices(15, 20, gridSize: g),

                    // MIDDLE VERTICALS
                    .fromIndices(1, 6, gridSize: g),
                    .fromIndices(6, 11, gridSize: g),
                    .fromIndices(11, 16, gridSize: g),
                    .fromIndices(16, 21, gridSize: g),

                    .fromIndices(2, 7, gridSize: g),
                    .fromIndices(7, 12, gridSize: g),
                    .fromIndices(12, 17, gridSize: g),
                    .fromIndices(17, 22, gridSize: g),

                    .fromIndices(3, 8, gridSize: g),
                    .fromIndices(8, 13, gridSize: g),
                    .fromIndices(13, 18, gridSize: g),

                    // RIGHT VERTICAL
                    .fromIndices(4, 9, gridSize: g),
                    .fromIndices(9, 14, gridSize: g),
                    .fromIndices(14, 19, gridSize: g),

                    // HORIZONTAL ROWS
                    .fromIndices(5, 6, gridSize: g),
                    .fromIndices(6, 7, gridSize: g),
                    .fromIndices(7, 8, gridSize: g),
                    .fromIndices(8, 9, gridSize: g),

                    .fromIndices(10, 11, gridSize: g),
                    .fromIndices(11, 12, gridSize: g),
                    .fromIndices(12, 13, gridSize: g),
                    .fromIndices(13, 14, gridSize: g),
                    .fromIndices(23, 18, gridSize: g),

                    .fromIndices(15, 16, gridSize: g),
                    .fromIndices(16, 17, gridSize: g),
                    .fromIndices(17, 18, gridSize: g),
                    .fromIndices(18, 19, gridSize: g),

                    .fromIndices(20, 21, gridSize: g),
                    .fromIndices(21, 22, gridSize: g),
                    .fromIndices(22, 23, gridSize: g),

                    // DIAGONAL LINE
                    .fromIndices(18, 24, gridSize: g)

                ])),

                // Pattern 3
                Pattern(gridSize: g, lines: Set([

                    // LEFT VERTICAL
                    .fromIndices(5, 10, gridSize: g),
                    .fromIndices(10, 15, gridSize: g),

                    // RIGHT VERTICAL
                    .fromIndices(9, 14, gridSize: g),
                    .fromIndices(14, 19, gridSize: g),

                    // TOP LEFT PEAK
                    .fromIndices(1, 5, gridSize: g),
                    .fromIndices(1, 7, gridSize: g),

                    // TOP RIGHT PEAK
                    .fromIndices(3, 7, gridSize: g),
                    .fromIndices(3, 9, gridSize: g),

                    // MIDDLE LEFT PEAK
                    .fromIndices(6, 10, gridSize: g),
                    .fromIndices(6, 12, gridSize: g),

                    // MIDDLE RIGHT PEAK
                    .fromIndices(8, 12, gridSize: g),
                    .fromIndices(8, 14, gridSize: g),

                    // BOTTOM LEFT PEAK
                    .fromIndices(11, 15, gridSize: g),
                    .fromIndices(11, 17, gridSize: g),

                    // BOTTOM RIGHT PEAK
                    .fromIndices(13, 17, gridSize: g),
                    .fromIndices(13, 19, gridSize: g),

                    // CENTER DOWN LINE
                    .fromIndices(17, 22, gridSize: g)

                ])),

                // Pattern 4
                Pattern(gridSize: g, lines: Set([

                    // TOP LEFT SLOPE
                    .fromIndices(1, 5, gridSize: g),
                    .fromIndices(5, 11, gridSize: g),

                    // TOP RIGHT SLOPE
                    .fromIndices(3, 9, gridSize: g),
                    .fromIndices(9, 13, gridSize: g),

                    // TOP HORIZONTAL
                    .fromIndices(1, 2, gridSize: g),
                    .fromIndices(2, 3, gridSize: g),

                    // LEFT VERTICAL
                    .fromIndices(5, 10, gridSize: g),

                    // RIGHT VERTICAL
                    .fromIndices(9, 14, gridSize: g),

                    // CENTER DIAMOND TOP
                    .fromIndices(2, 6, gridSize: g),
                    .fromIndices(6, 10, gridSize: g),

                    .fromIndices(2, 8, gridSize: g),
                    .fromIndices(8, 14, gridSize: g),

                    // MIDDLE HORIZONTAL
                    .fromIndices(10, 11, gridSize: g),
                    .fromIndices(11, 12, gridSize: g),
                    .fromIndices(12, 13, gridSize: g),
                    .fromIndices(13, 14, gridSize: g),

                    // INNER TRIANGLE
                    .fromIndices(11, 7, gridSize: g),
                    .fromIndices(7, 13, gridSize: g),

                    // INNER HORIZONTAL
                    .fromIndices(11, 12, gridSize: g),
                    .fromIndices(12, 13, gridSize: g),

                    // BOTTOM DIAMOND
                    .fromIndices(11, 17, gridSize: g),
                    .fromIndices(13, 17, gridSize: g),

                    // CENTER DOWN LINE
                    .fromIndices(17, 22, gridSize: g)

                ])),

                // Pattern 5
                Pattern(gridSize: g, lines: Set([

                    // LEFT OUTER
                    .fromIndices(1, 5, gridSize: g),
                    .fromIndices(5, 10, gridSize: g),
                    .fromIndices(10, 16, gridSize: g),

                    .fromIndices(1, 6, gridSize: g),
                    .fromIndices(6, 11, gridSize: g),
                    .fromIndices(11, 7, gridSize: g),
                    
                    // TOP LEFT
                    .fromIndices(5, 1, gridSize: g),
                    .fromIndices(3, 8, gridSize: g),
                    .fromIndices(8, 13, gridSize: g),
                    
                    // CENTER W SHAPE
                    .fromIndices(7, 13, gridSize: g),

                    // RIGHT OUTER
                    .fromIndices(3, 9, gridSize: g),
                    .fromIndices(9, 14, gridSize: g),
                    .fromIndices(14, 18, gridSize: g),

                    // BOTTOM SHAPE
                    .fromIndices(16, 17, gridSize: g),
                    .fromIndices(17, 18, gridSize: g),

                    // CENTER DOWN LINE
                    .fromIndices(17, 22, gridSize: g)

                ])),

                // Pattern 6
                Pattern(gridSize: g, lines: Set([
                    .fromIndices(10,11,gridSize:g),
                    .fromIndices(11,12,gridSize:g),
                    .fromIndices(12,13,gridSize:g),
                    .fromIndices(13,14,gridSize:g),
                    
                    .fromIndices(9,13,gridSize:g),
                    .fromIndices(8,12,gridSize:g),
                    .fromIndices(7,11,gridSize:g),
                    .fromIndices(6,10,gridSize:g),
                    
                    .fromIndices(19,13,gridSize:g),
                    .fromIndices(18,12,gridSize:g),
                    .fromIndices(17,11,gridSize:g),
                    .fromIndices(16,10,gridSize:g),
                    
                    .fromIndices(9,14,gridSize:g),
                    .fromIndices(14,19,gridSize:g),
                    
                    .fromIndices(8,13,gridSize:g),
                    .fromIndices(13,18,gridSize:g),
                    
                    .fromIndices(7,12,gridSize:g),
                    .fromIndices(12,17,gridSize:g),
                    
                    .fromIndices(6,11,gridSize:g),
                    .fromIndices(11,16,gridSize:g),
                ])),

                // Pattern 7
                Pattern(gridSize: g, lines: Set([
                 
                    .fromIndices(9, 13, gridSize: g),
                    .fromIndices(13, 17, gridSize: g),
                    .fromIndices(17, 21, gridSize: g),
                    
                    
                    .fromIndices(14, 18, gridSize: g),
                    .fromIndices(18, 22, gridSize: g),
                    
                    .fromIndices(19, 23, gridSize: g),
                    
                    .fromIndices(21, 22, gridSize: g),
                    .fromIndices(22, 23, gridSize: g),
                    
                    .fromIndices(14, 19, gridSize: g),
                    
                    .fromIndices(7, 11, gridSize: g),
                    .fromIndices(11, 16, gridSize: g),
                    .fromIndices(16, 21, gridSize: g),
                    
                    .fromIndices(16, 17, gridSize: g),
                    .fromIndices(12, 13, gridSize: g),
                    
                    .fromIndices(7, 12, gridSize: g),
                    .fromIndices(8, 13, gridSize: g),
                    
                    .fromIndices(12, 17, gridSize: g),

                    .fromIndices(9, 14, gridSize: g),
                    .fromIndices(11, 12, gridSize: g),
                    
                    .fromIndices(7, 8, gridSize: g),
                    .fromIndices(8, 9, gridSize: g),
                ])),

                // Pattern 8
                Pattern(gridSize: g, lines: Set([

                    // LEFT OUTER VERTICAL
                    .fromIndices(0, 5, gridSize: g),
                    .fromIndices(5, 10, gridSize: g),
                    .fromIndices(10, 15, gridSize: g),

                    // RIGHT OUTER VERTICAL
                    .fromIndices(8, 13, gridSize: g),
                    .fromIndices(13, 18, gridSize: g),

                    // TOP BIG M
                    .fromIndices(0, 6, gridSize: g),
                    .fromIndices(6, 2, gridSize: g),
                    .fromIndices(2, 8, gridSize: g),

                    // CENTER INNER M
                    .fromIndices(6, 11, gridSize: g),
                    .fromIndices(11, 7, gridSize: g),
                    .fromIndices(7, 12, gridSize: g),

                    // LOWER DIAMOND
                    .fromIndices(11, 16, gridSize: g),
                    .fromIndices(16, 12, gridSize: g),
                    .fromIndices(13, 7, gridSize: g),
                    // BOTTOM CONNECTIONS
                    .fromIndices(15, 16, gridSize: g),
                    .fromIndices(12, 18, gridSize: g),
                    
                    .fromIndices(16, 22, gridSize: g),
                    .fromIndices(22, 18, gridSize: g),
                    .fromIndices(18, 19, gridSize: g),
                    
                    .fromIndices(4, 9, gridSize: g),
                    .fromIndices(9, 14, gridSize: g),
                    .fromIndices(14, 19, gridSize: g),
                    .fromIndices(4, 8, gridSize: g),

                ])),

                // Pattern 9
                Pattern(gridSize: g, lines: Set([

                    // TOP W SHAPE
                    .fromIndices(1, 7, gridSize: g),
                    .fromIndices(7, 3, gridSize: g),
                    .fromIndices(3, 9, gridSize: g),

                    // LEFT UPPER DIAMOND
                    .fromIndices(5, 11, gridSize: g),
            
                    // RIGHT UPPER DIAMOND
                    .fromIndices(13, 9, gridSize: g),
    

                    // CENTER CONNECTION
                    .fromIndices(11, 17, gridSize: g),
                    .fromIndices(17, 13, gridSize: g),

                    // LEFT LOWER DIAMOND
                    .fromIndices(15, 21, gridSize: g),
                    .fromIndices(21, 17, gridSize: g),
                    .fromIndices(17, 23, gridSize: g),

                    // CENTER LOWER DIAMOND
                    .fromIndices(11, 17, gridSize: g),
                    .fromIndices(17, 21, gridSize: g),

                    // RIGHT LOWER DIAMOND
                    .fromIndices(13, 19, gridSize: g),
                    .fromIndices(19, 23, gridSize: g),

                    // BOTTOM SMALL DIAMONDS
                    .fromIndices(20, 16, gridSize: g),
                    .fromIndices(16, 22, gridSize: g),
                    .fromIndices(22, 18, gridSize: g),
                    .fromIndices(18, 24, gridSize: g),

                    // EXTRA CROSS CONNECTIONS
                    .fromIndices(1, 5, gridSize: g),
                    
                    
                    .fromIndices(12, 6, gridSize: g),
                    .fromIndices(12, 6, gridSize: g),
                    .fromIndices(12, 8, gridSize: g),
                    .fromIndices(6, 10, gridSize: g),
                    .fromIndices(8, 14, gridSize: g),
                    .fromIndices(11, 15, gridSize: g),

                ])),

                // Pattern 10
                Pattern(gridSize: g, lines: Set([

                    // TOP TRIANGLE
                    .fromIndices(2, 6, gridSize: g),
                    .fromIndices(6, 8, gridSize: g),
                    .fromIndices(8, 2, gridSize: g),

                    // LEFT OUTER
                    .fromIndices(11, 17, gridSize: g),
                    .fromIndices(13, 7, gridSize: g),

                    // RIGHT OUTER
                    .fromIndices(6, 7, gridSize: g),
                    .fromIndices(7, 8, gridSize: g),

                    // CENTER BOX
                   
                    .fromIndices(7, 8, gridSize: g),

                    .fromIndices(6, 12, gridSize: g),
                    .fromIndices(12, 18, gridSize: g),

                    .fromIndices(8, 14, gridSize: g),
                    .fromIndices(14, 18, gridSize: g),

                    .fromIndices(11, 12, gridSize: g),
                    .fromIndices(12, 13, gridSize: g),

                    .fromIndices(13, 14, gridSize: g),
                    .fromIndices(17, 18, gridSize: g),

                    // INNER CROSS
                    

                    .fromIndices(6, 11, gridSize: g),
                    .fromIndices(8, 13, gridSize: g),

                    // BOTTOM LINE
                    .fromIndices(12, 22, gridSize: g),
                    .fromIndices(16, 17, gridSize: g),
                    .fromIndices(17, 18, gridSize: g),
                    .fromIndices(6, 10, gridSize: g),
                    .fromIndices(10, 16, gridSize: g),
                    .fromIndices(10, 11, gridSize: g),
                    .fromIndices(11, 16, gridSize: g),
                    .fromIndices(13, 18, gridSize: g),
                    .fromIndices(8, 12, gridSize: g),
                    .fromIndices(12, 16, gridSize: g),
                    .fromIndices(7, 11, gridSize: g),

                ]))
            ]
        )
    }()

    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        applyTheme()
        
        rightOrWrongImg.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // only first time
        if currentLevelData == nil {
            loadLevelData()
        }
    }
    
    
    
    // MARK: Function
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        nextBtn.layer.cornerRadius = 6
        resetBtn.layer.cornerRadius = 6
        nextBtn.isHidden = false
        scoreView.layer.cornerRadius = 6
    }
    
  
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            scoreView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            nextBtn.setTitleColor(.black, for: .normal)

            resetBtn.backgroundColor = .white
            resetBtn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            scoreView.backgroundColor = color

            nextBtn.backgroundColor = color
            nextBtn.setTitleColor(.white, for: .normal)

            resetBtn.backgroundColor = color
            resetBtn.setTitleColor(.white, for: .normal)
        }
    }
    
    
    private func loadLevelData() {
            switch selectedLevel {
            case 1:
                currentLevelData = androidLevel1
            case 2:
                currentLevelData = level2
            default:
                currentLevelData = androidLevel1 // Default to level 1
            }
            
            loadLevel() // Now call loadLevel using currentLevelData
        }

    private func loadLevel() {
       currentIndex = 0
       score = 0
       totalQuestions = 0
       loadPattern()
       updateScore()
    }

    private func loadPattern() {

        guard currentIndex < currentLevelData.patterns.count else {

            let percentage = totalQuestions == 0 ? 0 : (score * 100) / totalQuestions

            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "patternRepeatLevel\(selectedLevel)Completed")
            defaults.set(percentage, forKey: "patternRepeatLevel\(selectedLevel)Percentage")

            // ✅ RESULT SCREEN
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            if let vc = storyboard.instantiateViewController(
                withIdentifier: "RepeatPatternResultVC"
            ) as? RepeatPatternResultVC {

                vc.finalScore = score
                vc.receivedLevel = selectedLevel
                vc.receivedPercentage = percentage

                navigationController?.pushViewController(vc, animated: true)
            }

            return
        }
        rightOrWrongImg.isHidden = true

        currentPattern = currentLevelData.patterns[currentIndex]

        // ✅ SAME COLOR FOR BOTH VIEWS
        let sameColor = ColorManager.randomColor()

        referenceView.lineColor = sameColor
        drawingView.lineColor = sameColor

        // ✅ LOAD REFERENCE PATTERN
        referenceView.loadPattern(currentPattern)

        // ✅ RESET USER DRAWING
        drawingView.reset()
        drawingView.gridSize = currentLevelData.gridSize
        drawingView.expectedLineCount = currentPattern.lines.count
        drawingView.isInteractive = true

        nextBtn.setTitle("Submit".localiz(), for: .normal)
        nextBtn.isHidden = false

        isAnswerSubmitted = false
    }
        
       private func updateScore() {
           scorelbl.text = "\("Score".localiz()): \(score) / \(totalQuestions)"
       }
//    private func isPatternCorrect() -> Bool {
//        let drawnSet = Set(drawingView.drawnLines.map { $0.normalized() })
//        let referenceSet = Set(currentPattern.lines.map { $0.normalized() })
//
//        return drawnSet.count == referenceSet.count &&
//               drawnSet == referenceSet
//    }
    private func isPatternCorrect() -> Bool {
        let drawn = Set(drawingView.drawnLines.map { $0.normalized() })
        let reference = Set(currentPattern.lines.map { $0.normalized() })

        // ✅ Check each reference line is covered
        for ref in reference {
            if !isLineCovered(refLine: ref, drawnLines: drawn) {
                return false
            }
        }

        return true
    }
    
    private func isLineCovered(refLine: Line, drawnLines: Set<Line>) -> Bool {

        // Direct match
        if drawnLines.contains(refLine) {
            return true
        }

        // 🔥 Check if multiple small lines form this line
        let sameDirectionLines = drawnLines.filter {
            isCollinear(line1: refLine, line2: $0)
        }

        // If no lines in same direction → fail
        if sameDirectionLines.isEmpty {
            return false
        }

        // Rough check: start & end covered
        let coversStart = sameDirectionLines.contains {
            $0.from == refLine.from || $0.to == refLine.from
        }

        let coversEnd = sameDirectionLines.contains {
            $0.from == refLine.to || $0.to == refLine.to
        }

        return coversStart && coversEnd
    }
    
    private func isCollinear(line1: Line, line2: Line) -> Bool {
        let dx1 = line1.to.col - line1.from.col
        let dy1 = line1.to.row - line1.from.row

        let dx2 = line2.to.col - line2.from.col
        let dy2 = line2.to.row - line2.from.row

        return dx1 * dy2 == dy1 * dx2
    }
    
    // MARK: Action
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        drawingView.reset()
        nextBtn.isHidden = false
        isAnswerSubmitted = false
        rightOrWrongImg.isHidden = true
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {

        // NEXT
        if isAnswerSubmitted {
            currentIndex += 1
            loadPattern()
            rightOrWrongImg.isHidden = true
            return
        }

        // SUBMIT
        totalQuestions += 1

        let isCorrect = isPatternCorrect()

        if isCorrect {
            score += 1
            rightOrWrongImg.image = UIImage(named: "check mark")   // ✅ your check image name
        } else {
            rightOrWrongImg.image = UIImage(named: "close")   // ❌ your wrong image name
        }

        rightOrWrongImg.isHidden = false

        updateScore()

        isAnswerSubmitted = true
        nextBtn.setTitle("Next".localiz(), for: .normal)
        nextBtn.isHidden = false
    }

}
//
struct Dot: Hashable {
    let row: Int
    let col: Int

    static func fromIndex(_ index: Int, gridSize: Int) -> Dot {
        return Dot(row: index / gridSize, col: index % gridSize)
    }
}

struct Line: Hashable {
    let from: Dot
    let to: Dot

    func normalized() -> Line {
        if from.row < to.row {
            return self
        } else if from.row > to.row {
            return Line(from: to, to: from)
        } else {
            return from.col <= to.col ? self : Line(from: to, to: from)
        }
    }
}

struct Pattern {
    let gridSize: Int
    let lines: Set<Line>
}

struct PatternLevel {
    let level: Int
    let gridSize: Int
    let patterns: [Pattern]
}
extension Line {
    static func fromIndices(_ index1: Int, _ index2: Int, gridSize: Int) -> Line {
        let dot1 = Dot.fromIndex(index1, gridSize: gridSize)
        let dot2 = Dot.fromIndex(index2, gridSize: gridSize)
        return Line(from: dot1, to: dot2)
    }
}
