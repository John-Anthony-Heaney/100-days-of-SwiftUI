//
//  Student.swift
//  Bookworm
//
//  Created by John Anthony Heaney on 27/11/2024.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id:UUID, name: String) {
        self.id = id
        self.name = name
    }
}

