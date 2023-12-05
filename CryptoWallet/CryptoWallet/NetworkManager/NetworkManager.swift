//
//  NetworkManager.swift
//  CryptoWallet
//
//  Created by aiga.bernane on 29/11/2023.
//

import Foundation

class NetworkManager {
    static func fetchData(url: String, completion: @escaping ([CoinModel]) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([CoinModel].self, from: data)
                completion(coins)
            } catch {
                
            }
        }.resume()
    }
    
    static func fetchCoinDetails(coinID: String, completion: @escaping (CoinModel?) -> ()) {
        let coinDetailUrl = "https://api.coingecko.com/api/v3/coins/\(coinID)"
        
        guard let url = URL(string: coinDetailUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let coinDetail = try decoder.decode(CoinModel.self, from: data)
                
                
                completion(coinDetail)
            } catch {
            
                completion(nil)
            }
        }.resume()
    }
}
