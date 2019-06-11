//
//  Restaurant.swift
//  FoodPin
//
//  Created by 王珏 on 2019/5/28.
//  Copyright © 2019 wangjue. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String
    var type: String
    var location: String
    var phone: String
    var description: String
    var image: String
    var isVisited: Bool
    var rating: String
    
    init(name: String, type: String, location: String, phone: String, description: String, isVisited: Bool = false, rating: String = "") {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = name
        self.isVisited = isVisited
        self.rating = rating
    }
    
    convenience init() {
        self.init(name: "", type: "", location: "", phone: "", description: "", isVisited: false)
    }
}
