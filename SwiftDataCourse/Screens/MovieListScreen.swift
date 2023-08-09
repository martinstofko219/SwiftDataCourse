//
//  MovieListScreen.swift
//  SwiftDataCourse
//
//  Created by Martin Stofko on 8/9/23.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    
    @State private var isAddMoviePresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                MovieListView(movies: movies)
                
                if movies.isEmpty {
                    Text("Movie list is empty!")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Movie List")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Movie") {
                        isAddMoviePresented = true
                    }
                }
            })
            .sheet(isPresented: $isAddMoviePresented, content: {
                AddMovieScreen()
            })
        }
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: Movie.self)
    }
}
