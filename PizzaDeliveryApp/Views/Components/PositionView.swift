//
//  PositionView.swift
//  PizzaDeliveryApp
//
//  Created by Даниил Кискин on 08.01.2025.
//

import SwiftUI

struct PositionView: View {
    
    var position: Position
    
    
    var body: some View {
        HStack{
            Text(position.product.title)
                .bold()
                .font(.headline)
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.cost) ₽")
                .frame(width: 85, alignment: .trailing)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PositionView(position: Position(product: Product(title: "Пепперони", imageUrl: "", price: 849, desctipt: "томатный соус, колбаса, сыр, огурцы, помидоры, грибы, майонез, елка", ordersCount: 1, isRecommend: true), count: 4))
}
