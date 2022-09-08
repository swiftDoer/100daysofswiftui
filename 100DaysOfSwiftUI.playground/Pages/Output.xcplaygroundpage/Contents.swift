import Foundation

//for i in 1...100 {
//    let w
//}


//var tipPercentages = [0.00]
//for i in 1...101 {
//    var w:Double = Double(i) - 0.99
//    tipPercentages.append(w)
//}
//print(tipPercentages)

//var tip = [0.00]
//var w = 0.0
//
//while Int(w) != 1 {
//    w += 0.01
//    tip.append(w)
//}
//print(tip)

//guess thats why you dont want to work with doubles lol

var tip = [Int]()
var tip2 = [Double]()

for i in 1...100 {
    tip.append(i)
}
print(tip)
print("""

 

""")
for j in 0...99 {
    tip2.append(Double(tip[j])/100)
}
print(tip2)

