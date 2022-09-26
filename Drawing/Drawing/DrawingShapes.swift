import SwiftUI
struct DrawingShapes_Previews: PreviewProvider {
    static var previews: some View {
        DrawingShapes()
    }
}

// Shapes are meant for reuseability
struct DrawingShapes: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Rektangle()
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .fill(.red.gradient)
                .frame(width: 300, height: 200)
            
            Triangle()
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .fill(.green.gradient)
                .frame(width: 300, height: 100)
            
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
//                .strokeBorder(.blue, lineWidth: 10)
                .stroke(style: StrokeStyle(lineWidth: 10))
                .fill(.blue.gradient)
                .frame(width: 100, height: 100)
            
            
            HStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 50))
                    .fill(.orange.gradient)
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 50, dash: [0.1,3], dashPhase: 2))
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 50, dash: [11,10]))
                    .fill(.brown.gradient)
            
            } .frame(height: 60)
            
            
        }
    }
}


struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount = 0.0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
}




struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}


struct Rektangle: InsettableShape {
    
    var insetAmount = 0.0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var inset = self
        inset.insetAmount += amount
        return inset
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}
