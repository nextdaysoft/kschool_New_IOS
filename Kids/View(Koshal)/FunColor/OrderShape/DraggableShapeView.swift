//
//  DraggableShapeView.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 22/01/26.
//

import UIKit

final class DraggableShapeView: UIView {

    let sizeIndex: Int
    let shape: ShapeORType
    var originalCenter: CGPoint = .zero

    weak var delegate: DraggableShapeDelegate?

    init(frame: CGRect, shape: ShapeORType, sizeIndex: Int, color: UIColor) {
        self.shape = shape
        self.sizeIndex = sizeIndex
        super.init(frame: frame)

        backgroundColor = .clear
        layer.borderWidth = 6
        layer.borderColor = color.cgColor

        setupShape()

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(pan)
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setupShape() {
        switch shape {
        case .circle:
            layer.cornerRadius = bounds.width / 2

        case .square:
            layer.cornerRadius = 0

        case .triangle:
            layer.borderWidth = 0
            drawTriangle()
        }
    }

    private func drawTriangle() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds

        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: 0))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.close()

        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = layer.borderColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 6

        layer.addSublayer(shapeLayer)
    }


    @objc private func handlePan(_ g: UIPanGestureRecognizer) {
        let translation = g.translation(in: superview)

        switch g.state {
        case .began:
            originalCenter = center

        case .changed:
            center = CGPoint(
                x: originalCenter.x + translation.x,
                y: originalCenter.y + translation.y
            )

        case .ended, .cancelled:
            delegate?.didEndDragging(self)

        default:
            break
        }
    }

}

protocol DraggableShapeDelegate: AnyObject {
    func didEndDragging(_ shape: DraggableShapeView)
}
