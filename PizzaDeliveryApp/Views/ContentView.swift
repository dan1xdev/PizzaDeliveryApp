import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ProfileViewModel: UserViewModel
    @EnvironmentObject var CatalogViewModel: ProductViewModel
    @State private var isDarkMode = false
    @State var isAuthorized: Bool = false
    @State var isGuest: Bool = true
    var body: some View {
        if (isGuest == true) || (isAuthorized == true)  {
            TabView{
                CatalogView(isDarkMode: isDarkMode)
                        .tabItem{
                            VStack{
                                Text("Каталог")
                                Image(systemName: "list.bullet")
                            }
                        }
                        .environmentObject(ProfileViewModel)
                BasketView(viewModel: BasketViewModel.shared)
                    .tabItem{
                        VStack{
                            Text("Корзина")
                            Image(systemName: "cart")
                        }
                    }
                ProfileView(isAuthorized: $isAuthorized, isDarkMode: $isDarkMode, isGuest: $isGuest)
                        .tabItem{
                            VStack{
                                Text("Профиль")
                                Image(systemName: "person")
                            }
                        }
                        .environmentObject(ProfileViewModel)
            }
        }
        else{
            AuthView(isAuthorized: $isAuthorized, isGuest: $isGuest)
                .environmentObject(ProfileViewModel)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
        .environmentObject(ProductViewModel())
}
