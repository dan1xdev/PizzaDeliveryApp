import SwiftUI
import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = [
        User(name: "Bob", email: "Bob@gmail.com", passw: "Bob12345"),
        User(name: "Alice", email: "Alice@gmail.com", passw: "Alice12345"),
        User(name: "A", email: "1", passw: "1")
    ]
    
    func registUser(name: String, email: String, passw: String) {
        users.append(User(name: name, email: email, passw: passw))
    }
}
