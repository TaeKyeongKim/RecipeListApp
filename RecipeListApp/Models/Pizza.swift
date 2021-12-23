//
//  Pizza.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/22.
//

import Foundation
class Pizza :Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var toppings:[String]
    
}
