import SwiftUI

struct BasketView: View {
    @ObservedObject var viewModel: BasketViewModel
    @State private var showOrderView = false

    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.positions) { position in
                    PositionView(position: position)
                        .swipeActions {
                            Button {
                                viewModel.positions.removeAll { $0.id == position.id }
                            } label: {
                                Text("Удалить")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
                .navigationTitle("Корзина")

                HStack {
                    Text("Итого: ")
                    Spacer()
                    Text("\(viewModel.cost) ₽")
                }
                .padding()

                HStack(spacing: 24) {
                    Button {
                        print("Отменить")
                    } label: {
                        Text("Отменить")
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(24)
                    }
                    .padding(.horizontal)

                    Button {
                        if !viewModel.positions.isEmpty {
                            showOrderView = true
                            
                        }
                    } label: {
                        Text("Заказать")
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(24)
                    }
                    .padding(.horizontal)
                }

            }
            .padding()
            .navigationDestination(isPresented: $showOrderView) {
                OrderView(viewModel: OrderViewModel(basketViewModel: viewModel))

            }
        }
    }
}
