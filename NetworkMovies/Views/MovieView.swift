//
//  MovieView.swift
//  Movie2
//
//  Created by Ahmed Rady on 22/07/2024.
//

import SwiftUI

struct MovieView: View {
    @State var upcomingMovies   : [Movie] = []
    @State var popularMovies    : [Movie] = []
    @State var topRatedMovies   : [Movie] = []
    @State var nowPlayingMovies : [Movie] = []
    var body: some View {
        NavigationStack{
             
            ScrollView(.vertical){
                Text("Upcoming")
                   .fontWeight(.bold)
                   .font(.title)
                   .foregroundColor(.accentColor)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(upcomingMovies) {
                            item in
                            NavigationLink {
                                DetailesView(movieID: item.id)
                            } label: {
                                MovieCellView(movie: item)
                            }
                        }
                    }
                }
                
                
                Text("Popular")
                   .fontWeight(.bold)
                   .font(.title)
                   .foregroundColor(.accentColor)
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(popularMovies) {
                            item in
                            NavigationLink {
                                DetailesView(movieID: item.id)
                            } label: {
                                MovieCellView(movie: item)
                            }
                        }
                    }
                }
                
                Text("Top Rated")
                   .fontWeight(.bold)
                   .font(.title)
                   .foregroundColor(.accentColor)
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(topRatedMovies) {
                            item in
                            NavigationLink {
                                DetailesView(movieID: item.id)
                            } label: {
                                MovieCellView(movie: item)
                                
                            }
                        }
                    }
                }
                
                Text("Now Playing")
                   .fontWeight(.bold)
                   .font(.title)
                   .foregroundColor(.accentColor)
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(nowPlayingMovies) {
                            item in
                            NavigationLink {
                                DetailesView(movieID: item.id)
                            } label: {
                                MovieCellView(movie: item)
                            }
                        }
                    }
                }
            }.task {
                do{
                    
                    let upcomingResults : Result =  try await getData(path: "https://api.themoviedb.org/3/movie/upcoming?api_key=a3c8ca7436bec5d2e064fa4a503e7fa9")
                    upcomingMovies = upcomingResults.movies
                    
                    let popularResults : Result = try await getData(path: "https://api.themoviedb.org/3/movie/popular?api_key=a3c8ca7436bec5d2e064fa4a503e7fa9#")
                    popularMovies = popularResults.movies
                    
                    let topRatedResultes : Result = try await getData(path: "https://api.themoviedb.org/3/movie/top_rated?api_key=a3c8ca7436bec5d2e064fa4a503e7fa9#")
                    topRatedMovies = topRatedResultes.movies
                    
                    let nowPlayingResultes : Result = try await getData(path: "https://api.themoviedb.org/3/movie/now_playing?api_key=a3c8ca7436bec5d2e064fa4a503e7fa9#")
                    nowPlayingMovies = nowPlayingResultes.movies
                    
                }catch let error {
                    print("\(error)")
                }
            }
            .navigationTitle("Movies")
        
//            .navigationBarBackButtonHidden()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
