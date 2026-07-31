//
//  GIFExtension.swift
//  Kids
//
//  Created by Koshal Singh on 23/02/26.
//

import UIKit
import ImageIO

extension UIImageView {
    
    func loadGif(name: String) {
        DispatchQueue.global().async {
            
            guard let bundleURL = Bundle.main
                .url(forResource: name, withExtension: "gif") else {
                return
            }
            
            guard let imageData = try? Data(contentsOf: bundleURL) else {
                return
            }
            
            let source = CGImageSourceCreateWithData(imageData as CFData, nil)
            var images = [UIImage]()
            
            let count = CGImageSourceGetCount(source!)
            
            for i in 0..<count {
                if let cgImage = CGImageSourceCreateImageAtIndex(source!, i, nil) {
                    let image = UIImage(cgImage: cgImage)
                    images.append(image)
                }
            }
            
            DispatchQueue.main.async {
                self.animationImages = images
                self.animationDuration = Double(count) * 0.08
                self.startAnimating()
            }
        }
    }
}
