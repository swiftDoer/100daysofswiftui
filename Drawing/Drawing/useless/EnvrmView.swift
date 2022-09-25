import SwiftUI
struct EnvrmView_Previews: PreviewProvider {
    static var previews: some View {
        EnvrmView()
    }
}

struct EnvrmView: View {
    
    @StateObject var petPerson = PetPersonViewModel()
    @State var addOwner = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(petPerson.petPersonArray) { item in
                    HStack {
                        VStack {
                            Text(item.name)
                            Text("$\(String(format: "%.2f", item.money))")
                                .font(.caption2).bold()
                        } .frame(width: 70, height: 37)
                        Spacer()
                        
                        VStack() {
                            Text(item.hasPets ? "\(item.petAmount)" : "")
                                .font(.caption2).bold()
                            Text("🐶")
                                .overlay(content: {
                                    
                                    Circle().fill(.thinMaterial)
                                        .opacity(item.hasPets ? 0.0 : 0.6)
                                        
                                })
                        }
                        .frame(width: 50, height: 37)
                        
                        
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            List {
                                Section("Details", content: {
                                    HStack {
                                        Text(item.name)
                                        Spacer()
                                        Text("Pet Amount: \(item.petAmount)")
                                    }
                                    
                                })
                                    
                                Section("Calculation", content: {
                                    VStack(alignment: .leading) {
                                        
                                        Text("Weekly: = $\(String(format: "%.2f", item.petWeeklyCost))")
                                        
                                        Text("(\(item.petAmount) * $\(String(format: "%.2f", item.perPetCost)))")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Monthly:  = $\(String(format: "%.2f", item.petMonthlyCost))")
                                        
                                        Text("(\(item.petAmount) * 4 * $\(String(format: "%.2f", item.perPetCost)))")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Yearly:  = $\(String(format: "%.2f", item.petYearlyCost))")
                                        
                                        Text("(\(item.petAmount) * 12 * 4 * $\(String(format: "%.2f", item.perPetCost)))")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                    
                                })
                                
                                Section("After this week", content: {
                                    VStack(alignment: .leading) {
                                        Text(item.weeklyCalculation)
                                        if item.costYabai {
                                            Text("You can't afford pets!")
                                                .foregroundColor(.red)
                                        }
                                    }
                                })
                            }
                        }, label: {
                            EmptyView()
                        }).opacity(0)
                            .background(content: {
                                HStack {
                                    Text("Details")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    
                                }
                            })
                            
                        
                        
                        VStack {
                            Text("Cost/w")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("$\(String(format: "%.2f", item.perPetCost))")
                                .font(.caption).bold()
                        }
                        
                    }
                    .sheet(isPresented: $addOwner, content: {
                        JustAnotherView(addPetsSheet: petPerson)
                    })
                }
                .onDelete(perform: removeItem)
            }

            .toolbar(content: {
                Button(action: {
                    addOwner = true
                }, label: {
                    Text("Add Owner")
                        .foregroundColor(.white)
                        .background(content: {
                            Rectangle().fill(.blue.gradient)
                                .frame(width: 100, height: 33)
                                .cornerRadius(10)
                        })
                })
            })
            
        }
        
        
    }
    func removeItem(index: IndexSet) {
        petPerson.petPersonArray.remove(atOffsets: index)
    }
}




