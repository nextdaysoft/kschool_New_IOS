//
//  MazeView.swift
//  New
//
//  Created by Koshal Singh on 03/06/26.
//

import Foundation
import UIKit

class MazeView: UIView {

    var mazeColor: UIColor = .systemBlue {
        didSet {
            backgroundColor = mazeColor
        }
    }
    
    var currentRow = 0
    var currentCol = 0
    
    var level: MazeLevel! {
         didSet {
             currentRow = level.startRow
             currentCol = level.startCol
         }
     }
 
    var onLevelComplete: (() -> Void)?
    
    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.setShouldAntialias(false)

        guard let level = level else { return }

        let maze = level.maze

        guard !maze.isEmpty,
              !maze[0].isEmpty else {
            return
        }

        self.backgroundColor = mazeColor

        let rows = maze.count
        let cols = maze[0].count

        let cellSize = min(
            bounds.width / CGFloat(cols),
            bounds.height / CGFloat(rows)
        )

        let mazeWidth = CGFloat(cols) * cellSize

        let startX = (bounds.width - mazeWidth) / 2
        let startY: CGFloat = 0

        UIColor.systemGray6.setFill()

        for row in 0..<rows {

            for col in 0..<cols {

                if maze[row][col] == 0 {

                    let x = round(startX + CGFloat(col) * cellSize)
                    let y = round(startY + CGFloat(row) * cellSize)

                    let frame = CGRect(
                        x: x - 0.5,
                        y: y - 0.5,
                        width: ceil(cellSize) + 1,
                        height: ceil(cellSize) + 1
                    )

                    UIRectFill(frame.integral)
                }
            }
        }

        drawStartImage(
            cellSize,
            startX,
            startY
        )

        drawEndImage(
            cellSize,
            startX,
            startY
        )
    }

    func drawStartImage(
        _ cellSize: CGFloat,
        _ startX: CGFloat,
        _ startY: CGFloat
    ) {

        viewWithTag(1001)?.removeFromSuperview()

        let imageView = UIImageView()

        imageView.tag = 1001
        imageView.image = level.startImage

        imageView.frame = CGRect(
            x: startX + CGFloat(currentCol) * cellSize,
            y: startY + CGFloat(currentRow) * cellSize,
            width: cellSize,
            height: cellSize
        )

        imageView.contentMode = .scaleAspectFit

        addSubview(imageView)
    }

    func drawEndImage(
        _ cellSize: CGFloat,
        _ startX: CGFloat,
        _ startY: CGFloat
    ) {

        viewWithTag(1002)?.removeFromSuperview()

        let imageView = UIImageView()

        imageView.tag = 1002
        imageView.image = level.endImage

        let imageSize = cellSize * 2.2

        imageView.frame = CGRect(
            x: startX + CGFloat(level.endCol) * cellSize - (imageSize - cellSize) / 2,
            y: startY + CGFloat(level.endRow) * cellSize - (imageSize - cellSize) / 2,
            width: imageSize,
            height: imageSize
        )

        imageView.contentMode = .scaleAspectFit

        addSubview(imageView)
    }
    
    func move(row: Int, col: Int) {

        guard let level = level else { return }

        let maze = level.maze

        guard !maze.isEmpty,
              !maze[0].isEmpty else {
            return
        }

        let newRow = currentRow + row
        let newCol = currentCol + col

        guard newRow >= 0,
              newRow < maze.count else {
            return
        }

        guard newCol >= 0,
              newCol < maze[newRow].count else {
            return
        }

        // Sirf path (0) par move karo
        guard maze[newRow][newCol] == 0 else {
            return
        }

        currentRow = newRow
        currentCol = newCol

        setNeedsDisplay()

        if currentRow == level.endRow &&
           currentCol == level.endCol {

            print("LEVEL COMPLETE")

            onLevelComplete?()
        }
    }
    
}
