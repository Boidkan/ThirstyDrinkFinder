//
//  TDFDrinkPresenter.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/19/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

protocol TDFDrinkDataSource {
    var image: UIImage { get }
    var name: String { get }
    var instructions: String { get }
    var ingredients: [TDFIngredientViewModel] { get }
}

class TDFDrinkPresenter: TDFPresenter {
    var coordinator: TDFCoordinator?
    var view: TDFView?
    
    private var _ingredients: [TDFIngredientViewModel] = []
    private var drink: TDFDrink
    
    init(with drink: TDFDrink) {
        self.drink = drink
        setIngredients()
    }
    
    private func setIngredients() {
        let colors = UIColor.getRandomColors(amount: drink.ingredients.count)
        
        _ingredients = drink.ingredients.enumerated().map { index, ingredient in
            
            let measurement: TDFMeasurement? = {
                
                let value = ingredient.measurement.getNumber
                let unit = ingredient.measurement.getUnit
                
                return TDFMeasurement(value: value, unit: unit)
            }()
            
            let text = ingredient.name + " (" + ingredient.measurement + ")"
            
            return TDFIngredientViewModel(text: text,
                                          color: colors[index],
                                          measurement: measurement)
        }
    }
}

extension TDFDrinkPresenter: TDFDrinkDataSource {
    var image: UIImage { drink.image }
    var name: String { drink.name }
    var instructions: String { drink.instructions }
    var ingredients: [TDFIngredientViewModel] {
        _ingredients
    }
}
