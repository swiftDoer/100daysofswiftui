import SwiftUI

struct ContentView4: View {
    @State private var selectedOption1 = "°C"
    @State private var selectedOption2 = "°C"
    @State private var inputNumber = 30.0
    @FocusState private var hideButton: Bool
    
    var computedOutput: Double {
        if selectedOption1 == "°C" && selectedOption2 == "°C" {
            return inputNumber
        } else if selectedOption1 == "°C" && selectedOption2 == "°F" {
            return inputNumber * (9/5) + 32
        } else if selectedOption1 == "°C" && selectedOption2 == "K" {
            return inputNumber + 273.15
        } else if selectedOption1 == "°F" && selectedOption2 == "°C" {
            return (inputNumber - 32) * (5/9)
        } else if selectedOption1 == "°F" && selectedOption2 == "°F" {
            return inputNumber
        } else if selectedOption1 == "°F" && selectedOption2 == "K" {
            return (inputNumber - 32) * (5/9) + 273.15
        } else if selectedOption1 == "K" && selectedOption2 == "°C" {
            return inputNumber - 273.15
        } else if selectedOption1 == "K" && selectedOption2 == "°F" {
            return (inputNumber - 273.15) * (9/5) + 32
        } else if selectedOption1 == "K" && selectedOption2 == "K" {
            return inputNumber
        } else {
            return 0
        }
    }
    let options = ["°C","°F","K"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("", value: $inputNumber, format:
                        .number)
                        .keyboardType(.decimalPad)
                        .focused($hideButton)
                    
                    Picker("Temperature Type", selection: $selectedOption1){
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                        .pickerStyle(.segmented)
                } header: {
                    Text("CONVERTS FROM")
                }
                
                Section {
                    
                    Text(computedOutput.formatted())
                    // i changed this form format: .number, so if something is wrong, its because this here
                        Picker("Temperature Type", selection: $selectedOption2){
                            ForEach(options, id: \.self) {
                                Text($0)
                        }
                    }
                        .pickerStyle(.segmented)
                } header: {
                    Text("CONVERTS TO")
                }
            }
            .navigationTitle("Temperature converter")
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

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
