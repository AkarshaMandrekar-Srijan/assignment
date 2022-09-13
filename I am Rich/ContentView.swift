//
//  ContentView.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 12/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
   
    @State private var loggedin = false
    
    @State private var authenticationFails = false
    @State private var authenticationsuccess = false
    
    
    var body: some View {
        
        ZStack{
            Color.blue.ignoresSafeArea()
            Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
            Circle().scale(1.35).foregroundColor(.white)
            
            VStack{
                //Username
                Text("Login").font(.largeTitle).bold().padding()
                //creating text field
                TextField("Username", text:$username).padding().frame(width:300,height:50).background(Color.blue.opacity(0.05)).cornerRadius(20).border(.red, width: CGFloat(wrongUsername))
                
                //Password
                SecureField("Password", text:$password).padding().frame(width:300,height:50).background(Color.blue.opacity(0.05)).cornerRadius(20).border(.red, width: CGFloat(wrongPassword))
                
                //Login Button
                Button("Login"){
                    authen(username: username, password: password)
                }.frame(width:150, height:50).background(Color.blue).foregroundColor(.white).cornerRadius(20).padding(.top)
                
                
                
                if authenticationFails{
                    Text("Information is incorrect").padding().foregroundColor(.red)
                }
                
                if authenticationsuccess{
                    Text("Logged In").foregroundColor(.green).offset(y: -280).font(.headline)
                    
                }
               

            }
            
            if loggedin{
                displayItem()
            }
            
            
        }
        
        
    }
    
    //function is created outside the var body
    func authen(username: String, password: String){
        //dont want it to be case sensitive
        if username.lowercased() == "coco"{
            wrongUsername = 0
            if password.lowercased() == "wow"{
                wrongPassword = 0
                //entered inside the same if brace as we have to check both.
                authenticationsuccess = true
                authenticationFails = false
                print("Welcome Back")
                loggedin = true
             
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
