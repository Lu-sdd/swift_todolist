import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    let item: ItemModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
                .font(.title2)
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .strikethrough(item.isCompleted)
                    .foregroundColor(item.isCompleted ? .gray : .primary)
                if let deadline = item.deadline {
                    Text(dateTimeFormatter.string(from: deadline))
                        .font(.caption)
                        .foregroundColor(deadlineColor(deadline))
                }
            }
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
    
    private func deadlineColor(_ deadline: Date) -> Color {
        if item.isCompleted { return .gray }
        let now = Date()
        if deadline < now {
            return .red
        } else if Calendar.current.isDate(deadline, inSameDayAs: now) || (deadline.timeIntervalSince(now) <= 24*60*60) {
            return .orange
        } else {
            return .secondary
        }
    }
    
    private var dateTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}

#Preview {
    VStack {
        let item1 = ItemModel(title: "First item", isCompleted: false, deadline: Date().addingTimeInterval(3600))
        let item2 = ItemModel(title: "Second item", isCompleted: true, deadline: Date().addingTimeInterval(3600*24*2))
        let item3 = ItemModel(title: "Overdue", isCompleted: false, deadline: Date().addingTimeInterval(-3600))
        
        ListRowView(item: item1)
            .environmentObject(ListViewModel())
        ListRowView(item: item2)
            .environmentObject(ListViewModel())
        ListRowView(item: item3)
            .environmentObject(ListViewModel())
    }
    .previewLayout(.sizeThatFits)
}

