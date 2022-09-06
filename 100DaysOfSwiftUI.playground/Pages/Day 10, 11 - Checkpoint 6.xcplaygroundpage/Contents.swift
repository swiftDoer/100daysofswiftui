import UIKit


struct Car {
    private let model: String
    private let seats: Int
    private(set) var currentGear = 1 {
        didSet{
            print("You changed the gear to \(currentGear)")
        }
    }
    static var example = Car(model: "Some Audi", seats: 5)
    
    
    mutating func changeGear(gearUp:Bool) {
        if currentGear >= 10 && gearUp{
            print("You can't go over gear 10")
        } else if currentGear <= 1 && !gearUp{
            print("You can't go below gear 1")
        } else if gearUp {
            currentGear += 1
        } else {
            currentGear -= 1
        }
    }
}


print(Car.example)
Car.example.changeGear(gearUp: true)
Car.example.changeGear(gearUp: true)
Car.example.changeGear(gearUp: true)
Car.example.changeGear(gearUp: false)
Car.example.changeGear(gearUp: false)
