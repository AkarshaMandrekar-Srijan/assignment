//
//  ContentView.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 12/09/22.
//

import SwiftUI

let loginData = userDataLoader().useData

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @EnvironmentObject var settings: UserSettings
    
    
    var body: some View {
        
        
        NavigationView {
            ZStack{
                
                //background display colours
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                
                
                if settings.isLoggedIn{//user already logged in
                    
                    //Text("\(name) is logged in")
                    APIdisplay().environmentObject(settings)
                    //displayItem
                    //if aalready logged in => display items screen
                }
                
                
                
                else {//user trying to log in
                    
                    if UserDefaults.standard.bool(forKey: "login"){
                        //Text("\(name) is logged in")
                        APIdisplay().environmentObject(settings)
                        //displayItem
                    }
                    
                    else {  //show the login screen
                        VStack{
                            
                            
                            //Title
                            Text("Login")
                                .font(.largeTitle)
                                .bold()
                                .padding()
                            
                            //creating text field
                            TextField("Username", text:$viewModel.username)
                                .padding()
                                .frame(width:300,height:50)
                                .background(Color.blue.opacity(0.05))
                                .cornerRadius(20)
                                .border(.red, width: CGFloat(viewModel.wrongUsername))
                            
                            
                            //Password
                            SecureField("Password", text:$viewModel.password)
                                .padding()
                                .frame(width:300,height:50)
                                .background(Color.blue.opacity(0.05))
                                .cornerRadius(20)
                                .border(.red, width: CGFloat(viewModel.wrongPassword))
                            
                            
                            //Login Button
                            Button("Login"){
                                viewModel.authen(username: viewModel.username, password: viewModel.password)
                                
                                if viewModel.authenticationsuccess{
                                    settings.isLoggedIn = true
                                }
                                
                            }.frame(width:150, height:50)
                             .background(Color.blue)
                             .foregroundColor(.white)
                             .cornerRadius(20)
                             .padding(.top)
                            
                            
                            
                            
                            if viewModel.authenticationFails{
                               
                                Text("Information is incorrect")
                                    .padding()
                                    .foregroundColor(.red)
                            }
                            
                            if viewModel.authenticationsuccess{
                                
                                Text("Logged In")
                                    .foregroundColor(.green)
                                    .offset(y: -280)
                                    .font(.headline)
                                
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
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

