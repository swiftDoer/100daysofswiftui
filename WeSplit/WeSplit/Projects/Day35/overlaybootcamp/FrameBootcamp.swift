//
//  FrameBootcamp.swift
//  WeSplit
//
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        ZStack {
            //background
//            RadialGradient(gradient: Gradient(colors: [Color("Colo5"), Color("Colo2")]), center: .top, startRadius: 3, endRadius: 1000)
//                .ignoresSafeArea()
            
            //foreground
            VStack(spacing: 0) {
                Text("Hello, World!")
                    .background(.green)
                    .frame(width: 100, height: 100, alignment: .leading)
                    .background(.red)
                    .frame(width: 200, alignment: .leading)
                    .background(.orange)
                    .frame(width: 300, height: 300, alignment: .bottomTrailing)
                    .background(.yellow)
                    .frame(width: 320, height: 320, alignment: .topLeading)
                    .background(.gray)
                    .frame(width: 380, height: 380)
                    .background(.black)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                
                Text("hi")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .background(.yellow)
                    .padding()
                    .background(.orange)
//                Spacer()
//                Text("Hello, World!")
            }
        }
        
    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
    }
}
