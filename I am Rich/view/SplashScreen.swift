//
//  SplashScreen.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 12/09/22.
//

import SwiftUI

struct SplashScreen: View {
   
    @StateObject private var SplashVM = SplashScreenViewModel()
    
    var body: some View {
       
        //linking splash screen to main page
        if SplashVM.isActive{
            ContentView()
        }
        else{
            VStack{
                VStack{
                    
                    Text("Akarsha")
                        .font(.system(size: 90))
                        .foregroundColor(Color.accentColor)
                        .padding()
                    
                    Image("diamond")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150.0, height: 150.0)
                    
                }
                //to give animated effect to above text and img
                .scaleEffect(SplashVM.size)
                .opacity(SplashVM.opacity)
                .onAppear(){
                    withAnimation(.easeIn(duration: 1.2)){
                        self.SplashVM.size = 0.9
                        self.SplashVM.opacity = 1.0
                    }
                }
            }
            //display the page for 2s and moves to main page.
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.SplashVM.isActive=true
                }
                
            }
        }
    }
    
    struct SplashScreen_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreen()
        }
    }
}
