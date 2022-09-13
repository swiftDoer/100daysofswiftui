import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}


extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -135, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

extension AnyTransition {
    static var pivot2: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: 135, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


struct Project6_Prep: View {
//    private let letters = Array("Hey SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    @State private var isShowingBlue = false
    
    
    var body: some View {
        
        ZStack {
                    Rectangle()
                .fill(isShowingRed ? .blue : .red)
                        .frame(width: 200, height: 200)
                        .animation(nil, value: isShowingRed)

                    if isShowingRed {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 200, height: 200)
                            .transition(.pivot)
                    } else {
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 200, height: 200)
                            .transition(.pivot2)
                    }
                }
                .onTapGesture {
                    withAnimation() {
                        isShowingRed.toggle()
                    }
                }
        
        
        
//        VStack {
//
//            Button("Tap Me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//
//            HStack(spacing: 0) {
//                ForEach(0..<11) { num in
//                    Text(String(letters[num]))
//                        .padding(5)
//                        .font(.title)
//                        .background(enabled ? .blue : .red)
//                        .offset(dragAmount)
//                        .animation(
//                            .default.delay(Double(num) / 20),
//                            value: dragAmount
//                        )
//                }
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation}
//                    .onEnded { _ in
//                        dragAmount = .zero
//                        enabled.toggle()
//                    }
//            )
//        }
    }
}


struct Project6_Prep_Previews: PreviewProvider {
    static var previews: some View {
        Project6_Prep()
    }
}
