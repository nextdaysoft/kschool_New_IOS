//
//  Drawing.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 23/01/26.
//

import UIKit
import PencilKit
class Drawing: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var canvasView: PKCanvasView!
    // MARK: Variable
    private let toolPicker = PKToolPicker()
    
    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        setupCanvas()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    // MARK: Function
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
        }
    }
    
    
    private func setupCanvas() {
            // Allow finger + pencil
            canvasView.drawingPolicy = .anyInput
            
            // White paper background
            canvasView.backgroundColor = .white
            
            // Pencil by default
            canvasView.tool = PKInkingTool(
                .pencil,
                color: .black,
                width: 6
            )

            // Tool picker (colors, eraser, pencil)
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            
            canvasView.becomeFirstResponder()
        }
    // MARK: Action
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
