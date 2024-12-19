//
//  HabitStruct.swift
//  TrackyourHabit
//
//  Created by Suzanne on 12/12/2024.
//

import Foundation

struct HabitStruct: Codable, Equatable, Hashable, Identifiable {
    var id = UUID()
    let name: String
    let discription: String
    var completeDates: [String]
}
