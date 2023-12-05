//
//  CoinModel.swift
//  CryptoWallet
//
//  Created by aiga.bernane on 29/11/2023.
//

import Foundation

struct CoinModel: Codable {
    let id: String?
    let symbol: String?
    let name: String?
    let image: String?
    var currentPrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image, currentPrice = "current_price"
    }
    
   // init(id: String?, symbol: String?, name: String?, image: String?, currentPrice: Double?) {
      // self.id = id
      //  self.symbol = symbol
        //self.name = name
       // self.image = image
        //self.currentPrice = currentPrice
   // }
}


