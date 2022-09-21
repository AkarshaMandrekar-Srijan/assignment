//
//  apiVM.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 19/09/22.
//

import Foundation

final class APIViewModel :ObservableObject{
    
    @Published var results = [Result]()
    

    func loadData() async {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Data Fetched")
            if let decodedResponse = try? JSONDecoder().decode([Result].self, from: data) {
                results = decodedResponse
                print(results)
            }
            
        } catch {
            print("Invalid data")
        }
        
        
    }
    
    
}
