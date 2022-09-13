import SwiftUI


struct ButtonAlternative: View {
    let num: Int
    @State private var buttonBackgroundColorRed = false

  var body: some View {
    Button {
        withAnimation {
            buttonBackgroundColorRed.toggle()
        }
    } label: {
        Text("Button \(num)")
    }
    .padding(10)
    .background(buttonBackgroundColorRed ? .red : .blue)
    .foregroundColor(.white)
    .padding()
  }
}



struct Playground2: View {
    
    @State private var buttonRow = [0, 1, 2, 3, 4, 5]
    
    var body: some View {
        VStack {
            ForEach(1..<4) { num in
                ButtonAlternative(num: num)
                Text("\(buttonRow[num])")
            }
//            Text("\(ButtonAlternative(num: 0))")
        }
    }
}




struct Playground2_Previews: PreviewProvider {
    static var previews: some View {
        Playground2()
    }
}
