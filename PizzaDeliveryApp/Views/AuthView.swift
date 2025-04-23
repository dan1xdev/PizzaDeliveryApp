import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
}


struct AuthView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State var temp_mail: String = ""
    @State var temp_pasw: String = ""
    @State var guard_temp_pasw: String = ""
    @State private var isRegistered = false
    @Binding var isAuthorized: Bool
    @State var wrongPassword: Bool = false
    @State private var selectedTag = 0
    @State var errorText: String = ""
    @Binding var isGuest: Bool
    
    @State private var text: String = ""
    var body: some View {
        NavigationStack{
            VStack {
                VStack(spacing: 5){
                    HStack{
                        Picker("Выберите вариант", selection: $selectedTag) {
                            Text("Авторизация").tag(0)
                            Text("Регистрация").tag(1)
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    Spacer()
                    TextField("", text: $temp_mail).placeholder(when: temp_mail.isEmpty){
                        Text("Почта")
                            .foregroundColor(.black)
                            .opacity(0.45)
                    }
                        .frame(width: 290, height: 20)
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(20)
                        .padding()

                    
                    SecureField("", text: $temp_pasw).placeholder(when: temp_pasw.isEmpty){
                        Text("Введите пароль")
                            .foregroundColor(.black)
                            .opacity(0.45)
                    }
                        .frame(width: 290, height: 20)
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(20)
                        .padding()
                    
                    
                    if selectedTag == 1{
                        SecureField("", text:
                                        $guard_temp_pasw).placeholder(when: guard_temp_pasw.isEmpty){
                            Text("Подтвердите пароль")
                                .foregroundColor(.black)
                                .opacity(0.45)
                        }
                        .frame(width: 290, height: 20)
                            .font(.title2)
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Color(.white))
                            .cornerRadius(20)
                            .padding()
                    }
                    if selectedTag == 0{
                        Text(wrongPassword ? "Неправильный логин или пароль" : "    ")
                            .foregroundColor(Color.red)
                            .bold()
                            .font(.title3)
                    }
                    if selectedTag == 1{
                        Text(errorText.isEmpty ? "    " : errorText)
                            .foregroundColor(Color.red)
                            .bold()
                            .font(.title3)
                    }
                    Spacer()
                    Button{
                        if selectedTag == 0{
                            if viewModel.users.contains(where: { $0.email == temp_mail && $0.passw == temp_pasw }) {
                                isAuthorized = true
                                isGuest = false
                            } else {
                                wrongPassword = true
                                temp_mail = ""
                                temp_pasw = ""
                            }
                        }
                        if selectedTag == 1{
                            if viewModel.users.contains(where: { $0.email == temp_mail }) {
                                errorText = "Почта уже занята"
                            } else {
                                if guard_temp_pasw == temp_pasw {
                                    viewModel.registUser(name: "", email: temp_mail, passw: temp_pasw)
                                    isAuthorized = true
                                    isGuest = false
                                }
                                else{
                                    errorText = "Пароли не совпадают"
                                }
                            }
                        }
                    }
                    label: {
                        Text(((selectedTag) == 1) ? "Создать" :"Войти")
                            .frame(width: 250)
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Color(.white))
                            .cornerRadius(10)
                            .foregroundColor(.white)
    
                        
                    }

                    .padding()
                }
                .frame(width: 350, height: 450)
                .background(.ultraThinMaterial.opacity(0.9))
                .cornerRadius(40)
                .shadow(radius: 90)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Image("bg").resizable()
                .ignoresSafeArea())
            
        }
    }
}
