//
//  MovieModel.swift
//  Movie2
//
//  Created by Ahmed Rady on 20/07/2024.
//

import Foundation
import SwiftUI


// MARK: - MovieModel
struct Result: Codable {
    let movies: [Movie]   // i rename results in json to movies

    enum CodingKeys: String, CodingKey {
        case movies = "results"  // change codingkey that matchess movies that i create to resultes in json
        
    }
}

// MARK: - Result
struct Movie: Codable , Identifiable{  //array of movies
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let voteAverage: Double
    let voteCount: Int
   
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
        
    }
    
    static var demo : Movie {
        return Movie(id: 1, originalTitle: "", overview: "", popularity: 1.1, posterPath: "", releaseDate: "", title: "", voteAverage: 1.1, voteCount: 1)
        // i make a dummy data to make preview stop screming and put it in movie cell view
    }
    
}




// MARK: - MovieDetail
struct MovieDetail: Codable {
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let runtime: Int
    let title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case budget, genres, homepage, id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case title
        case voteAverage = "vote_average"
    }
}
// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}




// MARK: - MovieTrailer
struct MovieTrailer: Codable {
    let id: Int
    let results: [Video]
    

}

// MARK: - Result
struct Video: Codable {
    let name, key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt, id: String

    enum CodingKeys: String, CodingKey {
        case name, key, size, type, official
        case publishedAt = "published_at"
        case id
        case site
        
    }
}


