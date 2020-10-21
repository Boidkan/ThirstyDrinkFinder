//
//  TDFDrinkPresenter.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import Foundation

protocol TDFDrinksDataSource {
    var drinks: [TDFDrink] { get }
}

protocol TDFDrinksDelegate {
    func didSelect(_ drink: TDFDrink)
    func searchDrinks(with name: String)
}


class TDFDrinkListPresenter: TDFPresenter {
    var coordinator: TDFCoordinator?
    var view: TDFView?
    var networkingService: TDFNetworkingService?
    
    private let drinksQueue = DispatchQueue(label: "Drinks_Queue", attributes: .concurrent)
    private var _drinks: [TDFDrink] = []
    
    init(networkingService: TDFNetworkingService, coordinator: TDFCoordinator) {
        self.networkingService = networkingService
        self.coordinator = coordinator
    }
    
    private func set(_ drinks: [TDFDrink]) {
        drinksQueue.async(flags: .barrier) {
            self._drinks = drinks
        }
    }
    
}

extension TDFDrinkListPresenter: TDFDrinksDataSource {
    var drinks: [TDFDrink] {
        var drinks: [TDFDrink] = []
        drinksQueue.sync {
            drinks = self._drinks
        }
        return drinks
    }
}

extension TDFDrinkListPresenter: TDFDrinksDelegate {
    func searchDrinks(with name: String) {
        networkingService?.getDrink(name) { drinks in
            self.set(drinks)
            DispatchQueue.main.async {
                self.view?.reload()
            }
        }
    }
    
    func didSelect(_ drink: TDFDrink) {
        coordinator?.navigateToDrinkView(for: drink)
    }
}
