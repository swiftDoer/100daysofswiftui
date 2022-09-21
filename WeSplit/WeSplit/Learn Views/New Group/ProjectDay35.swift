import SwiftUI

class GameStart : ObservableObject {
    @Published var buttonPressed1 = false
    @Published var buttonPressed2 = false
    @Published var buttonPressed3 = false
    @Published var buttonPressed4 = false
    @Published var buttonPressed5 = false
    @Published var buttonPressed6 = false
    @Published var buttonPressed7 = false
    @Published var buttonPressed8 = false
    @Published var buttonPressed9 = false
    @Published var buttonPressed10 = false
    @Published var buttonPressed11 = false
    @Published var buttonPressed12 = false
    
    @Published var buttonPressedArray = Set([Int]()) //turn this into a set after testing
    
    func add(number: Int) {
        buttonPressedArray.insert(number) //turn this into insert after set()
    }
}

struct AppView: View {
    var body: some View {
        FirstView()
        
        // how i could solve the multiple selected / deselected thing is just to say if x != 1 number is not selected. / true
        // && have it so you do x % 2 == 1 so it also takes reselecting into account
        
        // could also create a fuck ton of bindings i guess??? 12 in that case
        
        
        // or i could have this huge view that has 12 variables from 1 to 12 and so it expects them to be filled when called, basically making me push the data into it
        
        // guess we wanna use @StateObject instead of @ObservedObject so it doesnt blow everything up every time... maybe idk yet. maybe we want to blow it away after one value changes
    }
}
    

struct StudyView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var gameArray: GameStart
    
    var body: some View {
        VStack {
            
            List(0..<gameArray.buttonPressedArray.count, id: \.self) { hi in
                Text("\(gameArray.buttonPressedArray.description)")
            }
            
            Text("Nice")
            // show selected numbers
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                StyledButton(buttonName: "Back")
            })
        } .navigationBarBackButtonHidden(true)
        
    }
    
}


struct FirstView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle().fill(.blue.gradient)
                VStack {
                    Text("Select multiplication table")
                        .foregroundColor(.white)
                        .font(.title3)
                    
                    ButtonRow()
                    
                    NavigationLink(destination: {
                        StudyView()
                    }, label: {
                        StyledButton(buttonName: "Study")
                    })
                    
                }
            }.ignoresSafeArea()
        }
    } //
}

struct StyledButton: View {
    var buttonName = ""
    var body: some View {
        Text(buttonName)
            .foregroundColor(.white)
            .shadow(radius: 1)
            .frame(width: 62, height: 40)
            .background(.ultraThinMaterial)
            .background(.teal)
            .cornerRadius(15)
    }
}


struct ButtonRow: View {
    @State private var buttonRow1 = [1, 2, 3, 4, 5, 6]
    @State private var buttonRow2 = [7,8,9,10,11,12]
    
    var body: some View {
        HStack {
            ForEach(1..<buttonRow1.count + 1, id: \.self) { num in
                ButtonSelectable(num: num)
            }
        }
        
        HStack {
            ForEach(1..<buttonRow2.count + 1, id: \.self) { num in
                ButtonSelectable(num: num + 6)
            }
        }
    }
}


struct ButtonArrayLogic {
    var buttonIsSelectedArray = [Int]()
    mutating func add(number: Int) {
        buttonIsSelectedArray.append(number)
    }
}


struct ButtonSelectable: View {
    let num: Int
    @State private var isSelected = false
    @State private var buttonArray = ButtonArrayLogic()
    @EnvironmentObject var gameArray: GameStart

    var body: some View {
        VStack {
            Text("\(gameArray.buttonPressedArray.count)")
            
            Button {
                gameArray.add(number: num)
                buttonArray.add(number: num)
                withAnimation {
                    isSelected.toggle()
                }
                
            } label: {
                Text("\(num)")
                    .fontWeight(.bold)
            }
            .frame(width: 50, height: 50)
            .background(isSelected ? .green : .white)
            .foregroundColor(isSelected ? .white : .blue)
            .cornerRadius(15)
            
//            ForEach(0..<buttonArray.buttonIsSelectedArray.count, id: \.self) { number in
//                Text("\(buttonArray.buttonIsSelectedArray[number])")
//
//            ForEach(0..<gameArray.buttonPressedArray.count, id: \.self) { number in
//                Text("\(gameArray.buttonPressedArray[number])")
//
                
    
//            }
        }
    } //
}








struct Playground2_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
