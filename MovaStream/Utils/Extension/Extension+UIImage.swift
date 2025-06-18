//
//  Extension+UIImage.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIImage {
    
    func resized(to targetSize: CGSize) -> UIImage? {
        if(self.size.width < targetSize.width || self.size.height < targetSize.height) {
            return self
        }
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: targetSize))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    func tintColor(_ color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()
        context!.scaleBy(x: 1.0, y: -1.0)
        context!.translateBy(x: 0.0, y: -self.size.height)
        
        context!.setBlendMode(CGBlendMode.multiply)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context!.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context!.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
