//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Kim Tae Kyeong  on 2021/12/24.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0.0){
            
            
            Text("Featured Recipe")
                .bold()
                .padding([.top, .leading])
                .font(.largeTitle)
            
            GeometryReader{
                geo in
                TabView{
                    ForEach(0..<model.recipes.count){
                        index in
                        if model.recipes[index].featured{
                            
                            
                            //Recipe Card Button
                            Button (action: {
                                //show the recipe detail sheet
                                self.isDetailViewShowing = true
                            } , label:{
                                //Recipe Card
                                ZStack{
                                    
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                    
                                    
                                }
                            })
                                .sheet(isPresented: $isDetailViewShowing){
                                    // Show the recipe Detail View
                                    RecipeDetailView(recipe: model.recipes[index])
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity:0.5), radius: 10, x: -5, y: 5)
                            
                            
                            
                            
                        }
                    }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(spacing: 10.0){
                Text("Preperation Time:")
                
                Text("Preperation Time:")
                
                Text("Preperation Time:")
                
                Text("Preperation Time:")
                
                Text("Preperation Time:")
            }
            .padding(.leading)
            
            
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel()) //I need to inject this to
        // be able to view from the preview
    }
}
