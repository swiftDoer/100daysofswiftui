import SwiftUI
struct MoarDrawing_Previews: PreviewProvider {
    static var previews: some View {
        MoarDrawing()
    }
}


struct MoarDrawing: View {
    var body: some View {
        AvatarView(name: "Example")
    }
}

struct AvatarView: View {
    let name: String
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 175)
                .clipShape(Hexagon(sideLength: 0.2))
                
//
            HisView()
            Hexagon()
            Hexagon2()
            HexagonPointFiveAttempt()
        }
        
    }
}

struct HisView: View {
    var sideLength: CGFloat = 0.2
    var sideLength2: CGFloat {
        1 - sideLength
    }
    
    var body: some View {
        Path { path in
            let width: CGFloat = 200
            let height: CGFloat = 200
            
            path.move(
                to: CGPoint(
                    x: sideLength * width,
                    y: 0 * height
                )
            )

            path.addLine(
                to: CGPoint(
                    x: sideLength2 * width,
                    y: 0 * height)
            )

            path.addLine(
                to: CGPoint(
                    x: 1 * width,
                    y: 0.5 * height)
            )
            
            path.addLine(
                to: CGPoint(
                    x: sideLength2 * width,
                    y: 1 * height)
            )
            
            path.addLine(
                to: CGPoint(
                    x: sideLength * width,
                    y: 1 * height)
            )
            
            path.addLine(
                to: CGPoint(
                    x: 0 * width,
                    y: 0.5 * height)
            )

            path.closeSubpath()
        }
        .stroke(Color.pink, lineWidth: 1)
    }
}

struct HexagonPointFiveAttempt: View {
    
    var sideLength: CGFloat = 0.2
    var sideLength2: CGFloat {
        1 - sideLength
    }
    
    var body: some View {
        Path { path in
            let width: CGFloat = 200
            let height: CGFloat = 200
            
            path.move(to: CGPoint(x: width * sideLength, y: height * 0))
            path.addLine(to: CGPoint(x: width * 0, y: height * 0.5 ))
            path.addLine(to: CGPoint(x: width * sideLength, y: height * 1))
            path.addLine(to: CGPoint(x: width * sideLength2, y: height * 1))
            path.addLine(to: CGPoint(x: width * 1, y: height * 0.5 ))
            path.addLine(to: CGPoint(x: width * sideLength2, y: height * 0))
            
            path.closeSubpath()
        }
        .stroke(Color.green, lineWidth: 10)
    }
}


struct Hexagon: Shape {
    var sideLength: CGFloat = 0.15
    var sideLength2: CGFloat {
        1 - sideLength
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
//            let width: CGFloat = 200
//            let height: CGFloat = 200
            let width: CGFloat = rect.width
            let height: CGFloat = rect.height
            
            path.move(to: CGPoint(x: width * 0, y: height * 0.5))
            path.addLine(to: CGPoint(x: width * sideLength, y: height * 1))
            path.addLine(to: CGPoint(x: width * sideLength2, y: height * 1))
            path.addLine(to: CGPoint(x: width * 1, y: height * 0.5 ))
            path.addLine(to: CGPoint(x: width * sideLength2, y: height * 0))
            path.addLine(to: CGPoint(x: width * sideLength, y: height * 0))
            
            path.closeSubpath()
        }
    }
}


struct Hexagon2: View {
    var sideLength: CGFloat = 0.2
    var sideLength2: CGFloat {
        1 - sideLength
    }
    
    var body: some View {
        Path { path in
            let width: CGFloat = 200
            let height: CGFloat = 200
            
            path.move(to: CGPoint(x: width * 0.5, y: height * 0))
            path.addLine(to: CGPoint(x: width * 0, y: sideLength * height))
            path.addLine(to: CGPoint(x: width * 0, y: sideLength2 * height))
            path.addLine(to: CGPoint(x: width * 0.5, y: height * 1))
            path.addLine(to: CGPoint(x: width * 1, y: sideLength2 * height))
            path.addLine(to: CGPoint(x: width * 1, y: sideLength * height))
            
            path.closeSubpath()
        }
        .stroke(Color.blue, lineWidth: 10)
    }
}
























struct MyKyara: View {
    var body: some View {
//        Path { path in
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: 0, y: 50))
//        }
        Path { path in
            let width: CGFloat = 200
            let height: CGFloat = 200
            // 1
            path.move(
                to: CGPoint(
                    x: 0 * width,
                    y: 1 * height)
            )
            // 2
            path.addLine(
                to: CGPoint(
                    x: 1 * width,
                    y: 1 * height)
            )
            // 3
            path.addLine(
                to: CGPoint(
                    x: 0.5 * width,
                    y: 0 * height)
            )
            // 4
            path.closeSubpath()
        }
        .stroke(Color.pink, lineWidth: 1)
    }
}
