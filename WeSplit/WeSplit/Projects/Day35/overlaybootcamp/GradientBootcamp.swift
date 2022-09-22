//
//  GradientBootcamp.swift
//  WeSplit
//
//

import SwiftUI

struct GradientBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GUhUSH()
    }
}

struct GUhUSH: View {
    var body: some View {
        Image("Italy")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 200)
//            .clipped()
//            .cornerRadius(25)
            .clipShape(Circle())
    }
}



struct GradientBootcamp: View {
    
    // I have created separate color sets for these in Assets.xcassets folder
    let gradient1 = Gradient(colors: [Color("Color1"), Color("Color2")])
    let gradient2 = Gradient(colors: [Color("Color3"), Color("Color4")]) //fav
    let gradient3 = Gradient(colors: [Color("Color5"), Color("Color6"), Color("Color7")])
    let gradient4 = Gradient(colors: [Color("Color1"), Color("Color2"), Color("Color3")])
    let gradient5 = Gradient(colors: [Color("Color1"), Color("Color4"), Color("Color2"), Color("Color6"), Color("Color3")])
    let gradient6 = Gradient(colors: [Color("Colo1"), Color("Colo2")])
    let gradient7 = Gradient(colors: [Color("Colo3"), Color("Colo4"), Color("Colo5")])
    
    
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue.gradient)
                .frame(width: 150, height: 100)
                
                Grodient(gradientName: gradient1)
            }
            
            HStack {
                Grodient(gradientName: gradient2)
                Grodient(gradientName: gradient3)
            }
            
            HStack {
                Grodient(gradientName: gradient4)
                Grodient(gradientName: gradient5)
            }
            
            HStack {
                Grodient(gradientName: gradient6)
                Grodient(gradientName: gradient7)
            }
            HStack {
                RadialGradient(gradient: gradient2, center: .topLeading, startRadius: 3, endRadius: 150)
                    .frame(width: 150, height: 100)
                    .cornerRadius(25)
                
                AngularGradient(gradient: gradient2, center: .topLeading, angle: .degrees(180 + 45))
                    .frame(width: 150, height: 100)
                    .cornerRadius(25)
            }
            HStack {
                Image(systemName: "person.fill.badge.plus")
//                    .renderingMode(.original)
//                    .symbolRenderingMode(.palette)
                
                    .resizable()
//                    .scaledToFit()
                    .scaledToFill()
//                    .font(.largeTitle)
//                    .foregroundColor(.brown)
//                    .background(.green)
                    .frame(width: 100, height: 80)
                    .clipped()
            }
        }
    }
    
    
    
}

struct Grodient: View {
    
    let gradientName : Gradient
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                .red.gradient
                LinearGradient(gradient: gradientName,
                               startPoint: .top,
                               endPoint: .bottomTrailing
                              )
            )
            .frame(width: 150, height: 100)
    }
}


