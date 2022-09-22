//
//  BoardingView.swift
//  WeSplit
//
//

import SwiftUI
struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        BoardingView()
    }
}


struct BoardingView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.cyan, Color.indigo]),
                center: .topLeading,
                           startRadius: 5,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
    }
}

