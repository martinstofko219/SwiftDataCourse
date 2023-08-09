//
//  AddMovieScreen.swift
//  SwiftDataCourse
//
//  Created by Martin Stofko on 8/9/23.
//

import SwiftUI
import SwiftData

struct AddMovieScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var title: String = ""
    @State private var year: Int?
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace && year != nil
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Year", value: $year, format: .number)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add Movie")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        guard let year = year else { return }
                        addNewMovie(title: title, year: year)
                        dismiss()
                    }
                    .disabled(!isFormValid)
                }
            }
        }
    }
    
    private func addNewMovie(title: String, year: Int) {
        let movie = Movie(title: title, year: year)
        modelContext.insert(movie)
        
        // it's good practice to call save to ensure data is saved
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    NavigationStack {
        AddMovieScreen()
            .modelContainer(for: Movie.self)
    }
}
