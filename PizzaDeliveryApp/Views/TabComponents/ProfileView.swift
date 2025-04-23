//
//  SettingsView.swift
//  PizzaDeliveryApp
//
//  Created by Даниил Кискин on 05.01.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var ProfileViewModel: UserViewModel
    @Binding var isAuthorized: Bool
    @Binding var isDarkMode: Bool
    @Binding var isGuest: Bool
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
            Text("Вы вошли, как \(!isAuthorized ? "Гость" : "Даниил")")
                .bold()
                .font(.title)
                Spacer()
            }
            VStack(alignment: .leading){
                Text("Адрес доставки: ")
                    .bold()
                Text("Россия, Москва, Манежная улица, д. 122, кв. 78")
            }
            .padding()
            Spacer()
            HStack{
                Spacer()
                Button(!isAuthorized ? "Вход в аккаунт" : "Выйти из аккаунта") {
                    if isAuthorized == true {
                        isAuthorized = false
                        isGuest = true
                    }
                    else{
                        isAuthorized = false
                        isGuest = false
                    }
                }
                .font(.body)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .font(.title)
                .background(!isAuthorized ? Color.green : Color.red)
                .cornerRadius(24)
                Spacer()
            }
            .padding()
            

            }
        .padding()
        }
    }

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
        .environmentObject(ProductViewModel())
}
