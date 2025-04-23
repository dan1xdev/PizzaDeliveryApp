import SwiftUI
import Foundation


class ProductViewModel: ObservableObject {
    @Published var sizes = ["Маленькая", "Средняя", "Большая"]
    @Published var products: [Product] = [
        Product(title: "Пепперони", imageUrl: "", price: 849, desctipt: "томатный соус, колбаса, сыр, огурцы, помидоры, грибы, майонез, елка", ordersCount: 1, isRecommend: true),
        Product(title: "Маргарита", imageUrl: "", price: 1099, desctipt: "сыр, томатный соус, помидоры, майонез, огурцы", ordersCount: 1, isRecommend: true),
        Product(title: "Цезарь", imageUrl: "", price: 999, desctipt: "томатный соус, колбаса, сыр, огурцы, помидоры", ordersCount: 1, isRecommend: true),
        Product(title: "Четыре сыра", imageUrl: "", price: 799, desctipt: "томатный соус, колбаса, сыр, огурцы, помидоры", ordersCount: 1, isRecommend: true),
        Product(title: "Четыре мяса", imageUrl: "", price: 1099, desctipt: "томатный соус, колбаса, сыр, огурцы, помидоры", ordersCount: 1, isRecommend: true),
        Product(title: "Пепперони", imageUrl: "", price: 849, desctipt: "томатный соус, колбаса, сыр, огурцы, помидоры", ordersCount: 1, isRecommend: true),
        Product(title: "Пепперони", imageUrl: "", price: 849, desctipt: "томатный соус, колбаса, сыр, огурцы, помидоры", ordersCount: 1, isRecommend: true),
        Product(title: "Пепперони", imageUrl: "", price: 849, desctipt: "томатный соус, колбаса, сыр, огурцы, помидоры", ordersCount: 1, isRecommend: true),
        
    ]
    
}
