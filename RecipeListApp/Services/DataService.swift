//
//  DataService.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/22.
//

import Foundation
//Gets Struct/Class That is identifiable and decodable.
class DataService <T: Identifiable & Decodable>  {
    
    
    //Parse local json file
    func getLocalData (_ fileName:String, _ fileType:String) -> [T]{
        
        let pathString = Bundle.main.path(forResource: fileName, ofType: fileType)
        
        //Check if path String is not nil, otherwise...
        guard pathString != nil else{
            //if path String is nill, return empty array of recipe
            return [T]()
        }
        
        //if pathString is not nil
        let url = URL(fileURLWithPath: pathString!)
        do {
            let data = try Data(contentsOf: url)
            let decorder = JSONDecoder()
            
            do {
                let recipeData = try decorder.decode([T].self, from: data)
                
              
                                
                return recipeData
                
            }catch{
                print(error)
            }
        }catch{
            print(error)
        }
        
        return [T]()
    }
    
}

