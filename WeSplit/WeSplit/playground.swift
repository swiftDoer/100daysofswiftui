import SwiftUI

//struct playground: View {
//    var body: some View {
//        Text
//    }
//}

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.blue)
            .bold()
            .background(.white)
            .cornerRadius(5)
            .padding()
            .background(.gray)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            .background(.yellow)
    }
}

struct CustomArrayEmoji: View {
    var number: Int
    var text = [String]()
    
    var body: some View {
        Text(text[number])
            .foregroundColor(.blue)
            .bold()
            .background(.white)
            .cornerRadius(5)
            .padding()
            .background(.gray)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            .background(.green)
    }
}



struct RedTextGraybackground: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.red)
            .background(.gray)
    }
}

struct BottomEmojiWithRedBoarder: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 200, height: 200, alignment: .bottomTrailing)
            .background(.red)
    }
}

struct Playground: View {
    
    let emojiArray = ["🤘","🧑🏼‍💻","🤡"]
    
    var body: some View {
        
        VStack {
            RedTextGraybackground(text: "Hello")
            CustomText(text: "Hey whats up!")
            CustomArrayEmoji(number: 2, text: emojiArray)
            ForEach(0..<3) {
                CustomArrayEmoji(number: $0, text: emojiArray)
            }
            BottomEmojiWithRedBoarder(text: "🧻")
        }

        
        
    }
}







struct Playground_Previews: PreviewProvider {
    static var previews: some View {
        Playground()
    }
}
