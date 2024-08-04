//
//  MovieCellView.swift
//  Movie2
//
//  Created by Ahmed Rady on 20/07/2024.
//

import SwiftUI
import Kingfisher

struct MovieCellView: View {
    @State var movie : Movie
    let imageBaseUrl = "https://image.tmdb.org/t/p/w500/" // for image base url that add to posterpath from json
    var body: some View {
        VStack(alignment: .center){
            if let url = URL(string: imageBaseUrl + (movie.posterPath )) {
                KFImage(url)
                    .placeholder {
                        ProgressView()   // for showing loading mark in image view
                    }.renderingMode(.original)
                    .resizable()
                    .frame(maxWidth: 250,maxHeight: 330)
                    .cornerRadius(30)
            }
            
            VStack(spacing: 10){
                Text(movie.originalTitle )
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                HStack(alignment: .center){
                    Image(systemName: "calendar.circle.fill")
                        .foregroundColor(.accentColor)
                    Text(movie.releaseDate )
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.accentColor)
                    Text(String(format: "%1.2f",(movie.voteAverage )))
                         .foregroundColor(.gray)
                }.padding([.leading, .bottom, .trailing])
            }
        }.frame(maxWidth: 240,maxHeight: 390)
        
        
//            .task {  ----> this forr test one element in json file to make sure that the url is working and get                            the response and data back
//                do{
//                    // i prepare a var (result) that its kind from big struct (Result) and it calls function..
//                    //and save return value in it
//                    let result : Result =  try await getData(path: "https://api.themoviedb.org/3/movie/upcoming?api_key=a3c8ca7436bec5d2e064fa4a503e7fa9")
//                    movie = result.movies.first!
//                    // here i show the first element in movies array by calling the value of func (result) and the array of movies (movies) and its first elemen(first)
//                    
//                }catch let error {
//                    print("\(error)")
//                }
//            }
        
        
    }
}


struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(movie: .demo)
    }
}
