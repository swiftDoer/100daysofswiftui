import Foundation


// MODEL THAT JSON WILL BE INJECTED INTO - Codable makes that bridge possible. & Identifiable allows for Arrays of that data.
struct AstronautModel: Codable, Identifiable {
    
    let id : String
    let name : String
    let description : String
    
}

// MODEL THAT JSON WILL BE INJECTED INTO - Codable makes that bridge possible. & Identifiable allows for Arrays of that data.
struct MissionModel: Codable, Identifiable {
    
    struct CrewModel: Codable {
        let name : String
        let role : String
    }
    let id : Int
    let launchDate: Date?
    let crew: [CrewModel]
    let description : String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
var image: String {
        "apollo\(id)"
    }
    
//    var formattedLaunchDate: String {
//        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
//    }
    
}


// CONVERT ASTRONAUTS.JSON INTO DICTIONARY OF AstronautModel INSTANCES
extension Bundle {
    // FUNCTION TAKES THE ENTIRE STRING AS INPUT, SPITS IT OUT TO ARRAY OF AstronautModel
    // TO MAKE A FUNCTION GENERIC(ABLE TO WORK WITH DIFF. KINDS OF DATA) ADD <><><<><>
    // T = "type"
//    func decode(_ file: String) -> [String: AstronautModel] {
//    func decode<T>(_ file: String) -> T {
    func decode<T: Codable>(_ file: String) -> T {
        // FINDS FILE URL
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        // TAKES FILE URL AND LOADS ITS DATA
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // just a rename
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        
        // CHANGES THE DATING CONVENTION FROM THE JSON FILE TO STANDARD DECODED DATE
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        // LOADS DATA INTO Type: AstronautModel
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
