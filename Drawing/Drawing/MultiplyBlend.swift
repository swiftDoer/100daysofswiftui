import SwiftUI
struct MultiplyBlend_Previews: PreviewProvider {
    static var previews: some View {
        MultiplyBlend()
    }
}


struct MultiplyBlend: View {
    @State private var amount = 0.0
//    var animatableData: Double {
//        get { amount }
//        set { amount = newValue }
//    }
    var body: some View {
        
        VStack {
//            Image("Example")
//                .colorMultiply(.yellow)
            
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
//                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
                .onTapGesture {
                    withAnimation {
                        amount = Double.random(in: 0...1)
                    }
                }
            
            Button("Jump", action: {
                withAnimation {
                    amount = Double.random(in: 0...1)
                }
            })
            
//                   ZStack {
//                       Circle()
////                           .fill(.red)
//                           .fill(Color(red: 1, green: 0, blue: 0))
//                           .frame(width: 200 * amount)
//                           .offset(x: -50, y: -80)
//                           .blendMode(.screen)
//
//                       Circle()
////                           .fill(.green)
//                           .fill(Color(red: 0, green: 1, blue: 0))
//                           .frame(width: 200 * amount)
//                           .offset(x: 50, y: -80)
//                           .blendMode(.screen)
//
//                       Circle()
//                           .fill(Color(red: 0, green: 0, blue: 1))
////                           .fill(.blue)
//                           .frame(width: 200 * amount)
//                           .blendMode(.screen)
//                   }
//                   .frame(width: 300, height: 300)
//            Button("Bush", action: {
//                if amount < 0.1 {
//                    amount += 1.0
//                } else {
//                    amount = 0
//                }
//            })

                   Slider(value: $amount)
                       .padding()
               }
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .background(.black)
               .ignoresSafeArea()
        
    }
}

