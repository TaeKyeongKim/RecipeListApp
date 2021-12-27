//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    
    var recipe:Recipe
    
    @State var selectServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                
                
                
                // MARK: Recipe Iteam
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Serving Size Pricker
                Text(recipe.name)
                    .font(.largeTitle)
                    .padding(.leading)
                
                VStack(alignment: .leading){
                    Text("Select your serving size: ")
                        .font(.subheadline)
                    
                    Picker("servings" , selection: $selectServingSize){
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                .padding(.horizontal)
                
                Divider()
                
                
                // MARK: Recipe:Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    ForEach(recipe.ingredients){
                        item in
                        let portion = RecipeModel.getPortion(item, recipe.servings, selectServingSize)
                        
                        Text("⦿ \(portion) \(item.name.lowercased())")
                        
                        
                        
                        
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
