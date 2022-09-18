
import SwiftUI

struct BalanceView: View {
//    @ObservedObject var profileOn = Profile()
    // this is a problem because it creates a new observed object, different from AccountView
    @EnvironmentObject var profileOn: Profile
    @Environment(\.dismiss) var swipeBack
    
    var body: some View {
        VStack {
//            if profileOn.isLoggedIn {
//                Text("It's shining Light on us")
//            } else {
//                Text("Dark nights are awaiting us")
//            }
//
//            Button(action: {
//                profileOn.isLoggedIn.toggle()
//            }, label: {
//                Text("Dare pressing me!")
//            })
            
            if profileOn.isLoggedIn {
                Text("Balance: $1")
            } else {
                Text("Balance: $XXXXX")
            }
            
            Button(action: {
                swipeBack.callAsFunction()
            }, label: {
                Text("go back")
                    .padding()
            })
            
        }
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
