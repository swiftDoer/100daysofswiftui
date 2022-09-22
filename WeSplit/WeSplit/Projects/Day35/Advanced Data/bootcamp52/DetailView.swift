//
//  DetailView.swift
//  WeSplit
//
//  Created by Andreas Nuss on 20.09.22.
//

import SwiftUI

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
////        FinalView(uiColor: .red)
//        FinalView()
//    }
//}


struct ColorBootcamp: View {
    var body: some View {
        ZStack {
            Rectangle()
            RoundedRectangle(cornerRadius: 25)
                .fill(
    //                Color.primary
    //                #colorLiteral(
//                    Color(UIColor.systemBackground)
//                    Color(UIColor.secondarySystemBackground)
                    Color("CustomColor")
                )
            .frame(width: 300, height: 200)
        }
    }
}


struct EpicCircle: View {
    
    @State var isOn = true
    
    var body: some View {
        
        Button(action: {
            isOn.toggle()
        }, label: {
            ZStack {
                Circle()
                    .trim(from: isOn ? 0 : 0.99, to: 1)
                    .animation(.default, value: isOn)
                    .foregroundColor(Color(red: 0.471, green: 0.76, blue: 0.701))
                Text("Hi")
                    .foregroundColor(.white)
                    .font(.system(size: 99)).bold()
            }
        })
    }
}


struct FinalView: View {
    
//    init(uiColor : UIColor) {#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)}
//    var someColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
//    var anotherColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
//#colorLiteral(  everything not working lol
    
//    @ObservedObject var viewModel: EnvironmentViewModel dont need becuae of .environmentObject(viewModel)
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .cyan],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            
            
//            LinearGradient(gradient: Gradient(colors: UIColor(init)), startPoint: .topLeading, endPoint: .bottomTrailing)
//            Rectangle().fill(Color(red: 0.85, green: 0.786, blue: 0.487))
            VStack {
                Text("very hello")
                Text("very hello")
                    .font(.title)
                Text("very hello")
                    .font(.largeTitle)
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                }
            }.foregroundColor(.white)
        }
    }
}



struct DetailView: View {
    
//    @ObservedObject var viewModel: EnvironmentViewModel doesnt need it because of .environmentObject(viewModel)
    
    var selectedItem : String
    
    var body: some View {
        ZStack {
            Rectangle().fill(.orange.gradient).ignoresSafeArea()
            
            NavigationLink(destination: {
                FinalView()
            }, label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            })
            
        }
    }
}


