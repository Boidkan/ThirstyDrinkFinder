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
}

class TDFMasterCoordinator: TDFCoordinator {
    
    var children: [TDFCoordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {

        let presenter = TDFDrinksPresenter()
        presenter.coordinator = self

        let vc = TDFDrinksViewController.instantiate()
        vc.presenter = presenter


        navigationController.pushViewController(vc, animated: false)
    }
}
