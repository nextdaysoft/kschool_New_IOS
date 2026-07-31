//
//  SubSCell.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 18/12/25.
//

import UIKit

class SubSCell: UITableViewCell {
    // MARK: Outlet
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var subImg: UIImageView!
    
    @IBOutlet weak var cView: UIView!
    @IBOutlet weak var numLbl: UILabel!
    @IBOutlet weak var numView: UIView!
    @IBOutlet weak var subImgWidthConstraint: NSLayoutConstraint!
   
    @IBOutlet weak var subLabel: UILabel!
    
    
    // MARK: Variable
    var onTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(cViewTapped))
        cView.addGestureRecognizer(tap)
    }
    @objc private func cViewTapped() {
            onTap?()
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
