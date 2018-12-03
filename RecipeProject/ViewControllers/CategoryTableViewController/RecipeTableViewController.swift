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
        
        let recipe1 = RecipeTypeModel(name: "Hamburguesa", categoryImage: "https://assets.kraftfoods.com/recipe_images/opendeploy/74255_640x428.jpg", description: "Las cocinaremos a fuego medio alto, por ambos lados dejándolas un poco al gusto de cada uno. Más o menos cocinadas en función de cómo nos gusten. El tiempo de cocción debería ser de unos 3 minutos por cada lado y siempre una sola vuelta por cada lado.", difficult: "fácil", time: "20min", lat: 20.2, long: 19.7)
        let recipe5 = RecipeTypeModel(name: "Caballo", categoryImage: "https://cdn.colombia.com/sdi/2011/08/30/bistec-a-caballo-511344.jpg", description: "Las cocinaremos a fuego medio alto, por ambos lados dejándolas un poco al gusto de cada uno. Más o menos cocinadas en función de cómo nos gusten. El tiempo de cocción debería ser de unos 5 minutos por cada lado y siempre una sola vuelta por cada lado.", difficult: "dificil", time: "20min", lat: 21.9, long: 19.7)
        let recipe2 = RecipeTypeModel(name: "Lubina", categoryImage: "https://www.hogarmania.com/archivos/201107/lubina-patatas-xl-668x400x80xX.jpg", description: "En una sartén con una cucharada de aceite de oliva, dora la lubina. Añádele la sal y dale la vuelta. Pon en el fondo de un plato hondo las verduras con la salsita y coloca encima el lomo de lubina. ¡Listo para comer!", difficult: "Meddium", time: "35min", lat: 17.5, long: 18.7)
        let recipe3 = RecipeTypeModel(name: "Codorniz", categoryImage: "https://www.gallinablanca.es/files/thumbs/c883c825c44107f9b2e76dc15a193d99a215febc_r800_422_5.jpg", description: "salpimentar las codornices, untarlas con la miel y pasarlas por la harina de almendra. Ponerlas en una bandeja de horno con un chorro de aceite de oliva y hornearlas a a 180º unos 15 minutos.", difficult: "Hard", time: "25min", lat: 20.2, long: 19.7)
        let recipe4 = RecipeTypeModel(name: "Berenjena", categoryImage: "https://www.gallinablanca.es/files/thumbs/9378e1430f23eb3b39eea2e5da9de9bf25875dd6_r900_480_2.jpg", description: "fácil", difficult: "Debes pelar las berenjenas, meterlas en el horno con un relleno de carne y listo!", time: "40min", lat: 23.1, long: 15.7)
        let recipe6 = RecipeTypeModel(name: "Alcachofa", categoryImage: "https://www.hogarmania.com/archivos/201311/5272-1-alcachofas-con-patatas-657-xl-668x400x80xX.jpg", description: "fácil", difficult: "Debes pelar las alcachofas, meterlas en el horno con un relleno de carne y listo!", time: "45min", lat: 15.5, long: 20.3)
        
        recipesMeat.append(recipe1)
        recipesMeat.append(recipe5)
        recipesFish.append(recipe2)
        recipesBird.append(recipe3)
        recipesVegetable.append(recipe4)
        recipesVegetable.append(recipe6)
        
        
        let category1 = RecipeModel(name: "Carnes", categoryImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbOkK7VwdBqr-8wmhLDNYtKjjx-aemEPF3BvwnVsGbxWE9Va4WdQ", recipeNumber: 2, recipe: recipesMeat)
        let category2 = RecipeModel(name: "Pescado", categoryImage: "https://img.taste.com.au/KFln5Pso/w506-h253-cfill/taste/2016/11/lentil-rice-with-turmeric-fish-76468-1.jpeg", recipeNumber: 1, recipe: recipesFish)
        let category3 = RecipeModel(name: "Aves", categoryImage: "https://hips.hearstapps.com/del.h-cdn.co/assets/16/21/1600x800/landscape-1464124800-delish-grilled-chicken-sweet-chili.jpg?resize=1200:*", recipeNumber: 2, recipe: recipesBird)
        let category4 = RecipeModel(name: "Verduras", categoryImage: "https://www.inspiredtaste.net/wp-content/uploads/2017/10/Easy-Roasted-Vegetables-4-1200.jpg", recipeNumber: 2,recipe: recipesVegetable)
        let category5 = RecipeModel(name: "Salads", categoryImage: "https://www.tasteofhome.com/wp-content/uploads/2017/10/exps6498_MRR133247D07_30_5b_WEB-2-696x696.jpg", recipeNumber: 0,recipe: recipesVegetable)
        let category6 = RecipeModel(name: "Pasta", categoryImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxqslfD-ku0Vzt-F3Jj4WvVyUQuZiPx4Y0MdfcVJFVOkJwzjxn0A", recipeNumber: 0,recipe: recipesVegetable)
        let category7 = RecipeModel(name: "Soups", categoryImage: "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/recipe-image-legacy-id-1074500_11.jpg", recipeNumber: 0,recipe: recipesVegetable)
        let category8 = RecipeModel(name: "Desserts", categoryImage: "http://static.kidspot.com.au/recipe_asset/1385/img-4962.jpg-20150505010814~q75,dx720y432u1r1gg,c--.jpg", recipeNumber: 0,recipe: recipesVegetable)
        
        recipes.append(category1)
        recipes.append(category2)
        recipes.append(category3)
        recipes.append(category4)
        recipes.append(category5)
        recipes.append(category6)
        recipes.append(category7)
        recipes.append(category8)
        
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
                    cell.lblNum.text = "\(2)"
                    cell.categoryImage.image = UIImage(named: "meat")
                    cell.lblDescription.text = "Los mejores platos de carne"
                case 1:
                    cell.lblCategory.text = "Pescados"
                    cell.lblNum.text = "\(1)"
                    cell.categoryImage.image = UIImage(named: "fish")
                    cell.lblDescription.text = "Los mejores platos de pescado"
                case 2:
                    cell.lblCategory.text = "Aves"
                    cell.lblNum.text = "\(1)"
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
            let aRecipe = recipes[indexPath.row].recipe
            let vcComment = RecipeTypeTableViewController(recipes: aRecipe!)
            navigationController?.pushViewController(vcComment, animated: true)
        }
        
    }

