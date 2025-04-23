//
//  ProductView.swift
//  PizzaDeliveryApp
//
//  Created by Даниил Кискин on 05.01.2025.
//

import SwiftUI


struct ProductView: View {
    @EnvironmentObject var ProfileViewModel: UserViewModel
    var product: Product
    @State private var isModalPresented = false
    var body: some View {
        HStack(alignment: .top) {
            Image("ph").resizable().scaledToFit()
                .padding(.leading, -20)
            VStack(alignment: .leading) {
                Text(product.title)
                    .bold()
                    .font(.title)
                Text(product.desctipt)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .frame(width: 200, alignment: .leading)
                Spacer()
                Text("от \(product.price) ₽")
                    .padding(7)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).opacity(0.1))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .padding()
        .fixedSize()
        .onTapGesture {
                            isModalPresented = true
            
                        }
        .sheet(isPresented: $isModalPresented) {
            ProductDetailView(product: product)
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(UserViewModel())
        .environmentObject(ProductViewModel())
}
