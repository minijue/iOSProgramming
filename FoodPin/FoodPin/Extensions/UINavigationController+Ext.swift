//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by 王珏 on 2020/6/10.
//  Copyright © 2020 王珏. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
