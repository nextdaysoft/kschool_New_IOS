//
//  SelectLanguageVC.swift
//  New
//
//  Created by Koshal Singh on 21/04/26.
//

import UIKit
import LanguageManager_iOS

class SelectLanguageVC: BaseViewController {
    
    
    @IBOutlet weak var searchBGView: UIView!
    @IBOutlet weak var searchTextField: UITextField!

    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    @IBOutlet weak var viewBG9: UIView!
    @IBOutlet weak var viewBG10: UIView!
    @IBOutlet weak var viewBG11: UIView!
    @IBOutlet weak var viewBG12: UIView!
    @IBOutlet weak var viewBG13: UIView!
    @IBOutlet weak var viewBG14: UIView!
    @IBOutlet weak var viewBG15: UIView!
    @IBOutlet weak var viewBG16: UIView!
    @IBOutlet weak var viewBG17: UIView!
    @IBOutlet weak var viewBG18: UIView!
    @IBOutlet weak var viewBG19: UIView!
    @IBOutlet weak var viewBG20: UIView!
    @IBOutlet weak var viewBG21: UIView!
    @IBOutlet weak var viewBG22: UIView!
    @IBOutlet weak var viewBG23: UIView!
    @IBOutlet weak var viewBG24: UIView!
    @IBOutlet weak var viewBG25: UIView!
    @IBOutlet weak var viewBG26: UIView!
    @IBOutlet weak var viewBG27: UIView!
    @IBOutlet weak var viewBG28: UIView!
    @IBOutlet weak var viewBG29: UIView!
    @IBOutlet weak var viewBG30: UIView!
    @IBOutlet weak var viewBG31: UIView!
    @IBOutlet weak var viewBG32: UIView!
    @IBOutlet weak var viewBG33: UIView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var img10: UIImageView!
    @IBOutlet weak var img11: UIImageView!
    @IBOutlet weak var img12: UIImageView!
    @IBOutlet weak var img13: UIImageView!
    @IBOutlet weak var img14: UIImageView!
    @IBOutlet weak var img15: UIImageView!
    @IBOutlet weak var img16: UIImageView!
    @IBOutlet weak var img17: UIImageView!
    @IBOutlet weak var img18: UIImageView!
    @IBOutlet weak var img19: UIImageView!
    @IBOutlet weak var img20: UIImageView!
    @IBOutlet weak var img21: UIImageView!
    @IBOutlet weak var img22: UIImageView!
    @IBOutlet weak var img23: UIImageView!
    @IBOutlet weak var img24: UIImageView!
    @IBOutlet weak var img25: UIImageView!
    @IBOutlet weak var img26: UIImageView!
    @IBOutlet weak var img27: UIImageView!
    @IBOutlet weak var img28: UIImageView!
    @IBOutlet weak var img29: UIImageView!
    @IBOutlet weak var img30: UIImageView!
    @IBOutlet weak var img31: UIImageView!
    @IBOutlet weak var img32: UIImageView!
    @IBOutlet weak var img33: UIImageView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBOutlet weak var doneBtnBgView: UIView!
    
    var bgViews: [UIView] = []
    var imageViews: [UIImageView] = []
    var isFromMoreVC: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        updateText()
        NotificationCenter.default.addObserver(self, selector: #selector(updateText), name: NSNotification.Name("LanguageChanged"), object: nil)
        searchBGView.layer.cornerRadius = 10
        searchBGView.layer.borderColor = UIColor.black.cgColor
        searchBGView.layer.borderWidth = 0.3
       
        doneBtn.layer.cornerRadius = 10
        doneBtn.backgroundColor = ColorManager.randomColor()
        
     
        
        bgViews = [viewBG1, viewBG2, viewBG3, viewBG4, viewBG5,

                   viewBG6, viewBG7, viewBG8, viewBG9, viewBG10,

                   viewBG11, viewBG12, viewBG13, viewBG14, viewBG15,

                   viewBG16, viewBG17, viewBG18, viewBG19, viewBG20,

                   viewBG21, viewBG22, viewBG23, viewBG24, viewBG25,

                   viewBG26, viewBG27, viewBG28, viewBG29, viewBG30,

                   viewBG31, viewBG32, viewBG33]

        imageViews = [img1, img2, img3, img4, img5,

                      img6, img7, img8, img9, img10,

                      img11, img12, img13, img14, img15,

                      img16, img17, img18, img19, img20,

                      img21, img22, img23, img24, img25,

                      img26, img27, img28, img29, img30,

                      img31, img32, img33]
        
        for view in bgViews {

               view.layer.cornerRadius = 10

               view.backgroundColor = ColorManager.randomColor()

               view.layer.borderColor = UIColor.black.cgColor

           }
        
        let savedIndex = UserDefaults.standard.integer(forKey: "selectedLanguageIndex")

           if savedIndex >= 6 && savedIndex < bgViews.count {

               selectItem(at: savedIndex)

           } else {

               selectItem(at: 6)

           }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        doneBtnBgView.isHidden = isFromMoreVC
    }
    
    func selectItem(at index: Int) {
        
        for i in 0..<bgViews.count {
            bgViews[i].layer.borderWidth = 0
            imageViews[i].image = nil
        }
        
        bgViews[index].layer.borderColor = UIColor.black.cgColor
        bgViews[index].layer.borderWidth = 0.3
        
        imageViews[index].image = UIImage(named: "check")
        
        // ✅ SAVE
        UserDefaults.standard.set(index, forKey: "selectedLanguageIndex")
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

    
    
    @objc func updateText() {
        let currentLanguage = UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first ?? "en"
        print("Current language: \(currentLanguage)")
    }

    func changeLanguageAndSaveToUserDefaults(langSet: String = "en") {

        UserDefaults.standard.set(langSet, forKey: "selectedLanguage")
        UserDefaults.standard.synchronize()

        NotificationCenter.default.post(
            name: NSNotification.Name("LanguageChanged"),
            object: nil
        )

        DispatchQueue.main.async {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let homeVC = storyboard.instantiateViewController(
                withIdentifier: "HomeScreen"
            ) as! HomeScreen

            let navigationController = UINavigationController(
                rootViewController: homeVC
            )

            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {

                window.rootViewController = navigationController
                window.makeKeyAndVisible()
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("LanguageChanged"), object: nil)
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        selectItem(at: 0)
    }
    
    @IBAction func level2TapBtn(_ sender: UIButton) {
        selectItem(at: 1)
       
    }
    @IBAction func level3TapBtn(_ sender: UIButton) { selectItem(at: 2) }
    @IBAction func level4TapBtn(_ sender: UIButton) { selectItem(at: 3)
        
//        UserDefaults.standard.set(1, forKey: "selectedImageTag") // saveSelectedImage(tag: 3)
//        
//        LanguageManager.shared.setLanguage(language: .zhHans)
//        changeLanguageAndSaveToUserDefaults(langSet: "zhHans")
    }
    
    @IBAction func level5TapBtn(_ sender: UIButton) { selectItem(at: 4) }
    @IBAction func level6TapBtn(_ sender: UIButton) { selectItem(at: 5) }
    
    @IBAction func level7TapBtn(_ sender: UIButton) {
        selectItem(at: 6)
        LanguageManager.shared.setLanguage(language: .en)
        changeLanguageAndSaveToUserDefaults()
    }
    
    @IBAction func level8TapBtn(_ sender: UIButton) { selectItem(at: 7) }
    @IBAction func level9TapBtn(_ sender: UIButton) { selectItem(at: 8) }
    @IBAction func level10TapBtn(_ sender: UIButton) { selectItem(at: 9) }

    @IBAction func level11TapBtn(_ sender: UIButton) { selectItem(at: 10) }
    @IBAction func level12TapBtn(_ sender: UIButton) { selectItem(at: 11) }
    @IBAction func level13TapBtn(_ sender: UIButton) { selectItem(at: 12) }
    @IBAction func level14TapBtn(_ sender: UIButton) { selectItem(at: 13) }
    @IBAction func level15TapBtn(_ sender: UIButton) { selectItem(at: 14) }
    @IBAction func level16TapBtn(_ sender: UIButton) { selectItem(at: 15) }
    @IBAction func level17TapBtn(_ sender: UIButton) { selectItem(at: 16) }
    @IBAction func level18TapBtn(_ sender: UIButton) { selectItem(at: 17) }
    @IBAction func level19TapBtn(_ sender: UIButton) { selectItem(at: 18) }
    @IBAction func level20TapBtn(_ sender: UIButton) { selectItem(at: 19) }

    @IBAction func level21TapBtn(_ sender: UIButton) { selectItem(at: 20) }
    @IBAction func level22TapBtn(_ sender: UIButton) { selectItem(at: 21) }
    @IBAction func level23TapBtn(_ sender: UIButton) { selectItem(at: 22) }
    @IBAction func level24TapBtn(_ sender: UIButton) { selectItem(at: 23) }
    @IBAction func level25TapBtn(_ sender: UIButton) { selectItem(at: 24) }
    @IBAction func level26TapBtn(_ sender: UIButton) { selectItem(at: 25) }
    @IBAction func level27TapBtn(_ sender: UIButton) { selectItem(at: 26) }
    @IBAction func level28TapBtn(_ sender: UIButton) { selectItem(at: 27) }
    @IBAction func level29TapBtn(_ sender: UIButton) { selectItem(at: 28) }
    @IBAction func level30TapBtn(_ sender: UIButton) { selectItem(at: 29) }

    @IBAction func level31TapBtn(_ sender: UIButton) { selectItem(at: 30) }
    @IBAction func level32TapBtn(_ sender: UIButton) { selectItem(at: 31) }
    @IBAction func level33TapBtn(_ sender: UIButton) { selectItem(at: 32) }

    
    
    @IBAction func doneTapBtn(_ sender: UIButton) {
        
       // UserDefaults.standard.set(true, forKey: "hasSelectedLanguage")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
