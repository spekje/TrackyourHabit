//
//  addHabit.swift
//  TrackyourHabit
//
//  Created by Suzanne on 14/12/2024.
//

import SwiftUI

struct addHabit: View {
    @Environment(\.dismiss) var dismiss
    @FocusState private var textfieldFocused: Bool

    @State private var habitName = ""
    @State private var habitDescription = ""

    @State var showAlert = false
        
    @ObservedObject var habits : HabitClass

    var body: some View {
            VStack(alignment: .leading) {
                VStack {
                    Text("Habit:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("habit name", text: $habitName)
                        .onLongPressGesture(minimumDuration: 0.0) {
                            textfieldFocused = true
                        } // should help with warnings in Xcode when using Simulator
                    Text("Description:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Description", text: $habitDescription, axis: .vertical)
                        .focused($textfieldFocused)
                        .onLongPressGesture(minimumDuration: 0.0) {
                            textfieldFocused = true
                        }  // should help with warnings in Xcode when using Simulator
                        .onSubmit(of: .text, {
                            habitDescription.append("\n")
                            textfieldFocused = true // Return focus to the TextField
                        }) // this onSubmit helps to keep focus on field when user press return key
                }
                .padding(20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            } // end Vstack
            .backGroundStyle()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("cancel") {
                        dismiss()
                    }
                } // Toolbaritem cancel
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        checkInput()
                        if(!showAlert) {
                            let newHabit = HabitStruct(name: habitName, discription: habitDescription, completeDates: ["Added on: \n \(getDate())"])
                            habits.habits.append(newHabit)
                            dismiss()
                        }
                    } // end save button
                    .alert("Error", isPresented: $showAlert) {
                        Button("OK") { }
                    } message: {
                        Text("Please enter text in both fields")
                    }
                } // ToolbarItem Save
            } // end toolbar
            .navigationBarBackButtonHidden()
            . navigationBarTitle("Add new", displayMode: .inline)
    } //end Body
    
    func checkInput() {
        //lets make user the user has insert a name and description
        if habitName.count == 0 || habitDescription.count == 0 {
            showAlert = true
        }
    }
    
}

#Preview {
    addHabit(habits: HabitClass())
}
