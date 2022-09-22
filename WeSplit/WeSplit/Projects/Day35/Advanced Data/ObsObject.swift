//
//  ObsObject.swift
//  WeSplit
//
//  https://www.youtube.com/watch?v=VioWHKN1eKs&ab_channel=azamsharp
//  from that video

import SwiftUI

struct ObsObject: View {
    
    @ObservedObject var fancyTimer = FancyTimer()
    
    var body: some View {
        Text("\(fancyTimer.value)")
            .font(.largeTitle)
    }
}

struct ObsObject_Previews: PreviewProvider {
    static var previews: some View {
        ObsObject()
    }
}
