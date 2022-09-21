//
//  ExtraStuffAGAIN.swift
//  WeSplit
//
//
import SwiftUI
struct ExtraStuffAGAIN_Previews: PreviewProvider {
    static var previews: some View {
        List {
            EntireRow(itemName: "Ogayu", itemPosition: "Sit", itemCost: 320, itemDelivered: false)
        }
    }
}


struct EntireRow: View {
    
    var itemName : String
    var itemPosition : String
    var itemCost : Int
    var itemDelivered : Bool
    
    var body: some View {
        HStack {
            NameAndPosition(itemName: itemName, itemPosition: itemPosition)
            
            Spacer()
        
            CostAndDeliveredStatus(itemCost: itemCost, itemDelivered: itemDelivered)
        }
    }
}



struct CostAndDeliveredStatus: View {
    
    var itemCost : Int
    var itemDelivered : Bool
    
    
    var body: some View {
        VStack {
            Circle().fill(itemDelivered ? .green : .secondary)
                .frame(width: 25)
                .shadow(color: itemDelivered ? .green : .white, radius: 5)
            Text("\(itemCost)€")
                .font(.caption)
        }
    }
}


struct NameAndPosition: View {
    
    var itemName : String
    var itemPosition : String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(itemName)
            Text(itemPosition)
                .foregroundColor(.secondary)
        }
    }
}
