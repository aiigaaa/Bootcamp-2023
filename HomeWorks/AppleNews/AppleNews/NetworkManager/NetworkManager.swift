//
//  NetworkManager.swift
//  AppleNews
//
//  Created by aiga.bernane on 20/11/2023.
//

import Foundation

class NetworkManager {
    
    static let api = "https://newsapi.org/v2/everything?q=apple&from=2023-11-15&to=2023-11-17&sortBy=popularity&apiKey=40523cde59d24c839c35b86458a6bc9a"
    
    static func fetchData(url: String, completion: @escaping (NewsItems) -> () ) {

        guard let url = URL(string: url) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true

        URLSession(configuration: config).dataTask(with: request) { (data, response, err ) in

            guard err == nil else {
                print("err:::::", err!)
                return
            }

            //print("response:", response as Any)

            guard let data = data else { return }


            do {
                let jsonData = try JSONDecoder().decode(NewsItems.self, from: data)
                completion(jsonData)
            }catch{
                print("err:::::", error)
            }

        }.resume()

    }
    
}
