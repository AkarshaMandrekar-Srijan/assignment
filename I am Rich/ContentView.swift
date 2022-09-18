//
//  ContentView.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 12/09/22.
//

import SwiftUI

struct UserData: Codable{
    var username: String
    var password: String
}

let loginData = userDataLoader().useData

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    
    //login states
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var authenticationFails = false
    @State private var authenticationsuccess = false
    
    @State private var loggedin = false
    
    //required fro UserSetting
    @EnvironmentObject var settings: UserSettings
    
    
    var body: some View {
        
        
        NavigationView {
            ZStack{
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                
                
                if settings.isLoggedIn{
                    //Text("\(name) is logged in")
                    APIdisplay().environmentObject(settings)
                    //displayItem
                    
                    //if aalready logged in => display items screen
                }
                
                
                
                else {
                    if UserDefaults.standard.bool(forKey: "login") == true{
                        //Text("\(name) is logged in")
                        APIdisplay().environmentObject(settings)
                        //displayItem
                    }
                    
                    else {
                        
                        //show the login screen
                        
                        
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
                                
                                if authenticationsuccess{
                                settings.isLoggedIn = true
                                }
                                
                            }.frame(width:150, height:50).background(Color.blue).foregroundColor(.white).cornerRadius(20).padding(.top)
                            
                            
                            
                            if authenticationFails{
                                Text("Information is incorrect").padding().foregroundColor(.red)
                            }
                            
                            if authenticationsuccess{
                                Text("Logged In").foregroundColor(.green).offset(y: -280).font(.headline)
                                
                            }
                            
                            
                        }
                    }
                }
                
                
                //                if loggedin{
                //                    displayItem()
                //                }
                //                NavigationLink(destination: displayItem(),isActive:$loggedin){
                //
                //                }
                
            }.navigationTitle("").navigationBarHidden(true)
        }
        
        
    }
    
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

