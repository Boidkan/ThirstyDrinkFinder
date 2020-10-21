//
//  TDFMeasurement.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/20/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

struct TDFMeasurement {
    var value: Double
    var unit: TDFMeasurementUnit?
}

extension TDFMeasurement {
    func convert(to unit: TDFMeasurementUnit) -> TDFMeasurement? {
        
        if self.unit == unit { return self }
        
        if self.unit == .ounce && unit == .shot ||
            self.unit == .shot && unit == .ounce {
            return TDFMeasurement(value: self.value, unit: unit)
        }
        
        if self.unit == .centiliter && (unit == .shot || unit == .ounce) {
            let newValue = self.value / 2.957352968750042
            return TDFMeasurement(value: newValue, unit: unit)
        }
        
        if (self.unit == .shot || self.unit == .ounce) && unit == .centiliter {
            let newValue = self.value * 2.957352968750042
            return TDFMeasurement(value: newValue, unit: unit)
        }
        
        return nil
    }
}
