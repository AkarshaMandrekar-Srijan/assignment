//
//  SplashScreenVM.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 19/09/22.
//

import Foundation

final class SplashScreenViewModel: ObservableObject{
    
    @Published var isActive = false
    //for animations
    @Published var size = 0.8
    @Published var opacity = 0.5
    
}
