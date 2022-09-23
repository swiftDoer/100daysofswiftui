import SwiftUI
struct MainViewDay37_Previews: PreviewProvider {
    static var previews: some View {
        MainViewDay37()
    }
}


struct MainViewDay37: View {
    
    @StateObject var expenses = ExpenseViewModel()
    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationView {
            
            
            List {
                
                Section {
                    Text("Business List")
                        .font(.headline)
                    ForEach(expenses.businessExpenseArray) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text(item.cost, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .font(  item.cost < 10.0 ? .caption :
                                            item.cost < 100.0 ? .subheadline :
                                        .title3
                                )
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    .onDelete(perform: reemoveItem)
                }
                Section{
                    Text("Personal List")
                        .font(.headline)
                    ForEach(expenses.personalExpenseArray) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text(item.cost, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .font(  item.cost < 10.0 ? .caption :
                                            item.cost < 100.0 ? .subheadline :
                                        .title3
                                )
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    .onDelete(perform: reemoveItem)
                }
            }
            
            .navigationTitle("Expenses")
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    EditButton()
                })
                
                ToolbarItemGroup(placement: .navigationBarLeading, content: {
                    Button(action: {
//                        let expense = Expense(name: "Bag", isBusiness: true, cost: 1.29)
//                        expenses.expenseArray.append(expense)
                        showingAddExpense = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                })
            })
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expense: expenses)
            })
        }
    }
    func reemoveItem(index: IndexSet) {
        expenses.personalExpenseArray.remove(atOffsets: index)
    }
}

