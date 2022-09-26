import SwiftUI
struct MoreDrawing_Previews: PreviewProvider {
    static var previews: some View {
        MoreDrawing()
    }
}


struct MoreDrawing: View {
    var body: some View {
        VStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                .frame(width: 300, height: 300)
//                .background(.white.gradient)
//            .border(.red, width: 30)
            
//            Text("Hello World")
//                .frame(width: 300, height: 300)
//                .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0.15, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            
//            Text("Hello World")
//                .frame(width: 300, height: 300)
//                .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0.05, y: 0.1, width: 1, height: 1), scale: 0.1), width: 30)
            
            
            Circle()
                .fill(ImagePaint(image: Image("Example")))
            
            Circle()
                .fill(ImagePaint(image: Image("Example"), scale: 0.5))
            
//
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Example"), scale: 1.4), lineWidth: 50)
                .frame(width: 300, height: 200)

            
//            Image("Example")
//                .frame(width: 300, height: 300)
            
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Example"), scale: 2), width: 50)
                .font(.largeTitle)
        }
    }
}

