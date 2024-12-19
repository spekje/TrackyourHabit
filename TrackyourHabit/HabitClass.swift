//
//  HabitClass.swift
//  TrackyourHabit
//
//  Created by Suzanne on 12/12/2024.
//

import Foundation

@Observable
class HabitClass: ObservableObject, Identifiable {
    var habits = [HabitStruct]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([HabitStruct].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
    
    
    func completedHabbit(habit: HabitStruct) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].completeDates.insert(getDate(), at: 0)

        }
    }
    
    func removeHabbit(habit: HabitStruct) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits.remove(at: index)
        }
    }
}



