//
//  DataService.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/22.
//

import Foundation
class DataService {
    

    //Parse local json file
   static func getLocalData () -> [Recipe]{
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if path String is not nil, otherwise...
        guard pathString != nil else{
            //if path String is nill, return empty array of recipe
            return [Recipe]()
        }
        
        //if pathString is not nil
        let url = URL(fileURLWithPath: pathString!)
        do {
            let data = try Data(contentsOf: url)
            let decorder = JSONDecoder()
            
            do {
                let recipeData = try decorder.decode([Recipe].self, from: data)
                
                //Add unique IDs
                for i in recipeData{
                    i.id = UUID()
                    for j in i.ingredients{
                        j.id = UUID()
                    }
                }
                
                return recipeData
                
            }catch{
                print(error)
            }
        }catch{
            print(error)
        }
        
        return [Recipe]()
    }
    
}

