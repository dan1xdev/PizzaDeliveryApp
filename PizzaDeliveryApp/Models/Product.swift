import Foundation

struct Product: Codable, Identifiable{
    var id = UUID()
    var title: String
    var imageUrl: String
    var price: Int
    var desctipt: String
    var ordersCount: Int
    var isRecommend: Bool
}
