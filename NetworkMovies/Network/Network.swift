//
//  Network.swift
//  Movie2
//
//  Created by Ahmed Rady on 20/07/2024.
//

import Foundation
import SwiftUI

// MARK: - fetch movies
func getData<T:Decodable>(path : String) async throws -> T {
    guard let url = URL(string: path) else {
        throw ErrorHandler.invaledUrl
    }
    
    let (data,response) = try await URLSession.shared.data(from: url)
    
    
    guard let response = response as? HTTPURLResponse  , response.statusCode == 200 else {
        throw ErrorHandler.invaliidResponse
    }
    
    do{
        let decoder  = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch let error {
        print( "\(error)")
        throw ErrorHandler.failedloadingData
    }
    
}

// MARK: - error handling
enum ErrorHandler : Error {
    case invaledUrl
    case invaliidResponse
    case failedloadingData
}


// MARK: - fetch movies detailes
func fetchMovieDetails(movieID: Int) async throws -> MovieDetail {
    let apiKey = "a3c8ca7436bec5d2e064fa4a503e7fa9#"
    let url = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(apiKey)"
    guard let url = URL(string: url) else {
        throw ErrorHandler.invaledUrl
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    do{
        let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
        return movieDetail
    }catch let error {
        print("\(error)")
        throw ErrorHandler.failedloadingData
    }
}



// MARK: - fetch movies video
func fetchMovieVideo(movieID:Int) async throws -> [Video] {
    let apiKey = "a3c8ca7436bec5d2e064fa4a503e7fa9#"
    let path = "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=\(apiKey)"
    
    guard let url = URL(string: path) else {
        throw ErrorHandler.invaledUrl
    }
    let (data , _) = try await URLSession.shared.data(from: url)
    //    let str = String(decoding: data, as: UTF8.self)
    //    print(str)
    
    do{
        let movieVideo = try JSONDecoder().decode(MovieTrailer.self, from: data)
        return movieVideo.results
    }catch let error {
        print("\(error)")
        throw ErrorHandler.failedloadingData
    }
}



// MARK: - fetch search value

//func SearchMovie (query : String) async throws -> [Movie] {
//    
//    let apiKey = "a3c8ca7436bec5d2e064fa4a503e7fa9#"
//    let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//    
//    let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(queryEncoded)")!
//    let(data , _) = try await URLSession.shared.data(from: url)
//    let str = String(decoding: data, as: UTF8.self)
//    print(str)
//    
//    let searchResult = try JSONDecoder().decode(Result.self, from: data)
//    return searchResult.movies
//    
//    
//}
