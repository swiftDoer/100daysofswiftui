import SwiftUI

struct RedOneView: View {
    var body: some View {
        NavigationView {
            VStack {
                CircleNumberView(color: .red, number: 1)
                    .navigationBarTitle("Red one", displayMode: .inline)
                    .offset(y: -40)
                
                NavigationLink(destination: {
                    BlueTwoView(color: .green)
                }, label: {
                    ButtonStyle()
                        .background(Color.blue)
                })
            }
        }
        .accentColor(Color(.label))
    }
}

struct ButtonStyle: View {
    var body: some View {
        Text("Next Screen")
            .bold()
            .frame(width: 280, height: 50)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}


struct BlueTwoView: View {
    
    var color: Color
    
    var body: some View {
        VStack {
            CircleNumberView(color: .blue, number: 2)
                .navigationTitle("Blue Two")
                .offset(y: -40)
            
            NavigationLink(destination: {
                GreenThreeView(color: .brown)
            }, label: {
                ButtonStyle()
                    .background(color)
            })
        }
    }
}


struct GreenThreeView: View {
    
    var color: Color
 
    var body: some View {
        VStack {
            CircleNumberView(color: .green, number: 3)
                .navigationTitle("Green Three")
                .offset(y: -40)
        }
    }
}



struct CircleNumberView: View {
    
    var color: Color
    var number: Int
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct FirstCircleView_Preview: PreviewProvider {
    static var previews: some View {
        RedOneView()
    }
}
