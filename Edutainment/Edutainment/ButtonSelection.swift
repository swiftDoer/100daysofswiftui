//
//  ButtonSelection.swift
//  Edutainment
//
//  
//

import SwiftUI

struct ButtonSelection: View {
    
    @Binding var button1 : Bool
    @Binding var button2 : Bool
    
    
    var body: some View {
        HStack {
            Button(action: {
                button1.toggle()
            }, label: {
               ButtonStyling(button: $button1, num: 6)
            })
            
            Button(action: {
                button2.toggle()
            }, label: {
               ButtonStyling(button: $button2, num: 9)
            })
            
//            Button(action: {
//                button3.toggle()
//            }, label: {
//               ButtonStyling(button: $button3, num: 3)
//            })
            
        }
    }
}

