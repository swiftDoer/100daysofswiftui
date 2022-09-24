import SwiftUI
struct Wait_Previews: PreviewProvider {
    static var previews: some View {
        Wait()
    }
}


struct Wait: View {
    var body: some View {
            Rectangle().fill(.red.gradient)
                .ignoresSafeArea()
    }
}

