//
//  ViewAGAIN.swift
//  WeSplit
//
//

import SwiftUI
struct ViewAGAIN: View {
    
    @ObservedObject var figure = FigureViewModel()
    
    var body: some View {
        List {
            ForEach(figure.figureViewModel) { item in
                EntireRow(itemName: item.name, itemPosition: item.position, itemCost: item.cost, itemDelivered: item.delivered)
            }
        }
    }
}

struct ViewAGAIN_Previews: PreviewProvider {
    static var previews: some View {
        ViewAGAIN()
    }
}
