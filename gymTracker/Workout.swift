//
//  Workout.swift
//  gymTracker
//
//  Created by Oscar Hinojosa on 2/1/24.
//

import Foundation
import SwiftData

@Model
class Workout {
    var name: String
    var rep: Int
    var weight: Double
    var date:Date
    
    init(name: String = "Sample", rep: Int = 0, weight: Double = 0.0, date: Date = .now) {
        self.name = name
        self.rep = rep
        self.weight = weight
        self.date = date
    }
}
