//
//  IngredientsViewController.swift
//  RecipeProject
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/12/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {

    @IBOutlet weak var imgIngredients: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnMap: UIButton!
    @IBOutlet weak var lblDifficulty: UILabel!
    
    var img:String?
    var name:String?
    var descrip:String?
    var lat:Double?
    var long:Double?
    var difficulty:String?
    
    
    convenience init(img:String, name: String, descrip: String, lat: Double, long:Double, difficulty:String){
        self.init()
        self.img = img
        self.name = name
        self.descrip = descrip
        self.lat = lat
        self.long = long
        self.difficulty = difficulty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func loadData(){
        imgIngredients.sd_setImage(with:URL(string:img!), completed: nil)
        lblName.text = name
        lblDescription.text = descrip
        lblDifficulty.text = difficulty
    }
}
