import SwiftUI

struct ProjectManagerView: View {
    @StateObject private var projectManager = ProjectManager()
    @State private var showingAddProject = false

    var body: some View {
        NavigationView {
            List {
                ForEach(projectManager.packlists) { packlist in
                    NavigationLink(destination: ContentView(viewModel: packlist)) {
                        Text(packlist.name)
                    }
                }
                .onDelete { indexSet in
                    projectManager.deletePacklist(at: indexSet)
                }
            }
            .navigationTitle("Packlisten")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddProject = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddProject) {
                AddProjectView(projectManager: projectManager)
            }
        }
    }
}
