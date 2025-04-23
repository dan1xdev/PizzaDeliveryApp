import Foundation

struct Position: Identifiable, Codable{
    var id: UUID = UUID()
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
}
