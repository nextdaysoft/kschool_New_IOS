//
//  MazeVC.swift
//  New
//
//  Created by Koshal Singh on 03/06/26.
//

import UIKit
import LanguageManager_iOS

class MazeVC: BaseViewController {

    @IBOutlet weak var mazeBGView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var levelsLbl: UILabel!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var mazeView: MazeView!

    var currentLevel: MazeLevel!
    
    let goodJobView = UIView()
    let goodJobLabel = UILabel()
    
    let nextButton = UIButton(type: .system)
    
    private let upButton = UIButton(type: .system)
    private let leftButton = UIButton(type: .system)
    private let downButton = UIButton(type: .system)
    private let rightButton = UIButton(type: .system)
    
    var currentLevelNo = 1
    
    private var currentThemeColor = ColorManager.randomColor()
    private var currentMazeColor = ColorManager.randomColor()
    
    private var moveTimer: Timer?
    private var moveRow = 0
    private var moveCol = 0
    
    var totalLevels = 10
    var menuLevel = 1
    
    let goodJobBGView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyTheme()
        
        currentLevelNo = menuLevel
        levelsLbl.text = "# \("Level".localiz()) \(currentLevelNo)"
        loadLevel(level: currentLevelNo)

        setupControls()

        goodJobView.layer.cornerRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if mazeView == nil {

            mazeView = MazeView(frame: mazeBGView.bounds)

            mazeView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]

            mazeView.mazeColor = currentMazeColor
            mazeView.level = currentLevel
            mazeView.backgroundColor = currentMazeColor
            
            mazeView.onLevelComplete = { [weak self] in

                guard let self = self else { return }

                UserDefaults.standard.set(
                    true,
                    forKey: "mazeLevel\(self.menuLevel)Completed"
                )

                DispatchQueue.main.async {

                    self.goodJobBGView.isHidden = false
                    self.nextButton.isHidden = false
                }
            }

            mazeBGView.addSubview(mazeView)

            setupWinViews()

        } else {

            mazeView.frame = mazeBGView.bounds
            mazeView.mazeColor = currentMazeColor
        }
    }
    

    func setup() {

        currentThemeColor = ColorManager.randomColor()

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
    }
    
    func setupWinViews() {

        goodJobBGView.translatesAutoresizingMaskIntoConstraints = false
        goodJobLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        goodJobBGView.backgroundColor = currentThemeColor
        goodJobBGView.layer.cornerRadius = 8

        goodJobLabel.text = "Good Job!".localiz()
        goodJobLabel.textColor = .white
        goodJobLabel.textAlignment = .center
        goodJobLabel.font = .systemFont(ofSize: 20, weight: .medium)

        goodJobBGView.addSubview(goodJobLabel)

        NSLayoutConstraint.activate([
            goodJobLabel.leadingAnchor.constraint(equalTo: goodJobBGView.leadingAnchor, constant: 8),
            goodJobLabel.trailingAnchor.constraint(equalTo: goodJobBGView.trailingAnchor, constant: -8),
            goodJobLabel.topAnchor.constraint(equalTo: goodJobBGView.topAnchor),
            goodJobLabel.bottomAnchor.constraint(equalTo: goodJobBGView.bottomAnchor)
        ])

        nextButton.setTitle("Next".localiz(), for: .normal)
        nextButton.tintColor = .black
        nextButton.layer.cornerRadius = 6
        nextButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)

        goodJobBGView.isHidden = true
        nextButton.isHidden = true

        nextButton.addTarget(
            self,
            action: #selector(nextLevelTap),
            for: .touchUpInside
        )

        view.addSubview(goodJobBGView)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([

            goodJobBGView.topAnchor.constraint(
                equalTo: mazeBGView.bottomAnchor,
                constant: 15
            ),
            goodJobBGView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 10
            ),
            goodJobBGView.widthAnchor.constraint(
                equalToConstant: 110
            ),
            goodJobBGView.heightAnchor.constraint(
                equalToConstant: 50
            ),

            nextButton.centerYAnchor.constraint(
                equalTo: goodJobBGView.centerYAnchor
            ),
            nextButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10
            ),
            nextButton.widthAnchor.constraint(
                equalToConstant: 65
            ),
            nextButton.heightAnchor.constraint(
                equalToConstant: 40
            )
        ])
    }

    func applyTheme() {

        if UserDefaults.standard.bool(forKey: "WhiteTheme") {

            HeaderView.backgroundColor = .white
            statusView.backgroundColor = .white

            nextButton.backgroundColor = .white

            upButton.backgroundColor = .white
            leftButton.backgroundColor = .white
            downButton.backgroundColor = .white
            rightButton.backgroundColor = .white

        } else {

            HeaderView.backgroundColor = currentThemeColor
            statusView.backgroundColor = currentThemeColor
            nextButton.backgroundColor = currentThemeColor
            
            goodJobBGView.backgroundColor = currentThemeColor
            
            upButton.backgroundColor = currentThemeColor
            leftButton.backgroundColor = currentThemeColor
            downButton.backgroundColor = currentThemeColor
            rightButton.backgroundColor = currentThemeColor
        }
    }
    
    func loadLevel(level: Int) {

        currentThemeColor = ColorManager.randomColor()
        currentMazeColor = ColorManager.randomColor()

        while currentMazeColor == currentThemeColor {
            currentMazeColor = ColorManager.randomColor()
        }

        currentThemeColor = ColorManager.randomColor()

        applyTheme()
        
        applyTheme()

        // Good Job background and Next button same color
        goodJobBGView.backgroundColor = currentThemeColor
        nextButton.backgroundColor = currentThemeColor
        
        let mazeData = MazeGenerator.generate(level: level)

        var startImageName = "monkey"
        var endImageName = "banana"

        switch level {

        case 1:
            startImageName = "monkey"
            endImageName = "banana"

        case 2:
            startImageName = "cat"
            endImageName = "milk"

        case 3:
            startImageName = "dog"
            endImageName = "bone"

        case 4:
            startImageName = "rabbit"
            endImageName = "carrot"

        case 5:
            startImageName = "bird"
            endImageName = "nest"

        case 6:
            startImageName = "babyElephant"
            endImageName = "elephant"

        case 7:
            startImageName = "monkey"
            endImageName = "banana"

        case 8:
            startImageName = "monkey"
            endImageName = "banana"

        case 9:
            startImageName = "monkey"
            endImageName = "banana"

        case 10:
            startImageName = "monkey"
            endImageName = "banana"

        default:
            startImageName = "monkey"
            endImageName = "banana"
        }

        currentLevel = MazeLevel(

            maze: mazeData,

            startRow: 0,
            startCol: 1,

            endRow: mazeData.count - 1,
            endCol: mazeData[0].count - 2,

            startImage: UIImage(named: startImageName),
            endImage: UIImage(named: endImageName),

            levelNo: level
        )

      //  levelsLbl.text = "Level \(level)"

        mazeView?.mazeColor = currentMazeColor
        mazeView?.backgroundColor = currentMazeColor
        mazeView?.level = currentLevel
        mazeView?.setNeedsDisplay()
        mazeView?.layoutIfNeeded()
    }
    
    func setupControls() {

        func styleButton(_ button: UIButton, image: String) {

            button.translatesAutoresizingMaskIntoConstraints = false

            button.backgroundColor = UIColor(
                red: 61/255,
                green: 227/255,
                blue: 212/255,
                alpha: 1
            )

            button.layer.cornerRadius = 32.5

            button.setImage(
                UIImage(systemName: image),
                for: .normal
            )

            button.tintColor = .black

            button.imageView?.contentMode = .scaleAspectFit

            view.addSubview(button)
        }

        styleButton(upButton, image: "arrow.up")
        styleButton(leftButton, image: "arrow.left")
        styleButton(downButton, image: "arrow.down")
        styleButton(rightButton, image: "arrow.right")

        NSLayoutConstraint.activate([

            // UP
            upButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upButton.topAnchor.constraint(equalTo: mazeBGView.bottomAnchor, constant: 25),
            upButton.widthAnchor.constraint(equalToConstant: 65),
            upButton.heightAnchor.constraint(equalToConstant: 65),

            // DOWN
            downButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downButton.topAnchor.constraint(equalTo: upButton.bottomAnchor, constant: 10),
            downButton.widthAnchor.constraint(equalToConstant: 65),
            downButton.heightAnchor.constraint(equalToConstant: 65),

            // LEFT
            leftButton.trailingAnchor.constraint(equalTo: downButton.leadingAnchor, constant: -10),
            leftButton.centerYAnchor.constraint(equalTo: downButton.centerYAnchor),
            leftButton.widthAnchor.constraint(equalToConstant: 65),
            leftButton.heightAnchor.constraint(equalToConstant: 65),

            // RIGHT
            rightButton.leadingAnchor.constraint(equalTo: downButton.trailingAnchor, constant: 10),
            rightButton.centerYAnchor.constraint(equalTo: downButton.centerYAnchor),
            rightButton.widthAnchor.constraint(equalToConstant: 65),
            rightButton.heightAnchor.constraint(equalToConstant: 65)
        ])

        upButton.addTarget(self, action: #selector(startUpMove), for: .touchDown)
        downButton.addTarget(self, action: #selector(startDownMove), for: .touchDown)
        leftButton.addTarget(self, action: #selector(startLeftMove), for: .touchDown)
        rightButton.addTarget(self, action: #selector(startRightMove), for: .touchDown)

        upButton.addTarget(self, action: #selector(stopMove), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        downButton.addTarget(self, action: #selector(stopMove), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        leftButton.addTarget(self, action: #selector(stopMove), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        rightButton.addTarget(self, action: #selector(stopMove), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    }
    
    @objc func startUpMove() {
        startMoving(row: -1, col: 0)
    }

    @objc func startDownMove() {
        startMoving(row: 1, col: 0)
    }

    @objc func startLeftMove() {
        startMoving(row: 0, col: -1)
    }

    @objc func startRightMove() {
        startMoving(row: 0, col: 1)
    }

    func startMoving(row: Int, col: Int) {

        moveTimer?.invalidate()

        moveRow = row
        moveCol = col

        mazeView.move(row: row, col: col)

        moveTimer = Timer.scheduledTimer(
            withTimeInterval: 0.12,
            repeats: true
        ) { [weak self] _ in

            guard let self = self else { return }

            self.mazeView.move(
                row: self.moveRow,
                col: self.moveCol
            )
        }
    }

    @objc func stopMove() {

        moveTimer?.invalidate()
        moveTimer = nil
    }
    
    @objc func nextLevelTap() {

        currentLevelNo += 1

        if currentLevelNo > totalLevels {
            navigationController?.popViewController(animated: true)
            return
        }

        goodJobBGView.isHidden = true
        nextButton.isHidden = true

        loadLevel(level: currentLevelNo)
    }
    
    @IBAction func backTapBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
