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
        
        self.recipes = DataService.getLocalData()
        
            
            
            
        }
        
    
}
