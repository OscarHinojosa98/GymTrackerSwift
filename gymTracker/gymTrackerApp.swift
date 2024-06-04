//
//  gymTrackerApp.swift
//  gymTracker
//
//  Created by Oscar Hinojosa on 1/18/24.
//

import SwiftUI
import SwiftData

@main
struct gymTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Workout.self)
    }
}
