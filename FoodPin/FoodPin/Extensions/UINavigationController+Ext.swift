//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by 王珏 on 2019/6/4.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

extension UINavigationController {
    // 将状态栏指定为 topViewController 的风格
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
