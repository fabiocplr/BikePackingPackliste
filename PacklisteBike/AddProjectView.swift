import SwiftUI

struct AddProjectView: View {
    @ObservedObject var projectManager: ProjectManager
    @State private var name = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                TextField("Packlisten-Name", text: $name)
            }
            .navigationTitle("Neue Packliste")
            .navigationBarItems(trailing:
                Button("Hinzufügen") {
                    if !name.isEmpty {
                        projectManager.addPacklist(name: name)
                        dismiss()
                    }
                }
            )
        }
    }
}
