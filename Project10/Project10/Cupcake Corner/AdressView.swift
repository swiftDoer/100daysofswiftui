import SwiftUI
struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        AdressView(order: Order())
    }
}


struct AdressView: View {
    
    @ObservedObject var order: Order
    
       var body: some View {
           Form {
               Section("Information") {
                   TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)

               }
               Section(order.hasWhiteSpace ? "Please remove white space" : "") {
                   NavigationLink("Check out", destination: {
                       CheckoutView(order: order)
                   })
               } .disabled(order.hasValidAdress == false)
           }
           .navigationTitle("Delivery details")
           .navigationBarTitleDisplayMode(.inline)
       }
   }

