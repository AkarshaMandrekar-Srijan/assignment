//
//  dataLoader.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 13/09/22.
//

import Foundation

//creating a public class in order to access through any of the files
public class dataLoader{
    //@published not required, allows the variable to to updated in better way
    @Published var pdata = [productData]()
    
    init(){
        load()
        sort()
        //so when we create dataloader it will load and sort data directly
    }
    
    func load(){
        //bundle refers to everything inside the folder i am rich
        if let fileLocation = Bundle.main.url(forResource: "product", withExtension: "json"){
            //do catch incase of error
            do{
                //inside do we will try to get the data from product.json file
                let data = try Data(contentsOf: fileLocation)
                //the data(cintentsof )call can throw hence its written innside doCatch and uses try before
                
                let jsondecoder = JSONDecoder()
                let dataFromJson = try jsondecoder.decode([productData].self, from: data)
                
                self.pdata = dataFromJson       //pdat was created on top
                
            }catch{
                print(error)
            }
        }
    }
    func sort() {
        self.pdata = self.pdata.sorted(by: {$0.id < $1.id})
        //$0accesses 1st item of the array, 1st item should be less than next
    }
    
}
