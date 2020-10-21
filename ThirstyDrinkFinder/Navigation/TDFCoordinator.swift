//
//  TDFCoordinator.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit


protocol TDFCoordinator {
    var children: [TDFCoordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
    func navigateToDrinkView(for drink: TDFDrink)
}

class TDFMasterCoordinator: TDFCoordinator {
    
    var children: [TDFCoordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let presenter = TDFDrinkListPresenter(networkingService: TDFNetworkingService(),
                                              coordinator: self)
        
        let vc = TDFDrinkListViewController.instantiate()
        vc.presenter = presenter
        presenter.view = vc

        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToDrinkView(for drink: TDFDrink) {
        let vc = TDFDrinkViewController.instantiate()
        let presenter =  TDFDrinkPresenter(with: drink)
        
        vc.presenter = presenter
        presenter.view = vc
        
        vc.navigationItem.title = drink.name
        navigationController.pushViewController(vc, animated: true)
    }
}
