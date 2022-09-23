import Foundation

//struct PersonalExpense: Identifiable, Codable {
struct PersonalExpense: Identifiable {
    
    var id = UUID()
    let name : String
    var businessOrPersonal = "Personal"
    let cost : Double
}

//struct BusinessExpense: Identifiable, Codable {
struct BusinessExpense: Identifiable {
    
    var id = UUID()
    let name : String
    var businessOrPersonal = "Business"
    let cost : Double
}
