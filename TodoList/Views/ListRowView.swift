import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    VStack {
        let item1 = ItemModel(title: "First item", isCompleted: false)
        let item2 = ItemModel(title: "Second item", isCompleted: true)
        
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    .previewLayout(.sizeThatFits)
}

