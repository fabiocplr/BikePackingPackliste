import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PackListViewModel
    @State private var editingItem: PackItem?
    @State private var showingAddItem = false

    var body: some View {
        NavigationView {
            List {
                
                ForEach(viewModel.groupedItems.keys.sorted(), id: \.self) { category in
                    Section(header: Text(category).font(.headline)) {
                        ForEach(viewModel.groupedItems[category] ?? []) { item in
                            HStack {
                                Text("\(item.quantity)x \(item.name)")
                                    .strikethrough(item.packed)
                                    .onTapGesture { editingItem = item }

                                Spacer()
                                Text("\(item.totalWeight)g")

                                Button(action: { viewModel.togglePacked(id: item.id) }) {
                                    Image(systemName: item.packed ? "checkmark.square.fill" : "square")
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                        .onDelete { indices in
                            viewModel.items.remove(atOffsets: indices)
                        }
                    }
                }

                
                Section {
                    HStack {
                        Text("Gesamtgewicht:")
                            .font(.headline)
                        Spacer()
                        Text("\(viewModel.totalWeight)g")
                            .font(.headline)
                    }
                }
            }
            .navigationTitle(viewModel.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddItem = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddItem) {
                AddItemView(viewModel: viewModel)
            }
            .sheet(item: $editingItem) { item in
                EditItemView(viewModel: viewModel, item: Binding(
                    get: { item },
                    set: { updatedItem in
                        if let index = viewModel.items.firstIndex(where: { $0.id == updatedItem.id }) {
                            viewModel.items[index] = updatedItem
                        }
                    }
                ))
            }
        }
    }
}
