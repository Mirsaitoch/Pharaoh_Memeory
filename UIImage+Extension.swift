//
//  UIImage+Extension.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 3/3/23.
//

import Foundation
import UIKit


extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        var image = renderer.image { (context) in
            draw(in: CGRect(origin: .zero, size: size))
        }
        image = image.withRenderingMode(.alwaysOriginal)
        return image
    }
}
