import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
                .font(.title2)
            Text(item.title)
                .strikethrough(item.isCompleted)
                .foregroundColor(item.isCompleted ? .gray : .primary)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                listViewModel.toggleCompletion(item: item)
            }
        }
    }
}

#Preview {
    VStack {
        let item1 = ItemModel(title: "First item", isCompleted: false)
        let item2 = ItemModel(title: "Second item", isCompleted: true)
        
        ListRowView(item: item1)
            .environmentObject(ListViewModel())
        ListRowView(item: item2)
            .environmentObject(ListViewModel())
    }
    .previewLayout(.sizeThatFits)
}

