//
//  ButtonStyling.swift
//  Edutainment
//
//  
//

import SwiftUI

struct ButtonStyling: View {
    
    @Binding var button : Bool
    var num : Int
    
    var body: some View {
        ZStack {
            Rectangle().fill( button ? .green : .blue)
                .frame(width: 45, height: 40)
                .cornerRadius(12)
            Text("\(num)")
                .foregroundColor(.white)
                .font(.title)
        }
    }
}
