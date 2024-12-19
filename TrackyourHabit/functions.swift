//
//  functions.swift
//  TrackyourHabit
//
//  Created by Suzanne on 14/12/2024.
//

import Foundation

func getDate() -> String {
    let currentDate = Date.now
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE d MMMM y, HH:mm:ss"
    
    let dateFormatted = formatter.string(from: currentDate)
    return(dateFormatted)
}
