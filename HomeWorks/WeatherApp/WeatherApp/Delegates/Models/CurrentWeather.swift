//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by aiga.bernane on 13/11/2023.
//

import Foundation

struct CurrentWeather:Codable{
    let location:Location
    let current:Current
}

