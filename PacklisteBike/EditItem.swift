import SwiftUI

struct EditItemView: View {
    @ObservedObject var viewModel: PackListViewModel
    @Binding var item: PackItem
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String
    @State private var selectedCategory: String
    @State private var quantityText: String
    @State private var weightText: String

    init(viewModel: PackListViewModel, item: Binding<PackItem>) {
        self.viewModel = viewModel
        self._item = item
        self._name = State(initialValue: item.wrappedValue.name)
        self._selectedCategory = State(initialValue: item.wrappedValue.category)
        self._quantityText = State(initialValue: "\(item.wrappedValue.quantity)")
        self._weightText = State(initialValue: item.wrappedValue.weightPerItem != nil ? "\(item.wrappedValue.weightPerItem!)" : "")
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Kategorie", selection: $selectedCategory) {
                    ForEach(["Kleidung", "Zelten", "Equipment", "Fahrrad", "Kosmetik"], id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Anzahl", text: $quantityText)
                    .keyboardType(.numberPad)
                
                TextField("Gewicht pro Stück (g)", text: $weightText)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Item bearbeiten")
            .navigationBarItems(trailing:
             Button("Speichern") {
                if let quantity = Int(quantityText) {
                        let updatedItem = PackItem(
                            id: item.id,
                            name: name,
                            category: selectedCategory,
                            quantity: quantity,
                            weightPerItem: Int(weightText),
                            packed: item.packed
                        )
                        item = updatedItem  // ✅ Binding direkt überschreiben!
                }
                dismiss()
            }
            )
        }
    }
}
