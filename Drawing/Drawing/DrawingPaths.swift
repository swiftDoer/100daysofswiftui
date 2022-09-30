import SwiftUI
struct Drawing_Previews: PreviewProvider {
    static var previews: some View {
        NewMain()
    }
}



struct NewMain: View {
    
    @State var thing = 10.0
    @State private var colorRectangle = 0.0
    
    var body: some View {
        VStack {
            
            ColorRectanglingRectangle(amount: colorRectangle)
                .frame(width: 300, height: 200)

            Slider(value: $colorRectangle)
//            GeometryReader { geometry in
                Arrow(lineWidth: thing)
                .frame(height: 300)
                    .animation(.default, value: thing)
                    .onTapGesture {
                        withAnimation {
                            thing = Double.random(in: 0...1) * 100
                        }
                    }
                    
            
//            }
            Slider(value: $thing, in: 0...100)
            
            
            HStack {
                Button(action: {
                    thing += 10
                }, label: {
                    Text("Up")
                        .frame(width: 30, height: 50)
                        .background(.green.gradient)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                
                Button(action: {
                    thing -= 10
                }, label: {
                    Text("Down")
                        .frame(width: 50, height: 50)
                        .background(.red.gradient)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                
                Button(action: {
                    thing = Double.random(in: 0...1) * 100
                }, label: {
                    Text("Random")
                        .frame(width: 70, height: 50)
                        .background(.blue.gradient)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Text("Left")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width * 0.33)
                        .background(.yellow)
                    Text("Right")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width * 0.33)
                        .background(.orange)
                    Text("Righter")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width * 0.34)
                        .background(.yellow)
                }
            }
            .frame(height: 50)
        }
    }
}



struct Arrow: View {
    
    var lineWidth = 10.0
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 200))
            path.addLine(to: CGPoint(x: 150, y: 200))
            path.addLine(to: CGPoint(x: 150, y: 300))
            path.addLine(to: CGPoint(x: 250, y: 300))
            path.addLine(to: CGPoint(x: 250, y: 200))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 200, y: 100))
  
        }
        .stroke(.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
//        .fill(.blue.gradient)
        
    }
    }


struct Drawing: View {
    var body: some View {

        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))

        }
//        .stroke(.blue, lineWidth: 10)
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//        .fill(.blue)
        
    }
}

struct ColorRectanglingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Rectangle()
                    .inset(by: Double(value))
//                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
