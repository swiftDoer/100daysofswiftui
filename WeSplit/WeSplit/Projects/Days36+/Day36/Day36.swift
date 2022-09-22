import SwiftUI
struct Day36_Previews: PreviewProvider {
    static var previews: some View {
        Day36()
    }
}


struct Day36: View {
    
    @StateObject var user = User()
    @State private var sheetShowing = false
    
    //create a new current number for user because we have commented it out on other view
    @AppStorage("TapAmount") private var userCurrentNumber = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                //BACKGROUND
                Rectangle().fill(.pink.gradient)
                    .ignoresSafeArea()
                
                
                //FOREGROUND
                VStack(spacing: 10) {
                    List {
                        ForEach(user.numbers, id: \.self) { item in
                            Text("\(item)")
                        }
                        .onDelete(perform: user.deleteRow)
                    }
                    
//                    Text("Custom People:")
//                    ForEach(user.personArray) { item in
//                        Text("\(item.personalName) \(item.familyName)")
//                    }
//                    Button("Save User") {
//                        let encoder = JSONEncoder()
//                        if let data = try? encoder.encode(user.personArray) {
//                            UserDefaults.standard.set(data, forKey: "UserData")
//                        }
//                    }
                    
                    Button(action: {
                        user.numbers.append(userCurrentNumber)
                        userCurrentNumber += 1
                        UserDefaults.standard.set(userCurrentNumber, forKey: "TapAmount")
                    }, label: {
                        Text("Add to Array")
                    })
                    
                    Text("Your name: \(user.firstName) \(user.lastName)")
                    
                    TextField("First Name: ", text: $user.firstName)
                    TextField("Last Name: ", text: $user.lastName)
                    
                    Button(action: {
                        sheetShowing.toggle()
                    }, label: {
                        Text("Show sheet")
                    })
                    .sheet(isPresented: $sheetShowing, content: {
                        SecondVieww(user: user)
                    })
                    .navigationTitle("Day 36")
                    .toolbar(content: {
                        EditButton()
                            .foregroundColor(.white)
                    })
                }
                .padding(5)
                .background(.white)
                .cornerRadius(20)
                .padding()
            }
        }
    }
}


