import SwiftUI
struct PiPath_Previews: PreviewProvider {
    static var previews: some View {
        PiPath()
    }
}


struct PiPath: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            withAnimation{
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                //                .stroke(style: StrokeStyle(lineWidth: 1))
                //                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                //                .fill(.red)
                    .fill(.pink.gradient, style: FillStyle(eoFill: true))
            }
            
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
            
            Button(action: {
                if petalOffset < 0 {
                    petalOffset = 40
                    petalWidth = 100
                } else {
                    petalOffset = -40
                    petalWidth = 0
                }
            }, label: {
                Text("Hi")
            })
        }
    }
}

struct Flower: Shape {
    //offset from center
    var petalOffset: Double = -20
    var petalWidth: Double = 10
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to our main path
            path.addPath(rotatedPetal)
        }
        return path
    }
}
