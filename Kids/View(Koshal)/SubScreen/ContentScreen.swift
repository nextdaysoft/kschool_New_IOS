//
//  ContentScreen.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 18/12/25.
//

import UIKit

class ContentScreen: BaseViewController {
    
    // MARK: Outlet
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var StatusView: UIView!
    @IBOutlet weak var resetLabel: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    
    // MARK: Variable
        var Htitle = ""
        var subItem: SubItem!
        var selectedCategory: Any!
        var levelCount: Int = 0
    // MARK: Life Cycle
    
    var completedItems: [String: Bool] = [:]
    
    var didTapLockedLevel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyTheme()
        setupForRestBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()
        
        if let items = subItem.coloringItems {
            for item in items {
                completedItems[item.imageName] =
                    UserDefaults.standard.bool(forKey: item.imageName)
            }
        }

        tblView.reloadData()
        updateResetVisibility() // ⭐ IMPORTANT
    }
    
    func updateResetVisibility() {
        let isAnyCompleted = completedItems.values.contains(true)

        resetBtn.isHidden = !isAnyCompleted
        resetLabel.isHidden = !isAnyCompleted
    }
    
    func setupForRestBtn() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        
        
        let img = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: config)
        
        resetBtn.setImage(img, for: .normal)
        
        resetBtn.tintColor = UIColor(
            red: 0.17,
            green: 0.21,
            blue: 0.33,
            alpha: 1
        )
        
        // Text right side + icon right
        resetBtn.semanticContentAttribute = .forceRightToLeft
        resetBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    // MARK: Function
    func setup(){
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
       // let img = UIImage(systemName: "arrow.backward.circle")
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        lblTitle.text = Htitle
    }
    func numberToWord(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: NSNumber(value: number))?.capitalized ?? "\(number)"
    }

    func checkSubscription() -> Bool {

        if SubscriptionManager.shared.isSubscribed() {

            return true

        }

        if !didTapLockedLevel {

            didTapLockedLevel = true

            return false

        }

        didTapLockedLevel = false

        goToSubscription()

        return false

    }

    func goToSubscription() {

        let storyboard = UIStoryboard(

            name: "Main",

            bundle: nil

        )

        let vc = storyboard.instantiateViewController(

            withIdentifier: "SubscriptionVC"

        ) as! SubscriptionVC

        navigationController?.pushViewController(

            vc,

            animated: true

        )

    }
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            StatusView.backgroundColor = .white

        } else {

            let color = ColorManager.randomColor()

            HeaderView.backgroundColor = color
            StatusView.backgroundColor = color
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func resetTapBtn(_ sender: UIButton) {

        guard let items = subItem.coloringItems else { return }

        for item in items {
            // ✅ clear from memory
            completedItems[item.imageName] = false

            // ✅ clear from storage
            UserDefaults.standard.set(false, forKey: item.imageName)
        }

        tblView.reloadData()
        updateResetVisibility()
    }
    
}
// MARK: Extension
extension ContentScreen: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let items = subItem.coloringItems {
                return items.count
            }
        return subItem.levelConfig?.levelCount ?? 0//levelCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubSCell", for: indexPath) as! SubSCell
        cell.cView.layer.cornerRadius = 10
        cell.cView.layer.borderColor = UIColor.black.cgColor
       // cell.cView.layer.borderWidth = 0.4
        cell.cView.backgroundColor =
        UserDefaults.standard.bool(forKey: "WhiteTheme")
        ? .white
        : ColorManager.randomColor()
        cell.subImg.isHidden = true
        cell.imgView.isHidden = true
        cell.numView.makeCircle()
        cell.numView.layer.borderWidth = 1
        cell.numView.backgroundColor = .clear
        cell.subImgWidthConstraint.constant = 0
//        cell.numLbl.text = "\(indexPath.row + 1)"
//        cell.lblTitle.text = "Level"
        // ✅ COLORING MODE
        if let items = subItem.coloringItems {

            let item = items[indexPath.row]

            cell.imgView.isHidden = false
            cell.numView.isHidden = true

            // default
            cell.imgView.image = UIImage(named: item.imageName)
            cell.subImg.isHidden = true
            cell.subImgWidthConstraint.constant = 0
            cell.cView.backgroundColor =
            UserDefaults.standard.bool(forKey: "WhiteTheme")
            ? .white
            : ColorManager.randomColor()

            // ✅ First 4 free
            if indexPath.row >= 4 &&
                !SubscriptionManager.shared.isSubscribed() {

                cell.subImg.isHidden = false
                cell.subImg.image = UIImage(named: "lock")
                cell.subImgWidthConstraint.constant = 30

                cell.cView.backgroundColor = .systemGray4
            }
            else if completedItems[item.imageName] == true {

                cell.subImg.isHidden = false
                cell.subImg.image = UIImage(named: "done")
                cell.subImgWidthConstraint.constant = 30
            }

            cell.lblTitle.text = item.title

            cell.onTap = { [weak self] in

                guard let self = self else { return }

                // 0,1,2,3 free
                if indexPath.row >= 4 {

                    guard self.checkSubscription() else {
                        return
                    }
                }

                self.openColoring(item: item)
            }

            return cell
        }
        
        let row = indexPath.row
        switch subItem.levelDisplayType {
        case .number:
            cell.numLbl.text = "\(row + 1)"
            cell.lblTitle.text = "Level"
        case .numberWithWord:
            let number = row + 2
            cell.numLbl.text = "\(number)"
            cell.lblTitle.text = numberToWord(number)
        case .range(let step):
            let start = row * step + 1
            let end = start + step - 1
            cell.numLbl.text = "\(row + 1)"
            cell.lblTitle.text = "\(start)-\(end)"
        }



        cell.onTap = { [weak self] in
            //self?.openLevel(level: indexPath.row + 1)
            guard let self = self else { return }
               switch self.subItem.levelDisplayType {
               case .number:
                   self.openLevel(level: row + 1)
               case .numberWithWord:
                   self.openLevel(level: row + 2)
               case .range:
                   self.openLevel(level: row + 1)
               }
        }

        return cell
    }
    
    func openLevel(level: Int) {
        ScreenRouter.route(
            from: self,
            item: subItem,
            level: level
        )
    }
    
    func openColoring(item: ColoringItem) {

        let vc = storyboard?.instantiateViewController(
            withIdentifier: "Coloring"
        ) as! Coloring

        // ✅ all images
        vc.coloringItems = subItem.coloringItems ?? []

        // ✅ current selected index
        vc.currentIndex = (subItem.coloringItems ?? []).firstIndex {
            $0.imageName == item.imageName
        } ?? 0

        // ✅ callback
        vc.onColoringFinished = { [weak self] image in
            guard let self = self else { return }

            // ✅ current completed item
            let completedItem = vc.coloringItems[vc.currentIndex]

            // ✅ save correct image
            self.completedItems[completedItem.imageName] = true

            UserDefaults.standard.set(
                true,
                forKey: completedItem.imageName
            )

            // ✅ reload menu
            self.tblView.reloadData()

            self.updateResetVisibility()
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func showCompletionPopup() {
//        let alert = UIAlertController(title: "Great Job 🎉",
//                                      message: "You completed coloring!",
//                                      preferredStyle: .alert)
//
//        let image = UIImageView(image: UIImage(named: "done"))
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        alert.view.addSubview(image)
//
//        image.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
//        image.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 60).isActive = true
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//
//        present(alert, animated: true)
//    }

    func showCompletionImage(_ image: UIImage) {
        let alert = UIAlertController(title: "Great Job 🎉", message: nil, preferredStyle: .alert)

        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        alert.view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120)
        ])

        alert.addAction(UIAlertAction(title: "OK", style: .default))

        present(alert, animated: true)
    }
    
}
// MARK: Extension Circle View
extension UIView {
    func makeCircle() {
        layoutIfNeeded()
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
    }
}


