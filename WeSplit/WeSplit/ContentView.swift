
import SwiftUI

struct ContentView: View {
    @State private var amountOfPeopple = 0
    @State private var totalCost = 0.0
    @State private var tipPercentage = 0.10
    @FocusState private var priceIsFocused: Bool
    
    let tipPercentages = [0.0, 0.05, 0.10, 0.15, 0.20]
    
    var totalPerPerson: Double {
        let result = (totalCost * (1 + tipPercentage))/Double(amountOfPeopple + 2)
        return result
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Food total", value: $totalCost, format: .currency(code:
                        Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($priceIsFocused)
                    
                    Picker("Food enjoyers", selection: $amountOfPeopple) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("Price and enjoyers")
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip percentage")
                }
                
                Section {
                    
                    Text(totalPerPerson, format: .currency(code:
                        Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Cost per Person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        priceIsFocused = false
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
