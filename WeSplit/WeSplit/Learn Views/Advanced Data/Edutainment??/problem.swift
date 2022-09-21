//
//  problem.swift
//  WeSplit
//
//

import SwiftUI

//struct problem_Previews: PreviewProvider {
//    static var previews: some View {
//        Calculate()
//    }
//}


struct Calculate: View {
    @ObservedObject var viewModel : ButtonViewModel
    @State var myNum = 0
    @State var mySelectedNumArray = 0
    @State var answerStr = ""
    @State var answer = 0
    @State var displayingProblem = false
    @State var result = ""
    
    @State var score = 0
    @State var round = 0
    @State var answerBool = false
//    let numArray = [2,3,4,5] // this array will be dynamically filled in real implementation
 //   @State var myArray = myThing.selectedButtonArray
    
    var body: some View {
        VStack {
            List {
                Text("Calculate")
                    .font(.largeTitle)
                
                HStack(alignment: .center) {
                    Text("\(mySelectedNumArray) * \(myNum) = ")
                    
                    TextField("Answer", text: $answerStr)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text(result)
                    
                    Spacer()
                    
                    Button(action: {
                        if displayingProblem {
                            if let answer = Int(answerStr) {
                                if answer == myNum * mySelectedNumArray {
                                    result = "Correct"
                                    answerBool = true
                                } else {
                                    result = "Wrong"
                                    answerBool = false
                                }
                                displayingProblem.toggle()
                            }
                            else {
                                result = "Please input an integer"
                            }
                        }
                        else {
                            setupNewProblem()
                        }
                        
                    }, label: {
                        Text(displayingProblem ? "Submit" : "Next")
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                            .frame(width: 70, height: 40)
                            .background(displayingProblem ? .green : .blue)
                            .cornerRadius(15)
                            .bold()
                    })
                }
                Text("Score: \(score)/\(round - 1)")
            }
        }
        .onAppear {
            setupNewProblem()
        }
    }
    
    
    
    func setupNewProblem() {
//        myNum2 = numArray.randomElement() ?? 0
        mySelectedNumArray = viewModel.selectedButtonArray.randomElement() ?? 0
        if mySelectedNumArray == 0 {
            myNum = 0
        } else {
            myNum = Int.random(in: 0...12)
        }
        if answerBool {
            score += 1
        }
        round += 1
        result = ""
        answerStr = ""
        displayingProblem = true
        
        
    }
}

