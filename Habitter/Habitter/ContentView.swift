import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    
    @StateObject var habit = HabitViewModel()
    @State private var showSheet = false
    
    let neutralColor = Color("neutralColor")
    let neutralDarkColor = Color("neutralDarkColor")
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle().fill(.white.gradient).ignoresSafeArea()
                ScrollView {
                    VStack {
                        ForEach(habit.trackedHabitArray) { item in
                            HStack {
                                NavigationLink(destination: {
                                    HabitEdit(activityTitle: item.activityTitle, activityDescription: item.activityDescription, activityDayCount: item.activityDayCount)
                                    
//                                        HabitEdit2(habit: habit)
                                        .navigationTitle("Edit Habit")
                                    
                                }, label: {
//                                    HabitCard(activityTitle: item.activityTitle, activityDescription: item.activityDescription, activityDayCount: item.activityDayCount)
                                    if item.activityTitle == "Running" {
                                        HabitCard1(activityTitle: item.activityTitle, activityDescription: item.activityDescription, activityDayCount: item.activityDayCount)
//                                            .shadow(radius: 2, x: 2, y: 2)
                                    } else if item.activityTitle == "Eating" {
                                        HabitCard3(activityTitle: item.activityTitle, activityDescription: item.activityDescription, activityDayCount: item.activityDayCount)
//                                            .shadow(radius: 2, x: 2, y: 2)
                                    } else {
                                        HabitCard2(activityTitle: item.activityTitle, activityDescription: item.activityDescription, activityDayCount: item.activityDayCount)
//                                            .shadow(radius: 2, x: 2, y: 2)
                                    }
                                    
                                })
                            }
                        }
                    }
                    .navigationTitle("Habitter")
                    .toolbar(content: {
                        ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                            Button(action: {
                                showSheet = true
                            }, label: {
                                AddHabit
                            })
                        })
                    })
                    .sheet(isPresented: $showSheet, content: {
                        HabitSheet(habit: habit)
                    })
                }
            }
        }
    }
    
    
    private var AddHabit: some View {
        Text("Add Habit")
            .foregroundColor(Color("neutralColor"))
            .background(
                Rectangle()
                    .fill(Color("neutralDarkColor"))
                    .frame(width: 90, height: 35)
                    .cornerRadius(4)
            )
    }
}


