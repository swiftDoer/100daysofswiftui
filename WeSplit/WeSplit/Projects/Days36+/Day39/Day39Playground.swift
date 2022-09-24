import SwiftUI
struct Day39Playground_Previews: PreviewProvider {
    static var previews: some View {
        Day39Playground()
    }
}

struct SwiftUser: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct Day39Playground: View {
    
    let layout = [GridItem(.adaptive(minimum: 80, maximum: 120))]
    
    var body: some View {
        NavigationView {
            
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout, content: {
                    ForEach(0..<1000) { item in
                        //                    Text("Item \(item)")
                        if item == 881 {
                            NavigationLink(destination: {
                                Text("adjfoi23anpdfpiaefij.png")
                            }, label: {
                                Image(systemName: "folder.badge.person.crop")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            })
                        } else {
                            Image(systemName: "folder.badge.person.crop")
                                .font(.largeTitle)
                        }
                    }
                })
            }
            
//            ScrollView(.vertical) {
//                LazyVGrid(columns: layout, content: {
//                    ForEach(0..<1000) { item in
//                        //                    Text("Item \(item)")
//                        if item == 881 {
//                            NavigationLink(destination: {
//                                Text("adjfoi23anpdfpiaefij.png")
//                            }, label: {
//                                Image(systemName: "folder.badge.person.crop")
//                                    .font(.largeTitle)
//                                    .foregroundColor(.gray)
//                            })
//                        } else {
//                            Image(systemName: "folder.badge.person.crop")
//                                .font(.largeTitle)
//                        }
//                    }
//                })
//            }
        }
        
//        Button(action: {
//            let input = """
//                        {
//                        "name": "Taylor Swift",
//                        "address": {
//                            "street": "555, Taylor Swift Avenue",
//                            "city": "Nashville
//                            }
//                        }
//                        """
//
//            let data = Data(input.utf8)
//
//            if let user = try? JSONDecoder().decode(SwiftUser.self, from: data) {
//                print(user.address.street)
//            }
//        }, label: {
//            Text("Decode JSON")
//        })
//
        
//        GeometryReader { geo in
//            Image("Italy")
//                .resizable()
//                .frame(width: geo.size.width * 0.33, height: geo.size.height * 0.5)
//                .frame(width: geo.size.width, height: geo.size.height)
//        }
        
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10, content: {
//                ForEach(0..<100) { item in
//                    Text("item \(item)")
//                        .font(.title)
//                }
//            })
//            .frame(maxWidth: .infinity)
//        }
        
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink(destination: {
//                    Text("Hi \(row)")
//                }, label: {
//                    Text("Press me \(row)")
//            })
//            }
//        }
    }
}

