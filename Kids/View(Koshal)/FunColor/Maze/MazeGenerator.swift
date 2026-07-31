//
//  MazeGenerator.swift
//  New
//
//  Created by Koshal Singh on 03/06/26.
//

import Foundation

final class MazeGenerator {

    static func generate(level: Int) -> [[Int]] {

        let size = min(11 + level * 2, 31)

        var maze = Array(
            repeating: Array(repeating: 1, count: size),
            count: size
        )

        func carve(_ row: Int, _ col: Int) {

            maze[row][col] = 0

            let directions = [
                (-2, 0),
                ( 2, 0),
                ( 0,-2),
                ( 0, 2)
            ].shuffled()

            for (dr, dc) in directions {

                let newRow = row + dr
                let newCol = col + dc

                guard newRow > 0,
                      newRow < size - 1,
                      newCol > 0,
                      newCol < size - 1 else {
                    continue
                }

                if maze[newRow][newCol] == 1 {

                    maze[row + dr/2][col + dc/2] = 0

                    carve(newRow, newCol)
                }
            }
        }

        carve(1, 1)

        // TOP ENTRY ko direct connect karo
        maze[0][1] = 0
        maze[1][1] = 0

        // BOTTOM EXIT ko direct connect karo
        maze[size - 1][size - 2] = 0
        maze[size - 2][size - 2] = 0

        return maze

        return maze
    }
}
