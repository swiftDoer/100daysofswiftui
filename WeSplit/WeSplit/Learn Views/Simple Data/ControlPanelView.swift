

import SwiftUI

struct ControlPanelView: View {
    
    @Binding var userInput: String
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            TextField("Type sth", text: $userInput)
                .textFieldStyle(.roundedBorder)
        }
    }
}

//struct ControlPanelView_Previews: PreviewProvider {
//    static var previews: some View {
//        ControlPanelView()
//    }
//} 
