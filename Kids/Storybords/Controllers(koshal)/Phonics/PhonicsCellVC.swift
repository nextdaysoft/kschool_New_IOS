//
//  PhonicsCellVC.swift
//  KSchool
//
//  Created by Koshal Singh on 24/03/26.
//

import UIKit

class PhonicsCellVC: UICollectionViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var baarView: UIView!
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var allImages: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = true
        contentView.frame = bounds
        baarView.clipsToBounds = true
        baarView.backgroundColor = ColorManager.randomColor()
    }
    
}
struct PhonicsModel {
    let image: String
    let title: String
    let speech: String
}

let phonicsData: [PhonicsModel] = [
    PhonicsModel(image: "apple", title: "A", speech: "A A Apple"),
    PhonicsModel(image: "beach-ball", title: "B", speech: "B B Ball"),
    PhonicsModel(image: "cat_and_kitten", title: "C", speech: "C C Cat"),
    PhonicsModel(image: "dog_and_puppy", title: "D", speech: "D D Dog"),
    PhonicsModel(image: "elephant", title: "E", speech: "E E Elephant"),
    PhonicsModel(image: "clown-fish", title: "F", speech: "F F Fish"),
    PhonicsModel(image: "goat_and_kid", title: "G", speech: "G G Goat"),
    PhonicsModel(image: "HatImg", title: "H", speech: "H H Hat"),
    PhonicsModel(image: "ink", title: "I", speech: "I I Ink"),
    PhonicsModel(image: "jug", title: "J", speech: "J J Jug"),
    PhonicsModel(image: "kite", title: "K", speech: "K K Kite"),
    PhonicsModel(image: "lion_and_cub", title: "L", speech: "L L Lion"),
    PhonicsModel(image: "mango", title: "M", speech: "M M Mango"),
    PhonicsModel(image: "nest", title: "N", speech: "N N Nest"),
    PhonicsModel(image: "orange", title: "O", speech: "O O Orange"),
    PhonicsModel(image: "nature", title: "P", speech: "P P Peacock"),
    PhonicsModel(image: "RatImg", title: "R", speech: "R R Rat"),
    PhonicsModel(image: "queen", title: "R", speech: "Q Q Queen"),
    PhonicsModel(image: "sun", title: "S", speech: "S S Sun"),
    PhonicsModel(image: "tap", title: "T", speech: "T T Tap"),
    PhonicsModel(image: "umbrella", title: "U", speech: "U U Umbrella"),
    PhonicsModel(image: "vanNew", title: "V", speech: "V V Van"),
    PhonicsModel(image: "watch", title: "W", speech: "W W Watch"),
    PhonicsModel(image: "xylophone", title: "X", speech: "X X Xylophone"),
    PhonicsModel(image: "yak", title: "Y", speech: "Y Y Yak"),
    PhonicsModel(image: "zebra_and_baby", title: "Z", speech: "Z Z Zebra")
]
