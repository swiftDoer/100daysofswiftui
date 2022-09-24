import SwiftUI

@main
struct WeSplitApp: App {
    
// MARK: MAKES THE NAVIGATION BAR WHITE
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
//    }
    
    var body: some Scene {
        WindowGroup {
            MoonShotView()

            
            /*
             DataAcrossViews().environmentObject(appInfo)
             AppView().environmentObject(GameStart())
             profile will be accessible to AccountView and all of its subviews.
             */
        }
    }
}
