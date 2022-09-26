import Foundation


//IMPORT FROM JSON FORMATTER WEBSITE (PASTE IN JSON DATA INTO IT AND JUST YOINK IT INTO HERE
struct Person: Codable {
    let firstName, surname, gender : String
    let age : Int
    let address : Address
    let phoneNumbers : [PhoneNumber]
    
    static let allPeopleArray : [Person] = Bundle.main.decode(file: "example.json")
//    static let samplePerson : Person = allPeople[0]
    // That way you can display someone easily and previewing is possible
    static let samplePerson = allPeopleArray[0]
}

struct Address: Codable {
    let streetAddress, city, state, postalCode: String
}

struct PhoneNumber: Codable {
    let type, number: String
}


