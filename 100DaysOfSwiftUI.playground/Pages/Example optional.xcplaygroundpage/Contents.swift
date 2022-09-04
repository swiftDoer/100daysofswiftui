import UIKit

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]
print(peachOpposite)

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}




var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty")
}

var num1 = 1_000
var num2 : Int? = nil

num2 = 12
num2 = nil

var str1 = "Hi"
var str2 : String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil

//The function below wont work because it needs to know value really exists. No optionals allowed.

func square(number: Int) -> Int {
    number * number
}
var number: Int? = nil

// print(square(number: number))
// this line ^should be uncommented.


//So we have to check it before we mark it before we allow it to enter out country. It's ironically called unwrapping.

number = 12 //code wont run if no num
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}



//the standard way of unwrapping looks like this actually:
//if let number = number {
//    print(square(number: number))
//}


// "if let" only runs if the optional has a value
// "guard let" only runs if the optional doesnt have a value

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number) ")
}

var e: Int? = nil
printSquare(of: e)



func getMeaningOfLife() -> Int? {
    42
}

func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}

func printMeaningOfLife2() {
    guard let name = getMeaningOfLife() else {
        return
    }
    print(name)
}

printMeaningOfLife2()


// nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

//same as
// let new = captains["Serenity", default:"N/A"]

let tvShows = ["Archer", "Babylon", "Lasso"]
let favorite = tvShows.randomElement() ?? "None"
print(favorite)


struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anon"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)


// optional chaining
// if the optional has a value inside -> unwrap it & then ... uppercase it in this case. if it cant be done, print no one

let namezz = ["Arya", "Bran", "Robb"]
let chosen = namezz.randomElement()?.uppercased() ?? "No one"

print("Next in line: \(chosen)")





struct Book2 {
    let title: String
    let author: String?
}

//if we have a book && it has an author && has first letter in their name, then uppercase it. if it doesnt, send an "A"

var book2: Book? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author)

//ERROR HANDLING

enum UserError: Error {
    case badID, networkFail
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFail
}

if let user = try? getUser(id: 23){
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymus"
print(user)
 
func arrayAccepter(array: [Int]?) -> Int{
    array?.randomElement() ?? Int.random(in: 1...100)
}
var array = [1,2,3]
print(arrayAccepter(array: array))
array.removeAll()
print(arrayAccepter(array: array))
