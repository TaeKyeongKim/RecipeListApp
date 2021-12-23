//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                
                
                
                // MARK: Recipe Iteam
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe:Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    ForEach(recipe.ingredients){
                        item in
                        Text("⦿ \(item.name)")
                        
                        
                        
                        
                    }
                    
                }
                .padding(.leading)
                // MARK: Recipe Direction
                VStack(alignment: .leading){
                    Text("Directions").font(.headline)
                        .padding(.bottom, 5)
                    ForEach(0..<recipe.directions.count, id:\.self){
                        steps in
                        Text("Step \(steps+1) : "+recipe.directions[steps])
                            .padding(.bottom, 5.0)
                        
                        
                        
                    }
                }
                .padding([.top, .leading, .trailing])
                VStack{
                    if let highlight = recipe.highlights{
                    Text("Hightlights").font(.headline)                  
                        ForEach(highlight , id:\.self){
                            item in
                            Text(item)
                        }
                    }
                }
                
                
            }
            
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //Create a dummy recipe and pass it into the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
