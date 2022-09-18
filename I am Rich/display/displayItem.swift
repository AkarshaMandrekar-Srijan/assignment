//
//  displayItem.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 13/09/22.
//

import SwiftUI

let product = dataLoader().pdata

struct displayItem: View {
    
    //recently added
    @EnvironmentObject var settings: UserSettings
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing:20){
                        ForEach(product, id: \.id){
                            product in ProductCard(product: product)
                        }
                    }.padding()
                    
                }
                
            }
            Button("Logout"){
                settings.isLoggedIn = false
            }.frame(width:400,height: 45,alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(25)
                .foregroundColor(Color.red)
                .offset(y: 415)
        }
    }
}

struct displayItem_Previews: PreviewProvider {
    static var previews: some View {
        displayItem()
    }
}
