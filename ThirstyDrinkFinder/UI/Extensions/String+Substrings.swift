//
//  String+Substrings.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/20/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import Foundation

extension String {
    
    var getNumber: Double {
        let regex = try! NSRegularExpression(pattern: "([0-9]*\\s)?(\\d*\\/\\d*)?")
        let range = NSRange(location: 0, length: self.count)
        let match = regex.firstMatch(in: self, options: [], range: range)
        if let matchRange = match?.range {
            if let subStringRange = Range(matchRange, in: self) {
                
                let subString = String(self[subStringRange])
                let components = subString.split(separator: " ")
                
                var number: Double = 0
                
                if (components.count > 1 && self.contains("/")) ||
                   (components.count == 1 && !self.contains("/")) {
                    if let wholeNumberString = components.first {
                        number = Double(wholeNumberString) ?? 0
                    }
                }
                
                guard self.contains("/") else {
                    return number
                }
                
                if let fractionString = components.last {
                    let fractionComponents = fractionString.split(separator: "/")
                    if let numeratorString = fractionComponents.first,
                        let denominatorString = fractionComponents.last {
                        
                        if let numerator = Double(numeratorString),
                            let denominator = Double(denominatorString) {
                            number += numerator / denominator
                        }
                    }
                }
                return number
            }
        }
        
        return 0
    }
    
    var getUnit: TDFMeasurementUnit? {
        let stringArray = self.components(separatedBy: " ")
        for component in stringArray {
            if let unit = TDFMeasurementUnit(value: component) {
                return unit
            }
        }
        return nil
    }
}
