import SwiftUI

@main
struct WeSplitApp: App { //do not change this struct name
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.red]
//    }
    
//    @StateObject var appInfo = AppInformation()
    
    var body: some Scene {
        WindowGroup {
//            DataAcrossViews().environmentObject(appInfo)
//            FirstView()
//            AppView()
//                .environmentObject(GameStart()) // profile will be accessible to AccountView and all of its subviews.
            
//            MainView()
            ButtonUI()
//            oneView()
//                .environmentObject(BreadViewModel())
        }
    }
}
