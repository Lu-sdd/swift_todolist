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
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
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
            listViewModel.addItem(title: textFieldText)
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

#Preview {
    NavigationView{
        AddView()
            .environmentObject(ListViewModel())
    }
}
