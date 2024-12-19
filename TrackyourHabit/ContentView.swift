//
//  ContentView.swift
//  TrackyourHabit
//
//  Created by Suzanne on 12/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var habits = HabitClass()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(habits.habits) { item in
                        NavigationLink(value: item) {
                            //works not like I want
                            Text(item.name)
                                .buttonStylingGreen()
                        }
                        NavigationLink {
                            //works like I want
                                DescriptionView(habitclass: habits, habits: item)
                        } label: {
                            Text(item.name)
                        }
                        
                    }
                } //VStack end
            } // end ScrollView
            .backGroundStyle()
            .navigationDestination(for: HabitStruct.self) { habit in
                DescriptionView(habitclass: habits, habits: habit)
            }
            .navigationTitle("Track your habit")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        addHabit(habits: habits)
                    } label : {
                     Text("Add new")
                    }
                } //end Toolbaritem

            } //end Toolbar
        } // end NavigationStack
    } // end body
}

#Preview {
    ContentView()
}
