

import SwiftUI

struct DataFlowHonki: View {
    
    //here from comment vvvvv
    
    var body: some View {
        VStack {
            Label("Hi", systemImage: "globe")
            
            Creature(name: "Snake", emoji: "🐍")
            Creature(name: "Bear", emoji: "🧸")
            
//            creatures           guess in order to use this you need an @OberservaleObject or something like that above the body part
        }
        
    }
}


class CreatureZoo : ObservableObject {
    @Published var creatures = [
    Creature(name: "String", emoji: "😳")
    ]
}


struct Creature: View, Identifiable {
    var name : String
    var emoji : String
    
    var id = UUID()
    var offset = CGSize.zero
    var rotation : Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("\(name) Emoji: \(emoji)")
    }
}






struct DataFlowHonki_Previews: PreviewProvider {
    static var previews: some View {
        DataFlowHonki()
    }
}
