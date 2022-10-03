import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    
    @State private var results = [User]()
    
    var body: some View {
        List(results, id: \.id) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text("\(item.age)")
                }
                Spacer()
                Text(item.isActive ? "ONLINE" : "OFFLINE")
                    .foregroundColor(.secondary)
            }
        }
        .task {
            await loadData()
        }
        Text("pleaceholder")
    }
    
    
    func loadData() async {

//        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
//            print("Invalid URL")
//            return
//        }

//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//        } catch {
//            print("Invalid data")
//        }

        do {
            // Fetch and decode a specific type
            let url1 = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let user = try await URLSession.shared.decode(User.self, from: url1)
            print("Downloaded \(user.name)")


            // Create a custom URLSession and decode a Double array from that
            let config = URLSessionConfiguration.default
            config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            let session = URLSession(configuration: config)

        } catch {
            print("Download error: \(error.localizedDescription)")
        }
    }
}


struct Response: Codable {
    var results: [User]
}


struct User: Codable {

    var id: String
    var isActive: Bool
    var name: String
    var age: Int

}



extension URLSession {
    func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from url: URL,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
    ) async throws  -> T {
        let (data, _) = try await data(from: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy

        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}

//
//struct User: Codable {
//
//    let id: String
//    let issActive: Bool
//    let name: String
//    let age: Int
//
//}
//
//
//struct Friends: Codable {
//
//    let id: String
//    let name: String
//
//}






