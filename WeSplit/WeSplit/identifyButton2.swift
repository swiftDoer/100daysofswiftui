import SwiftUI

struct ChangeColorButton: ButtonStyle {
    let colors: [Color] = [.gray, .green, .red]
    let numberForBackground: Int

    func makeBody(configuration: Configuration) -> some View {

        configuration.label
            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
            .background(colors[numberForBackground])
    }
}

struct Playground3: View {

@State private var buttonNumberArray:[String] = ["A","B","C"]
@State private var colorNumberArray:[Int] = [0,0,0]

var body: some View {

    VStack {
        ForEach(0..<colorNumberArray.count, id: \.self) { forNumber in

            Text("\(colorNumberArray[forNumber])")
            Text("\(forNumber)")
            Button(action: {
                changeNumber(number: forNumber)
            }, label: {
                Text("\(buttonNumberArray[forNumber])")
                    .font(.caption2)
            })
            .buttonStyle(ChangeColorButton(numberForBackground: colorNumberArray[forNumber]))
            .padding()
        }

    VStack {
        Text("colorNumberArray 0  \(colorNumberArray[0])")
        Text("colorNumberArray 1  \(colorNumberArray[1])")
        Text("colorNumberArray 2 \(colorNumberArray[2])")
    }
    }

}


func changeNumber(number:Int){

    if colorNumberArray[number] == 2 {
        colorNumberArray[number] = 0
    }else {
        colorNumberArray[number] += 1
    }
}
}

struct Playground3_Previews: PreviewProvider {
    static var previews: some View {
        Playground3()
    }
}
