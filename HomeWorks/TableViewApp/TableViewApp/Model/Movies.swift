//
//  Movies.swift
//  TableViewApp
//
//  Created by aiga.bernane on 29/10/2023.
//

import Foundation

struct Movie {
    
    let movieTitles: String
    let imageNames: String
    let movieGenres: String
    let releaseYears: Int
    let descriptions: String
    let movieTrailerUrls: String
    
    static func createMovie() -> [Movie] {
        var movies: [Movie] = []
        let titles = DataManager.shared.movieTitles
        let images = DataManager.shared.imageNames
        let genre = DataManager.shared.movieGenres
        let releaseYear = DataManager.shared.releaseYears
        let descriptions = DataManager.shared.descriptions
        let movieTrailers = DataManager.shared.movieTrailerUrls
        
        for i in 0..<titles.count {
            
            let movie = Movie(movieTitles: titles[i], imageNames: images[i], movieGenres: genre[i], releaseYears: releaseYear[i], descriptions: descriptions[i], movieTrailerUrls: movieTrailers[i])
            movies.append(movie)
        }
        return movies
    }
    
}
