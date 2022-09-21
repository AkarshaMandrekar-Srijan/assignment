//
//  APIdisplay.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 17/09/22.
//

import SwiftUI

struct APIdisplay: View {
    
    @StateObject private var APIvm = APIViewModel()
    @EnvironmentObject var settings: UserSettings
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    
    var body: some View {
        
        ZStack {
            Color.white.ignoresSafeArea()
            VStack{
                ScrollView {
                    //card:
                    
                    LazyVGrid(columns: columns, spacing:20){
                        ForEach(APIvm.results, id: \.id) { item in
                            ZStack(alignment: .bottom){
                                AsyncImage(url: URL(string: item.image)){
                                    
                                    image in image.resizable().scaledToFit()
                                        .cornerRadius(20)
                                        .frame(width:180)
                                    
                                }placeholder: {
                                    ProgressView()
                                }.frame(width: 180, height: 250)
                                
                                
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(item.title)
                                        .font(.headline)
                                        .bold()
                                    Text("RS.\(item.price)")
                                        .bold()
                                    
                                }.padding()
                                    .frame(width:180,height:75 ,alignment: .leading)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(20)
                                
                                
                            }.frame(width: 180, height: 250)
                                .shadow(radius:3)
                        }
                    }
                    .task {
                        await APIvm.loadData()
                    }
                }
            }
            
            
            
            .safeAreaInset(edge: .bottom) {
                Button{
                    settings.isLoggedIn = false
                }label: {
                    Text( "Logout")
                
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.top)
                    .background(.ultraThinMaterial)
                    .foregroundColor(Color.red)
                    .font(.system(size: 23))

                }
            
            }
            
            
            
        }
        
        
    }
    
}


struct APIdisplay_Previews: PreviewProvider {
    static var previews: some View {
        APIdisplay()
    }
}
