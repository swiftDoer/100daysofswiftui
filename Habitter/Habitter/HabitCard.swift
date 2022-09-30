import SwiftUI
struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        HabitCard1(activityTitle: "Running", activityDescription: "I need to get my clothes, dress up and move my feet!", activityDayCount: 100)
    }
}


struct HabitCard1: View {
    
    let neutralColor = Color("neutralColor")
    let neutralDarkColor = Color("neutralDarkColor")
    
    var activityTitle: String
    var activityDescription: String
    @State var activityDayCount: Int
    
    var body: some View {
        ZStack {
            //BACKGROUND
            Rectangle().fill(neutralColor.gradient)
                .frame(height: 120)
                .cornerRadius(20, corners: [.topLeft, .topRight])
//                .cornerRadius(20)
            
            //FOREGROUND
            HStack {
                ZStack {
                    //BACKGROUND
                    Circle()
//                        .fill(neutralDarkColor)
                        .fill(RadialGradient(colors: [neutralDarkColor,neutralColor, neutralDarkColor], center: .center, startRadius: 60, endRadius: 34))
                        .frame(width: 90, height: 90, alignment: .leading)
                    
                    
                    //FOREGROUND
                        Text(verbatim: "\(activityDayCount)")
                        .font(.largeTitle).bold()
                        .foregroundColor(neutralColor)
                    
                    
                }
                VStack() {
                        ZStack {
                            //BACKGROUND CARD TITLE AND BUTTONS
                            Rectangle()
                                .frame(width: 250, height: 25)
                                .cornerRadius(6)
                            
                            //FOREGROUND CARD TITLE AND BUTTONS
                            HStack {
                                Button(action: {
                                    activityDayCount += 1
                                }, label: {
                                    Text("+")
                                        .foregroundColor(neutralColor)
                                        .fontWeight(.black)
                                        
                                })
                                Text(activityTitle)
                                    .foregroundColor(neutralColor)
                                    .frame(width: 150, height: 20, alignment: .center)
                                Button(action: {
                                    if activityDayCount > 0 {
                                        activityDayCount -= 1
                                    }
                                }, label: {
//                                    Text("-")
                                    Text("-")
                                        .foregroundColor(neutralColor)
                                        .fontWeight(.black)
                                        
                                })
                            }
                            
                        }
                        
                    .frame(width: 250, height: 25)
                    
                    Text(activityDescription)
                        .frame(width: 250, height: 50)
                }.foregroundColor(neutralDarkColor)
            }
            .padding()
        }
        .frame(width: 380, height: 120)
    }
}

struct HabitCard2: View {
    
    let neutralColor = Color("neutralColor")
    let neutralDarkColor = Color("neutralDarkColor")
    
    var activityTitle: String
    var activityDescription: String
    @State var activityDayCount: Int
    
    var body: some View {
        ZStack {
            //BACKGROUND
            Rectangle().fill(neutralColor.gradient)
                .frame(height: 120)
//                .cornerRadius(20, corners: [.topLeft, .topRight])
//                .cornerRadius(20)
            
            //FOREGROUND
            HStack {
                ZStack {
                    //BACKGROUND
                    Circle()
                        .fill(RadialGradient(colors: [neutralDarkColor,neutralColor, neutralDarkColor], center: .center, startRadius: 60, endRadius: 34))
                        .frame(width: 90, height: 90, alignment: .leading)
                    
                    
                    //FOREGROUND
                        Text(verbatim: "\(activityDayCount)")
                        .font(.largeTitle).bold()
                        .foregroundColor(neutralColor)
                    
                    
                }
                VStack() {
                        ZStack {
                            //BACKGROUND CARD TITLE AND BUTTONS
                            Rectangle()
                                .frame(width: 250, height: 25)
                                .cornerRadius(6)
                            
                            //FOREGROUND CARD TITLE AND BUTTONS
                            HStack {
                                Button(action: {
                                    activityDayCount += 1
                                }, label: {
                                    Text("+")
                                        .foregroundColor(neutralColor)
                                        .fontWeight(.black)
                                        
                                })
                                Text(activityTitle)
                                    .foregroundColor(neutralColor)
                                    .frame(width: 150, height: 20, alignment: .center)
                                Button(action: {
                                    if activityDayCount > 0 {
                                        activityDayCount -= 1
                                    }
                                }, label: {
//                                    Text("-")
                                    Text("-")
                                        .foregroundColor(neutralColor)
                                        .fontWeight(.black)
                                        
                                })
                            }
                            
                        }
                        
                    .frame(width: 250, height: 25)
                    
                    Text(activityDescription)
                        .frame(width: 250, height: 50)
                }.foregroundColor(neutralDarkColor)
            }
            .padding()
        }
        .frame(width: 380, height: 120)
    }
}

struct HabitCard3: View {
    
    let neutralColor = Color("neutralColor")
    let neutralDarkColor = Color("neutralDarkColor")
    
    var activityTitle: String
    var activityDescription: String
    @State var activityDayCount: Int
    
    var body: some View {
        ZStack {
            //BACKGROUND
            Rectangle().fill(neutralColor.gradient)
                .frame(height: 120)
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
//                .cornerRadius(20)
            
            //FOREGROUND
            HStack {
                ZStack {
                    //BACKGROUND
                    Circle()
                        .fill(RadialGradient(colors: [neutralDarkColor,neutralColor, neutralDarkColor], center: .center, startRadius: 60, endRadius: 34))
                        .frame(width: 90, height: 90, alignment: .leading)
                    
                    
                    //FOREGROUND
                        Text(verbatim: "\(activityDayCount)")
                        .font(.largeTitle).bold()
                        .foregroundColor(neutralColor)
                    
                    
                }
                VStack() {
                        ZStack {
                            //BACKGROUND CARD TITLE AND BUTTONS
                            Rectangle()
                                .frame(width: 250, height: 25)
                                .cornerRadius(6)
                            
                            //FOREGROUND CARD TITLE AND BUTTONS
                            HStack {
                                Button(action: {
                                    activityDayCount += 1
                                }, label: {
                                    Text("+")
                                        .foregroundColor(neutralColor)
                                        .fontWeight(.black)
                                        
                                })
                                Text(activityTitle)
                                    .foregroundColor(neutralColor)
                                    .frame(width: 150, height: 20, alignment: .center)
                                Button(action: {
                                    if activityDayCount > 0 {
                                        activityDayCount -= 1
                                    }
                                }, label: {
//                                    Text("-")
                                    Text("-")
                                        .foregroundColor(neutralColor)
                                        .fontWeight(.black)
                                        
                                })
                            }
                            
                        }
                        
                    .frame(width: 250, height: 25)
                    
                    Text(activityDescription)
                        .frame(width: 250, height: 50)
                }.foregroundColor(neutralDarkColor)
            }
            .padding()
        }
        .frame(width: 380, height: 120)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
