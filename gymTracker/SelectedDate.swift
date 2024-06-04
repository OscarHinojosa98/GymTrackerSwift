//
//  SelectedDate.swift
//  gymTracker
//
//  Created by Oscar Hinojosa on 1/18/24.
//

import SwiftUI
import SwiftData



struct SelectedDate: View {
    @Environment(\.modelContext) var modelContext
    var value: Workout;
    @Query(sort: \Workout.name) var workouts : [Workout]
    
    private var nameTypes:[String]{
        Array(Set(workouts.map{ $0.name })).sorted()
    }
    
    var body: some View {
        NavigationStack(){
            VStack{
                HStack{
                    Spacer()
                    Text(String(value.date.formatted(date: .long, time: .omitted)))
                        .font(.title)
                    Spacer()
                    NavigationLink(destination: {NewWorkoutView(workout: Workout(name: "",rep: 0,weight: 0.0,date: value.date))}, label:
                    {
                      Image(systemName: "plus")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    })
                }
                .padding(.all)
                List{
                    ForEach(workouts.filter{
                        $0.date.formatted(date: .long, time: .omitted) == value.date.formatted(date: .long, time: .omitted)
                    }){ workout in

                        NavigationLink(destination:{EditWorkoutView(workout: workout)}){
                            VStack{
                                Text(workout.name)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                                HStack{
                                    Text("Weight: " + String(workout.weight))
                                        .font(.title)
                                    Spacer()
                                    Text("Reps " + String(workout.rep))
                                        .font(.title)
                                    Spacer()
                                }
                            }
                                }
                    }
                    
                    .onDelete(perform: deleteWorkouts)
                }
            }
        }
    }
    /*
    func names(workouts: [Workout]) -> [String]{
        var allNames = [String]()
        workouts.forEach{workout in
            if(!allNames.contains(workout.name)){
                allNames.append(workout.name)
            }
        }
        return allNames
    }
    
    
    func addWorkouts(){
        let set1 = Workout(name: "Squat", rep: 12, weight: 120.0, date: .now)
        let set2 = Workout(name: "Squat", rep: 11, weight: 120.0, date: .now)
        let set3 = Workout(name: "Squat", rep: 10, weight: 120.0, date: .now)
        
        modelContext.insert(set1)
        modelContext.insert(set2)
        modelContext.insert(set3)
    }
    */
    func deleteWorkouts(_ indexSet: IndexSet){
        for index in indexSet{
            let workout = workouts[index]
            modelContext.delete(workout)
        }
    }
}

#Preview {
    SelectedDate(value: Workout(name: "",rep: 1, weight: 0, date: Date.now))
}
