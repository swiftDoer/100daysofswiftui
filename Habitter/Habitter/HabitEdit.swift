import SwiftUI
struct HabitEdit_Previews: PreviewProvider {
    static var previews: some View {
        HabitEdit(activityTitle: "Running", activityDescription: "I need to get my clothes, dress up and move my feet!", activityDayCount: 100)
    }
}




struct HabitEdit: View {
    
    let neutralColor = Color("neutralColor")
    let neutralDarkColor = Color("neutralDarkColor")
    
    @State var activityTitle: String
    @State var activityDescription: String
    @State var activityDayCount: Int
//    @ObservedObject var habit : HabitViewModel
    
    
    var body: some View {
        ZStack {
            // BACKGROUND COLOR
            Rectangle().fill(neutralColor.gradient)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    //BLUE HORIZONTAL BAR
                    Rectangle()
                        .fill(neutralDarkColor.gradient)
                        .frame(height: 120)
                    
                    
                    //FOREGROUND HABIT AND ZIRCLE THING
                    HStack {
                        // CIRCLE WITH NUMBER
                        ZStack(alignment: .leading) {
                            Circle()
                                .fill(neutralColor.gradient)
                                .overlay(alignment: .topLeading, content: {
                                    Button(action: {
                                        activityDayCount += 1
                                    }, label: {
                                        ZStack {
                                            Circle()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(neutralColor)
                                            Text("+")
                                                .foregroundColor(neutralDarkColor)
                                            .fontWeight(.black)
                                        }
                                    })
                                })
                                .overlay(alignment: .topTrailing, content: {
                                    Button(action: {
                                        activityDayCount = 0
                                    }, label: {
                                        ZStack {
                                            Circle()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(neutralColor)
                                            
                                            Image(systemName: "gobackward")
                                                .foregroundColor(neutralDarkColor)
                                                .fontWeight(.black)
                                                .font(.caption)
                                        }
                                    })
                                })
                            
                            TextField("Days", value: $activityDayCount, format: .number)
                                .multilineTextAlignment(.center)
                                .font(.largeTitle).bold()
                                .foregroundColor(neutralDarkColor)
                                
                        } .frame(width: 90, height: 90).padding(.horizontal, 30)
                        
                        TextField("Habit", text: $activityTitle)
                            .foregroundColor(neutralColor)
                            .font(.system(size: 35))
                    }
                }
                
                TextEditor(text: $activityDescription)
//                    .scrollContentBackground(.hidden)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
            }
            .padding(.vertical, 10)
        }
    }
}




