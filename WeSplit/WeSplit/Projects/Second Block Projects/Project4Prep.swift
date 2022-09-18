import SwiftUI

extension Text {
    func largeTitle() -> some View {
        self
            .bold()
            .foregroundColor(.primary)
            .font(
                   .custom(
                   "AmericanTypewriter",
                   fixedSize: 34)
               )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 37)
    }
}

struct Project4: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        
        VStack {
            Text("hi").largeTitle()
            Stepper("sleep hours: \(sleepAmount.formatted())", value: $sleepAmount, in: 4...15, step: 0.25)
            
            DatePicker("select date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            DatePicker("select date", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
            
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.month().year())
            Text(Date.now, format: .dateTime.day())
            
            Text(Date.now.formatted(date: .numeric, time: .standard))
            
        }.padding()
    
    }
    
    func exampleDate() {
//        let now = Date.now
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tomorrow
//            var components = DateComponents()
//            components.hour = 8
//            components.minute = 0
//            let date = Calendar.current.date(from: components) ?? Date.now
//
//        let components2 = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
//        let hour = components2.hour ?? 0
//        let minute = components2.minute ?? 0
        }
    }

struct Project4_Previews: PreviewProvider {
    static var previews: some View {
        Project4()
    }
}
