import SwiftUI

//custom view for ForEach button label

struct FlagImage: View {
    var country = [String]()
    var number: Int
    
    var body: some View {
        Image(country[number])
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}


struct Project2Final:View {
    @State public var countryArray = ["Germany", "Nigeria", "France", "Ireland", "Russia", "Italy", "Estonia", "Monaco", "Poland", "Spain", "UK", "US"]
        .shuffled()
    @State public var correctNumber = Int.random(in: 0...2)
    @State public var gameRoundTracker = 0
    @State public var score = 0
    @State public var prompt = "Correct Answer"
    @State public var alert = false
    @State public var gameOver = false
    let gameOverMessage = "Game over"
    @State public var updatedVisualScore = ""
    
    
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
//                        Image(countryArray[number])           I used custom view (FlagImage) instead
//                            .renderingMode(.original)
//                            .clipShape(Capsule())
//                            .shadow(radius: 5)
                        FlagImage(country: countryArray, number: number)
                        
                    }.alert(prompt, isPresented: $alert) {
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
            prompt = "Correct Answer"
            score += 1
            updatedVisualScore += "[O]"
        } else {
            prompt = "Wrong Answer: That's \(countryArray[number])"
            score -= 1
            updatedVisualScore += "[X]"
        }
        
        gameRoundTracker += 1
        
        if gameRoundTracker == 8 {
            gameOver = true
        }
        alert = true
    }
    
    func newRoll() {
        countryArray.shuffle()
        correctNumber = Int.random(in: 0...2)
    }
    
    func newGame() {
        score = 0
        gameRoundTracker = 0
        updatedVisualScore = ""
        countryArray.shuffle()
        correctNumber = Int.random(in: 0...2)
    }
    
}

struct Project2Final_Previews: PreviewProvider {
    static var previews: some View {
        Project2Final()
    }
}
