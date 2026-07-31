//
//  ProfileVC.swift
//  New
//
//  Created by Koshal Singh on 21/04/26.
//

import UIKit

class ProfileVC: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var nameBGView: UIView!
    @IBOutlet weak var ageBGView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageBtn: UIButton!
    @IBOutlet weak var backBtnBgView: UIView!
    
    @IBOutlet weak var backBtnBgViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var submitBtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var titelBGView: UIView!
    @IBOutlet weak var titleBGViewLeadingConstraint: NSLayoutConstraint!
    
    var isFromOnboarding: Bool = false
    var buttonOriginalY: CGFloat = 0
    var isKeyboardShown = false
    var originalBottomSpace: CGFloat = 20
    
    var themeColor: UIColor?
    
    let nameErrorLabel = UILabel()
    let ageErrorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        // delegates

         nameTextField.delegate = self
         ageTextField.delegate = self
        
        originalBottomSpace = submitBtnBottomConstraint.constant
        
        NotificationCenter.default.addObserver(
                  self,
                  selector: #selector(keyboardWillShow),
                  name: UIResponder.keyboardWillShowNotification,
                  object: nil

              )

              NotificationCenter.default.addObserver(
                  self,
                  selector: #selector(keyboardWillHide),
                  name: UIResponder.keyboardWillHideNotification,
                  object: nil

              )
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        loadSavedData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if buttonOriginalY == 0 {
            buttonOriginalY = submitBtn.frame.origin.y
        }
    }
    
    deinit {

            NotificationCenter.default.removeObserver(self)

        }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        if textField == nameTextField {

            nameBGView.layer.borderColor = themeColor?.cgColor
            nameBGView.layer.borderWidth = 1.5
        }

        if textField == ageTextField {

            ageBGView.layer.borderColor = themeColor?.cgColor
            ageBGView.layer.borderWidth = 1.5
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        if textField == nameTextField {

            if nameTextField.text?.isEmpty ?? true {

                nameBGView.layer.borderColor = UIColor.black.cgColor
                nameBGView.layer.borderWidth = 0.3
            }
        }

        if textField == ageTextField {

            if ageTextField.text?.isEmpty ?? true {

                ageBGView.layer.borderColor = UIColor.black.cgColor
                ageBGView.layer.borderWidth = 0.3
            }
        }
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        let currentText = textField.text ?? ""

        guard let stringRange = Range(range, in: currentText) else {
            return true
        }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        if textField == nameTextField {
            nameErrorLabel.isHidden = !updatedText.isEmpty
        }

        if textField == ageTextField {
            ageErrorLabel.isHidden = !updatedText.isEmpty
        }

        return true
    }
    
    
        // MARK: Keyboard Show

        @objc func keyboardWillShow(notification: Notification) {

            guard let keyboardFrame =

                    notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect

            else { return }

            let keyboardHeight = keyboardFrame.height

            UIView.animate(withDuration: 0.3) {

                self.submitBtnBottomConstraint.constant = keyboardHeight + 20

                self.view.layoutIfNeeded()

            }

        }

        // MARK: Keyboard Hide

        @objc func keyboardWillHide(notification: Notification) {

            UIView.animate(withDuration: 0.3) {

                self.submitBtnBottomConstraint.constant = self.originalBottomSpace

                self.view.layoutIfNeeded()

            }

        }

        // MARK: Return Key

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            self.view.endEditing(true)

            return true

        }

    // MARK: Hide keyboard on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func loadSavedData() {
        let name = UserDefaults.standard.string(forKey: "userName")
        let age = UserDefaults.standard.string(forKey: "userAge")
        
        nameTextField.text = name
        ageTextField.text = age
        
        backBtnBgView.isHidden = isFromOnboarding

        if backBtnBgView.isHidden {

            // hide width
            backBtnBgViewWidthConstraint.constant = 0

            // move title left
            titleBGViewLeadingConstraint.constant = 10
        }

        view.layoutIfNeeded()
    }
    
    func setupErrorLabels() {

        nameErrorLabel.textColor = .red
        nameErrorLabel.font = .systemFont(ofSize: 12)
        nameErrorLabel.isHidden = true

        ageErrorLabel.textColor = .red
        ageErrorLabel.font = .systemFont(ofSize: 12)
        ageErrorLabel.isHidden = true

        view.addSubview(nameErrorLabel)
        view.addSubview(ageErrorLabel)

        nameErrorLabel.translatesAutoresizingMaskIntoConstraints = false
        ageErrorLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            nameErrorLabel.topAnchor.constraint(equalTo: nameBGView.bottomAnchor, constant: 4),
            nameErrorLabel.leadingAnchor.constraint(equalTo: nameBGView.leadingAnchor, constant: 5),

            ageErrorLabel.topAnchor.constraint(equalTo: ageBGView.bottomAnchor, constant: 4),
            ageErrorLabel.leadingAnchor.constraint(equalTo: ageBGView.leadingAnchor, constant: 5)

        ])
    }
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
        submitBtn.layer.cornerRadius = 10
        submitBtn.backgroundColor = color
        
        nameBGView.layer.cornerRadius = 10
        nameBGView.layer.borderColor = UIColor.black.cgColor
        nameBGView.layer.borderWidth = 0.3
        
        themeColor = color
        
        ageBGView.layer.cornerRadius = 10
        ageBGView.layer.borderColor = UIColor.black.cgColor
        ageBGView.layer.borderWidth = 0.3
        
        setupErrorLabels()
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ageTapBtn(_ sender: UIButton) {

        self.view.subviews.forEach {
            if $0 is AgeSelectionView {
                $0.removeFromSuperview()
            }
        }

        let frame = ageBGView.convert(ageBGView.bounds, to: self.view)

        var yPosition: CGFloat = frame.maxY + 8

        // submit ke baad error show hua tab hi extra space
        if ageErrorLabel.isHidden == false {
            yPosition = frame.maxY + 25
        }

        let ageView = AgeSelectionView(
            frame: CGRect(
                x: frame.origin.x,
                y: yPosition,
                width: frame.width,
                height: 110
            )
        )

        ageView.onSelect = { selectedAge in
            self.ageTextField.text = selectedAge
            self.ageErrorLabel.isHidden = true
        }

        self.view.addSubview(ageView)
    }
    
    
    
    @IBAction func submitTapBtn(_ sender: Any) {

        // Name validation
        if nameTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {

            nameErrorLabel.text = "This field cannot be empty"
            nameErrorLabel.isHidden = false

            return
        } else {
            nameErrorLabel.isHidden = true
        }

        // Age validation
        if ageTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {

            ageErrorLabel.text = "This field cannot be empty"
            ageErrorLabel.isHidden = false

            self.view.layoutIfNeeded()

            self.view.subviews.forEach {
                if $0 is AgeSelectionView {
                    $0.removeFromSuperview()
                }
            }

            let frame = ageBGView.convert(ageBGView.bounds, to: self.view)

            let ageView = AgeSelectionView(
                frame: CGRect(
                    x: frame.origin.x,
                    y: frame.maxY + 25,
                    width: frame.width,
                    height: 110
                )
            )

            ageView.onSelect = { selectedAge in
                self.ageTextField.text = selectedAge
                self.ageErrorLabel.isHidden = true
            }

            self.view.addSubview(ageView)

            return

        } else {
            ageErrorLabel.isHidden = true
        }

        let name = nameTextField.text!
        let age = ageTextField.text!

        UserDefaults.standard.set(name, forKey: "userName")
        UserDefaults.standard.set(age, forKey: "userAge")

        // ye 3 line important hain

        UserDefaults.standard.set(true, forKey: "hasSelectedLanguage")
        UserDefaults.standard.set(true, forKey: "hasOnboarded")
        UserDefaults.standard.set(true, forKey: "isProfileCompleted")

        UserDefaults.standard.synchronize()

        goToHome()

    }
    
    
    
    func goToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeScreen")
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: homeVC)
        sceneDelegate.window?.makeKeyAndVisible()
    }
    
}
