
import UIKit


enum numError: Error{
    case tooLow, tooHigh, noRoot
}

func squareRoot(_ number: Int) throws-> Int{
    
    if number < 1 {
        throw numError.tooLow
    }
    if number > 10_000 {
        throw numError.tooHigh
    }
    
    var insideNum = 1
    
    for _ in 1...100{
        if insideNum * insideNum == number{
            break;
        } else{
            insideNum += 1
        }
    }
    
    if insideNum == 101{
        throw numError.noRoot
    }
    
    return insideNum
}

let testNumber = 16

do{
    let result = try squareRoot(testNumber)
    print("Squareroot from \(testNumber) = \(result)")
} catch numError.noRoot {
    print("Please use a number with a natural number as the result")
} catch {
    print("Error: Please use a number between 1 and 10000.")
}
