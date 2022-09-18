//
//  Well yeah okay so just use a bool to figure out if its seletected lol
//  Well yeah okay so just use a bool to figure out if its seletected lol
//
//  Well yeah okay so just use a bool to figure out if its seletected lol
//

import SwiftUI

struct SelectedButton: View {
    
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Text(isOn ? "Hello, World!" : "Bye, 世界")
            
            Button(action: {
                isOn.toggle()
            }, label: {
                ZStack {
                    Rectangle().fill(.cyan.gradient)
                        .frame(width: 200, height: 50)
                    .cornerRadius(15)
                    Text("Change World")
                        .tint(.secondary)
                }
            })
            
            if isOn {
                Text("素晴らしいですね")
            }
            
        }
    }
}

struct SelectedButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectedButton()
    }
}
