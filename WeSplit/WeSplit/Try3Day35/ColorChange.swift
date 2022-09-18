//
//  ColorChange.swift
//  WeSplit
//
//
//

import SwiftUI

class ColorModel : ObservableObject {
    @Published var isOnFirstView = false
    @Published var isOnSecondView = false
    
    func didTapChangeColor(atFirstView: Bool) {
        if atFirstView {
            isOnSecondView = !isOnSecondView
        } else {
            isOnFirstView = !isOnFirstView
        }
    }
}

struct ColorChange2: View {
    // binding model
    @ObservedObject var colorModel : ColorModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Circle()
                .fill(colorModel.isOnSecondView ? .green : .red)
                .frame(width: 100)
            
            Button(action: {
                colorModel.didTapChangeColor(atFirstView: false)
            }, label: {
                Text("Change button view 1")
                    .padding()
            })
            
            Button(action: {
                dismiss.callAsFunction()
            }, label: {
                Text("Go to view 1")
            })
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct ColorChange1: View {
    @StateObject private var colorModel = ColorModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Circle()
                    .fill(colorModel.isOnFirstView ? .green : .red)
                    .frame(width: 100)
                
                Button(action: {
                    colorModel.didTapChangeColor(atFirstView: true)
                }, label: {
                    Text("Change button view 2")
                        .padding()
                })
                
                NavigationLink(destination: {
                    ColorChange2(colorModel: colorModel)
                }, label: {
                    Text("Go to view 2")
                })
            }
        }
    }
}


struct ColorChange_Previews: PreviewProvider {
    static var previews: some View {
        ColorChange1()
    }
}
