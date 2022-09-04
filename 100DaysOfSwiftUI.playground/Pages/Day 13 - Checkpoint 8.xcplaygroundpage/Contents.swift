import UIKit

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var stateAgent: String { get }
    func salesSummary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var stateAgent: String
    func salesSummary() {
        print("The house with \(rooms) rooms was had a cost of \(cost) and was sold by \(stateAgent) ")
    }
    
}
struct Office: Building {
    var rooms: Int
    var cost: Int
    var stateAgent: String
    func salesSummary() {
        print("The office with \(rooms) rooms had a cost of \(cost) and was sold by \(stateAgent) ")
    }
}

let office = Office(rooms: 12, cost: 2_000_000, stateAgent: "Berno Bernstein")
office.salesSummary()
let house = House(rooms: 5, cost: 128_000, stateAgent: "Christine Cross")
house.salesSummary()
