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
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    guard let year = year else { return }
                    
                    let movie = Movie(title: title, year: year)
                    modelContext.insert(movie)
                    
                    // it's good practice to call save to ensure data is saved
                    do {
                        try modelContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                .disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddMovieScreen()
            .modelContainer(for: Movie.self)
    }
}
