//
//  RecipeTypeTableViewController.swift
//  RecipeProject
//
//  Created by JORGE VAZQUEZ REQUEJO on 30/11/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeTypeTableViewController: UIViewController    {
    
    @IBOutlet var RecipeTypeTable: UITableView!
    var recipes:[RecipeTypeModel]!
    var name: String!
    
    convenience init(recipes:[RecipeTypeModel]){
        self.init()
        self.recipes = recipes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        registerCells()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    private func registerCells(){
        let RecipeCellIdentifier = "recipeTypeCell"
        let cellNib = UINib(nibName: "RecipeTypeTableViewCell", bundle: nil)
        RecipeTypeTable?.register(cellNib, forCellReuseIdentifier: RecipeCellIdentifier)
    }
    
}
extension RecipeTypeTableViewController: UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecypeTypeTableViewCell = (RecipeTypeTable.dequeueReusableCell(withIdentifier: "recipeTypeCell", for: indexPath) as! RecypeTypeTableViewCell)
        
        let recipe = recipes[indexPath.row]
        cell.lblName.text = recipe.name
        cell.recipeImage?.sd_setImage(with: URL(string: recipe.categoryImage!), completed: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myCategory = recipes[indexPath.row]
        let recepieVC = RecipeTypeTableViewController()
        navigationController?.pushViewController(recepieVC, animated: true)
    }
}
