//
//  ProductCard.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 13/09/22.
//

import SwiftUI

struct ProductCard: View {
    //variable product of product type
    var product: productData
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image(product.image).resizable().cornerRadius(20).frame(width:180).scaledToFit()
            
            VStack(alignment: .leading){
                Text(product.name).bold()
                Text("Rs.\(product.price)").bold()
            }.padding().frame(width:180,alignment: .leading).background(.ultraThinMaterial).cornerRadius(20)
            
        }.frame(width: 180, height: 250).shadow(radius:3)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: product[2])
    }
}
