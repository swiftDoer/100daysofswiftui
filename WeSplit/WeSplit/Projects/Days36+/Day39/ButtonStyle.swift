import SwiftUI
struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleCool()
    }
}


//struct BlueButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .background(Color(red: 0, green: 0, blue: 0.5))
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//    }
//}
extension View {
    
    func withPressableStyle(scaleAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(GrowingButton(scaleAmount: scaleAmount))
    }
}

struct GrowingButton: ButtonStyle {
    
    let scaleAmount: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
                // BUFFET
            .scaleEffect(configuration.isPressed ? scaleAmount : 1)
                // SELECT-POI-COME-CLOSER-POI
//            .scaleEffect(configuration.isPressed ? 1.2 : 1)
                //CONFIRM-SEND-AWAY-POI
//            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct ButtonStyleCool: View {
    
    @State private var isPressed = false
    @State private var scaleValue = 1.2
    
    var body: some View {
//        Button(action: {
//            isPressed.toggle()
//        }, label: {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
////                .foregroundColor(.white)
////                .padding()
////                .background(Color(red: 0, green: 0, blue: 0.5))
////                .clipShape(Capsule())
//                .padding()
//                           .background(.blue)
//                           .foregroundColor(.white)
//                           .clipShape(Capsule())
//                           .scaleEffect(isPressed ? scaleValue : 1)
//                           .animation(.easeOut(duration: 0.2), value: isPressed)
//        })
//        .buttonStyle(.bordered)
        
        HStack(spacing: 40) {
            Button(action: {
                isPressed.toggle()
            }, label: {
    //            Text(isPressed ? "Hi" : "Bye")
                Text("SELECT-POI")
            })
            .buttonStyle(GrowingButton(scaleAmount: 1.2))
            Button(action: {
                isPressed.toggle()
            }, label: {
    //            Text(isPressed ? "Hi" : "Bye")
                Text("SUBMIT-POI")
            })
//            .buttonStyle(GrowingButton(scaleAmount: 0.8))
            .withPressableStyle(scaleAmount: 0.8)
            
        }
    }
}

