//
//  NewsModel.swift
//  LoadImagefromJson
//
//  Created by Claudio Tendean on 24/05/23.
//

import Foundation
import Combine
import SwiftyJSON

class NewsModel : ObservableObject {
    @Published var data = [News]()
    
    init() {
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2023-04-24&sortBy=publishedAt&apiKey=b1875d927c754432b167cdb2ad1732a7"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) {(data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            let items = json["articles"].array!
            
            // Looping pada Swift
            for i in items {
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let imgurl = i["urlToImage"].stringValue
                
                DispatchQueue.main.async {
                    self.data.append(News(title: title, image: imgurl, description: description))
                }
            }
        }.resume()
    }
}
