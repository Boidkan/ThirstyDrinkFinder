//
//  TDFDrinkPresenter.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import Foundation

protocol TDFDrinksDataSource {
    
}

protocol TDFDrinksDelegate {
    func didSelect()
}


class TDFDrinksPresenter: TDFPresenter {
    var coordinator: TDFCoordinator?
    var view: TDFView?
}
