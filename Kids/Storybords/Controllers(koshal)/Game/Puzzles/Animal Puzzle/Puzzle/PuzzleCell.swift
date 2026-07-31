//
//  PuzzleCell.swift
//  KSchool
//
//  Created by Koshal Singh on 16/03/26.
//

import UIKit

class PuzzleCell: UITableViewCell {

    
    @IBOutlet weak var puzzleBGView: UIView!
    @IBOutlet weak var puzzleImgsBGView: UIView!
    
    @IBOutlet weak var puzzleMainImge: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
