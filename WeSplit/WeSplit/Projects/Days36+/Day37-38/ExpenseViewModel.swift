import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var personalExpenseArray : [PersonalExpense] = [
        PersonalExpense(name: "Eraser", cost: 3.29),
        PersonalExpense(name: "Tennisball", cost: 29.99),
    ]
    
    @Published var businessExpenseArray : [BusinessExpense] = [
        BusinessExpense(name: "Brush", cost: 2.99),
        BusinessExpense(name: "Pen", cost: 1.09),
    ]
}
    
//class ExpenseViewModel: ObservableObject {
//    @Published var expenseArray = [Expense]() {
//
//        didSet {
//            if let encoded = try? JSONEncoder().encode(expenseArray) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([Expense].self, from: savedItems) {
//                expenseArray = decodedItems
//                return
//            }
//        }
//        expenseArray = []
//    }
//}
//        func reemoveItem(index: IndexSet) {
//            expenseArray.remove(atOffsets: index)
//        }
    

