//
//  PizzaDeliveryAppApp.swift
//  PizzaDeliveryApp
//
//  Created by Даниил Кискин on 04.01.2025.
//

import SwiftUI

@main
struct PizzaDeliveryAppApp: App {
    @StateObject var AuthViewModel = UserViewModel()
    @StateObject var CatalogViewModel = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel)
                .environmentObject(CatalogViewModel)
        }
    }
}
