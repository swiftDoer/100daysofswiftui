import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct WordScramble: View {
    @State private var increaseBox = 0.0
    var body: some View {
        GridStack(rows: 2, columns: 6) { row, col in
            HStack {
                
                
                Button {
                    increaseBox += 10.0
                } label: {
                    ZStack {
                        Color.blue
                            .frame(width: 50 + increaseBox, height: 50 + increaseBox)
                            .cornerRadius(15)
                        Text("\(row * 6 + col + 1)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
            }
        }
    }
}

struct WordScramble_Previews: PreviewProvider {
    static var previews: some View {
        WordScramble()
    }
}

