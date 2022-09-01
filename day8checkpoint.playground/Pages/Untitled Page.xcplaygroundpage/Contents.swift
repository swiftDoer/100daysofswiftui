import UIKit

//1
var moin = String()

print(moin.isEmpty)

//2

enum weight: Comparable{
    case light, mid, heavy
}

let firstSet = weight.mid

firstSet < .heavy ? print("Warming up.") : print("Last set!")
    
//3

var fun = true

print(fun ? "Yes" : "No")

//4

let pets = -1

if pets.isMultiple(of: 2) && pets < 3 {
    print("Seems like you have 2 pets")
} else if pets == 0{
    print("0 it is. Try harder.")
}else{
    print("anything but 0 and 2.")
}

//5

enum Workdays{
    case monday, tuesday, thursday
}

let day = Workdays.monday

switch day{
case .monday: print("Start of the week - that's easy!")
case .tuesday: print("Halfway there - that was fast!")
case .thursday: print("Pretty much done - lets go again!")
}

//6

let iAlreadyUsedTheTernaryOperation = true

print(iAlreadyUsedTheTernaryOperation ? "Yes" : "No")

//7

var coloredSocksRow = [String]()
coloredSocksRow.append("red")
coloredSocksRow.append("blue")
coloredSocksRow.append("green")
coloredSocksRow.append("yellow")
coloredSocksRow.append("gray")

print(coloredSocksRow.count < 6 ? "Gotta get more socks! \(coloredSocksRow.count) wont last you a week" : "\(coloredSocksRow.count) is enough for a week")

//8

//loop variable, loop body, loop iteration

//9

let array = [1,2,3,6,4,5]

for i in 0..<array.count{
    print("item \(i) is \(array[i])")
}

//10


let array2 = [1,2,3,6,4,5]

print(array2[0...])
print(array2) //same thing
print(array2[2...])

//11

var num = 0

while num != 6{
    print("Unlucky!")
    num = Int.random(in: 1...6)
}
print("Congratulations, you rolled a \(num)!")

//12

var num2 = 0

while true{
    num2 += 1
    if num2 == 2{
        continue
    }
    else if num2 == 7{
        break
    }
    else{
        print(num2)
    }
}

//13

func cityCountry() -> (city: String, country: String){
    ("London", "England")
}
let (city, country) = cityCountry()
print("\(city) is in \(country)")

//14

func addTwo(_ num1:Int, secondSpot num2:Int)->Int{
    num1 + num2
}
print(addTwo( 3, secondSpot: 3))


