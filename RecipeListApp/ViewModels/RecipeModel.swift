//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/22.
//

import Foundation
class RecipeModel : ObservableObject {
    @Published var recipes = [Recipe]()
    
    init(){
        let fileName = "recipes"
        let fileType = "json"
        let getRecipe = DataService<Recipe>()
        self.recipes = getRecipe.getLocalData(fileName,fileType)
        //Add unique IDs
        for i in  self.recipes {
            i.id = UUID()
            for j in i.ingredients{
                j.id = UUID()
            }
        }

            
            
            
        }
        
    
}
