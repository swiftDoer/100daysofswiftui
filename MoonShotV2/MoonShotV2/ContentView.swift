import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ContentView: View {
    
//    WOULD HAVE WORKED WITHOUT THE SPECIFIC TYPE - IF BUNDLE EXTENSION WASNT GENERIC (IT IS GENERIC NOW)
    let astronauts : [String:AstronautModel] = Bundle.main.decode("astronauts.json")
    let missions : [MissionModel] = Bundle.main.decode("missions.json")
    let gridColumns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationView {
            ZStack {
                //BACKGROUND
                Rectangle()
                    .fill(.darkBackground)
                    .ignoresSafeArea()
                
                //FOREGROUND
                LazyVGrid(columns: gridColumns) {
                    ForEach(missions) { mission in
                        NavigationLink(destination: {
                            MissionView(mission: mission, astronauts: astronauts)
                            //where you get after pressing on view 1
                        }, label: {
                            VStack {
    //                            Image("apollo\(mission.id)")
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top)
                                    .frame(width: 115, height: 80)
    //                            Text("Apollo \(mission.id)")
                                Text(mission.displayName)
                                    .foregroundColor(.cyan)
//                                Text(mission.launchDate ?? "N/A")
                                Text(mission.launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A")
                                    .foregroundColor(.secondary)
                                    .font(.caption)
                                    .padding(.bottom)
                            }
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            })
                        })
                    }
                }
                .navigationTitle("To the Moon")
                .preferredColorScheme(.dark)
            }
        }
    }
}

