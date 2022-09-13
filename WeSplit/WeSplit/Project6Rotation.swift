import SwiftUI

struct Project6_Rotation: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hi!")
            
            Button("Tap me") {
                withAnimation {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
            
            ForEach(0..<3) { number in
                Button("Tab me \(number)"){
                    withAnimation {
                        animationAmount += 360
                    }
                }
                
            }
        }
    }
}

struct Project6_Rotation_Previews: PreviewProvider {
    static var previews: some View {
        Project6_Rotation()
    }
}

