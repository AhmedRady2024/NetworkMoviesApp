//
//  SearchParView.swift
//  Movie2
//
//  Created by Ahmed Rady on 29/07/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @State private var isEditing = false

    var body: some View {
        HStack {
            TextField("Search for a movie", text: $text)
                .padding(10)
                .padding(.horizontal, 25)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
}
