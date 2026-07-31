//
//  ClockView.swift
//  Kids
//
//  Created by Koshal Singh on 06/02/26.
//

import Foundation
import UIKit

class ClockView: UIView {

    private let minuteHand = UIView()
    private let hourHand = UIView()

    private var currentMinute: Int = 0
    private var currentHour: Int = 0

    private var lastMinute: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupClock()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupClock()
    }

    // MARK: - Update Hands
    private func updateHands() {

        let minuteAngle = CGFloat(currentMinute) * 6
        let hourAngle = CGFloat(currentHour % 12) * 30 +
                        CGFloat(currentMinute) * 0.5

        UIView.animate(withDuration: 0.08) {

            self.minuteHand.transform =
                CGAffineTransform(
                    rotationAngle: minuteAngle * .pi / 180
                )

            self.hourHand.transform =
                CGAffineTransform(
                    rotationAngle: hourAngle * .pi / 180
                )
        }
    }

    // MARK: - Gestures
    @objc private func handleMinutePan(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: self)
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        let angle = atan2(location.y - center.y, location.x - center.x)
        var degrees = angle * 180 / .pi + 90
        if degrees < 0 { degrees += 360 }

        let newMinute = Int(degrees / 6)

        // Detect crossing 12
        if lastMinute >= 50 && newMinute <= 10 {
            currentHour = (currentHour + 1) % 12
        } else if lastMinute <= 10 && newMinute >= 50 {
            currentHour = (currentHour - 1 + 12) % 12
        }

        currentMinute = newMinute
        lastMinute = newMinute

        updateHands()
    }

    @objc private func handleHourPan(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: self)
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        let angle = atan2(location.y - center.y, location.x - center.x)
        var degrees = angle * 180 / .pi + 90
        if degrees < 0 { degrees += 360 }

        // Calculate hour
        let rawHour = degrees / 30
        currentHour = Int(rawHour)

        // Calculate minute from remaining angle
        let minutePart = degrees.truncatingRemainder(dividingBy: 30)
        currentMinute = Int(minutePart * 2)

        lastMinute = currentMinute

        updateHands()
    }

    // MARK: - Setup
    func setupClock() {
        backgroundColor = .clear

        // Minute hand (Blue - badi sui)
        minuteHand.backgroundColor = .clear
        minuteHand.isUserInteractionEnabled = true
        addSubview(minuteHand)

        // ✅ Minute hand pan gesture added
        let minutePan = UIPanGestureRecognizer(
            target: self,
            action: #selector(handleMinutePan(_:))
        )
        minuteHand.addGestureRecognizer(minutePan)

        let minuteLine = UIView()
        minuteLine.backgroundColor = .blue
        minuteLine.tag = 1002
        minuteHand.addSubview(minuteLine)

        // Hour hand (Black - chhoti sui)
        hourHand.backgroundColor = .clear
        hourHand.isUserInteractionEnabled = true
        addSubview(hourHand)

        let hourPan = UIPanGestureRecognizer(
            target: self,
            action: #selector(handleHourPan(_:))
        )
        hourHand.addGestureRecognizer(hourPan)

        let hourLine = UIView()
        hourLine.backgroundColor = .black
        hourLine.tag = 1003
        hourHand.addSubview(hourLine)

        // Center dot
        let centerDot = UIView()
        centerDot.backgroundColor = .black
        centerDot.tag = 2000
        addSubview(centerDot)
    }

    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        // Minute hand (blue - long & thin)
        minuteHand.bounds = CGRect(
            x: 0,
            y: 0,
            width: 40,
            height: bounds.height * 0.40
        )
        minuteHand.center = center
        minuteHand.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)

        if let minuteLine = minuteHand.viewWithTag(1002) {
            minuteLine.frame = CGRect(
                x: minuteHand.bounds.width/2 - 1.5,
                y: 0,
                width: 3,
                height: minuteHand.bounds.height
            )
            minuteLine.layer.cornerRadius = 2
        }

        // Hour hand (black - shorter & thicker)
        hourHand.bounds = CGRect(
            x: 0,
            y: 0,
            width: 40,   // invisible touch area
            height: bounds.height * 0.28
        )
        hourHand.center = center
        hourHand.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)

        if let hourLine = hourHand.viewWithTag(1003) {
            hourLine.frame = CGRect(
                x: hourHand.bounds.width/2 - 2.5,
                y: 0,
                width: 5,
                height: hourHand.bounds.height
            )
            hourLine.layer.cornerRadius = 3
        }

        // Center dot
        if let centerDot = viewWithTag(2000) {
            centerDot.bounds = CGRect(x: 0, y: 0, width: 8, height: 8)
            centerDot.center = center
            centerDot.layer.cornerRadius = 4
        }

        updateHands()
        setNeedsDisplay()
    }

    // MARK: - Draw Clock
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2 - 10

        ctx.setStrokeColor(UIColor.lightGray.cgColor)
        ctx.setLineWidth(3)
        ctx.addEllipse(in: CGRect(x: center.x - radius,
                                  y: center.y - radius,
                                  width: radius * 2,
                                  height: radius * 2))
        ctx.strokePath()

        for i in 1...12 {
            let angle = CGFloat(i) * (.pi * 2) / 12 - .pi/2
            let numberRadius = radius - 20

            let x = center.x + numberRadius * cos(angle)
            let y = center.y + numberRadius * sin(angle)

            let text = "\(i)" as NSString
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 16, weight: .medium),
                .foregroundColor: UIColor.darkGray
            ]

            let size = text.size(withAttributes: attributes)
            text.draw(at: CGPoint(x: x - size.width/2,
                                  y: y - size.height/2),
                      withAttributes: attributes)
        }
    }
    
    func getCurrentTime() -> (hour: Int, minute: Int) {
        let hour = currentHour == 0 ? 12 : currentHour
        return (hour, currentMinute)
    }
    
    // Enable or disable hand movement
    func setInteractionEnabled(_ enabled: Bool) {
        minuteHand.isUserInteractionEnabled = enabled
        hourHand.isUserInteractionEnabled = enabled
    }

    // Set random time
    func setRandomTime() {
        currentHour = Int.random(in: 1...12)
        currentMinute = Int.random(in: 0...59)
        lastMinute = currentMinute
        updateHands()
    }
}
