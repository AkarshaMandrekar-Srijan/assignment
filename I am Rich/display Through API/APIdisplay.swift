//
//  APIdisplay.swift
//  I am Rich
//
//  Created by Akarsha Mandrekar on 17/09/22.
//

import SwiftUI
struct Result: Codable {
    let id: Int
    let title: String
    let price: Double
    let resultDescription: String
    let category: Category
    let image: String
    let rating: Rating
    enum CodingKeys: String, CodingKey {
        case id, title, price
        case resultDescription = "description"
        case category, image, rating
    }
}
enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}
// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}



struct APIdisplay: View {
    @State private var results = [Result]()
    @EnvironmentObject var settings: UserSettings
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        
        
      ZStack {
           Color.white.ignoresSafeArea()
        VStack{
            ScrollView {
                ForEach(results, id: \.id) { item in
                    
                    //card:
                    
                    LazyVGrid(columns: columns, spacing:20){
                        ForEach(results, id: \.id) { item in
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
                    
                }
                .task {
                    await loadData()
                }
            }
        }
        Button("Logout"){
             settings.isLoggedIn = false
        }.frame(width:400,height: 45,alignment: .center)
            .background(.ultraThinMaterial)
            .cornerRadius(25)
            .foregroundColor(Color.red)
            .offset(y: 415)
    }
        
        
    }
    
    
    func loadData() async {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Data Fetched")
            if let decodedResponse = try? JSONDecoder().decode([Result].self, from: data) {
                results = decodedResponse
                print(results)
            }
            
        } catch {
            print("Invalid data")
        }
        
        
    }
}

struct APIdisplay_Previews: PreviewProvider {
    static var previews: some View {
        APIdisplay()
    }
}
