import SwiftUI


struct PackItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var category: String
    var quantity: Int
    var weightPerItem: Int?
    var packed: Bool

    var totalWeight: Int {
        return (weightPerItem ?? 0) * quantity
    }
}

// ViewModel für eine einzelne Packliste
class PackListViewModel: ObservableObject, Identifiable {
    let id = UUID() // Eindeutige ID für jede Packliste
    @Published var name: String
    @Published var items: [PackItem]

    init(name: String, items: [PackItem] = []) {
        self.name = name
        self.items = items
    }
    var groupedItems: [String: [PackItem]] {
            Dictionary(grouping: items, by: { $0.category })
        }
    
    func addItem(name: String, category: String, quantity: Int, weightPerItem: Int?) {
        let newItem = PackItem(name: name, category: category, quantity: quantity, weightPerItem: weightPerItem, packed: false)
        items.append(newItem)
    }

    func togglePacked(id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].packed.toggle()
        }
    }
    var totalWeight: Int {
        items.reduce(0) { $0 + $1.totalWeight }
    }

}

