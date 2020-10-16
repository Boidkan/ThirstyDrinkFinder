//
//  TDFViewControllers.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

//protocol TDFStoryboarded {
//    static func instantiate() -> Self
//}
//
//extension TDFStoryboarded where Self: UIViewController {
//    static func instantiated() -> Self {
//        let id = NSStringFromClass(: self)
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        return storyboard.instantiateViewController(identifier: id) as! Self
//    }
//}

protocol TDFStoryboarded {
    static func instantiate() -> Self
}

extension TDFStoryboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Thirsty", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
