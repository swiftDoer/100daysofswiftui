import Foundation

protocol Vehicle {
    var speed: Double { get }
    func estimateTime(for distance: Int) -> Double
}


struct Car: Vehicle {
    
    var speed: Double 
    
    func estimateTime(for distance: Int) -> Double {
      print("You wish to travel: \(distance) meters")
        return Double(distance)/(speed/3.6)
        
    }
    
    func speedPrint() {
        print("km/h: \(speed), m/s: \(speed/3.6)")
        
    }
}


let mercedes = Car(speed: 100)
mercedes.speed
let estimate = mercedes.estimateTime(for: 3000)
print("Traveltime: \(estimate/60) minutes")
mercedes.speedPrint()




extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
"""

print(lyrics.lines.count)


//最高


extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = [String]()
let bestFriend = guests.randomElement() ?? "Myself"
print("my best friend is: \(bestFriend)")

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
} else {
    print("Get some friends!")
}


let test = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]
let peachOpposite = test["Peach"]

if let marioOpposite = test["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}



let tvShows = [String]()
let favorite = tvShows.randomElement() ?? "None"
print(favorite)



let input2 = ""
let number = Int(input2) ?? 0
print(number)





var names222 = ["Arya", "Bran", "Robb", "Sansa"]
var chosen = names222.randomElement()?.uppercased()

for _ in names222 {
    print("Next in line: \(chosen ?? "nobody")")
    names222.remove(at: 0)
    chosen = names222.randomElement()?.uppercased()
}

print("Next in line: \(chosen ?? "nobody")")




enum UserError: Error {
    case badID, networkFailed
}


func getUser(id: Int) throws -> String {
    if id == 23 {
        throw UserError.networkFailed
    } else {
        return "Gottem"
    }
}
if let user = try? getUser(id: 22) {
    print("User: \(user)")
}

 // The getUser() function will always throw networkFailed (if id == 23), but you don’t care what was  thrown – all i care about is whether the call sent back a user or not.


var zuser: Dictionary<String, String>
var losers: [String: String]

var iejr = [String]()
var iejwji = Set([String]())


let age = 18
let canVote = age >= 18 ?
"Yes" : "No"
print(canVote)


var result2: Int {
    Int.random(in: 1...6)
}
print(result2)




func tupel(_ name1: String, _ name2: String) -> (name1: String, name2: String) {
    (name1, name2)
}

let tupelExample = tupel("Mon", "Sob")
print(tupelExample.name1)



let adder = { (num1: Int, num2: Int) -> Int in
num1 + num2
}
print(adder(2, 3))


let tem = ["Geran", "Milda"]
let gSort = tem.filter({ name in
    name.hasPrefix("G")
})
print(gSort)


var vacAllowed = 10
var vacTaken = 2
var vacRemain = vacAllowed - vacTaken // is calculated once

var vacRemain2: Int {
    vacAllowed - vacTaken
}
// calculated every time its mentioned

var dogFood = 200
let dogs = 2

var dogFoodAmount: Int {
    get {
        dogFood / dogs
    }
  
}
print(dogFoodAmount)




outer: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("Product is \(product)")
        break outer
    }
}
