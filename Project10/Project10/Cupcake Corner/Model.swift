import Foundation

//    @Published var orderViewModel : OrderModel = OrderModel()
/*
 why not struct?
 struct OrderModel: Identifiable {
     
     static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbox"]
     
     let id = UUID()
     var type = 0
     var quantity = 3
     
     var specialRequestEnabled = false
     var extraFrosting = false
     var addSprinkles = false
 }
 */



/*
 ORDER DETAILS:
 - amount of ordered cupcakes
 - what kind of cupcake
 - extra frosting?
 - sprinkles?
 - extra special customizations?: bool -> they can type what they want into textedior
 */




//ScrollView {
//    VStack {
//        AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//            ProgressView()
//        }
//        .frame(height: 233)
//
//        Text("Your total is \(order.cost, format: .currency(code: "USD"))")
//            .font(.title)
//
//        Button("Place Order", action: {})
//    }
//}
//.navigationTitle("Check out")
//.navigationBarTitleDisplayMode(.inline)
