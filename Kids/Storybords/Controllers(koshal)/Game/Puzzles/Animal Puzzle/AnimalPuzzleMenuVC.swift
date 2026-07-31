//
//  AnimalPuzzleMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 16/03/26.
//
enum PuzzleType {
    case animal
    case continent
    case countrys
    
}

import UIKit

class AnimalPuzzleMenuVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!

    
    @IBOutlet weak var titelLabel: UILabel!
    
    var puzzleType: PuzzleType = .animal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupTitle()
        
       tableView.delegate = self
       tableView.dataSource = self
        
        
       tableView.separatorStyle = .none
       tableView.separatorInset = .zero
       tableView.layoutMargins = .zero
       tableView.showsVerticalScrollIndicator = false
           
       tableView.allowsSelection = true
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
        
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
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
    
    func setupTitle() {
        switch puzzleType {
        case .animal:
            titelLabel.text = "Animal Puzzle"
            
        case .continent:
            titelLabel.text = "Continent Puzzle"
            
        case .countrys:
            titelLabel.text = "Country Puzzle"
        }
    }
    
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch puzzleType {
        case .animal:
            return animalTitles.count
        case .continent:
            return continentTitles.count
        case .countrys:
            return countryNames.count
        }
    }

    // Cell Design
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalPuzzleMenuCell", for: indexPath) as! AnimalPuzzleMenuCell

        switch puzzleType {

        case .animal:
            cell.titelLabel.text = animalTitles[indexPath.row]
            cell.titelImg.image = UIImage(named: animalImages[indexPath.row])

        case .continent:
            cell.titelLabel.text = continentTitles[indexPath.row]
            cell.titelImg.image = UIImage(named: continentImages[indexPath.row])
            
        case .countrys:
            cell.titelLabel.text = countryNames[indexPath.row]
            cell.titelImg.image = UIImage(named: countryFlagImages[indexPath.row])
        }

        cell.cellBGView.backgroundColor = ColorManager.randomColor()
        cell.cellBGView.layer.cornerRadius = 10

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(withIdentifier: "PuzzleVC") as? PuzzleVC {

            switch puzzleType {

            case .animal:
                vc.selectedDisplayImage = animalImages[indexPath.row]
                vc.selectedPuzzleImage = animalPuzzleImages[indexPath.row]

            case .continent:
                vc.selectedDisplayImage = continentImages[indexPath.row]
                vc.selectedPuzzleImage = continentImages[indexPath.row]
            case .countrys:
                vc.selectedDisplayImage = countrysMap[indexPath.row]
                vc.selectedPuzzleImage = countrysMap[indexPath.row]
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func restTapBtn(_ sender: UIButton) {
    }
    
}
extension PuzzleType {
    var title: String {
        switch self {
        case .animal: return "Animal Puzzle"
        case .continent: return "Continent Puzzle"
        case .countrys: return "Country Puzzle"
        }
    }
}
