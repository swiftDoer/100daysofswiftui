 
import SwiftUI

struct Parentview: View {
    
    @State var userInput = ""
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(userInput.lowercased() == "blue" ? .blue : .black)
                .frame(width: 200, height: 200)
            
            ControlPanelView(userInput: $userInput)
        }
    }
}

struct Parentview_Previews: PreviewProvider {
    static var previews: some View {
        Parentview()
    }
}
