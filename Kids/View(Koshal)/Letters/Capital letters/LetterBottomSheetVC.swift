//
//  LetterBottomSheetVC.swift
//  KSchool
//
//  Created by Koshal Singh on 15/05/26.
//

import UIKit

class LetterBottomSheetVC: BaseViewController,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    var onLetterSelected: ((Int) -> Void)?

    var letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var selectedIndex = 0

    private var collectionView: UICollectionView!
    private let sheetView = UIView()

    private var sheetBottomConstraint: NSLayoutConstraint!
    private var sheetHeightConstraint: NSLayoutConstraint!

    private var currentSheetHeight: CGFloat = 500

    private let minHeight: CGFloat = 500

    private let maxHeight: CGFloat =
    UIScreen.main.bounds.height - 100

    let selectedColor =
    ColorManager.randomColor()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor =
        UIColor.black.withAlphaComponent(0.3)

        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(backgroundTapped)
        )

        tap.delegate = self
        tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)

        setupSheet()
        addPanGesture()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        showSheet()
    }

    func setupSheet() {

        sheetView.backgroundColor = .white
        sheetView.layer.cornerRadius = 30
        sheetView.clipsToBounds = true
        sheetView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(sheetView)

        sheetBottomConstraint =
        sheetView.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: 650
        )

        sheetHeightConstraint =
        sheetView.heightAnchor.constraint(
            equalToConstant: minHeight
        )

        NSLayoutConstraint.activate([

            sheetView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),

            sheetView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),

            sheetBottomConstraint,

            sheetHeightConstraint
        ])


        let line = UIView()

        line.backgroundColor = .systemGray4
        line.layer.cornerRadius = 3.5
        line.translatesAutoresizingMaskIntoConstraints = false

        sheetView.addSubview(line)

        NSLayoutConstraint.activate([

            line.topAnchor.constraint(
                equalTo: sheetView.topAnchor,
                constant: 12
            ),

            line.centerXAnchor.constraint(
                equalTo: sheetView.centerXAnchor
            ),

            line.widthAnchor.constraint(
                equalToConstant: 50
            ),

            line.heightAnchor.constraint(
                equalToConstant: 7
            )
        ])


        let title = UILabel()

        title.text = "Select Letter"

        title.font =
        .boldSystemFont(ofSize: 12)

        title.translatesAutoresizingMaskIntoConstraints =
        false

        sheetView.addSubview(title)

        NSLayoutConstraint.activate([

            title.topAnchor.constraint(
                equalTo: line.bottomAnchor,
                constant: 25
            ),

            title.centerXAnchor.constraint(
                equalTo: sheetView.centerXAnchor
            )
        ])


        let layout =
        UICollectionViewFlowLayout()

        collectionView =
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )

        collectionView.backgroundColor = .white

        // scroll wali side line hide
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            LetterCell.self,
            forCellWithReuseIdentifier: "cell"
        )

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        sheetView.addSubview(collectionView)

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(
                equalTo: title.bottomAnchor,
                constant: 20
            ),

            collectionView.leadingAnchor.constraint(
                equalTo: sheetView.leadingAnchor,
                constant: 18
            ),

            collectionView.trailingAnchor.constraint(
                equalTo: sheetView.trailingAnchor,
                constant: -18
            ),

            collectionView.bottomAnchor.constraint(
                equalTo: sheetView.bottomAnchor
            )
        ])
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        letters.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell =
        collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as! LetterCell

        cell.label.text =
        String(letters[indexPath.row])

        cell.container.backgroundColor =
        selectedIndex == indexPath.row
        ? selectedColor
        : .white

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {

        dismiss(animated: true)

        onLetterSelected?(indexPath.row)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let padding: CGFloat = 18 * 2      // left + right
        let spacing: CGFloat = 5 * 2      // 3 items => 2 spaces

        let width =
        (collectionView.frame.width -
         padding -
         spacing) / 3

        return CGSize(
            width: width,
            height: 78
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout:
        UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {

        15
    }
    
    func showSheet() {

        sheetBottomConstraint.constant = 0

        UIView.animate(
            withDuration: 0.35
        ) {

            self.view.layoutIfNeeded()
        }
    }

    @objc func dismissSheet() {

        sheetBottomConstraint.constant = 650

        UIView.animate(
            withDuration: 0.3
        ) {

            self.view.layoutIfNeeded()

            self.view.backgroundColor =
            .clear

        } completion: { _ in

            self.dismiss(
                animated: false
            )
        }
    }

    @objc func backgroundTapped() {

        dismissSheet()
    }

    func addPanGesture() {

        let pan = UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePan)
        )

        pan.delaysTouchesBegan = false
        pan.cancelsTouchesInView = false

        sheetView.addGestureRecognizer(pan)
    }

    @objc func handlePan(
        gesture: UIPanGestureRecognizer
    ) {

        let translation =
        gesture.translation(in: view)

        switch gesture.state {

        case .changed:

            // finger ke according live move
            var newHeight =
            currentSheetHeight - translation.y

            // minimum aur maximum limit
            newHeight = max(220,
                            min(newHeight,
                                maxHeight))

            sheetHeightConstraint.constant =
            newHeight

            view.layoutIfNeeded()

        case .ended:

            let velocity =
            gesture.velocity(in: view)

            // fast niche swipe -> dismiss
            if velocity.y > 1200 {

                dismissSheet()
                return
            }

            let middleHeight =
            (maxHeight + minHeight) / 2

            // snap logic
            if sheetHeightConstraint.constant >
                middleHeight {

                currentSheetHeight =
                maxHeight

            } else {

                currentSheetHeight =
                minHeight   // = 500
            }

            UIView.animate(
                withDuration: 0.35,
                delay: 0,
                usingSpringWithDamping: 0.85,
                initialSpringVelocity: 0.7
            ) {

                self.sheetHeightConstraint.constant =
                self.currentSheetHeight

                self.view.layoutIfNeeded()
            }

        default:
            break
        }
    }
}


extension LetterBottomSheetVC:
UIGestureRecognizerDelegate {

    func gestureRecognizer(
        _ gestureRecognizer:
        UIGestureRecognizer,
        shouldReceive touch:
        UITouch
    ) -> Bool {

        let location =
        touch.location(in: view)

        if sheetView.frame.contains(
            location
        ) {

            return false
        }

        return true
    }
}
