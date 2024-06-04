//
//  ContentView.swift
//  gymTracker
//
//  Created by Oscar Hinojosa on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    //@State private var path = [Date]()
    @State private var date = Date()
    //@State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(){
            VStack {
                
                Text("GYM TRACKER")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .fontDesign(.serif)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
                
                
                Text("Choose Workout Date")
                    .font(.title2)
                    .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                
                
                DatePicker(
                    "Select Workout Date",
                    selection: $date,
                    displayedComponents: [.date])
                .datePickerStyle(.graphical)
                Spacer()
                HStack{
                    Spacer()
                    
                    NavigationLink(destination: {SelectedDate(value: Workout(name: "Hello",rep: 0, weight: 0, date: $date.wrappedValue))},label:{
                        /*Button("Sign In", systemImage: "arrow.right", action:{
                            let exaWorkout = Workout(name: "",rep: 0, weight: 0, date: $date.wrappedValue)
                            path.append(exaWorkout)})
                             .labelStyle(.iconOnly)
                             .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                             .padding(.all)*/
                        Image(systemName: "arrow.right")
                     .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                     .labelStyle(.iconOnly)
                     .padding(.all)
                     })
                     
                }
            }
        }
        
    }
    

}

#Preview {
    ContentView()
}

//{SelectedDate(value:String(date.formatted(date: .long, time: .omitted)))}
