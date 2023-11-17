//
//  Country.swift
//  RestCountries
//
//  Created by aiga.bernane on 15/11/2023.
//

import Foundation


struct Name:Codable
{
    let common, official: String?
    
}

struct Country:Codable{
    let name: Name
   let region: String?
let subregion: String?
}


