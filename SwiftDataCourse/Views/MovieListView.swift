//
//  MovieListView.swift
//  SwiftDataCourse
//
//  Created by Martin Stofko on 8/9/23.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    let movies: [Movie]
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                HStack {
                    Text(movie.title)
                    Spacer()
                    Text(movie.year.description)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .onDelete(perform: deleteMovie)
        }
    }
    
    private func deleteMovie(indexSet: IndexSet) {
        for index in indexSet {
            let movie = movies[index]
            modelContext.delete(movie)
        }
        
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    MovieListView(movies: [])
        .modelContainer(for: [Movie.self])
}
