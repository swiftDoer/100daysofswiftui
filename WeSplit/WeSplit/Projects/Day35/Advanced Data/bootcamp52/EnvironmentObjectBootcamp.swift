//
//  EnvironmentObjectBootcamp.swift
//  WeSplit
//
//

import SwiftUI

struct EnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel : EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(destination: {
                        DetailView(selectedItem: item)
                    }, label: {
                        Text(item)
                    })
                }
            }
            .navigationTitle("Apple")
        }
        .environmentObject(viewModel)
    }
}

struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBootcamp()
    }
}
