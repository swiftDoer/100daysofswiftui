//
//  ButtonLook.swift
//  WeSplit
//
//  Created by Andreas Nuss on 20.09.22.
//

import SwiftUI


struct ButtonLooks_Previews: PreviewProvider {
    static var previews: some View {
        Text("h")
    }
}

struct StudySecondView: View {
    
    @ObservedObject var butting: ButtonViewModel
    
    var body: some View {
        VStack {
            
            Calculate(viewModel: butting)
  
            HStack {
                ForEach(butting.selectedButtonArray, id: \.self) { item in
                    Text("\(item)")
                }
            }
        }
    }
}

struct NavButton: View {
    
    let buttonName : String
    @State var buttonPressed = false
    
    var body: some View {
        
        Button(action: {
            buttonPressed.toggle()
        }, label: {
            Text(buttonName)
                .foregroundColor(.white)
                .shadow(radius: 1)
                .frame(width: 62, height: 40)
                .background(.ultraThinMaterial)
                .background(buttonPressed ? .green : .teal)
                .cornerRadius(15)
        })
    }
}

struct ActuallyJustButtonLook: View {
    
    @State var buttonNumber : Int
    @State var buttonSelected : Bool
    
    var body: some View {
        ZStack {
            
            Rectangle().fill(buttonSelected ? .green : .cyan)
                .frame(width: 50, height: 50)
                .cornerRadius(15)
            
            Text("\(buttonNumber)")
                .foregroundColor(.white)
                .font(.title.bold())
        }
    }
}


struct ButtonLooks: View {
    
    @State var buttonNumber : Int
    @State var buttonSelected : Bool
    @ObservedObject var buttong : ButtonViewModel
 
    var body: some View {
        Button(action: {
            buttonSelected.toggle()
            buttong.addToArray(number: buttonNumber)
        }, label: {
            ZStack {
                
                Rectangle().fill(buttonSelected ? .green : .cyan)
                    .frame(width: 50, height: 50)
                    .cornerRadius(15)
                
                Text("\(buttonNumber)")
                    .foregroundColor(.white)
                    .font(.title.bold())
            }
        })
    }
}





