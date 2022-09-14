//
//  UserSettings.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 14/09/22.
//

//recently added

import Foundation
class UserSettings: ObservableObject{
    
    @Published var isLoggedIn: Bool{
        didSet{
            UserDefaults.standard.set(isLoggedIn, forKey: "login")
            //here the value of loggin will be saved
        }
    }
    
    init(){
        self.isLoggedIn = false
    }
}
