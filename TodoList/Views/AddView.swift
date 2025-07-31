//
//  AddView.swift
//  TodoList
//
//  Created by Lu Han on 30/07/2025.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var deadline: Date? = nil
    @State var showDatePicker: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action: { showDatePicker.toggle() }) {
                    HStack {
                        Image(systemName: "calendar")
                        if let deadline = deadline {
                            Text(deadline, formatter: dateFormatter)
                        } else {
                            Text("Select the deadline")
                        }
                    }
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(10)
                }
                if showDatePicker {
                    DatePicker(
                        "",
                        selection: Binding(get: {
                            deadline ?? Date()
                        }, set: { newValue in
                            deadline = newValue
                        }),
                        displayedComponents: [.date, .hourAndMinute] // 支持日期和时间
                    )
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                }
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
        }
        .padding(14)
        .navigationTitle("Add an Item ✍️")
        .alert("Error", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text("Please enter a todo item!")
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText, deadline: deadline)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            showAlert = true
            return false
        }
        return true
    }
}

private var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}

#Preview {
    NavigationView{
        AddView()
            .environmentObject(ListViewModel())
    }
}
