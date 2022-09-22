//
//  Overlay.swift
//  WeSplit
//
//

import SwiftUI

struct Overla2y: View {
    var body: some View {
        VStack {
//            Text("""
//    Hello,
//    Motherfuckers
//    """        )
//                .background(
//                    Circle().fill(.yellow.gradient)
//                        .frame(width: 140, height: 140, alignment: .center)
//                )
//                .frame(width: 150, height: 150, alignment: .leading)
//                .background(
//                    Circle().fill(.red.gradient)
//
//            )
            
            
            
            Circle().fill(.red.gradient)
                .frame(width: 100, height: 100)
                .shadow(color: .black.opacity(0.3), radius: 15, x: -10, y: -10)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -5, y: -5)
                .overlay(alignment: .bottomTrailing, content: {
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .overlay(alignment: .topLeading, content: {
                            Circle()
                                .fill(.orange)
                                .frame(width: 15, height: 15)
                                .shadow(color: .orange, radius: 10)
                        })
                })
            
            Spacer()
            
            Rectangle()
                .frame(width: 100, height: 100)
                .shadow(radius: 15)
                .overlay(alignment: .bottom, content: {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 50, height: 50)
                        .shadow(color: .blue, radius: 10)
                })
                .background(alignment: .bottomTrailing, content: {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 150, height: 150)
                        .shadow(color: .black.opacity(0.3), radius: 15, x: -10, y: -10)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: -5, y: -5)
                })
            
            
            
            
            Circle()
                .fill(.pink)
                .frame(width: 100, height: 100)
                .shadow(radius: 5)
                .overlay(
                    Text("sus")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                )
                .frame(width: 110, height: 110, alignment: .topLeading)
                .background(
                Circle()
                    .fill(.red.gradient)
                )
            
            
            
            
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .background(alignment: .center, content: {
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.indigo, .blue]),
                            startPoint: .topTrailing,
                            endPoint: .bottomLeading))
                        .frame(width: 100, height: 100)
                        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                        .overlay(alignment: .bottomTrailing, content: {
                            Circle()
                                .fill(.orange)
                                .frame(width: 35, height: 35)
                                .overlay(content: {
                                    Text("5")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                })
                                .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                        })
                })
            
            
            
        }
    }
}

struct Overla2y_Previews: PreviewProvider {
    static var previews: some View {
        Overla2y()
    }
}
