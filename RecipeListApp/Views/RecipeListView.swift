//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/21.
//

import SwiftUI

struct RecipeListView: View {
 
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack{
            NavigationView{
                List(model.recipes){ item in
                    NavigationLink(
                        destination: RecipeDetailView(recipe:item),
                        label: {
                            HStack{
                                Image(item.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipped()
                                    .cornerRadius(5)
                                Text(item.name)
                                
                            }
                        })
                    
                    
                    
                }.navigationBarTitle("All Recipes")
                
            }
        }
        
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}

