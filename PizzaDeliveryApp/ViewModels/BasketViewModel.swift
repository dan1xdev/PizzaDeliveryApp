import Foundation
import SwiftUI


class BasketViewModel: ObservableObject{
    static let shared = BasketViewModel()
    private init(){}
    @Published var positions: [Position] = []
    var cost: Int{
        var sum = 0
        for pos in positions{
            sum += pos.cost
        }
        return sum
    }
    func addPosition(_ position: Position){
        self.positions.append(position)
    }
}
