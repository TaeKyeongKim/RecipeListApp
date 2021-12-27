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
        
    
    static func getPortion(_ ingredient:Ingredient, _ recipeServing:Int, _ targetServing:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1 //if its nill, it is 1.
        var denomenator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // Get a single serving size by multiplying denominator by the recipe servings
            denomenator *= recipeServing
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServing
            
            //Reduce fraction by greatest common divisor
            let divisor = Rational.GCD(numerator, denomenator)
            
            numerator /= divisor
            denomenator /= divisor
            
            //Get the whole portion if numerator > denominator
            if numerator >= denomenator {
                
                //Cacluated whole portion
                wholePortions = numerator / denomenator
                
                // Calculate the remainder
                numerator = numerator % denomenator
                
                
                ///Assign  to portion string
                portion += String(wholePortions)
                
            }
            
            if numerator > 0 {
                // It checkes of the wholePortion is greater than 0.
                portion += wholePortions > 0 ? " " : ""
                
                //assign remainder as fraction to the portion string
                portion += "\(numerator)/\(denomenator)"
            }
            
            
        }
        
        
        
        
        //
        if var unit = ingredient.unit{
            
            //Calculate appropriate suffix
            if wholePortions > 1{
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }else if unit.suffix(1) == "f" {
                    unit = String (unit.dropLast())
                    unit += "ves"
                }else {
                    unit += "s"
                }

            } 
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit 
        }
        
        return portion
    }
}
