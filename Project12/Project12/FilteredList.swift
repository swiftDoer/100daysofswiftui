import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    

    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    

    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    

    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
        )
        self.content = content 
    }
}

/* "SIMPLE" */
//struct FilteredList: View {
//    @FetchRequest var fetchRequest: FetchedResults<Singer>
//    var body: some View {
//        List(fetchRequest, id: \.self) { item in
//            Text("\(item.wrappedFirstName) \(item.wrappedLastName)")
//        }
//    }
//    init(filter: String) {
//        _fetchRequest = FetchRequest<Singer>(
//            sortDescriptors: [],
//            predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter)
//        )
//    }
