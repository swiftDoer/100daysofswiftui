import SwiftUI
struct FramesDames_Previews: PreviewProvider {
    static var previews: some View {
        FramesDames()
    }
}


struct FramesDames: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 150)
            .background(.red)
            .frame(height: 30)
            .background(.blue)
            .overlay(alignment: .topLeading, content: {
                Rectangle().fill(.ultraThinMaterial)
                    .frame(width: 30, height: 50)
                    .cornerRadius(25)
                    .rotationEffect(Angle(degrees: 25))
                    .scaleEffect(1.5)
            })
            .overlay(alignment: .topTrailing, content: {
                Rectangle().fill(.ultraThinMaterial)
                    .frame(width: 30, height: 90)
                    .cornerRadius(25)
                    .rotationEffect(Angle(degrees: 25))
                    .scaleEffect(1.8)
                    .tint(.cyan)
            })
            .overlay(alignment: .top, content: {
                Rectangle().fill(.ultraThinMaterial)
                    .frame(width: 30, height: 90)
                    .cornerRadius(25)
                    .rotationEffect(Angle(degrees: 25))
                    .scaleEffect(2.5)
                
            })
            .overlay(alignment: .topLeading, content: {
                Rectangle().fill(.teal)
                    .frame(width: 30, height: 90)
                    .cornerRadius(25)
                    .rotationEffect(Angle(degrees: -8))
                    .scaleEffect(1.5)
                    .opacity(0.8)
            })
            .overlay(alignment: .top, content: {
                Rectangle().fill(.ultraThinMaterial)
                    .frame(width: 30, height: 90)
                    .cornerRadius(25)
                    .rotationEffect(Angle(degrees: -15))
                    .scaleEffect(2)
            })
            .frame(maxWidth: .infinity)
            .background(.yellow)
            .frame(maxHeight: .infinity)
            .background(alignment: .topTrailing, content: {
                Color.green
                Text("Hello")
                    .foregroundColor(.white)
            })
            .ignoresSafeArea()
    }
}
