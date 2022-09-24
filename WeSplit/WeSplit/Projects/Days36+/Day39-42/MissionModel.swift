import Foundation

struct Mission: Codable, Identifiable {
    
    let crew : [CrewRole]
    let description : String
    let id : Int
    let launchDate : Date?

    //NESTED STRUCT
    struct CrewRole: Codable {
        let name : String
        let role : String
    }

    var displayName : String {
        "Apollo \(id)"
    }
    
    var image : String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate : String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
