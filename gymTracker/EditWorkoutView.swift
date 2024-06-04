//
//  EditWorkoutView.swift
//  gymTracker
//
//  Created by Oscar Hinojosa on 2/1/24.
//

import SwiftUI
import SwiftData

/// <#Description#>
struct EditWorkoutView:View {
    @Bindable var workout: Workout
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    //@State private var name:String = ""
    
    
    
    
    //@Binding var path = [Workout]()
    
    //init(workout:Workout){
    //   self.workout = workout
    //}
    var body: some View {
        NavigationStack(){
            Form{
                Text(workout.name)
                //HStack{
                TextField("Reps:", value:$workout.rep,format: .number)
                TextField("Weight:", value: $workout.weight, format: .number)
                //}
            }
            .navigationTitle("Edit Workout")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar(content: {
            Button("Done"){
                //let savedWorkout = workout
                //modelContext.insert(savedWorkout)
                dismiss()
            }
        })
        
    }
}



/*View {
    @Bindable var workout: Workout
    
    //@Binding var path = [Workout]()
    
    //init(workout:Workout){
    //   self.workout = workout
    //}
    var body: some View {
        Form{
                Text(workout.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //HStack{
                    TextField("Reps:", value:$workout.rep,format: .number)
                    TextField("Weight:", value: $workout.weight, format: .number)
                //}
        }
        .navigationTitle("Edit Workout")
        .navigationBarTitleDisplayMode(.inline)
    }*/


#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Workout.self, configurations: config)
        let example = Workout(name: "Sample Name", rep: 10, weight: 120.0, date: .now)
        
        return EditWorkoutView(workout: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to createmodel container")
    }
}
