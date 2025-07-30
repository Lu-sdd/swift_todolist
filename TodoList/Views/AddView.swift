//
//  AddView.swift
//  TodoList
//
//  Created by Lu Han on 30/07/2025.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView{
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .padding(14)
        .navigationTitle("Add an Item ✍️")
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}
