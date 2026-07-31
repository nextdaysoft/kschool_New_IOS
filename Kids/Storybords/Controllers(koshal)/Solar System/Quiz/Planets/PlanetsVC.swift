//
//  PlanetsVC.swift
//  Kids
//
//  Created by Koshal Singh on 28/01/26.
//

import UIKit
import LanguageManager_iOS

class PlanetsVC: BaseViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    let correctOrder = [
        "Mercury".localiz(),
        "Venus".localiz(),
        "Earth".localiz(),
        "Mars".localiz(),
        "Jupiter".localiz(),
        "Saturn".localiz(),
        "Uranus".localiz(),
        "Neptune".localiz()
    ]

    var planets = [
        "Mercury".localiz(),
        "Venus".localiz(),
        "Earth".localiz(),
        "Mars".localiz(),
        "Jupiter".localiz(),
        "Saturn".localiz(),
        "Uranus".localiz(),
        "Neptune".localiz()
    ]

    var planetViews: [UIView] = []
    var planetLabels: [UILabel] = []
    
    var currentDraggingIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupPlanets()
        addDragGesture()
        setCornerRadius()
        lockViewSize()
        submitBtn.layer.cornerRadius = 10
    
        submitBtn.layer.cornerRadius = 10
        submitBtn.backgroundColor = ColorManager.randomColor()
        submitBtn.layer.borderColor = UIColor.black.cgColor
        
        
        view1.layer.cornerRadius = 10
        view1.backgroundColor = ColorManager.randomColor()
        view1.layer.borderColor = UIColor.black.cgColor
   
        
        view2.layer.cornerRadius = 10
        view2.backgroundColor = ColorManager.randomColor()
        view2.layer.borderColor = UIColor.black.cgColor
 
        
        view3.layer.cornerRadius = 10
        view3.backgroundColor = ColorManager.randomColor()
        view3.layer.borderColor = UIColor.black.cgColor
     
        
        view4.layer.cornerRadius = 10
        view4.backgroundColor = ColorManager.randomColor()
        view4.layer.borderColor = UIColor.black.cgColor
      
        
        view5.layer.cornerRadius = 10
        view5.backgroundColor = ColorManager.randomColor()
        view5.layer.borderColor = UIColor.black.cgColor
        
        
        view6.layer.cornerRadius = 10
        view6.backgroundColor = ColorManager.randomColor()
        view6.layer.borderColor = UIColor.black.cgColor
       
        
        view7.layer.cornerRadius = 10
        view7.backgroundColor = ColorManager.randomColor()
        view7.layer.borderColor = UIColor.black.cgColor
     
        
        view8.layer.cornerRadius = 10
        view8.backgroundColor = ColorManager.randomColor()
        view8.layer.borderColor = UIColor.black.cgColor
        
        
        if let stackView = view1.superview as? UIStackView {
            stackView.clipsToBounds = true
        }
    }
    
    func setCornerRadius() {
        let views = [view1, view2, view3, view4, view5, view6, view7, view8]
        
        for view in views {
            view?.layer.cornerRadius = 12   // yahan radius adjust kar sakte ho
            view?.layer.masksToBounds = true
        }
    }
    
    func setupPlanets() {

        planetViews = [view1, view2, view3, view4, view5, view6, view7, view8]
        planetLabels = [label1, label2, label3, label4, label5, label6, label7, label8]

        planets.shuffle()

        for i in 0..<planetLabels.count {

            planetLabels[i].text = planets[i]

            // Correct index ko tag me save karo
            if let index = correctOrder.firstIndex(of: planets[i]) {
                planetViews[i].tag = index
            }
        }
    }
    
    func lockViewSize() {
        for view in planetViews {
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: view.frame.height),
                view.widthAnchor.constraint(equalToConstant: view.frame.width)
            ])
        }
    }
    
    func addDragGesture() {
        for view in planetViews {
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            view.addGestureRecognizer(pan)
        }
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {

        guard let draggedView = gesture.view,
              let stackView = draggedView.superview as? UIStackView else { return }

        let location = gesture.location(in: stackView)

        switch gesture.state {

        case .began:
            draggedView.layer.zPosition = 10
            stackView.bringSubviewToFront(draggedView)

        case .changed:
            draggedView.center.y = location.y

        case .ended:
            draggedView.layer.zPosition = 0

            // 🔥 Find drop index
            var targetIndex = stackView.arrangedSubviews.count - 1

            for (index, view) in stackView.arrangedSubviews.enumerated() {
                if location.y < view.frame.midY {
                    targetIndex = index
                    break
                }
            }

            // 🔁 Reinsert ONLY ON DROP
            stackView.removeArrangedSubview(draggedView)
            draggedView.removeFromSuperview()
            stackView.insertArrangedSubview(draggedView, at: targetIndex)

            UIView.animate(withDuration: 0.25) {
                stackView.layoutIfNeeded()
            }

        default:
            break
        }
    }
    

    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
 
    @IBAction func submitTapBtn(_ sender: Any) {

        let resultVC = storyboard?.instantiateViewController(
            withIdentifier: "PlanetsResultVC"
        ) as! PlanetsResultVC

        guard let stackView = view1.superview as? UIStackView else { return }

        var currentOrder: [String] = []

        for arrangedView in stackView.arrangedSubviews {

            let index = arrangedView.tag

            if index >= 0 && index < correctOrder.count {
                currentOrder.append(correctOrder[index])
            }
        }

        resultVC.userOrder = currentOrder

        navigationController?.pushViewController(resultVC, animated: false)
    }
    
}
