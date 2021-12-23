//
//  Ingredient.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/24.
//

import Foundation
class Ingredient : Identifiable , Decodable {
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
      
    
}
