//
//  ContentViewVM.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 19/09/22.
//

import Foundation

//final keyword dosen allow u to subclass it

final class ContentViewModel : ObservableObject{
    
    @Published var username = ""
    @Published var password = ""
    
    //login states
    @Published var wrongUsername = 0
    @Published var wrongPassword = 0
    @Published var authenticationFails = false
    @Published var authenticationsuccess = false
    @Published var loggedin = false
    
    
    
    //function is created outside the var body
    func authen(username: String, password: String){
        //dont want it to be case sensitive
        
        for i in 0...4{
            
            if username == loginData[i].username{
                wrongUsername = 0
                if password == loginData[i].password
                {
                    wrongPassword = 0
                    loggedin = true
                    //entered inside the same if brace as we have to check both.
                    authenticationsuccess = true
                    authenticationFails = false
                    // print("Welcome Back")
                    break
                    
                }else{
                    wrongPassword = 2
                    print("wrong Password")
                    authenticationFails = true
                    authenticationsuccess = false
                    
                }
            }else{
                wrongUsername = 2
                print("wrong Username")
                authenticationFails = true
                authenticationsuccess = false
                
            }
            
        }
        
        
    }

}
