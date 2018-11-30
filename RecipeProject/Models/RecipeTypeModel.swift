//
//  File.swift
//  RecipeProject
//
//  Created by JORGE VAZQUEZ REQUEJO on 29/11/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import Foundation

class RecipeTypeModel {
    var name:String?
    var categoryImage:String?
    var description:String?
    var difficult:String?
    var time:String?
    var lat: Double?
    var long: Double?
    
    init(name:String, categoryImage:String, description:String, difficult:String, time:String,lat:Double, long:Double) {
        self.name = name
        self.categoryImage = categoryImage
        self.description=description
        self.difficult = difficult
        self.time = time
        self.lat = lat
        self.long = long
    }
}
