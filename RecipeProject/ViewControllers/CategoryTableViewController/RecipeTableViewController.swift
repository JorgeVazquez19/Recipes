//
//  RecipeTableViewController.swift
//  RecipeProject
//
//  Created by JORGE VAZQUEZ REQUEJO on 30/11/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeTableViewController: UIViewController {
    
    @IBOutlet var recipesTableView: UITableView?
    internal var recipes:[RecipeModel] = []
    internal var recipesMeat:[RecipeTypeModel] = []
    internal var recipesFish:[RecipeTypeModel] = []
    internal var recipesBird:[RecipeTypeModel] = []
    internal var recipesSalads:[RecipeTypeModel] = []
    internal var recipesDesserts:[RecipeTypeModel] = []
    internal var recipesSoups:[RecipeTypeModel] = []
    internal var recipesPastas:[RecipeTypeModel] = []
    internal var recipesVegetable:[RecipeTypeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        setupBarButtonsItems()
        registerCells()
        insertData()
    }
    
    func insertData(){
        let category1 = RecipeModel(name: "Carnes", categoryImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbOkK7VwdBqr-8wmhLDNYtKjjx-aemEPF3BvwnVsGbxWE9Va4WdQ", recipeNumber: 4, recipe: recipesMeat)
        let category2 = RecipeModel(name: "Pescado", categoryImage: "https://img.taste.com.au/KFln5Pso/w506-h253-cfill/taste/2016/11/lentil-rice-with-turmeric-fish-76468-1.jpeg", recipeNumber: 4, recipe: recipesFish)
        let category3 = RecipeModel(name: "Aves", categoryImage: "https://hips.hearstapps.com/del.h-cdn.co/assets/16/21/1600x800/landscape-1464124800-delish-grilled-chicken-sweet-chili.jpg?resize=1200:*", recipeNumber: 4, recipe: recipesBird)
        let category4 = RecipeModel(name: "Verduras", categoryImage: "https://www.inspiredtaste.net/wp-content/uploads/2017/10/Easy-Roasted-Vegetables-4-1200.jpg", recipeNumber: 4,recipe: recipesVegetable)
        let category5 = RecipeModel(name: "Salads", categoryImage: "https://www.tasteofhome.com/wp-content/uploads/2017/10/exps6498_MRR133247D07_30_5b_WEB-2-696x696.jpg", recipeNumber: 4,recipe: recipesVegetable)
        let category6 = RecipeModel(name: "Pasta", categoryImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxqslfD-ku0Vzt-F3Jj4WvVyUQuZiPx4Y0MdfcVJFVOkJwzjxn0A", recipeNumber: 4,recipe: recipesVegetable)
        let category7 = RecipeModel(name: "Soups", categoryImage: "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/recipe-image-legacy-id-1074500_11.jpg", recipeNumber: 4,recipe: recipesVegetable)
        let category8 = RecipeModel(name: "Desserts", categoryImage: "http://static.kidspot.com.au/recipe_asset/1385/img-4962.jpg-20150505010814~q75,dx720y432u1r1gg,c--.jpg", recipeNumber: 4,recipe: recipesVegetable)
        
        recipes.append(category1)
        recipes.append(category2)
        recipes.append(category3)
        recipes.append(category4)
        recipes.append(category5)
        recipes.append(category6)
        recipes.append(category7)
        recipes.append(category8)
        
        let recipe1 = RecipeTypeModel(name: "Hamburguesa", categoryImage: "http://assets.kraftfoods.com/recipe_images/opendeploy/74255_640x428.jpg", description: "hola", difficult: "Hard", time: "20min", lat: 20.2, long: 19.7)
        let recipe2 = RecipeTypeModel(name: "Hamburguesa", categoryImage: "http://assets.kraftfoods.com/recipe_images/opendeploy/74255_640x428.jpg", description: "hola", difficult: "Hard", time: "20min", lat: 20.2, long: 19.7)
        let recipe3 = RecipeTypeModel(name: "Hamburguesa", categoryImage: "http://assets.kraftfoods.com/recipe_images/opendeploy/74255_640x428.jpg", description: "hola", difficult: "Hard", time: "20min", lat: 20.2, long: 19.7)
        let recipe4 = RecipeTypeModel(name: "Hamburguesa", categoryImage: "http://assets.kraftfoods.com/recipe_images/opendeploy/74255_640x428.jpg", description: "hola", difficult: "Hard", time: "20min", lat: 20.2, long: 19.7)
        
        recipesMeat.append(recipe1)
        recipesFish.append(recipe2)
        recipesBird.append(recipe3)
        recipesVegetable.append(recipe4)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
    
    extension RecipeTableViewController : UITableViewDelegate,UITableViewDataSource{
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return recipes.count
        }
        
        private func setupBarButtonsItems(){
            let generalBarButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(generalPressed))
            navigationItem.setLeftBarButton(generalBarButton, animated: false)
            
        }
        @objc private func generalPressed(){
            dismiss(animated: true, completion: nil)
        }
        private func registerCells(){
            let RecipeCellIdentifier = "recipeCell"
            
            let cellNib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
            recipesTableView?.register(cellNib, forCellReuseIdentifier: RecipeCellIdentifier)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
            UITableViewCell {
                let cell: RecipeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell)!
                cell.accessoryType = .disclosureIndicator
                switch indexPath.row{
                case 0:
                    cell.lblCategory.text = "Carne"
                    cell.lblNum.text = "\(4)"
                    cell.categoryImage.image = UIImage(named: "meat")
                    cell.lblDescription.text = "Los mejores platos de carne"
                case 1:
                    cell.lblCategory.text = "Pescados"
                    cell.lblNum.text = "\(3)"
                    cell.categoryImage.image = UIImage(named: "fish")
                    cell.lblDescription.text = "Los mejores platos de pescado"
                case 2:
                    cell.lblCategory.text = "Aves"
                    cell.lblNum.text = "\(4)"
                    cell.categoryImage.image = UIImage(named: "birds")
                    cell.lblDescription.text = "Los mejores platos de aves"
                case 3:
                    cell.lblCategory.text = "Verduras"
                    cell.lblNum.text = "\(2)"
                    cell.categoryImage.image = UIImage(named: "vegetables")
                    cell.lblDescription.text = "Los mejores platos de verduras"
                case 4:
                    cell.lblCategory.text = "Ensaladas"
                    cell.lblNum.text = "\(0)"
                    cell.categoryImage.image = UIImage(named: "salad")
                    cell.lblDescription.text = "Las mejores ensaladas"
                case 5:
                    cell.lblCategory.text = "Pastas"
                    cell.lblNum.text = "\(0)"
                    cell.categoryImage.image = UIImage(named: "pasta")
                    cell.lblDescription.text = "Las mejores pastas"
                case 6:
                    cell.lblCategory.text = "Sopas"
                    cell.lblNum.text = "\(0)"
                    cell.categoryImage.image = UIImage(named: "soup")
                    cell.lblDescription.text = "Las mejores sopas"
                case 7:
                    cell.lblCategory.text = "Postres"
                    cell.lblNum.text = "\(0)"
                    cell.categoryImage.image = UIImage(named: "dessert")
                    cell.lblDescription.text = "Los mejores postres"
                default: break
                }
                return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 122
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vcComment = RecipeTypeTableViewController(recipes: recipes[indexPath.row].recipe)
            navigationController?.pushViewController(vcComment, animated: true)
        }
        
    }

