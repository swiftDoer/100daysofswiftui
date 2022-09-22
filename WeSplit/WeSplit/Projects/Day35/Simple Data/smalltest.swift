import SwiftUI

//struct Wheeze: View {
//    var body: some View {
//        VStack {
//            ForEach(1..<4) {num in
//                Row(num: num)
//            }
//        }
//    }
//}
//
//
//
//struct Row: View {
//    let num: Int
//    @State private var buttonBackgroundColorRed = false
//
//    var body: some View {
//        Button {
//            withAnimation {
//                buttonBackgroundColorRed.toggle()
//            }
//        } label: {
//            Text("Button \(num)")
//        }
//        .padding(10)
//        .background(buttonBackgroundColorRed ? .red : .blue)
//        .foregroundColor(.white)
//        .padding()
//    }
//}


struct School {
    var studentArray = [String]()
    
    mutating func add(student: String) {
        studentArray.append(student)
    }
}


struct ReviewClosuresAndStructs: View {
    
    @State private var test = School() // <= here
    
    var body: some View {
        VStack {
            Button(action: {
                test.add(student: "Tyler")
            }, label: {
                Text("Press me. \n Students: \(test.studentArray.count)") // <= here
            })
            ForEach(0..<test.studentArray.count, id: \.self) { number in
                Text("\(test.studentArray[number])")
            }
            
        }
    }
}

struct Wheeze_preview: PreviewProvider {
    static var previews: some View {
        ReviewClosuresAndStructs()
    }
}
