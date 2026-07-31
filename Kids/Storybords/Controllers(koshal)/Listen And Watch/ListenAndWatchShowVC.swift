//
//  ListenAndWatchShowVC.swift
//  KSchool
//
//  Created by Koshal Singh on 04/06/26.
//

import UIKit
import AVFoundation

class ListenAndWatchShowVC: BaseViewController {

    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!

    
    @IBOutlet weak var capitalDraw: LetterDrawCapitalView!
    @IBOutlet weak var smallDraw: LetterDrawSmallView!
    
    @IBOutlet weak var smallCurDraw: LetterDrawSmallCursiveVC!
    
    var letterStyle: LetterStyle = .normal
    var screenTitle = ""
    var isSmallLetters = false
    
    var isSmallCursiveLetters = false
    
    var isNumbers = false
    
    private var numbers = Array(1...100)
    private var numberIndex = 0
    
    private var letters: [Character] {

        if isSmallLetters || isSmallCursiveLetters {
            return Array("abcdefghijklmnopqrstuvwxyz")
        }

        return Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    }
    
    private var letterIndex = 0
    private let speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        
        titleLabel.text = screenTitle

        capitalDraw.isHidden = isSmallLetters || isSmallCursiveLetters
        smallDraw.isHidden = !(isSmallLetters || isSmallCursiveLetters)
        smallCurDraw.isHidden = !isSmallCursiveLetters

        loadLetter(at: letterIndex)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
    }
    
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
    
    func speakLetter(_ letter: String) {

        speechSynthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(string: letter)

        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5

        speechSynthesizer.speak(utterance)
    }
    
    func speakNumber(_ number: Int) {

        speechSynthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(
            string: "\(number)"
        )
        utterance.voice = AVSpeechSynthesisVoice(
            language: "en-US"
        )
        utterance.rate = 0.5
        speechSynthesizer.speak(utterance)
    }
    
    private func loadLetter(at index: Int) {

        if isNumbers {

            guard numberIndex < numbers.count else {
                goToResultScreen()
                return
            }

            let number = numbers[numberIndex]

            speakNumber(number)

            let data = HandwrittenNumberPathProvider.strokeData(for: number)

            capitalDraw.resetDraw()
            capitalDraw.setNumber(data.paths)

            capitalDraw.onAnimationCompleted = { [weak self] in

                guard let self = self else { return }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

                    self.numberIndex += 1
                    self.loadLetter(at: self.numberIndex)
                }
            }

            return
        }

        guard index < letters.count else {
            goToResultScreen()
            return
        }

        speakLetter(String(letters[index]).lowercased())

        let data: LetterStrokeData

        if isSmallCursiveLetters {

            data = SmallCursiveAlphabetPath.strokeData(
                for: letters[index]
            )

        } else if isSmallLetters {

            data = SmallAlphabetPathProvider.strokeData(
                for: letters[index]
            )

        } else {

            data = AlphabetPathProvider.strokeData(
                for: letters[index],
                style: letterStyle
            )
        }

        if isSmallCursiveLetters {

            smallCurDraw.resetDraw()

            smallCurDraw.setLetter(
                data.paths,
                letter: letters[index]
            )

            smallCurDraw.onAnimationCompleted = { [weak self] in

                guard let self = self else { return }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

                    self.letterIndex += 1
                    self.loadLetter(at: self.letterIndex)
                }
            }

        }
        else if isSmallLetters {

            smallDraw.resetDraw()

            smallDraw.setLetter(
                data.paths,
                letter: letters[index]
            )

            smallDraw.onAnimationCompleted = { [weak self] in

                guard let self = self else { return }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

                    self.letterIndex += 1
                    self.loadLetter(at: self.letterIndex)
                }
            }

        }
        else {

            capitalDraw.resetDraw()

            capitalDraw.setLetter(data.paths)

            capitalDraw.onAnimationCompleted = { [weak self] in

                guard let self = self else { return }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

                    self.letterIndex += 1
                    self.loadLetter(at: self.letterIndex)
                }
            }
        }
    }
    
    
    func goToResultScreen() {

        let sb = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = sb.instantiateViewController(
            withIdentifier: "ListenAndWatchResultVC"
        ) as! ListenAndWatchResultVC

        if isNumbers {
            
            vc.levelKey = "listenAndWatchLevel5Completed"
            vc.titleText = "Numbers"

        } else if isSmallCursiveLetters {

            vc.levelKey = "listenAndWatchLevel4Completed"
            vc.titleText = "Small Cursive Letters"

        } else if isSmallLetters {

            vc.levelKey = "listenAndWatchLevel2Completed"
            vc.titleText = "Small Letters"

        } else if letterStyle == .cursive {

            vc.levelKey = "listenAndWatchLevel3Completed"
            vc.titleText = "Capital Cursive Letters"

        } else {

            vc.levelKey = "listenAndWatchLevel1Completed"
            vc.titleText = "Capital Letters"
        }

        vc.menuVCType = ListenAndWatchMenuVC.self

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    //  MARK: Action
      @IBAction func backbtn(sender: UIButton){
          self.navigationController?.popViewController(animated: true)
      }
    

}
