//
//  DraggableImageView.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 22/01/26.
//
import UIKit

//final class DraggableImageView: UIImageView {
//
//    var shapeType: ShapeType!
//    var originalPosition: CGPoint = .zero
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//
//    private func setup() {
//        isUserInteractionEnabled = true
//        contentMode = .scaleAspectFit
//        addGestureRecognizer(UIPanGestureRecognizer(
//            target: self,
//            action: #selector(handlePan)
//        ))
//    }
//
//    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
//        guard let view = gesture.view else { return }
//
//        switch gesture.state {
//        case .began:
//            originalPosition = view.center
//        case .changed:
//            let translation = gesture.translation(in: superview)
//            view.center = CGPoint(
//                x: originalPosition.x + translation.x,
//                y: originalPosition.y + translation.y
//            )
//        default:
//            break
//        }
//    }
//}
final class DraggableImageView: UIImageView {

    var shapeType: ShapeType!
    var originalPosition: CGPoint = .zero
    weak var delegate: DraggableImageViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        isUserInteractionEnabled = true
        contentMode = .scaleAspectFit
        addGestureRecognizer(UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePan)
        ))
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view else { return }

        switch gesture.state {
        case .began:
            originalPosition = view.center

        case .changed:
            let translation = gesture.translation(in: superview)
            view.center = CGPoint(
                x: originalPosition.x + translation.x,
                y: originalPosition.y + translation.y
            )

        case .ended:
            delegate?.didDrop(self)

        default:
            break
        }
    }
}

protocol DraggableImageViewDelegate: AnyObject {
    func didDrop(_ dragView: DraggableImageView)
}
