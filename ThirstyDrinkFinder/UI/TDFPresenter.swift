//
//  TDFViewController.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

protocol TDFPresenter: class {
    var coordinator: TDFCoordinator? { get set }
    var view: TDFView? { get set }
}
