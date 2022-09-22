
import SwiftUI

struct ObservableObjects1: View {
    
    @State var num = 5
//    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        if num == 1 {
            Text("w")
        } else {
            
            NavigationView {
                VStack {
                    Text("\(num)")
                    
                    Text("kk")
                    
                    Button(action: {
                        num -= 1
                    }, label: {
                        Text("-1")
                    })
                    
                    NavigationLink(destination: {
                        RandomShitView()
                    }, label: {
                        Text("Get to destination")
                    })
                    
                    
                }
            }
        }
    }
}


struct RandomShitView: View {
    
    @Environment(\.dismiss) var dismissView
    
    var body: some View {
        VStack {
            Text("youve reached your destination")
            Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                            dismissView.self  doesnt work either - so it only works if you actually switch views.
                dismissView.callAsFunction()
            }, label: {
                Text("Go back")
            })
        }
    }
}

struct ObservableObjects1_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjects1()
    }
}
