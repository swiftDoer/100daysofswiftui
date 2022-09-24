import SwiftUI
//struct ScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollViewAstronauts()
//    }
//}


struct ScrollViewAstronauts: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { item in
                    NavigationLink(destination: {
                        AstronautView(astronaut: item.astronaut)
                    }, label: {
                        HStack() {
                            Image(item.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .strokeBorder(.white, lineWidth: 1)
                            )
                            
                            VStack(alignment: .leading) {
                                Text(item.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(item.role)
                            }
                        }
                })
                }
            }
            .padding(10)
        }
    }
}

