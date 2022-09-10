import SwiftUI

struct ContentView3: View {
    
    @State private var totalCost = 10.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    @FocusState private var hideButton: Bool
    
    var computedPricePerPerson: Double {
        
        let tipValue = totalCost * (Double(tipPercentage)/100)
        let grandTotal = totalCost + tipValue
        let amountPerPerson = grandTotal / Double(numberOfPeople)
        
        return amountPerPerson
    }
    var computedPrice: Double {
        
        let tipValue = totalCost * (Double(tipPercentage)/100)
        let grandTotal = totalCost + tipValue
        
        return grandTotal
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Total Price", value: $totalCost, format:
                        .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($hideButton)
                    
                    Picker("Food enjoyers", selection: $numberOfPeople){
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
//                    .pickerStyle(.menu)
                    
                } header: {
                    Text("PRICE AND FOOD ENJOYERS")
                }
                
                Section {
                    Picker("Tip Percentage",selection: $tipPercentage){
                        ForEach(0..<101, id: \.self){
                            Text($0, format:
                                .percent)
                                
                        }
                    }
                    //.pickerStyle(.segmented)
                } header: {
                    Text("TIP PERCENTAGE")
                }
                
                Section {
                    Text(computedPrice, format:
                        .currency(code: Locale.current.currencyCode ?? "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red : .primary)
                } header: {
                    Text("TOTAL AMOUNT")
                }
                
                Section {
                    Text(computedPricePerPerson, format:
                            .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("AMOUNT PER PERSON")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        hideButton = false
                    }
                }
            }
        }
        
    }
}





struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
