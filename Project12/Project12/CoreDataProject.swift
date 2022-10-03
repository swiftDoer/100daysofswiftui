import CoreData
import SwiftUI
struct CoreDataProject_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataProject()
    }
}


struct CoreDataProject: View {
    
    
//    @FetchRequest(sortDescriptors: [], predicate: nil) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == 'Star Wars'")) var ships: FetchedResults<Ship>
    
    
    // %@‘ means “insert some data here”,
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])) var ships: FetchedResults<Ship>
    // BEGINSWITH[c] -> CASE-INSENSITIVE
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
//
//    var body: some View {
//        VStack {
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown name")
//            }
//
//            Button("Add Examples") {
//                let ship1 = Ship(context: moc)
//                ship1.name = "Enterprise"
//                ship1.universe = "Star Trek"
//
//                let ship2 = Ship(context: moc)
//                ship2.name = "Defiant"
//                ship2.universe = "Star Trek"
//
//                let ship3 = Ship(context: moc)
//                ship3.name = "Millennium Falcon"
//                ship3.universe = "Star Wars"
//
//                let ship4 = Ship(context: moc)
//                ship4.name = "Executor"
//                ship4.universe = "Star Wars"
//
//                try? moc.save()
//            }
//        }
//    }
    
    
    
    
    
    
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    var body: some View {
        VStack {
            //list of matching singers
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (item: Singer) in
                Text("\(item.wrappedFirstName) \(item.wrappedLastName)")
            }

            Button("add examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? moc.save()
            }

            Button("show A") {
                lastNameFilter = "A"
            }

            Button("show S") {
                lastNameFilter = "S"
            }
        }
    }
    
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
//
//    var body: some View {
//        VStack {
//            List {
//                ForEach(countries, id: \.self) { country in
//                    Section(country.wrappedFullName) {
//                        ForEach(country.candyArray, id: \.self) { candy in
//                            Text(candy.wrappedName)
//                        }
//                    }
//                }
//            }
//            Button("add examples") {
//                let candy1 = Candy(context: moc)
//                candy1.name = "Mars"
//                candy1.origin = Country(context: moc)
//                candy1.origin?.shortName = "UK"
//                candy1.origin?.fullName = "United Kingdom"
//
//                let candy2 = Candy(context: moc)
//                candy2.name = "KitKat"
//                candy2.origin = Country(context: moc)
//                candy2.origin?.shortName = "UK"
//                candy2.origin?.fullName = "United Kingdom"
//
//                let candy3 = Candy(context: moc)
//                candy3.name = "Twix"
//                candy3.origin = Country(context: moc)
//                candy3.origin?.shortName = "UK"
//                candy3.origin?.fullName = "United Kingdom"
//
//                let candy4 = Candy(context: moc)
//                candy4.name = "Toblerone"
//                candy4.origin = Country(context: moc)
//                candy4.origin?.shortName = "CH"
//                candy4.origin?.fullName = "Switzerland"
//
//                try? moc.save()
//            }
//        }
//    }
}
