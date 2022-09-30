import SwiftUI
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct MainView: View {
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Cupcake Type", selection: $order.type, content: {
                        ForEach(Order.types.indices) { item in //indices gives position of array
                            Text("\(Order.types[item])")
                        }
                    })
                    Stepper("Quantity: \(order.quantity)", value: $order.quantity, in: 3...20)
                } // SECTION 1 END
                
                Section("Extra") {
                    Toggle("Special Requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add Extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add Extra sprinkles", isOn: $order.addSprinkles)
                    }
                } // SECTION 2 END
                
                Section("Delivery Details") {
                    NavigationLink("Enter Address", destination: {
                        AdressView(order: order)
                    })
                } // SECTION 2 END
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

