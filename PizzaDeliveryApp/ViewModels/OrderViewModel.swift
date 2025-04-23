import Foundation

class OrderViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var address: String = ""
    @Published var isSending: Bool = false
    @Published var isOrderSent: Bool = false
    @Published var showError: Bool = false

    let basketViewModel: BasketViewModel

    init(basketViewModel: BasketViewModel) {
        self.basketViewModel = basketViewModel
    }

    func isFormValid() -> Bool {
        return !name.isEmpty && !phone.isEmpty && !address.isEmpty
    }

    func sendOrder() {
        guard isFormValid() else {
            showError = true
            return
        }

        isSending = true
        showError = false

        let token = "token"
        let chatID = "chatid"

        var message = "🛒 Новый заказ:\n"
        for pos in basketViewModel.positions {
            message += "\n• \(pos.product.title) - \(pos.cost)₽"
        }
        message += "\n\n💰 Итого: \(basketViewModel.cost)₽"
        message += "\n\n👤 Имя: \(name)\n📞 Телефон: \(phone)\n📍 Адрес: \(address)"

        let urlString = "https://api.telegram.org/bot\(token)/sendMessage"
        guard let url = URL(string: urlString) else { return }

        let body: [String: Any] = [
            "chat_id": chatID,
            "text": message
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isSending = false
                if let error = error {
                    print("Ошибка: \(error.localizedDescription)")
                    self?.showError = true
                } else {
                    print("Заказ отправлен")
                    self?.isOrderSent = true
                    self?.basketViewModel.positions.removeAll()
                }
            }
        }
        task.resume()
    }
}

