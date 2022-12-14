//
//  userDataLoader.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 14/09/22.
//

import Foundation

//creating a public class in order to access through any of the files
public class userDataLoader{
    //@published not required, allows the variable to to updated in better way
    @Published var useData = [UserData]()
    
    init(){
        load()
        
    }
    
    func load(){
        
        if let fileLocation = Bundle.main.url(forResource: "jsonformatter", withExtension: "json"){
            
            do{
                let data = try Data(contentsOf: fileLocation)
                let jsondecoder = JSONDecoder()
                let dataFromJson = try jsondecoder.decode([UserData].self, from: data)
                self.useData = dataFromJson       //pdat was created on top
                
            }catch{
                print(error)
            }
        }
    }
   
    
}
