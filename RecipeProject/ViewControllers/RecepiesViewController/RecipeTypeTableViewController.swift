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
    var recipesSearch:[RecipeTypeModel]!
    let searchController = UISearchController(searchResultsController: nil)
    var name: String!
    
    convenience init(recipes:[RecipeTypeModel]){
        self.init()
        self.recipes = recipes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar ..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        registerCells()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    private func registerCells(){
        let RecipeCellIdentifier = "recipeTypeCell"
        let cellNib = UINib(nibName: "RecypeTypeTableViewCell", bundle: nil)
        RecipeTypeTable?.register(cellNib, forCellReuseIdentifier: RecipeCellIdentifier)
    }
    internal func searchBarIsEmpty() -> Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    internal func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    internal func filterContentForSearchText(_ searchText: String){
        recipesSearch = recipes.filter({ (aRecipes: RecipeTypeModel ) -> Bool in
            return (aRecipes.name?.lowercased().contains(searchText.lowercased()))!
        })
        RecipeTypeTable.reloadData()
    }
    
}
extension RecipeTypeTableViewController: UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return recipesSearch.count
        }
        return recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecypeTypeTableViewCell = (RecipeTypeTable.dequeueReusableCell(withIdentifier: "recipeTypeCell", for: indexPath) as! RecypeTypeTableViewCell)
        if isFiltering(){
            let recipe = recipesSearch[indexPath.row]
            cell.lblName.text = recipe.name
            cell.recipeImage?.sd_setImage(with: URL(string: recipe.categoryImage!), completed: nil)
            return cell
        }else{
            let recipe = recipes[indexPath.row]
            cell.lblName.text = recipe.name
            cell.lblName.layer.cornerRadius = 20
            cell.recipeImage?.sd_setImage(with: URL(string: recipe.categoryImage!), completed: nil)
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myCategory = recipes[indexPath.row]
        let recepieVC = IngredientsViewController(img: myCategory.categoryImage!, name: myCategory.name!, descrip: myCategory.description!, lat: myCategory.lat!, long: myCategory.long!, difficulty: myCategory.difficult!)
        navigationController?.pushViewController(recepieVC, animated: true)
    }
}

extension RecipeTypeTableViewController:UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        filterContentForSearchText(searchController.searchBar.text!)
}
}   
