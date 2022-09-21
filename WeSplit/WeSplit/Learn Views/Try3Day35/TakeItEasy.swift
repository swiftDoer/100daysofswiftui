//
//  so first idea is have a button with a 1 and show number one on second side if button is selected
//
//
//
//

import SwiftUI

struct TakeItEasy: View {
    
    @Binding var button1 : Bool
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Text("Hi")
                        
                        Button(action: {
                            button1.toggle()
                        }, label: {
                            Text("Click")
                        })
                        
                    }
                }
                NavigationLink(destination: {
                    TakeItEasyTwo()
                }, label: {
                    Text("Other view")
                })
            }
        }
    }//
}





//struct TakeItEasy_Previews: PreviewProvider {
//    static var previews: some View {
//        TakeItEasy(button1: )
//    }
//}
