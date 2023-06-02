import Foundation

class DataManager: ObservableObject {
    @Published var repositories: [Repository] = []
    static let shared = DataManager()
    
    
    init() {
        
    }
    
    private func fetchRepositories() {
        // Make a request to the GitHub API
        // Use the access token for authentication
        
        guard let url = URL(string: "https://api.github.com/user/repos") else {
            return
        }
        
        var request = URLRequest(url: url)
        //request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let repositories = try JSONDecoder().decode([Repository].self, from: data)
                    DispatchQueue.main.async {
                        self.repositories = repositories
                    }
                } catch {
                    print("Error decoding repositories:", error)
                }
            }
        }.resume()
    }
    
    
}
