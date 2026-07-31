//
//  MazeLevel.swift
//  New
//
//  Created by Koshal Singh on 03/06/26.
//

import Foundation
import UIKit

import UIKit

struct MazeLevel {

    let maze: [[Int]]

    let startRow: Int
    let startCol: Int

    let endRow: Int
    let endCol: Int

    let startImage: UIImage?
    let endImage: UIImage?

    let levelNo: Int
}

enum MazeLevels {

    static let level1 = MazeLevel(

        maze: [
            // maze
        ],

        startRow: 0,
        startCol: 1,

        endRow: 14,
        endCol: 8,

        startImage: UIImage(named: "monkey"),
        endImage: UIImage(named: "banana"),

        levelNo: 1
    )

    static let level2 = MazeLevel(

        maze: [
            // level2 maze
        ],

        startRow: 0,
        startCol: 2,

        endRow: 12,
        endCol: 10,

        startImage: UIImage(named: "cat"),
        endImage: UIImage(named: "milk"),

        levelNo: 2
    )

    static let level3 = MazeLevel(

        maze: [
            // level3 maze
        ],

        startRow: 0,
        startCol: 1,

        endRow: 13,
        endCol: 7,

        startImage: UIImage(named: "car"),
        endImage: UIImage(named: "flag"),

        levelNo: 3
    )
}
