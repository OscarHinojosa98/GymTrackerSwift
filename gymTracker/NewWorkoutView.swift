//
//  NewWorkoutView.swift
//  gymTracker
//
//  Created by Oscar Hinojosa on 2/9/24.
//

import SwiftUI
import SwiftData

struct NewWorkoutView: View {
    @Bindable var workout: Workout
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingAlert = false
    
    //@State private var name:String = ""
    
    
    
    
    //@Binding var path = [Workout]()
    
    //init(workout:Workout){
    //   self.workout = workout
    //}
    var body: some View {
        NavigationStack(){
            Form{
                TextField("Name:", text:$workout.name)
                    
                TextField("Reps:", value:$workout.rep,format: .number)
                TextField("Weight:", value: $workout.weight, format: .number)
                
            }
            .navigationTitle("Edit Workout")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar(content: {
            Button("Save"){
                if (workout.name != ""){
                    let savedWorkout = workout
                    modelContext.insert(savedWorkout)
                    dismiss()
                }
                else{
                   showingAlert = true
                }
            }
            .alert("Enter workout name!", isPresented: $showingAlert, actions: {
                Button("OK", role: .cancel){}
            })
        })
        
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Workout.self, configurations: config)
        let example = Workout(name: "Sample Name", rep: 10, weight: 120.0, date: .now)
        
        return NewWorkoutView(workout: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to createmodel container")
    }
}
