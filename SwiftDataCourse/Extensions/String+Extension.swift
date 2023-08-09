//
//  String+Extension.swift
//  SwiftDataCourse
//
//  Created by Martin Stofko on 8/9/23.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
}
