import SwiftUI
struct asdfoisfod_Previews: PreviewProvider {
    static var previews: some View {
        asdfoisfod()
    }
}


struct asdfoisfod: View {
    var body: some View {
        ZStack {

            //BACKGROUND
            Rectangle().fill(.cyan.gradient)
                .ignoresSafeArea()
            
            //FOREGROUND
            VStack {
                Button(action: {
    //                dismiss.callAsFunction()
                }, label: {
                    Text("dismiss")
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 50)
                        .background(content: {
                            Rectangle().fill(.white.gradient)
                                .cornerRadius(15)
                            // PASTE sjiifasiodfj VIEW HERE
                        })
            })
            }
        }
    }
}

