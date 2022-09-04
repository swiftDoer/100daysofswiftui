import UIKit

func arrayAccepter(array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}
var array = [1,2,3]
print(arrayAccepter(array: array))
array.removeAll()
print(arrayAccepter(array: array))

