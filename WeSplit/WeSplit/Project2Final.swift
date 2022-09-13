import SwiftUI

//custom view for ForEach button label

//struct FlagImage: View {
//    var country = [String]()
//    var number: Int
//
//    var body: some View {
//        Image(country[number])
//            .renderingMode(.original)
//            .clipShape(Capsule())
//            .shadow(radius: 5)
//    }
//}


struct Project2Final:View {
    @State public var countryArray = ["Germany", "Nigeria", "France", "Ireland", "Russia", "Italy", "Estonia", "Monaco", "Poland", "Spain", "UK", "US"]
        .shuffled()
    @State private var correctNumber = Int.random(in: 0...2)
    @State private var gameRoundTracker = 0
    @State private var score = 0
    @State private var prompt = "Correct Answer"
    @State private var alert = false
    @State private var gameOver = false
    let gameOverMessage = "Game over"
    @State private var updatedVisualScore = ""
    
    @State private var wonRound = false
    @State private var animationAmount = [0.0, 0.0, 0.0]
    
    //Make the other two buttons fade out to 25% opacity. && 0.75 scale.
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .green, .yellow, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .padding()
                    .background(.regularMaterial)
                    .font(.largeTitle.bold())
                    .clipShape(Capsule())
                
                Text(countryArray[correctNumber])
                    .padding(.horizontal)
                    .background(.regularMaterial)
                    .font(.title2.bold())
                    .clipShape(Capsule())
                
                ForEach(0..<3) { number in
                    Button {
                        flagCheck(number)
                        
                    } label: {
 //                        FlagImage(country: countryArray, number: number)
                        if number != correctNumber {
                            Image(countryArray[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                                .opacity(wonRound ? 0.75 : 1)
                                .scaleEffect(wonRound ? 0.75 : 1)
                                .animation(.default, value: wonRound)
                        } else {
                            Image(countryArray[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                                .animation(.default, value: wonRound)
                        }
                        
                    }
                    .rotation3DEffect(.degrees(animationAmount[number]), axis: (x: 0, y: 1, z: 0))
                    .alert(prompt, isPresented: $alert) {
                        Button("Continue", action: newRoll)
                    } message: {
                        if prompt == "Correct Answer" {
                            Text("Score: +1")
                        } else {
                            Text("Score: -1")
                        }
                    }
                    .alert(gameOverMessage, isPresented: $gameOver) {
                        Button("New Game", action: newGame)
                    } message: {
                        Text("You have finished 8 rounds")
                    }
                }
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(prompt == "Correct Answer" ? .green : .red)
                
                Text(updatedVisualScore)
                    .font(.title3.bold())
                    .foregroundColor(prompt == "Correct Answer" ? .green : .red)
            }
        }
    }
    
    func flagCheck(_ number: Int) {
        if number == correctNumber {
            wonRound = true
            withAnimation {
                animationAmount[number] += 360
                prompt = "Correct Answer"
                score += 1
                updatedVisualScore += "[O]"
                
            }
        } else {
            withAnimation {
                prompt = "Wrong Answer: That's \(countryArray[number])"
                score -= 1
                updatedVisualScore += "[X]"
            }
        }
        
        gameRoundTracker += 1
        
        if gameRoundTracker == 8 {
            gameOver = true
        }
        alert = true
    }
    
    func newRoll() {
        withAnimation {
            wonRound = false
            countryArray.shuffle()
            correctNumber = Int.random(in: 0...2)
        }
    }
    
    func newGame() {
        withAnimation {
            wonRound = false
            score = 0
            gameRoundTracker = 0
            updatedVisualScore = ""
            countryArray.shuffle()
            correctNumber = Int.random(in: 0...2)
        }
    }
    
}

struct Project2Final_Previews: PreviewProvider {
    static var previews: some View {
        Project2Final()
    }
}
