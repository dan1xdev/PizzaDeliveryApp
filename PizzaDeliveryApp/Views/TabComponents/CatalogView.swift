//
//  MainMenu.swift
//  PizzaDeliveryApp
//
//  Created by Даниил Кискин on 05.01.2025.
//

import SwiftUI
struct CatalogView: View {
    var isDarkMode: Bool
    @EnvironmentObject var CatalogViewModel: ProductViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ForEach(CatalogViewModel.products){ item in
                ProductView(product: item)
                    .environmentObject(CatalogViewModel)
                    
                
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
        .environmentObject(ProductViewModel())
}

