//
//  ExternalViews.swift
//  WeSplit
//
//  Created by Andreas Nuss on 19.09.22.
//

import SwiftUI


struct ExternalViews_Previews: PreviewProvider {
    static var previews: some View {
        RightSideListView(itemInternalName: "Chikeee", itemSpiedOnAmount: 32)
    }
}


struct myDestinedDestination:View {
    var body: some View {
        Text("hi")
    }
}


struct LeftSideListView: View {
    
    let itemGovName : String
    let itemIsOnline : Bool
    
    var body: some View {
        VStack {
            Text(itemGovName)
                .bold()
            Image(systemName: "person.crop.circle.badge.checkmark.fill")
                .font(.largeTitle)
                .foregroundColor(itemIsOnline ? .green : .secondary)
        }
    }
}


struct RightSideListView: View {
    
    let itemInternalName : String
    let itemSpiedOnAmount : Int
    
    var body: some View {
        
        VStack {
            Text(itemInternalName)
            Text("\(itemSpiedOnAmount)")
                .foregroundColor(.secondary)
                .fontWeight(.bold)
        }
    }
}


