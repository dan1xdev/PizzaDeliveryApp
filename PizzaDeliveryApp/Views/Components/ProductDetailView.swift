import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @EnvironmentObject var CatalogViewModel: ProductViewModel
    @State var size = "Средняя"
    @State var count = 1

    func roundToPrettyPrice(_ price: Int) -> Int {
        if price < 1000 {
            return (price / 50) * 50 + 49 // Округляем до вида 849, 899
        } else {
            return (price / 100) * 100 + 99 // Округляем до вида 1099, 1199
        }
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "Маленькая": return product.price
        case "Средняя": return Int(Double(product.price) * Double(1.25))
        case "Большая": return Int(Double(product.price) * Double(1.5))
        default:
            return product.price
        }
    }
    
    var body: some View {
        VStack {
            Image("ph")
                .resizable()
                .scaledToFit()
            
            Text("\(product.title)")
                .bold()
                .font(.largeTitle)
            
            Text("\(product.desctipt)")
                .frame(maxWidth: 350)
                .foregroundColor(.secondary)
            
            // Отображаем цену, основанную на размере
            Text("\(roundToPrettyPrice(getPrice(size: size))) ₽")
                .bold()
                .font(.largeTitle)
                .padding()
            
            Picker("Размеры пиццы", selection: $size) {
                ForEach(CatalogViewModel.sizes, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            HStack {
                Stepper("Количество", value: $count, in: 0...10)
                    .font(.title2)
                    .bold()
                
                TextField("", text: Binding(
                                               get: {
                                                   String(count) // Преобразуем Int в String
                                               },
                                               set: { newValue in
                                                   if let intValue = Int(newValue) { // Преобразуем String в Int
                                                       count = intValue
                                                   }
                                               }
                                           ))
                                           .font(.title2)
                                           .bold()
                                           .keyboardType(.numberPad) // Показываем только числовую клавиатуру
                                           .frame(width: 50, alignment: .trailing)
            }
            .padding()
            
            Button {
                let updatedPrice = roundToPrettyPrice(getPrice(size: size)) // Получаем актуальную цену
                let updatedProduct = Product(
                    title: product.title,
                    imageUrl: product.imageUrl,
                    price: updatedPrice, // Присваиваем актуальную цену
                    desctipt: product.desctipt,
                    ordersCount: product.ordersCount,
                    isRecommend: product.isRecommend
                )
                
                // Добавляем позицию с актуальной ценой в корзину
                let position = Position(product: updatedProduct, count: count)
                BasketViewModel.shared.addPosition(position)
            } label: {
                Text("Добавить в корзину")
                    .font(.title2)
                    .bold()
                    .padding()
                    .foregroundColor(Color.white)
            }
            .frame(width: 290, height: 60)
            .background(Color.green)
            .cornerRadius(30)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    ProductDetailView(product: Product(title: "Пепперони", imageUrl: "", price: 849, desctipt: "Томатный соус, колбаса, сыр, огурцы, помидоры, грибы, майонез, елка", ordersCount: 1, isRecommend: true))
        .environmentObject(ProductViewModel())
}
