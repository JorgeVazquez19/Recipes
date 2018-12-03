//
//  IngredientsTableViewCell.swift
//  RecipeProject
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/12/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIngredients: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDifficulty: UILabel!
    @IBOutlet weak var btnMap: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
