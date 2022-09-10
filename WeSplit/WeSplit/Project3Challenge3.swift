import SwiftUI

struct ThiccTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.blue)
            .padding()
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(ThiccTitle())
        
        
    }
}

struct Project3_Challenge3:View {
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack {
                Text("Hi!")
                    .prominentTitle()
                Text("Welcome!")
                    .prominentTitle()
            }
            
        }
    }
}

struct Project3_Challenge3_Previews: PreviewProvider {
    static var previews: some View {
        Project3_Challenge3()
    }
}
