//
//  Movie.swift
//  SwiftDataCourse
//
//  Created by Martin Stofko on 8/9/23.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var year: Int
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}
