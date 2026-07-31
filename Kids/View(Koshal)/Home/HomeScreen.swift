//
//  HomeScreen.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 18/12/25.
//

import UIKit

class HomeScreen: BaseViewController {
    // MARK: Outlet
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var filteredCategories: [Item<HomeCategory>] = []
    
    // MARK: Variable
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        applyTheme()
        checkForUpdate()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(languageChanged),
            name: NSNotification.Name("LanguageChanged"),
            object: nil
        )
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        applyTheme()

        filterCategoriesByAge()
        CollectionView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: false)

        let shouldShowSubscriptionToast =
            UserDefaults.standard.bool(forKey: "showSubscriptionToast")

        if shouldShowSubscriptionToast {

            showCustomToast(
                message: "Subscription purchased successfully",
                image: UIImage(named: "logo")
            )

            UserDefaults.standard.set(false, forKey: "showSubscriptionToast")
        }
    }
    
    
    @objc func languageChanged() {
        filterCategoriesByAge()
        CollectionView.reloadData()
    }
    
    // MARK: Function
    func setup(){
        if let layout = CollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical      // ⭐ IMPORTANT
                layout.minimumLineSpacing = 12
                layout.minimumInteritemSpacing = 12
                layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
                layout.estimatedItemSize = .zero           // ⭐ VERY IMPORTANT
            }
        CollectionView.showsHorizontalScrollIndicator = false
    }
    // MARK: Action
    
    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            // White Theme
            view.backgroundColor = .white
            CollectionView.backgroundColor = .systemGray6

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

        } else {

            // Random Theme
            let color = ColorManager.randomColor()

            view.backgroundColor = .systemBackground
            CollectionView.backgroundColor = .clear

            HeaderView.backgroundColor = color
            statusView.backgroundColor = color
        }
    }
    
    func filterCategoriesByAge() {

        let selectedAge = UserDefaults.standard.string(forKey: "userAge") ?? ""

        if selectedAge == "1 - 6 yrs" {

            let allowedCategories: [HomeCategory] = [
                .phonics,
                .listenAndWatch,
                .letter,
                .vehicle,
                .color,
                .maths,
                .funcorner,
                .picture,
                .game,
                .solarSystem,
                .animals,
                .frutisAndVegetables,
                .externalBodyParts,
                .guitar,
                .calendar,
                .internalBodyParts,
                .shapes,
                .seasons,
                .animalEatingStyle,
                .animalFamilies
            ]

            filteredCategories = Variable.Shared.category.filter {
                allowedCategories.contains($0.category)
            }

        } else {

            // 7-12 years → sab show
            filteredCategories = Variable.Shared.category
        }
    }
    
    @IBAction func menuTapBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "MoreVC"
        ) as! MoreVC
        navigationController?.pushViewController(vc, animated: true)
       // showForceUpdateAlert()
    }
    
    
    func checkForUpdate() {

        guard let bundleID = Bundle.main.bundleIdentifier else { return }

        let urlString = "https://itunes.apple.com/lookup?bundleId=\(bundleID)"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else { return }

            do {

                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let results = json["results"] as? [[String: Any]],
                   let appStoreVersion = results.first?["version"] as? String {

                    let currentVersion =
                    Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""

                    DispatchQueue.main.async {

                        if currentVersion.compare(appStoreVersion, options: .numeric) == .orderedAscending {

                            self.showForceUpdateAlert()
                        }
                    }
                }

            } catch {
                print(error)
            }

        }.resume()
    }
    
//    func checkForUpdate() {
//
//        let currentVersion =
//        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
//
//        // 👇 Fake App Store version for testing
//        let appStoreVersion = "2.0"
//
//        print("Current Version:", currentVersion)
//        print("Store Version:", appStoreVersion)
//
//        DispatchQueue.main.async {
//
//            if currentVersion.compare(appStoreVersion, options: .numeric) == .orderedAscending {
//
//                self.showForceUpdateAlert()
//            }
//        }
//    }
    
    func showForceUpdateAlert() {

        let alertView = UIView()
        alertView.frame = self.view.bounds
        alertView.backgroundColor = UIColor.black.withAlphaComponent(0.45)

        // ✅ Container
        let container = UIView(frame: CGRect(
            x: 30,
            y: self.view.center.y - 170,
            width: self.view.frame.width - 60,
            height: 340
        ))

        container.backgroundColor = .white
        container.layer.cornerRadius = 24
        container.clipsToBounds = true

        // ✅ Logo Image
        let imageView = UIImageView(frame: CGRect(
            x: (container.frame.width - 140)/2,
            y: 25,
            width: 140,
            height: 140
        ))

        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit

        // ✅ Title
        let titleLabel = UILabel(frame: CGRect(
            x: 20,
            y: imageView.frame.maxY + 10,
            width: container.frame.width - 40,
            height: 30
        ))

        titleLabel.text = "Update Required"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black

        // ✅ Message
        let messageLabel = UILabel(frame: CGRect(
            x: 25,
            y: titleLabel.frame.maxY + 10,
            width: container.frame.width - 50,
            height: 60
        ))

        messageLabel.text = "Please update the app to continue using it."
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .darkGray

        // ✅ Update Button
        let updateBtn = UIButton(frame: CGRect(
            x: 40,
            y: container.frame.height - 75,
            width: container.frame.width - 80,
            height: 50
        ))

        updateBtn.setTitle("Update Now", for: .normal)
        updateBtn.backgroundColor = ColorManager.randomColor()
        updateBtn.layer.cornerRadius = 14
        updateBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)

        updateBtn.addAction(UIAction(handler: { _ in

            let appID = "6759913599"

            if let url = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)") {
                UIApplication.shared.open(url)
            }

        }), for: .touchUpInside)

        // ✅ Add Subviews
        container.addSubview(imageView)
        container.addSubview(titleLabel)
        container.addSubview(messageLabel)
        container.addSubview(updateBtn)

        alertView.addSubview(container)

        // ✅ Prevent dismiss
        self.view.addSubview(alertView)

        // ✅ Animation
        container.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        container.alpha = 0

        UIView.animate(withDuration: 0.3) {
            container.transform = .identity
            container.alpha = 1
        }
    }
    
}
extension HomeScreen: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        return filteredCategories.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCell",
            for: indexPath
        ) as! CategoryCell

        cell.configure(
            title: filteredCategories[indexPath.row].title,
            image: UIImage(named: filteredCategories[indexPath.row].imageName)
        )

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let selected = filteredCategories[indexPath.row]

        switch selected.category {

        case .letter:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "LetterMenuVC"
            ) as! LetterMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .listenAndWatch:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ListenAndWatchMenuVC"
            ) as! ListenAndWatchMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .grammar:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "GrammarMenuVC"
            ) as! GrammarMenuVC
            navigationController?.pushViewController(vc, animated: true)
           
        case .reading:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ReadingMenuVC"
            ) as! ReadingMenuVC
            navigationController?.pushViewController(vc, animated: true)
          
        case .clock:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ClockMenuVC"
            ) as! ClockMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .game:
            let vc = storyboard?.instantiateViewController(
                withIdentifier: "GameMenuVC"
            ) as! GameMenuVC
            navigationController?.pushViewController(vc, animated: true)

        case .wordsearch:
            let vc = storyboard?.instantiateViewController(
                withIdentifier: "WordSearchMenuVC"
            ) as! WordSearchMenuVC
            navigationController?.pushViewController(vc, animated: true)

        case .science:
            let vc = storyboard?.instantiateViewController(
                withIdentifier: "ScienceMenuVC"
            ) as! ScienceMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .solarSystem:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "SolarSystemMenuVC"
            ) as! SolarSystemMenuVC
            navigationController?.pushViewController(vc, animated: true)
          
        case .animals:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "AnimalsMenuVC"
            ) as! AnimalsMenuVC
            navigationController?.pushViewController(vc, animated: true)
          
        case .frutisAndVegetables:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "FruitsAndVegetablesMenuVC"
            ) as! FruitsAndVegetablesMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .country:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "CountryMenuVC"
            ) as! CountryMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .phonics:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "PhonicsVC"
            ) as! PhonicsVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .color:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ColorMenuVC"
            ) as! ColorMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .vehicle:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "VehicleMenuVC"
            ) as! VehicleMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .guitar:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "MusicMenuVC"
            ) as! MusicMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .calendar:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "CalendarMenuVC"
            ) as! CalendarMenuVC
            navigationController?.pushViewController(vc, animated: true)
          
        case .measurement:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "MeasurementMenuVC"
            ) as! MeasurementMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .roadSignsAndSignals:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "RoadSignsAndSignalsMenuVC"
            ) as! RoadSignsAndSignalsMenuVC
            navigationController?.pushViewController(vc, animated: true)
          
        case .internalBodyParts:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "InternalBodyPartsMenuVC"
            ) as! InternalBodyPartsMenuVC
            navigationController?.pushViewController(vc, animated: true)
    
        case .shapes:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ShapesMenuVC"
            ) as! ShapesMenuVC
            navigationController?.pushViewController(vc, animated: true)
          
        case .romanNumerals:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "RomanNumeralsMenuVC"
            ) as! RomanNumeralsMenuVC
            navigationController?.pushViewController(vc, animated: true)
          
        case .seasons:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "SeasonsMenuVC"
            ) as! SeasonsMenuVC
            navigationController?.pushViewController(vc, animated: true)
          
        case .idioms:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "LearnIdiomsVC"
            ) as! LearnIdiomsVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .vitamin:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "LearnVitaminsVC"
            ) as! LearnVitaminsVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .bloodGroup:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "LearnBloodGroupsMenuVC"
            ) as! LearnBloodGroupsMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .externalBodyParts:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "ExternalBodyPartsMenuVC"
            ) as! ExternalBodyPartsMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .directions:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "DirectionsVC"
            ) as! DirectionsVC
            navigationController?.pushViewController(vc, animated: true)
           
        case .maths:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "MathsMenuVC"
            ) as! MathsMenuVC
            vc.selectedItem = Variable.Shared.Maths.first
            navigationController?.pushViewController(vc, animated: true)
            
        case .animalEatingStyle:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "AnimalEatingStyleMenuVC"
            ) as! AnimalEatingStyleMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .animalFamilies:
            let storyboard = UIStoryboard(name: "KoshalSB", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "AnimalFamiliesMenuVC"
            ) as! AnimalFamiliesMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        case .funcorner:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(
                withIdentifier: "FunColorMenuVC"
            ) as! FunColorMenuVC
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            let vc = storyboard?.instantiateViewController(
                withIdentifier: "SubScreen"
            ) as! SubScreen
            vc.category = selected.category
            vc.Htitle = selected.title
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeScreen: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let columns: CGFloat = 2
        let spacing: CGFloat = 16
        let totalHorizontalSpacing = (columns + 1) * spacing

        let availableWidth = collectionView.frame.width - totalHorizontalSpacing
        let width = availableWidth / columns

        // ✅ Taller cards like second image
        return CGSize(width: width, height: width * 0.95)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
