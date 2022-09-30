import SwiftUI



struct HabitSheet: View {
    
    let neutralColor = Color("neutralColor")
    let neutralDarkColor = Color("neutralDarkColor")
    
    @State var activityTitle = "Habit"
    @State var activityDescription = "Description..."
    @State var activityDayCount = 0
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habit: HabitViewModel
    
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
                            VStack {
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
                                            if activityDayCount > 0 {
                                                activityDayCount -= 1
                                            }
                                        }, label: {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 25, height: 25)
                                                    .foregroundColor(neutralColor)
                                                
                                                Text("-")
                                                    .foregroundColor(neutralDarkColor)
                                                    .fontWeight(.black)
                                            }
                                        })
                                })
                            }
                            
                            TextField("Days", value: $activityDayCount, format: .number)
                                .multilineTextAlignment(.center)
                                .font(.largeTitle).bold()
                                .foregroundColor(neutralDarkColor)
                                
                        } .frame(width: 90, height: 90).padding(.horizontal, 30)
                        
                        TextField("Habit...", text: $activityTitle)
                            .foregroundColor(neutralColor)
                            .font(.system(size: 35))
                            .opacity(activityTitle == "Habit" ? 0.5 : 1)
                    }
                }
                
                TextEditor(text: $activityDescription)
//                    .scrollContentBackground(.hidden)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    habit.trackedHabitArray.append(HabitModel(activityTitle: activityTitle, activityDescription: activityDescription, activityDayCount: activityDayCount))
                    dismiss.callAsFunction()
                    
                }, label: {
                    ZStack {
                        Rectangle().fill(neutralDarkColor.gradient)
                            .frame(width: 320, height: 50)
                            .cornerRadius(10)
                        Text("Add")
                            .foregroundColor(neutralColor)
                    }
                })
                    
            }
            .padding(.vertical, 10)
        }
    }
}


