//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Emmanuel Okwara on 30/01/2021.
//

import UIKit

class OnboardingViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            
            // ✅ Back button logic
            backBtn.isHidden = currentPage == 0
            
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Continue", for: .normal)
            } else {
                nextBtn.setTitle("Continue", for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        backBtn.isHidden = true
        slides = [
            OnboardingSlide(title: "Fun Learning for Little Kids (0-6 Years)", description: "Learn ABCD, numbers, colors, animals, fruits, vegetables, and vehicles through fun games, pictures, and sounds.Designed to help young kids learn easily while playing.", image: #imageLiteral(resourceName: "lion_with_white_bg")),
            OnboardingSlide(title: "Smart Learning for Growing Kids (7-9 Years", description: "Practice math, science, grammar, vocabulary, cursive writing, clocks, and word games. Explore animals, countries, continents, oceans, and the solar system with interactive lessons.", image: #imageLiteral(resourceName: "Science")),
            OnboardingSlide(title: "Smart Learning for Growing Kids (7-9 Years", description: "Practice math, science, grammar, vocabulary, cursive writing, clocks, and word games. Explore animals, countries, continents, oceans, and the solar system with interactive lessons.", image: #imageLiteral(resourceName: "continents_map"))
        ]
        
        pageControl.numberOfPages = slides.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setup(){
        let color = ColorManager.randomColor()
        HeaderView.backgroundColor = color
        nextBtn.backgroundColor = color
        skipBtn.backgroundColor = color
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = .black
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        
        if currentPage > 0 {
            currentPage -= 1
            
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            
            UserDefaults.standard.set(true, forKey: "hasOnboarded")
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            
            vc.isFromOnboarding = true // ✅ IMPORTANT
            
            navigationController?.pushViewController(vc, animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
    
    @IBAction func skipTapBtn(_ sender: UIButton) {
        
        // ✅ onboarding complete mark karo
        UserDefaults.standard.set(true, forKey: "hasOnboarded")
        
        // ✅ ProfileVC open karo
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        
        vc.isFromOnboarding = true // back button hide ke liye
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
