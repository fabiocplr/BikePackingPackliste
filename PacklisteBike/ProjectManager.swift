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
            PackItem(name: "Cappie", category: "Kleidung", quantity: 1, weightPerItem: 100, packed: false),
            PackItem(name: "T-Shirts", category: "Kleidung", quantity: 3, weightPerItem: 200, packed: false),
            PackItem(name: "Radelhose kurz", category: "Kleidung", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Radelshirt", category: "Kleidung", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Funktionshandtuch", category: "Kleidung", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Badehose / Sporthose", category: "Kleidung", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Pullover", category: "Kleidung", quantity: 2, weightPerItem: 300, packed: false),
            PackItem(name: "Lange Unterhose", category: "Kleidung", quantity: 1, weightPerItem: 300, packed: false),
            PackItem(name: "Thermo-Shirt", category: "Kleidung", quantity: 1, weightPerItem: 300, packed: false),
            PackItem(name: "Helm", category: "Kleidung", quantity: 1, weightPerItem: 300, packed: false),
            PackItem(name: "Unterhose", category: "Kleidung", quantity: 4, weightPerItem: 100, packed: false),
            PackItem(name: "Crocs", category: "Kleidung", quantity: 1, weightPerItem: 400, packed: false),
            PackItem(name: "Regenjacke", category: "Kleidung", quantity: 1, weightPerItem: 400, packed: false),
            PackItem(name: "Zip-Hose", category: "Kleidung", quantity: 1, weightPerItem: 500, packed: false),
            PackItem(name: "Rennrad-Schuhe", category: "Kleidung", quantity: 1, weightPerItem: 600, packed: false),
            PackItem(name: "Schuhe (klein, Leder)", category: "Kleidung", quantity: 1, weightPerItem: 800, packed: false),

            // Zelten
            PackItem(name: "Sommer-Schlafsack", category: "Zelten", quantity: 1, weightPerItem: 800, packed: false),
            PackItem(name: "Isomatte", category: "Zelten", quantity: 1, weightPerItem: 500, packed: false),
            PackItem(name: "Hängematte (Paracord, keine Karabiner)", category: "Zelten", quantity: 1, weightPerItem: 700, packed: false),
            PackItem(name: "Kleines Kopfkissen (Therm-a-Rest)", category: "Zelten", quantity: 1, weightPerItem: 250, packed: false),
            PackItem(name: "Plane", category: "Zelten", quantity: 1, weightPerItem: 400, packed: false),
            PackItem(name: "Heringe", category: "Zelten", quantity: 6, weightPerItem: 50, packed: false),
            PackItem(name: "Zelt", category: "Zelten", quantity: 1, weightPerItem: 1660, packed: false),
            PackItem(name: "Zeltstangen", category: "Zelten", quantity: 1, weightPerItem: 0, packed: false),
            PackItem(name: "Tarp", category: "Zelten", quantity: 0, weightPerItem: 600, packed: false),
            PackItem(name: "Mini-Bodenplane", category: "Zelten", quantity: 1, weightPerItem: 300, packed: false),

            // Equipmentap
            PackItem(name: "Angelhaken", category: "Equipment", quantity: 2, weightPerItem: 50, packed: false),
            PackItem(name: "AirPods", category: "Equipment", quantity: 1, weightPerItem: 40, packed: false),
            PackItem(name: "Apple Watch", category: "Equipment", quantity: 1, weightPerItem: 60, packed: false),
            PackItem(name: "Geld", category: "Equipment", quantity: 1, weightPerItem: 10, packed: false),
            PackItem(name: "Handy", category: "Equipment", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Lightning-Kabel", category: "Equipment", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "USB-C-Kabel", category: "Equipment", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "Micro-USB-Kabel", category: "Equipment", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "Apple Watch-Kabel", category: "Equipment", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "Weed", category: "Equipment", quantity: 1, weightPerItem: 5, packed: false),
            PackItem(name: "Bittl Spanngurte", category: "Equipment", quantity: 3, weightPerItem: 300, packed: false),
            PackItem(name: "AirTag", category: "Equipment", quantity: 1, weightPerItem: 10, packed: false),
            PackItem(name: "Akkuboxen", category: "Equipment", quantity: 3, weightPerItem: 400, packed: false),
            PackItem(name: "Erste-Hilfe-Set", category: "Equipment", quantity: 1, weightPerItem: 500, packed: false),
            PackItem(name: "Trinkflaschen (mit Wasser)", category: "Equipment", quantity: 3, weightPerItem: 1200, packed: false),
            PackItem(name: "Kindle", category: "Equipment", quantity: 1, weightPerItem: 300, packed: false),
            PackItem(name: "Feuerzeug", category: "Equipment", quantity: 1, weightPerItem: 30, packed: false),
            PackItem(name: "Taschenlampe", category: "Equipment", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Mini-Rucksack", category: "Equipment", quantity: 1, weightPerItem: 500, packed: false),
            PackItem(name: "Tasse / Schüssel", category: "Equipment", quantity: 1, weightPerItem: 300, packed: false),
            PackItem(name: "Schnur (hochwertiges Paracord)", category: "Equipment", quantity: 1, weightPerItem: 100, packed: false),
            PackItem(name: "Schleifstein (Victorinox)", category: "Equipment", quantity: 1, weightPerItem: 150, packed: false),
            PackItem(name: "Baggie", category: "Equipment", quantity: 1, weightPerItem: 10, packed: false),
            PackItem(name: "Sonnenbrille", category: "Equipment", quantity: 1, weightPerItem: 150, packed: false),
            PackItem(name: "Besteck / Teller / Spork", category: "Equipment", quantity: 1, weightPerItem: 300, packed: false),
            PackItem(name: "Leatherman", category: "Equipment", quantity: 1, weightPerItem: 350, packed: false),
            PackItem(name: "Taschenmesser", category: "Equipment", quantity: 1, weightPerItem: 500, packed: false),
            PackItem(name: "Gaffa", category: "Equipment", quantity: 1, weightPerItem: 100, packed: false),
            PackItem(name: "Kabelbinder", category: "Equipment", quantity: 1, weightPerItem: 100, packed: false),
            PackItem(name: "Ziplock-Bags", category: "Equipment", quantity: 4, weightPerItem: 50, packed: false),


            // Fahrrad
            PackItem(name: "Wahoo", category: "Fahrrad", quantity: 1, weightPerItem: 100, packed: false),
            PackItem(name: "Rücklicht", category: "Fahrrad", quantity: 1, weightPerItem: 150, packed: false),
            PackItem(name: "Flicken-Kit", category: "Fahrrad", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "Multitool", category: "Fahrrad", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Schlauch", category: "Fahrrad", quantity: 1, weightPerItem: 250, packed: false),
            PackItem(name: "Pumpe", category: "Fahrrad", quantity: 1, weightPerItem: 300, packed: false),

            // Kosmetik
            PackItem(name: "Klopapier", category: "Kosmetik", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Zahnbürsten-Hülle", category: "Kosmetik", quantity: 1, weightPerItem: 20, packed: false),
            PackItem(name: "Sonnencreme", category: "Kosmetik", quantity: 1, weightPerItem: 150, packed: false),
            PackItem(name: "Shampoo", category: "Kosmetik", quantity: 1, weightPerItem: 200, packed: false),
            PackItem(name: "Gesichtscreme", category: "Kosmetik", quantity: 1, weightPerItem: 100, packed: false),
            PackItem(name: "Oropax", category: "Kosmetik", quantity: 1, weightPerItem: 10, packed: false),
            PackItem(name: "Schmerzmittel", category: "Kosmetik", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "Kohletabletten", category: "Kosmetik", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "Handwaschmittel", category: "Kosmetik", quantity: 1, weightPerItem: 150, packed: false),
            PackItem(name: "Haarwachs (im Döschen)", category: "Kosmetik", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "Pinzette", category: "Kosmetik", quantity: 1, weightPerItem: 30, packed: false),
            PackItem(name: "Rasierer", category: "Kosmetik", quantity: 1, weightPerItem: 100, packed: false),
            PackItem(name: "Kamm", category: "Kosmetik", quantity: 1, weightPerItem: 40, packed: false),
            PackItem(name: "Deo", category: "Kosmetik", quantity: 1, weightPerItem: 150, packed: false),
            PackItem(name: "Zahnbürste", category: "Kosmetik", quantity: 1, weightPerItem: 50, packed: false),
            PackItem(name: "Zahnpasta", category: "Kosmetik", quantity: 1, weightPerItem: 100, packed: false)
            ]

    }
}
