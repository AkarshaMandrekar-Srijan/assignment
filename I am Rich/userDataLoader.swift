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
        //bundle refers to everything inside the folder i am rich
        if let fileLocation = Bundle.main.url(forResource: "jsonformatter", withExtension: "json"){
            //do catch incase of error
            do{
                //inside do we will try to get the data from product.json file
                let data = try Data(contentsOf: fileLocation)
                //the data(cintentsof )call can throw hence its written innside doCatch and uses try before
                
                let jsondecoder = JSONDecoder()
                let dataFromJson = try jsondecoder.decode([UserData].self, from: data)
                
                self.useData = dataFromJson       //pdat was created on top
                
            }catch{
                print(error)
            }
        }
    }
   
    
}
