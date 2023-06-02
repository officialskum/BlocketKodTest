import Foundation

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let owner: User
    // Add more properties as needed
    
    struct User: Codable {
        let login: String
        // Add more properties as needed
    }
}
