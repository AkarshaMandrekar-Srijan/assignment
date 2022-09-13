//
//  Product.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 13/09/22.
//

import Foundation

struct Product: Identifiable{
    var id = UUID()
    var name = String()
    var image = String()
    var price = Int()
}

var productList = [Product(name: "Macarons", image: "img1", price: 340),
                   Product(name: "D2", image: "img2", price: 300),
                   Product(name: "D3", image: "img3", price: 300),
                   Product(name: "D4", image: "img4", price: 300),
                   Product(name: "D5", image: "img5", price: 300),
                   Product(name: "D6", image: "img6", price: 300),

]
