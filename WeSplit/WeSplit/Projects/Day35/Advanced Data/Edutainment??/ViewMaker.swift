//
//  ViewMaker.swift
//  WeSplit
//
//

import SwiftUI


struct ViewMaker_Previews: PreviewProvider {
    static var previews: some View {
        ViewMaker()
    }
}



struct ViewMaker: View {
    
    let numArray = [2,3,4,5]
    
//    @State var myNum = numArray.randomElement() ?? 0// das wird das ding hier sein selectedButtonArray.randomElement()
    //have a 10 second timer running down, if 0 then next round and no point extra
    var myNum = Int.random(in: 0...12)
    
    @State var beforeGame = true // i want the circle to be gray before the game starts
    @State var isCorrect = true // this could cause problems ??? because it might say its always tue
    @State var answerVar = ""
    
    var body: some View {
        VStack {
            
            
           
            
            List {
                Text("Calculate")
                    .font(.largeTitle)
                
                HStack(alignment: .center) {
                    if let myNum2 = numArray.randomElement() {
                        Text("\(myNum) * \(myNum2) = ")
                    }
                    
                    TextField("Answer", text: $answerVar)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    if beforeGame {
                        Circle()
                        .foregroundColor(.gray)
                        .frame(width: 46, height: 46)
                    } else {
                        Circle()
                        .fill(isCorrect ? .green : .blue)
                        .frame(width: 46, height: 46)
                    }
                    Spacer()
                    Button(action: {
                        beforeGame.toggle()
                        answerVar = ""
                        //new game - well actually just set myNum2 = numArray.randomElement()
                        //&& myNum = Int.random(in: 0...12)
                    }, label: {
                        Text("Submit")
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                            .frame(width: 70, height: 40)
                            .background(.blue)
                            .cornerRadius(15)
                            .bold()
                    })
                }
            }
            
            HStack {
                    Text("1 2 3 4 5 6 7 8 9 10 11 12")
            }
        }
    }
}

