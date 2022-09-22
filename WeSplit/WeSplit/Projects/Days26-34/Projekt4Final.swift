import CoreML
import SwiftUI

struct Project4Honki: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 00
        return Calendar.current.date(from: components) ?? Date.now
    }

    
    var body: some View {
        NavigationView {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    
                }
                
                Section("Daily coffee intake") {
                    Picker(selection: $coffeeAmount, label: EmptyView()) {
                        ForEach(1..<21) { number in
                            HStack {
                                Text(number == 1 ? "1 cup" : "\(number) cups")
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                        }
                    }
                    .labelsHidden()
                    
                }
                
                Section("Daily coffee intake") {
                    Text(calculateBedtime())
                }
                
                .navigationTitle("BetterRest")
//                .toolbar {
//                    Button("Calculate", action: calculateBedtime)
//            }
                
            }
        }
    }
    
    func calculateBedtime() -> String{
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let msg = sleepTime.formatted(date: .omitted, time: .shortened)
            
           return msg
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            showAlert = true
        }
        return ""
    }
}

struct Project4Honki_Preview: PreviewProvider {
    static var previews: some View {
        Project4Honki()
    }
}
