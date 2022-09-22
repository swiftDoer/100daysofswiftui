import SwiftUI

@main
struct WeSplitApp: App { //do not change this struct name
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
//    @StateObject var appInfo = AppInformation()
    
    var body: some Scene {
        WindowGroup {
//            DataAcrossViews().environmentObject(appInfo)
//            FirstView()
//            AppView()
//                .environmentObject(GameStart()) // profile will be accessible to AccountView and all of its subviews.
            
//            MainView()
            Day36()
//            oneView()
//                .environmentObject(BreadViewModel())
        }
    }
}
