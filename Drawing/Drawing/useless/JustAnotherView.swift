import SwiftUI
//struct JustAnotherView_Previews: PreviewProvider {
//    static var previews: some View {
//        JustAnotherView(addPetsSheet: PetPersonViewModel())
//    }
//}


struct JustAnotherView: View {
    
    @State var name = ""
    @State var hasPets = false
    @State var money = 0.0
    @State var petAmount = 0
    @State var perPetCost = 0.0
    @Environment(\.dismiss) var dismiss
    @ObservedObject var addPetsSheet : PetPersonViewModel
    
    
    var body: some View {
        NavigationView {
            List {
                Section("Name", content: {
                    TextField("Name", text: $name)
                })
                
                Section("Money Available", content: {
                    TextField("Money", value: $money, format: .currency(code: "USD"))
                })
                
                Section("Pet info & Cost per week", content: {
                    Toggle("Has Pets?", isOn: $hasPets)
                    
                    if hasPets {
                        Picker("Pet Amount", selection: $petAmount, content: {
                            ForEach(1..<15, id: \.self) { number in
                                Text("\(number)")
                            }
                        })
                        TextField("Cost per Pet", value: $perPetCost, format: .currency(code: "USD"))
                    }
                    
                    Button(action: {
                        addPetsSheet.petPersonArray.append(PetPerson(name: name, hasPets: hasPets, money: money, petAmount: petAmount, perPetCost: perPetCost))
                        
                        name = ""
                        hasPets = false
                        money = 0.0
                        petAmount = 0
                        perPetCost = 0.0
                        
                    }, label: {
                        Text("Add")
                            .frame(width: 330, height: 50)
                                                       .foregroundColor(.white)
                                                       .font(.headline)
                                                       .background(content: {
                                                           Rectangle().fill(.pink.gradient)
                                                               .cornerRadius(10)
                                                       })
                    })
                })
            }
            .toolbar(content: {
                Button(action: {
                    dismiss.callAsFunction()
                }, label: {
                    Text("Done")
                })
            })
        }
    }
}


