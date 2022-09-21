//
//  twoView.swift
//  WeSplit
//
//

import SwiftUI

struct twoView: View {
    
//    @ObservedObject var second : BreadViewModel
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            NavigationLink(destination: {
//                thirdPage(third: second)
                thirdPage()
            }, label: {
                Text("Third")
            })
        }
        
    }
}

//struct twoView_Previews: PreviewProvider {
//    static var previews: some View {
//        twoView()
//    }
//}
