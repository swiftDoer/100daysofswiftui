import SwiftUI
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}


struct CheckoutView: View {
   
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var alertError = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                
                Text("Your total cost is: \(order.cost, format: .currency(code: "usd"))")
                
                Button("Check out", action: {
                    Task {
                        await placeOrder()
                    }
                })
            }
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("Ok", action: {})
        } message: {
            Text(confirmationMessage)
        }
        .alert("Request error ", isPresented: $alertError) {
            Button("OK", action: {})
        } message: {
            Text("Please try again")
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            alertError = true
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
            
        } catch {
            print("Checkout failed.")
            alertError = true
        }
    }
}

