import SwiftUI

struct Edutainment: View {
    @State private var clickedButtonArray = [ false, false, false, false, false, false, false, false, false, false, false, false ]
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<6) { numberRow1 in
                    Button {
                        //hi
                    } label: {
                        ZStack {
                            Color.blue
                                .frame(width: 50, height: 50)
                                .cornerRadius(15)
                            Text("\(numberRow1 + 1)")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                    }
                }
            }
            
            HStack {
                ForEach(6..<12) { numberRow2 in
                    Button {
                        //hi
                    } label: {
                        ZStack {
                            Color.blue
                                .frame(width: 50, height: 50)
                                .cornerRadius(15)
                            Text("\(numberRow2 + 1)")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                    }
                }
            }
            
            ForEach(0..<clickedButtonArray.count, id: \.self){ num in
                
                Text("\(num)")
            }
        }
    }
}

struct Edutainment_Previews: PreviewProvider {
    static var previews: some View {
        Edutainment()
    }
}

