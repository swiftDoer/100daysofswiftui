//
//  TapGesture.swift
//  WeSplit
//
//  Created by Andreas Nuss on 20.09.22.
//

import SwiftUI

struct TapGesture: View {
    
    @State var isSelected = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? Color.green : Color .red)
                .shadow(radius: 5)
            
            Button(action: {
                isSelected.toggle()
            }, label: {
                Text("button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
            })
            
            Text("tap gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
                .onTapGesture {
                    isSelected.toggle()
                }
            
            Spacer()
            
            
            
        }
        .padding(40 )
    }
}

struct TapGesture_Previews: PreviewProvider {
    static var previews: some View {
        TapGesture()
    }
}
