//
//  Detail.swift
//  Movie2
//
//  Created by Ahmed Rady on 27/07/2024.
//

import Foundation
import SwiftUI

func getDetail(path : String) async throws -> String {
    guard let url = URL(string: path) else {
        throw ErrorHandeling.invaledUrl
    }
    
    let (data,response) = try await URLSession.shared.data(from: url)
    let str = String(decoding: data, as: UTF8.self)
    print(str)
    
    guard let response = response as? HTTPURLResponse  , response.statusCode == 200 else {
        throw ErrorHandeling.invaliidResponse
    }
    
    do{
        let decoder  = JSONDecoder()
        return try decoder.decode(String.self, from: data)
    } catch let error {
        print( "\(error)")
        throw ErrorHandeling.failedloadingData
    }
    
}

enum ErrorHandeling : Error {
case invaledUrl
case invaliidResponse
case failedloadingData
}
