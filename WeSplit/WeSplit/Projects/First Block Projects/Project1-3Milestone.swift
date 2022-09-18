import SwiftUI

struct Project3_Milestone:View {
    @State private var itemArray = ["🪨", "🧻", "✂️"]
    @State private var winCheck = Bool.random()
    @State private var randomItem = Int.random(in: 0...2)
    @State private var score = 0
    @State private var rounds = 0
    @State public var gameOver = false
    let gameOverMessage = "Game over"
    //do these even have to be state private?? maybe remove
    
    private var status: String {
        winCheck ? "Defeats" : "Loses to"
    }
    
    private var rpsLogic: String {
        if winCheck && itemArray[randomItem] == "🪨" {
            return "🧻"
        } else if !winCheck && itemArray[randomItem] == "🪨"{
            return "✂️"
        } else if winCheck && itemArray[randomItem] == "🧻" {
            return "✂️"
        } else if !winCheck && itemArray[randomItem] == "🧻" {
            return "🪨"
        } else if winCheck && itemArray[randomItem] == "✂️" {
            return "🪨"
        } else if !winCheck && itemArray[randomItem] == "✂️" {
            return "🧻"
        } else {
            return "oof"
        }
    }
    
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
                .opacity(0.4)
            VStack {
                Text("Rock, Paper, Scissors")
                    .prominentTitle()
                
                ZStack {
                    Capsule()
                        .padding()
                        .frame(height: 200)
                        .foregroundColor(winCheck ? .green : .red)
                        .opacity(0.5)
    //                Color.winCheck ? .green : .red
    //                    .clipShape(RoundedRectangle(cornerRadius: 30))
    //                    .frame(height: 200)
                    VStack {
                        Text("\(itemArray[randomItem])")
                            .font(.system(size: 80))
                            .shadow(radius: 10)
                            .shadow(color: winCheck ? .green : .red, radius: 5)
                        
                        Text("What \(status) \(itemArray[randomItem])")
                            .padding(.horizontal)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                    }
                }
                
                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            if itemArray[number] == rpsLogic {
                                score += 1
                            } else {
                                score -= 1
                            }
                            
                            rounds += 1
                            if rounds == 10 {
                                gameOver = true
                            } else {
                                winCheck = Bool.random()
                                randomItem = Int.random(in: 0...2)
                            }
                            
                        } label: {
                            Text(itemArray[number])
                                .font(.system(size: 80))
                                .padding()
                                .background()
                                .cornerRadius(15)
                        }
                    }
                }
                Text("Score: \(score)")
                    .prominentTitle()
            }
        }
        .alert(gameOverMessage, isPresented: $gameOver) {
            Button("New Game", action: newGame)
        } message: {
            Text("You have finished 10 rounds with a score of \(score)")
        }
    }
    
    func newGame() {
        score = 0
        rounds = 0
        winCheck = Bool.random()
        randomItem = Int.random(in: 0...2)
    }

}






struct Project3_Milestone_Previews: PreviewProvider {
    static var previews: some View {
        Project3_Milestone()
    }
}
