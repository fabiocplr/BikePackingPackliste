import SwiftUI

class ProjectManager: ObservableObject {
    @Published var packlists: [PackListViewModel] = []

    init() {
        loadPacklists()
    }

    func loadPacklists() {
        if packlists.isEmpty {
            let fabiosPacklist = PackListViewModel(name: "Fabios Packliste")
            fabiosPacklist.items = loadFabiosPackliste()
            packlists.append(fabiosPacklist)
        }
    }

    func addPacklist(name: String) {
        let newPacklist = PackListViewModel(name: name)
        packlists.append(newPacklist)
    }

    func deletePacklist(at offsets: IndexSet) {
        packlists.remove(atOffsets: offsets)
    }

    private func loadFabiosPackliste() -> [PackItem] {
        return [
            // Kleidung
            PackItem(name: "Radsocken", category: "Kleidung", quantity: 1, weightPerItem: 70, packed: false),
            PackItem(name: "Socken", category: "Kleidung", quantity: 3, weightPerItem: 70, packed: false),


            // Zelten
            PackItem(name: "Sommer-Schlafsack", category: "Zelten", quantity: 1, weightPerItem: 800, packed: false),
            PackItem(name: "Isomatte", category: "Zelten", quantity: 1, weightPerItem: 500, packed: false),


            // Equipmentap
            PackItem(name: "Angelhaken", category: "Equipment", quantity: 2, weightPerItem: 50, packed: false),
            


            // Fahrrad
            PackItem(name: "Wahoo", category: "Fahrrad", quantity: 1, weightPerItem: 100, packed: false),


            // Kosmetik
           
            PackItem(name: "Zahnbürste", category: "Kosmetik", quantity: 1, weightPerItem: 50, packed: false),

            ]

    }
}
