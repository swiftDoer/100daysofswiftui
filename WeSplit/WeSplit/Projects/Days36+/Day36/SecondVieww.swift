import SwiftUI
//struct SecondVieww_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondVieww(fuckYou: "ss")
//    }
//}


struct SecondVieww: View {
    
    @ObservedObject var user : User
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            //BACKGROUND
            Rectangle().fill(.cyan.gradient)
                .ignoresSafeArea()
            
            //FOREGROUND
            VStack {
                HStack {
                    ForEach(user.numbers, id: \.self) { item in
                        Text("\(item)")
                            .foregroundColor(.white)
                    }
                }
                Text("@\(user.firstName)\(user.lastName)")
                    .foregroundColor(.white)
                Button(action: {
                    dismiss.callAsFunction()
                }, label: {
                    Text("dismiss")
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 50)
                        .background(content: {
                            Rectangle().fill(.white.gradient)
                                .cornerRadius(15)
                        })
                })
            }
        }
    }
}

