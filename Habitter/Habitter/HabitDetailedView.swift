import SwiftUI
struct HabitDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailedView(title: "Gun", description: "Reload them yes owo wowo yes very long text amazing!", days: 2)
    }
}


struct HabitDetailedView: View {
    
    @State var title: String
    @State var description: String
    @State var days: Int
    let neutralColor = Color("neutralColor")
    let neutralDarkColor = Color("neutralDarkColor")
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(days > 1 ? "Days: \(days)" : "Day: \(days)")
                    .padding(.horizontal)
                    .foregroundColor(neutralColor)
                    .background(
                        Rektangle
                    )
            }
            Text(title)
            Text(description)
        }
    }
    
    
    private var Rektangle: some View {
        Rectangle().fill(neutralDarkColor)
            .frame(width: 70, height: 30)
            .cornerRadius(5)
    }
}

