import SwiftUI
struct MoonShotView_Previews: PreviewProvider {
    static var previews: some View {
        MoonShotView()
    }
}


struct MoonShotView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // GRIDITEM
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    @State private var isON = true
    
    var body: some View {
        NavigationView {
            Group {
                if isON {
                    MyListView
                    
                } else {
                    ScrollView {
                        MyGridView
                            .padding(.horizontal)
                    }
                    
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar(content: {
                Button(action: {
                    isON.toggle()
                }, label: {
                    Text("Change View")
                })
            })
        }
    }
    
    
    private var MyListView: some View {
        List() {
//            ForEach(missions)
//            Text("Hi")
            
//            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink(destination: {
                        MissionView(mission: mission, astronauts: astronauts)
                    }, label: {

                        HStack() {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding()

                            HStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)

                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)

                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    })
                }
//            }
        }
    }
    
    
    private var MyGridView: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink(destination: {
                    MissionView(mission: mission, astronauts: astronauts)
                }, label: {
                    VStack() {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                })
            }
        }
//        .padding([.horizontal, .bottom])
    }
}

