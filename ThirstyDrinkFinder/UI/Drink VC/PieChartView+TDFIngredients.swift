//
//  PieChartView+TDFIngredients.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/20/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import Foundation
import Charts

extension PieChartView {
    
    
    func load(ingredients: [TDFIngredientViewModel]) {
        self.holeRadiusPercent = 0
        self.drawHoleEnabled = false
        self.data = nil
        self.legend.enabled = false
        self.minOffset = 0
        self.highlightPerTapEnabled = false
        
        var entries: [PieChartDataEntry] = []
        
        guard let firstUnit = ingredients.first(where: { $0.measurement?.unit != nil })?.measurement?.unit else {
            return
        }
        
        for ingredient in ingredients {
            guard var value = ingredient.measurement?.value,
                var unit = ingredient.measurement?.unit else {
                    continue
            }
            
            if unit != firstUnit {
                guard let convertedMeasurement = ingredient.measurement?.convert(to: unit),
                    let newUnit = convertedMeasurement.unit else {
                    continue
                }
                
                value = convertedMeasurement.value
                unit = newUnit
            }
            
            entries.append(PieChartDataEntry(value: Double(value)))
        }
        
        let set = PieChartDataSet(entries: entries, label: nil)
        set.sliceSpace = 0
        set.drawValuesEnabled = false
        
        var colors: [UIColor] = []
        for ingredient in ingredients {
            guard ingredient.measurement?.value != nil else { continue }
            colors.append(ingredient.color)
        }
        
        set.colors = colors
        
        self.data = PieChartData(dataSet: set)
    }
}
