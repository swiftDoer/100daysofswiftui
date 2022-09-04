
import UIKit

//Checkpoint 7:

class Animal {
    let legs:Int
    init(legs: Int){
        self.legs = legs
    }
    
}


class Dog: Animal {
    func speak(){
        print("What language do dogs speak?")
        
    }
}

class Cat: Animal {
    var isTame: Bool
    init(isTame: Bool, legs:Int){
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak(){
        print("What language do cats speak?")
        
    }
}


final class Corgi: Dog {
    override func speak(){
        print("Wrrrruf wrruff!!!")

    }
}

final class Poodle: Dog {
    override func speak(){
        print("Woof wooph!!!")
        
    }
}

final class Persian: Cat {
    override func speak(){
        print("Meeow")
    }
}

final class Lion: Cat {
    override func speak(){
        print("MRRReeooow!!!")
    }
}


let ben = Persian(isTame: true, legs: 3)
ben.speak()
print("Ben has \(ben.legs) legs and is tame is: \(ben.isTame)")

















// super.init with set parameter

class Shape {
    var sides: Int
    init(sides: Int) {
        self.sides = sides
    }
}
class Rectangle: Shape {
    var color: String
    init(color: String) {
        self.color = color
        super.init(sides: 4)
    }
}

//Creates two different Statues, so the data is not shared.

class Statue {
    var sculptor = "Unknown"
}
var venusDeMilo = Statue()
venusDeMilo.sculptor = "Alexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)



