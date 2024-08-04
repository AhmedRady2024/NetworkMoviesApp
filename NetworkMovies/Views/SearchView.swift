//
//  SearchView.swift
//  Movie2
//
//  Created by Ahmed Rady on 28/07/2024.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(text: $viewModel.query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(40)
                    

                if viewModel.query.isEmpty {
                    Text("Type to search for movies")
                        .foregroundColor(.gray)
                        .padding()
                } else if viewModel.movies.isEmpty {
                    Text("No movies found")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.movies) {
                        movie in
                        NavigationLink(destination: DetailesView(movieID: movie.id)) {
                            HStack {
                                if let posterPath = movie.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)") {
                                    KFImage(url)
                                        .resizable()
                                        .frame(width: 75, height: 100)
                                        .cornerRadius(8)
                                }
                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                        .font(.headline)
                                        .foregroundColor(.accentColor)
                                }
                            }
                        }
                    }.listStyle(.grouped)
                }
            }
            Spacer()
            .navigationTitle("Searching...")
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


