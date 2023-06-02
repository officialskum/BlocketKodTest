import SwiftUI

struct RepositoryListView: View {
    @State private var repositories: [Repository] = []

    var body: some View {
        List(repositories, id: \.id) { repository in
            Text(repository.name)
        }
        .onAppear(perform: fetchRepositories)
    }

    private func fetchRepositories() {
        // Make a request to the GitHub API
        // Use the access token for authentication
        // Parse the response and update the repositories array
    }
}

struct RepositoryDetailView: View {
    let repository: Repository

    var body: some View {
        VStack {
            Text(repository.name)
                .font(.title)
            Text(repository.description ?? "")
                .font(.subheadline)
            // Add more details as needed
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
