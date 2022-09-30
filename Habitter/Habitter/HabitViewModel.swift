import Foundation

class HabitViewModel: ObservableObject {
    
    @Published var trackedHabitArray: [HabitModel] = [
        HabitModel(activityTitle: "Running", activityDescription: "Every other day you want to go for a run around the park", activityDayCount: 10),
        HabitModel(activityTitle: "Reading", activityDescription: "Every weekend you want to go to the library to read.", activityDayCount: 3),
        HabitModel(activityTitle: "Walking", activityDescription: "Every day you want to get your steps in", activityDayCount: 10),
        HabitModel(activityTitle: "Eating", activityDescription: "Dont forget to eat", activityDayCount: 10),
    ]
    
    func increase(positionInArray: Int) -> Int{
        trackedHabitArray[positionInArray].activityDayCount + 1
    }
    
    func decrease(positionInArray: Int) -> Int{
        trackedHabitArray[positionInArray].activityDayCount - 1
    }
    
//    func changeText(text: String) -> String {
//        text
//    }
}
