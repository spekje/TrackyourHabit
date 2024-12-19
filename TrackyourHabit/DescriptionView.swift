//
//  DescriptionView.swift
//  TrackyourHabit
//
//  Created by Suzanne on 14/12/2024.
//

import SwiftUI

struct DescriptionView: View {
    @ObservedObject var habitclass: HabitClass
    @Environment(\.dismiss) var dismiss
    
    @State private var removeHabit = false
    @State private var completeHabit = false
    
    
    var habits: HabitStruct
    
    var body: some View {
        VStack {   //VStack1
            VStack {  //VStack2
                Text(habits.name)
                    .font(.largeTitle.weight(.bold))
            } // end Vstack2
            
            GeometryReader { proxy in
                ScrollView {
                    Text(habits.discription)
                } // end ScrollView
                .frame(maxWidth: .infinity, maxHeight: proxy.size.height * 1, alignment: .leading)
                .padding(20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 25))
            } //end GeomtryReader
            
            VStack {
                HStack {
                    Button("\(habits.name) \ncompleted"){
                        completeHabit = true
                    }
                    .buttonStylingGreen()
                    
                    VStack {
                        Text("Total completed:")
                        Text("\(getCurrentAmount(amount: habits.completeDates.count))")
                    } // end Vstack
                } // end HStack
            } // end Vstack
            ScrollView {
                ForEach(habits.completeDates, id: \.self) { completed in
                    Text(completed)
                }
            } // end ScrollView
            .padding(20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 25))
        } // end VStack1
        .backGroundStyle()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Back") {
                    dismiss()
                }
            } // end Toolbaritem back
            
            ToolbarItem(placement: .destructiveAction) {
                Button("remove") {
                    removeHabit = true
                }
            }
        } // end Toolbar
        .alert("Remove \(habits.name)?", isPresented: $removeHabit) {
            Button("Remove", role: .destructive) {
                habitclass.removeHabbit(habit: habits)
                dismiss()
            }
        }
        .alert("Completed \(habits.name)?", isPresented: $completeHabit) {
            Button("cancel") {}
            Button("Yes") {
                habitclass.completedHabbit(habit: habits)
                
            }
        }
    } // end body
    
    func getCurrentAmount(amount: Int) -> Int {
        let totalAmount = amount - 1
        
        return totalAmount
    }
}

#Preview {
    ContentView()
}
