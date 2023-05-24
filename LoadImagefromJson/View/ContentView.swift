//
//  ContentView.swift
//  LoadImagefromJson
//
//  Created by Claudio Tendean on 24/05/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @ObservedObject var News = NewsModel()
    
    var body: some View {
        List(News.data) {i in
            HStack {
                if i.image != "" {
                    WebImage(url: URL(string: i.image)!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 170)
                        .background(Color.secondary)
                        .cornerRadius(10)
                } else {
                    Image("loader")
                        .resizable()
                        .frame(width: 120, height: 170)
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 10){
                    Text(i.title)
                        .fontWeight(.bold)
                    Text(i.description)
                        .font(.caption)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}
