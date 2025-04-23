import Foundation
struct User: Identifiable{
    var id = UUID()
    var name: String
    var email: String
    var passw: String
}
