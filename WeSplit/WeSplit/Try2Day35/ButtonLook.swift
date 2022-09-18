//
//  ButtonLook.swift
//  WeSplit
//
//  
//

import SwiftUI
struct ButtonLook: View {
      
    var buttonNumber : Int
    @State var buttonSelected = false
    @State var buttonSelection = PleaseAddButton()
    @State var testNum = 0
    
    var body: some View {
        VStack {
            Button(action: {
                buttonSelected.toggle()
                buttonSelection.add(number: buttonNumber)
                
    //            buttonSelection.add
            }, label: {
                ZStack {
                    Rectangle().fill(buttonSelected ? .green : .cyan)
                        .frame(width: 50, height: 50)
                        .cornerRadius(15)
                    Text("\(buttonNumber)")
                        .tint(.white)
                        .font(.title.bold())
                }
        })
//            Text("\(buttonSelection.buttonIsSelectedArray)")
        }
    }
    
}



struct PleaseAddButton {
    var buttonIsSelectedArray = [Int]()
    mutating func add(number: Int) {
        buttonIsSelectedArray.append(number)
    }
}


struct ButtonLook_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLook(buttonNumber: 1)
    }
}
