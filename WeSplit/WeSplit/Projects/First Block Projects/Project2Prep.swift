import SwiftUI

struct Project2Prep:View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        .shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .green, .yellow, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 15) {
                VStack {
                    Text("Guess the Flag")
                        .padding()
                        .font(.largeTitle.bold())
                        .background(.regularMaterial)
                        .clipShape(Capsule())
                    
                    Text(countries[correctAnswer])
                        .padding(.horizontal)
                        .font(.title2.bold())
                        .background(.ultraThickMaterial)
                        .clipShape(Capsule())
                }
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
                Text("Score: \(score)")
                    .padding(5)
                    .font(.subheadline.bold())
                    .background(.regularMaterial)
                    .clipShape(Capsule())
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}


struct Project2Prep_Previews: PreviewProvider {
    static var previews: some View {
        Project2Prep()
    }
}
