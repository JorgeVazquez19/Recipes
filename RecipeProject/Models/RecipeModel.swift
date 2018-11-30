//
//  RecipeModel.swift
//  RecipeProject
//
//  Created by JORGE VAZQUEZ REQUEJO on 28/11/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import Foundation

class RecipeModel {
    var name:String?
    var categoryImage:String?
    var recipeNumber:Int?
    var description:String?
    var recipe:[RecipeTypeModel]!
    
    
    init(name: String, categoryImage: String, recipeNumber: Int,recipe:[RecipeTypeModel]) {
        self.name = name
        self.categoryImage = categoryImage
        self.recipeNumber = recipeNumber
        self.recipe = recipe
    }
}
