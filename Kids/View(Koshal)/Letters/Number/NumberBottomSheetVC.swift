//
//  NumberBottomSheetVC.swift
//  KSchool
//
//  Created by Koshal Singh on 22/05/26.
//

import UIKit

class NumberBottomSheetVC: LetterBottomSheetVC {

    var onNumberSelected:((Int)->Void)?
    var numbers:[Int] = []

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        return numbers.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell =
        collectionView.dequeueReusableCell(
            withReuseIdentifier:"cell",
            for:indexPath
        ) as! LetterCell

        cell.label.text =
        "\(numbers[indexPath.row])"

        cell.container.backgroundColor =
        selectedIndex == indexPath.row
        ? selectedColor
        : .white

        return cell
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {

        dismiss(animated:true)

        onNumberSelected?(indexPath.row)
    }
}
