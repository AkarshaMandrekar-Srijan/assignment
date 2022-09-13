//
//  displayItem.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 13/09/22.
//

import SwiftUI

struct displayItem: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns, spacing:20){
                    ForEach(productList, id: \.id){
                        product in ProductCard(product: product)
                    }
                }.padding()
            }
        }
    }
}

struct displayItem_Previews: PreviewProvider {
    static var previews: some View {
        displayItem()
    }
}
