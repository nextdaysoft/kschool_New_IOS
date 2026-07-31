//
//  RememberShapeAndPickColorsVC.swift
//  Find Pair
//
//  Created by Koshal Singh on 29/12/25.
//

import UIKit

class RememberShapeAndPickColorsVC: BaseViewController {

    @IBOutlet weak var imgs: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    var shapesData: [ShapeColorData] = []
    var selectedIndex = 0

    var colorOptions: [UIColor] = []
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
         navigationItem.hidesBackButton = true
         
         colorOptions = shapesData.map { $0.correctColor }
         colorOptions.shuffle()
         
         setupButtons()
         showShape()
      
        nextBtn.isHidden = true
    }
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        nextBtn.backgroundColor = color
        nextBtn.layer.cornerRadius = 6
    }

    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {

        guard let nav = navigationController else { return }

        for vc in nav.viewControllers {
            if vc is GameMenuVC {
                nav.popToViewController(vc, animated: true)
                return
            }
        }

        // Agar GameMenuVC na mile to normal back
        nav.popViewController(animated: true)
    }
 
    
    
    func showShape() {
        let shape = shapesData[selectedIndex]

        if let selectedColor = shape.selectedColor {
           
            imgs.image = UIImage(named: shape.templateImageName)?
                .withRenderingMode(.alwaysTemplate)
            imgs.tintColor = selectedColor
        } else {
   
            imgs.image = UIImage(named: shape.plainImageName)?
                .withRenderingMode(.alwaysOriginal)
            imgs.tintColor = nil
        }
    }
    
    func selectColor(_ color: UIColor) {
        shapesData[selectedIndex].selectedColor = color

        imgs.image = UIImage(named: shapesData[selectedIndex].templateImageName)?
            .withRenderingMode(.alwaysTemplate)

        imgs.tintColor = color

        nextBtn.isHidden = false   
    }
    
    func setupButtons() {
        btn1.backgroundColor = colorOptions[0]
        btn2.backgroundColor = colorOptions[1]
        btn3.backgroundColor = colorOptions[2]
        btn4.backgroundColor = colorOptions[3]
    }
   
    
    @IBAction func btnTap1(_ sender: UIButton) { selectColor(colorOptions[0]) }
    @IBAction func btnTap2(_ sender: UIButton) { selectColor(colorOptions[1]) }
    @IBAction func btnTap3(_ sender: UIButton) { selectColor(colorOptions[2]) }
    @IBAction func btnTap4(_ sender: UIButton) { selectColor(colorOptions[3]) }

    
    @IBAction func nextTapBtn(_ sender: UIButton) {
        if selectedIndex < shapesData.count - 1 {
            selectedIndex += 1
            showShape()
            nextBtn.isHidden = true
        } else {
            let vc = storyboard?.instantiateViewController(
                withIdentifier: "RememberShapeAndColorsAnswerVC"
            ) as! RememberShapeAndColorsAnswerVC

            vc.shapesData = shapesData
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
