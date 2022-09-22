import SwiftUI

//CUSTOM VIEW

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}



// CUSTOM MODIFIER

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
        
        
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
// there also are CUSTOM CONTAINERS https://www.youtube.com/watch?v=WTvV2fpbJuM
//everything back to normal :)

struct Project3Prep:View {
    var body: some View {
        VStack(spacing: 10) {
            //CUSTOM VIEW
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
            
            // CUSTOM MODIFIER
            Text("Hello World")
                .modifier(Title())
            //COSTUM MODIFIER WITH VIEW EXTENSION
            Text("Hello World")
                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
        }
    }
}

struct Project3Prep_Previews: PreviewProvider  {
    static var previews: some View {
        Project3Prep()
    }
}
