
import SwiftUI

struct AccountView: View {
    
//    @ObservedObject var profileOn = Profile()
    @EnvironmentObject var profileOn: Profile //you dont want to create() a new one.
    
    var body: some View {
        NavigationView {
            VStack {
                if profileOn.isLoggedIn {
                    Text(" It's shining Light on us")
                } else {
                    Text("Dark nights are awaiting us")
                }
                
                Button(action: {
                    profileOn.isLoggedIn.toggle()
                }, label: {
                    Text("Dare pressing me!")
                })
                
                NavigationLink(destination: {
                    BalanceView()
                }, label: {
                    Text("another view")
                        .padding()
                })
                
                
                Text("So you have the same controls but they're still independant. not the same source of truth")
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
