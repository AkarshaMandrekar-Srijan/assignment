//
//  I_am_RichApp.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 12/09/22.
//

import SwiftUI

@main
struct I_am_RichApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
            //this is the first screen that needs to be displayed
            
                .environmentObject(UserSettings())
            //recently added
        }
    }
}
