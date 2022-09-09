import SwiftUI

struct Project2Blind:View {
    @State public var countryArray = ["Germany", "Nigeria", "France", "Ireland", "Russia", "Italy", "Estonia", "Monaco", "Poland", "Spain", "UK", "US"]
        .shuffled()
    @State public var correctNumber = Int.random(in: 0...2)
    @State public var score = 0
    @State public var prompt = "Correct Answer"
    @State public var alert = false
    
    
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
                        Image(countryArray[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                        
                    }.alert(prompt, isPresented: $alert) {
                        Button("Continue", action: newRoll)
                    } message: {
                        if prompt == "Correct Answer" {
                            Text("""
                                Score: UP!
                                Congratulation
                            """)
                        } else {
                            Text("""
                                Score: DOWN!
                                Try harder next time
                            """)
                        }
                    }
                }
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(prompt == "Correct Answer" ? .green : .red)
            }
        }
    }
    
    func flagCheck(_ number: Int) {
        if number == correctNumber {
            prompt = "Correct Answer"
            score += 1
        } else {
            prompt = "False Answer"
            score -= 1
        }
        alert = true
    }
    
    func newRoll() {
        countryArray.shuffle()
        correctNumber = Int.random(in: 0...2)
    }
    
}

struct Project2Blind_Previews: PreviewProvider {
    static var previews: some View {
        Project2Blind()
    }
}
