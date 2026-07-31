//
//  RememberShapeAndColorVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 29/12/25.
//
struct ShapeColorData {
    let plainImageName: String
    let templateImageName: String 
    let correctColor: UIColor
    var selectedColor: UIColor?
}

import UIKit

class RememberShapeAndColorVC: BaseViewController {

    @IBOutlet weak var circleImg: UIImageView!
    @IBOutlet weak var starImg: UIImageView!
    @IBOutlet weak var triangleImg: UIImageView!
    @IBOutlet weak var squareImg: UIImageView!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var goBtn: UIButton!
    
    var shapesData: [ShapeColorData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setImages()
        changeColors()
        
    }
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        goBtn.backgroundColor = color
        goBtn.layer.cornerRadius = 6
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func goTapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "RememberShapeAndPickColorsVC"
        ) as! RememberShapeAndPickColorsVC

        vc.shapesData = shapesData
        navigationController?.pushViewController(vc, animated: true)
    }

    func setImages() {
        circleImg.image = UIImage(named: "circle1")?.withRenderingMode(.alwaysTemplate)
        starImg.image = UIImage(named: "star1")?.withRenderingMode(.alwaysTemplate)
        triangleImg.image = UIImage(named: "triangle1")?.withRenderingMode(.alwaysTemplate)
        squareImg.image = UIImage(named: "square1")?.withRenderingMode(.alwaysTemplate)
    }

    func changeColors() {
        var systemColors: [UIColor] = [
            .systemRed, .systemGreen, .systemBlue,
            .systemYellow, .systemOrange, .systemPurple
        ]
        systemColors.shuffle()

       
            shapesData = [
                ShapeColorData(
                    plainImageName: "circle",
                    templateImageName: "circle1",
                    correctColor: systemColors[0]
                ),
                ShapeColorData(
                    plainImageName: "star",
                    templateImageName: "star1",
                    correctColor: systemColors[1]
                ),
                ShapeColorData(
                    plainImageName: "triangleNew",
                    templateImageName: "triangle1",
                    correctColor: systemColors[2]
                ),
                ShapeColorData(
                    plainImageName: "square",
                    templateImageName: "square1",
                    correctColor: systemColors[3]
                )
            ]
        

        circleImg.tintColor = systemColors[0]
        starImg.tintColor = systemColors[1]
        triangleImg.tintColor = systemColors[2]
        squareImg.tintColor = systemColors[3]
    }
}
