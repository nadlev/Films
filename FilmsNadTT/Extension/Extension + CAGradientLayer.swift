//
//  Extension + CAGradientLayer.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/3/23.
//

import UIKit

extension CAGradientLayer {
    static func posterShadow() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        return gradient
    }
}
