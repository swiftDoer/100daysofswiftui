import Foundation

struct HabitModel: Identifiable {
    
    let id = UUID()
    var activityTitle: String
    var activityDescription: String
    var activityDayCount = 0
//    let category
}


