//
//  Numbers.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 28/01/26.
//

import UIKit
import AVFoundation

class Numbers: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var repeatBtn: UIButton!
    @IBOutlet weak var draw: NumberDrawView!
    @IBOutlet weak var trace: NumberTraceView!
    
    @IBOutlet weak var restBtn: UIButton!
    @IBOutlet weak var letterNextBtn: UIButton!
    @IBOutlet weak var letterBackBtn: UIButton!
    @IBOutlet weak var sheetBtn: UIButton!
    
    // MARK: Variables
    private var numberIndex = 0
    private let speechSynthesizer = AVSpeechSynthesizer()
    
    private var numbers:[Int] = []
    var levelNumber:Int = 1
    
    // MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
        setupForRestBtn()
        
        let start = ((levelNumber - 1) * 10) + 1
        let end = min(levelNumber * 10,100)

        numbers = Array(start...end)
        
        loadNumber(at: numberIndex)
        // Do any additional setup after loading the view.
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
      
        nextBtn.layer.cornerRadius = 6
        //nextBtn.isHidden = true
       
        repeatBtn.layer.cornerRadius = 6
        nextBtn.isHidden = true
        repeatBtn.isHidden = true

    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            repeatBtn.backgroundColor = .white

            nextBtn.setTitleColor(.black, for: .normal)
            repeatBtn.setTitleColor(.black, for: .normal)

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            repeatBtn.backgroundColor = color

            nextBtn.setTitleColor(.white, for: .normal)
            repeatBtn.setTitleColor(.white, for: .normal)
        }
    }
    
    func speakNumber(_ number: Int) {

        speechSynthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(
            string: "\(number)"
        )

        utterance.voice =
            AVSpeechSynthesisVoice(
                language: "en-US"
            )

        utterance.rate = 0.5

        speechSynthesizer.speak(
            utterance
        )
    }
    
    func setupForRestBtn() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        
        
        let img = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: config)
        
        restBtn.setImage(img, for: .normal)
        
        restBtn.tintColor = UIColor(
            red: 0.17,
            green: 0.21,
            blue: 0.33,
            alpha: 1
        )
        
        // Text right side + icon right
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    private func loadNumber(at index: Int) {

        guard index >= 0,
              index < numbers.count else { return }

        let number = numbers[index]

        let data =
        HandwrittenNumberPathProvider
            .strokeData(for:number)

        speakNumber(number)

        trace.resetTrace()
        draw.resetDraw()

        draw.setNumber(data.paths)

        trace.initTracing(
            strokes:data.paths
        ){ [weak self] in

            self?.nextBtn.isHidden = false
            self?.repeatBtn.isHidden = false
        }
    }
    
    func goToResultScreen() {

        let storyboard =
        UIStoryboard(
            name:"Main",
            bundle:nil
        )

        if let vc =
            storyboard.instantiateViewController(
                withIdentifier:
                "CapitalLettersResultVC"
            )
            as? CapitalLettersResultVC {

            vc.levelKey =
            "pickCorrectSpellingLevel\(levelNumber)Completed"

            vc.titleText =
            "Numbers"
            vc.menuVCType = NumberMenuVC.self
            
            navigationController?
                .pushViewController(
                    vc,
                    animated:true
                )
        }
    }
    
    @IBAction func letterNextTapBtn(_ sender: UIButton) {

        if numberIndex >= numbers.count-1 {

            goToResultScreen()
            return
        }

        numberIndex += 1

        nextBtn.isHidden = true
        repeatBtn.isHidden = true

        loadNumber(at:numberIndex)
    }

    @IBAction func letterBackTapBtn(_ sender: UIButton) {

        guard numberIndex > 0
        else { return }

        numberIndex -= 1

        nextBtn.isHidden = true
        repeatBtn.isHidden = true

        loadNumber(at:numberIndex)
    }

    @IBAction func speakBtn(
        _ sender:UIButton
    ){

        speakNumber(
            numbers[numberIndex]
        )
    }
    
    
    @IBAction func repeatDrawBtn(
        _ sender:UIButton
    ){
        trace.resetTrace()
        draw.redraw()
    }
    
   
    
    // MARK: Action
    @IBAction func backbtn(sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    @IBAction func repeatTapped(
        _ sender:UIButton
    ){

        trace.resetTrace()

        nextBtn.isHidden = true
        repeatBtn.isHidden = true
    }
    
    @IBAction func nextTapped(
        _ sender:UIButton
    ){

        numberIndex += 1

        if numberIndex >= numbers.count {

            goToResultScreen()
            return
        }

        loadNumber(
            at:numberIndex
        )

        nextBtn.isHidden = true
        repeatBtn.isHidden = true
    }
    
    @IBAction func sheetTapBtn(_ sender:UIButton){

        let vc = NumberBottomSheetVC()

        vc.modalPresentationStyle = .overFullScreen

        // current selected number
        vc.selectedIndex = numberIndex

        // sirf current level ke numbers
        vc.numbers = numbers

        vc.onNumberSelected = { [weak self] index in

            guard let self = self else { return }

            self.numberIndex = index

            self.nextBtn.isHidden = true
            self.repeatBtn.isHidden = true

            self.loadNumber(at: index)
        }

        present(vc, animated: true)
    }
    
}
