//
//  DrawSmallLetters.swift
//  KSchool
//
//  Created by Koshal Singh on 02/05/26.
//


import UIKit
import AVFoundation

class DrawSmallLetters: BaseViewController {

    // MARK: Outlet
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var repeatBtn: UIButton!

    @IBOutlet weak var draw: LetterDrawSmallView!
    @IBOutlet weak var trace: LetterTraceSmallView!

    @IBOutlet weak var restBtn: UIButton!
    @IBOutlet weak var letterNextBtn: UIButton!
    @IBOutlet weak var letterBackBtn: UIButton!
    @IBOutlet weak var sheetBtn: UIButton!

    private let speechSynthesizer = AVSpeechSynthesizer()

    // SMALL LETTERS
    private let letters = Array("abcdefghijklmnopqrstuvwxyz")

    private var letterIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        setupForRestBtn()
        
        loadLetter(at: letterIndex)

        nextBtn.isHidden = true
        repeatBtn.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
    }
    
    func setup() {
        let config = UIImage.SymbolConfiguration(
            pointSize: 26,
            weight: .medium
        )

        let img = UIImage(
            systemName: "arrow.backward.circle",
            withConfiguration: config
        )

        backBtn.setImage(img, for: .normal)

        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)

        nextBtn.layer.cornerRadius = 6
        repeatBtn.layer.cornerRadius = 6
    }

    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextBtn.backgroundColor = .white
            repeatBtn.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color

            nextBtn.backgroundColor = color
            repeatBtn.backgroundColor = color

        }
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
    
    func speakLetter(_ letter: String) {

        speechSynthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(string: letter)

        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        utterance.rate = 0.5

        speechSynthesizer.speak(utterance)
    }

    private func loadLetter(at index: Int) {

        guard index >= 0, index < letters.count else { return }

        let data = SmallAlphabetPathProvider.strokeData(
            for: letters[index]
        )

        speakLetter(String(letters[index]))

        trace.resetTrace()

        draw.resetDraw()

        draw.setLetter(
            data.paths,
            letter: letters[index]
        )

        trace.initTracing(
            strokes: data.paths,
            letter: letters[index],
            isLoopLetter: data.isLoop
        ) { [weak self] in

            self?.nextBtn.isHidden = false
            self?.repeatBtn.isHidden = false
        }
    }
    
    func goToResultScreen() {

        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        if let vc = storyboard.instantiateViewController(
            withIdentifier: "CapitalLettersResultVC"
        ) as? CapitalLettersResultVC {

            vc.levelKey = "letterLevel2Completed"
            vc.titleText = "Small Letters"
            vc.menuVCType = LetterMenuVC.self
            navigationController?.pushViewController(
                vc,
                animated: true
            )
        }
    }
    
    @IBAction func letterNextTapBtn(_ sender: UIButton) {

        // last letter
        if letterIndex >= letters.count - 1 {

            goToResultScreen()
            return
        }

        letterIndex += 1

        nextBtn.isHidden = true
        repeatBtn.isHidden = true

        loadLetter(at: letterIndex)
    }

    @IBAction func letterBackTapBtn(_ sender: UIButton) {

        guard letterIndex > 0 else { return }

        letterIndex -= 1

        nextBtn.isHidden = true
        repeatBtn.isHidden = true

        loadLetter(at: letterIndex)
    }

    
    
    @IBAction func speakBtn(_ sender: UIButton) {
        speakLetter(String(letters[letterIndex]))
    }
    
    
    @IBAction func repeatDrawBtn(_ sender: UIButton) {
        trace.resetTrace()
           draw.redraw()
    }
    

    // MARK: Actions
      @IBAction func backbtn(sender: UIButton){
          self.navigationController?.popViewController(animated: true)
      }
    
    @IBAction func nextTapped(_ sender: UIButton) {

        letterIndex += 1

        if letterIndex >= letters.count {

            goToResultScreen()
            return
        }

        loadLetter(at: letterIndex)

        nextBtn.isHidden = true
        repeatBtn.isHidden = true
    }

    @IBAction func repeatTapped(_ sender: UIButton) {

        trace.resetTrace()

        nextBtn.isHidden = true
        repeatBtn.isHidden = true
    }

    @IBAction func sheetTapBtn(_ sender:UIButton){

        let vc = LetterBottomSheetVC()

        vc.modalPresentationStyle = .overFullScreen

        vc.selectedIndex = letterIndex

        // small letters mode
        vc.letters = Array("abcdefghijklmnopqrstuvwxyz")

        vc.onLetterSelected = { [weak self] index in

            guard let self = self else { return }

            self.letterIndex = index

            self.nextBtn.isHidden = true
            self.repeatBtn.isHidden = true

            self.loadLetter(at:index)
        }

        present(vc,animated:true)
    }
}
