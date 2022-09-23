import SwiftUI
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: ExpenseViewModel())
    }
}


struct AddView: View {
    
    @ObservedObject var expense : ExpenseViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Business"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    TextField("Name",text: $name)
                    
                    Picker("Type", selection: $type, content: {
                        ForEach(types, id: \.self) { item in
                            Text(item)
                        }
                        
                    }).pickerStyle(.segmented)
                    
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                    Button(action: {
                        if type == "Personal" {
                            expense.personalExpenseArray.append(PersonalExpense(name: name, cost: amount))
                        } else {
                            expense.businessExpenseArray.append(BusinessExpense(name: name, cost: amount))
                        }
                        clearInput()
                    }, label: {
                        Text("Add")
                            .frame(width: 330, height: 50)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.white)
                            .font(.headline)
                            .background(content: {
                                Rectangle().fill(.pink.gradient)
                                    .cornerRadius(10)
                            })
                })
                }
                .navigationTitle("Add new expense")
                .toolbar(content: {
                    Button(action: {
                        dismiss.callAsFunction()
                    }, label: {
                        Text("Dismiss")
                    })
                })
            }
        }
    }
    
    func clearInput() {
        name = ""
//        type = "Personal"
        amount = 0.0
    }
}

