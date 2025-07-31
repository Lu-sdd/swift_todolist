//
//  ListView.swift
//  TodoList
//
//  Created by Lu Han on 30/07/2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("TodoList📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                HStack {
                    Button(action: {
                        isDarkMode.toggle()
                    }) {
                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                    }
                    NavigationLink("Add", destination: AddView())
                }
        )
    }
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}
