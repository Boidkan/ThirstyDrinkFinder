//
//  TDFIngredientStackView.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/20/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

class TDFIngredientStackView: UIStackView {

    func load(ingredients: [TDFIngredientViewModel]) {
            self.subviews.forEach { $0.removeFromSuperview() }
        ingredients.enumerated().forEach { index, ingredient in
            self.add(ingredient)
        }
    }
    
    private func add(_ ingredient: TDFIngredientViewModel) {
        
        let colorView = UIView()
        colorView.layer.cornerRadius = 3
        let widthConstraint = NSLayoutConstraint(item: colorView,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 20)
        widthConstraint.isActive = true
        
        let heightConstraint = NSLayoutConstraint(item: colorView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 20)
        heightConstraint.isActive = true
        
        colorView.addConstraint(widthConstraint)
        colorView.addConstraint(heightConstraint)
        colorView.backgroundColor = ingredient.color
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = ingredient.text
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        
        let horizontalStack = UIStackView(arrangedSubviews: [colorView, label])
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 5

        self.addArrangedSubview(horizontalStack)
    }
}
