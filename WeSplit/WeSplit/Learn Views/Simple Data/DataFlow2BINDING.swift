
import SwiftUI
struct FirstContent: View {
    
    @Binding var wtf : Bool
    @State private var counter = 0.0
    @State private var truth = false
    
    
    
    var body: some View {
        NavigationView{
            VStack {
//                Text("Your count is: \(Int(counter))")
                Text("Your count is: \(counter)")
                
                Circle()
                    .fill(truth ? .green : .purple)
                    .frame(width: 50, height: 50)
                
                NavigationLink(destination: {
                    SecondContent(count: $counter, truth: $truth)
                        .navigationBarBackButtonHidden(true)
                }, label: {
                    Text("Another place")
                })
                
                Toggle(isOn: $truth, label: {
                    Text("Change other side")
                })
                
                
            }
        }
    }
}

struct SecondContent: View {
    
    @State var wtf = false
    
    @Binding var count : Double
    @Binding var truth : Bool
    @Environment(\.dismiss) var goBack
    
    var body: some View {
        VStack {
            Button(action: {
                count += 1                                      //changes value +1 on button click
            }, label: {
                Text("Up")
                    .padding()
            })
            
            Slider(value: $count, label: {                          //changes value through slider
                Text("Slide me bby one more time")
            })
            
            Toggle(isOn: $truth, label: {                           //changes color on toggle
                Text("Change color")
            })
            
            HStack {
                Text("Changes color too")
                
                Spacer()
                
                Button(action: {
                    truth.toggle()
                }, label: {
                    Text("Click")
                })
            }
            
            Button(action: {                                    //goes back to first view
                goBack.callAsFunction()
            }, label: {
                Text("Back")
            })
        }.padding()
    }
}


//struct FirstContent_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstContent(wtf: <#Binding<Bool>#>)
//    }
//}
