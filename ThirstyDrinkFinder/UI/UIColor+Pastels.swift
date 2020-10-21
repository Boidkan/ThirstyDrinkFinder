//
//  UIColor+Pastels.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/20/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func getRandomColors(amount: Int) -> [UIColor] {
        
        guard amount > 0 else { return [] }
        
        var colors: [UIColor] = []
        
        for _ in 0...amount {
            colors.append(randomPastelColor)
        }
        
        return colors
    }
    
    static var randomPastelColor: UIColor {
        let hue = CGFloat.random(in: 50...255) / 255
        let brightness = CGFloat.random(in: 128...255) / 255
        let saturation = CGFloat.random(in: 64...242) / 255
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
