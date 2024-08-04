//
//  DetailesView.swift
//  Movie2
//
//  Created by Ahmed Rady on 25/07/2024.
//

import SwiftUI
import Kingfisher
import AVKit
import WebKit

struct DetailesView: View {
    @State var movieDetails: MovieDetail?
    @State var trailers : [Video] = []
    @State var isViewed = false
    
    let imageBaseUrl = "https://image.tmdb.org/t/p/w500/"
    let movieID: Int
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false){
            
            VStack(spacing: 10){
                if let url = URL(string: imageBaseUrl + (movieDetails?.posterPath ?? "")) {
                    KFImage(url)
                        .placeholder {
                            ProgressView()
                        }.renderingMode(.original)
                        .resizable()
                        .frame(height: 500)
                }
                VStack(alignment: .center){
                    Text(movieDetails?.title ?? "" )
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    
                    HStack(alignment: .center){
                        Image(systemName: "calendar.circle.fill")
                            .foregroundColor(.accentColor)
                        Text(movieDetails?.releaseDate ?? "" )
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundColor(.accentColor)
                        Text(String(format: "%0.1f",(movieDetails?.voteAverage ?? "")))
                            .foregroundColor(.gray)
                    }.frame(maxWidth: 290)
                }.padding()//first vstack
                
                VStack(alignment: .leading){
                    HStack(){
                        Text("Genres:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        ForEach(movieDetails?.genres ?? [], id: \.id) {
                            item in
                            Text("\(item.name) -")
                        }
                    }.padding(.vertical,1)
                    
                    HStack{
                        Text("Runtime :").foregroundColor(.accentColor).font(.title2).fontWeight(.bold)
                        Text("\(movieDetails?.runtime ?? 0) minutes")
                        Image(systemName: "timer").font(.subheadline).foregroundColor(.gray)
                    }.padding(.vertical,1)
                    HStack{
                        Text("Budget:").foregroundColor(.accentColor).font(.title2).fontWeight(.bold)
                        Text(" $\(movieDetails?.budget ?? 0)")
                    }.padding(.vertical,1)
                    
                    Text("OverView :")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    Text(movieDetails?.overview ?? "")
                        .lineLimit(isViewed ? 15 : 3)
                    Button(isViewed ? "Read Less" : "Read More" ) {
                        isViewed.toggle()
                    }.font(.system(size: 15, weight: .semibold))
                }.padding(.vertical)   //second vstack
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Trailers:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .foregroundColor(.accentColor)
                    
                    ForEach(trailers.prefix(2), id: \.id) {
                        trailer in
                        if trailer.site == "YouTube" {
                            YouTubeView(videoID: trailer.key)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .padding(.bottom, 10)
                        }
                    }
                }.padding(.vertical) // third VStack
                
                GroupBox{
                    HStack{
                        Image(systemName: "globe")
                        Text("Movie Website:")
                        Group {
                            if let homepage = movieDetails?.homepage, let url = URL(string: homepage) {
                                Link(movieDetails?.title ?? "", destination: url)
                                Spacer()
                                Image(systemName: "link")
                            }
                            
                        }.foregroundColor(.accentColor)
                    }
                }.padding(.horizontal,10)
                    .cornerRadius(20)
                Spacer()
            } //main vstack
            
        }.edgesIgnoringSafeArea(.top)   //main scrolview
        
            .task {
                do {
                    self.movieDetails = try await fetchMovieDetails(movieID: movieID)
                    self.trailers     = try await fetchMovieVideo(movieID: movieID)
                } catch let error {
                    print("\(error)")
                }
            }
    }
}

struct DetailesView_Previews: PreviewProvider {
    static var previews: some View {
        DetailesView(movieID: 0)
    }
}
