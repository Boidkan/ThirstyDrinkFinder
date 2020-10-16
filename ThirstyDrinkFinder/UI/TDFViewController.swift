//
//  TDFViewController.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

protocol TDFView: class {
    var presnterType: TDFPresenter.Type { get }
    var presenter: TDFPresenter { get set }
}
