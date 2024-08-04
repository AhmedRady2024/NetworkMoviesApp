//
//  ContentView.swift
//  Movie2
//
//  Created by Ahmed Rady on 20/07/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            MovieView().tabItem{
                Text("Movies")
                Image(systemName: "house")
            }
            
            SearchView().tabItem{
                Text("Search")
                Image(systemName: "magnifyingglass.circle.fill")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
