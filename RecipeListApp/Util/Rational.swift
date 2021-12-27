//
//  Rational.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/27.
//

import Foundation

struct Rational {
    
    static func GCD (_ a:Int , _ b: Int) -> Int {
        
        //GCD(0,b) = b
        if a == 0 {return b}
        
        //GCD(a,0) = a
        if b == 0 {return a}
        
        //Otherwise, GCD(a,b) = GCD(b, remainder)
        return GCD(b,a % b)
    }
    
}
