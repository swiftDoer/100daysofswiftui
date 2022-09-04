import Foundation

extension Array {
    var isNotEmpty: Bool{
        isEmpty == false
    }
}

let guests = ["Manhattan", "Texas", "John"]

if guests.isNotEmpty {
    print("We have \(guests.count) guests attending.")
}
