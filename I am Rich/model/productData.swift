//
//  productData.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 13/09/22.
//

import Foundation

//mentions the parameters from the json file
struct productData: Codable{
    var id: Int
    var name: String
    var image: String
    var price: Int
    
}
