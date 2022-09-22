import Foundation

class User: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var numbers = [Int]()
//    @Published var currentNumber = UserDefaults.standard.integer(forKey: "TapAmount") // THIS WORKS WITH IF YOU USE UserDefaults IN THE FIRST VIEW.
    
    func deleteRow(indexOffset: IndexSet) {
        numbers.remove(atOffsets: indexOffset)
    }
    
    @Published var personArray = [
    CustomPerson(personalName: "James", familyName: "Jamily"),
    CustomPerson(personalName: "Emily", familyName: "Emily")
    ]
}
