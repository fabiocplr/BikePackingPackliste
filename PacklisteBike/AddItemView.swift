import SwiftUI

struct AddItemView: View {
    @ObservedObject var viewModel: PackListViewModel
    @State private var name = ""
    @State private var category = "Kleidung"
    @State private var quantity = ""
    @State private var weightPerItem = "" 
    @Environment(\.dismiss) var dismiss

    let categories = ["Kleidung", "Zelten", "Equipment", "Fahrrad", "Kosmetik"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Kategorie", selection: $category) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Anzahl", text: $quantity)
                    .keyboardType(.numberPad)

                TextField("Gewicht pro Stück (optional, g)", text: $weightPerItem)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Neuer Gegenstand")
            .navigationBarItems(trailing:
                Button("Hinzufügen") {
                    if let q = Int(quantity), !name.isEmpty {
                        let w = Int(weightPerItem) ?? nil // Falls leer, bleibt nil
                        viewModel.addItem(name: name, category: category, quantity: q, weightPerItem: w)
                        dismiss()
                    }
                }
            )
        }
    }
}
