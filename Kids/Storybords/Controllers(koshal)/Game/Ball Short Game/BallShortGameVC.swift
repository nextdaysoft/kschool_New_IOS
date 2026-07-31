//
//  BallShortGameVC.swift
//  KSchool
//
//  Created by Koshal Singh on 18/03/26.
//

import UIKit

class BallShortGameVC: BaseViewController {
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var mainBGView: UIView!

    @IBOutlet weak var goodJobLabel: UILabel!
    @IBOutlet weak var goodJobBGView: UIView!
    @IBOutlet weak var replayBtn: UIButton!
    
    private var abacusView: BallGameAbacusView!
    
    weak var gameViewController: BallShortGameVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodJobBGView.isHidden = true
        replayBtn.isHidden = true
        
        setup()
        setupAbacus()
    
        goodJobBGView.layer.cornerRadius = 8
        goodJobBGView.backgroundColor = ColorManager.randomColor()
    }
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        replayBtn.layer.cornerRadius = 8
        replayBtn.backgroundColor = color
    }
    
    private func setupAbacus() {

        abacusView = BallGameAbacusView()
        abacusView.gameViewController = self

        abacusView.translatesAutoresizingMaskIntoConstraints = false

        mainBGView.addSubview(abacusView)

        NSLayoutConstraint.activate([
            abacusView.topAnchor.constraint(equalTo: mainBGView.topAnchor),
            abacusView.bottomAnchor.constraint(equalTo: mainBGView.bottomAnchor),
            abacusView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
            abacusView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor)
        ])
    }
    
    func showSuccess() {

        goodJobBGView.isHidden = false
        replayBtn.isHidden = false
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func replayTapBtn(_ sender: UIButton) {

        goodJobBGView.isHidden = true
        replayBtn.isHidden = true

        abacusView.resetGame()
    }
}
