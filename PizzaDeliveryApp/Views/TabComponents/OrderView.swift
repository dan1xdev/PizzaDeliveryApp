import SwiftUI

struct OrderView: View {
    @StateObject var viewModel: OrderViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Оформление заказа")
                .font(.largeTitle)
                .bold()

            TextField("Имя", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Телефон", text: $viewModel.phone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.phonePad)

            TextField("Адрес доставки", text: $viewModel.address)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if viewModel.showError {
                Text("❗Пожалуйста, заполните все поля")
                    .foregroundColor(.red)
            }

            if viewModel.isSending {
                ProgressView("Отправка...")
            } else {
                Button(action: {
                    viewModel.sendOrder()
                }) {
                    Text("Отправить заказ")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }

            Spacer()
        }
        .padding()
        .alert(isPresented: $viewModel.isOrderSent) {
            Alert(
                title: Text("Спасибо!"),
                message: Text("Ваш заказ успешно отправлен в пиццерию 🎉"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
