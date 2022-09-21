//
//  View.swift
//  WeSplit
//
//

import SwiftUI

struct MyView: View {
    
    @ObservedObject var viewView = NicePersonViewModel()
    
    var body: some View {
        
        List {
            ForEach(viewView.nicePersonViewModelArray) { item in
                HStack {
                    
                    LeftSideListView(itemGovName: item.govName, itemIsOnline: item.isOnline)
                    
                    Spacer()
                    
                    RightSideListView(itemInternalName: item.internalName, itemSpiedOnAmount: item.spiedOnAmount)
                }
            }
            NavigationLink(destination: {
                myDestinedDestination()
            }, label: {
                Text("Fuck you land")
            })
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
