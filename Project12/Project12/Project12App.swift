import SwiftUI

@main
struct Project12App: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            CoreDataProject()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
