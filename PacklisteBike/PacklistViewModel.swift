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
 

