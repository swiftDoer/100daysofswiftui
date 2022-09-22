//
//  OnboardingView.swift
//  WeSplit
//
//

import SwiftUI

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(.purple)
    }
}
 

struct OnboardingView: View {
    
    //Onboarding states:
    /*
     0 - Welcome screen
     1 - Add name
     2 - Add age
     3 - Gender
     4?- Profile Screen
     */
    
    // TRANSITION BETWEEN VIEWS
    @State var onboardingState: Int = 0
    let myTransition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // ALERT
    @State var alertTitle = ""
    @State var showAlert = false
    
    // ONBOARDING
    @State var name = ""
    @State var age = 21.0
    @State var gender = ""
    
    // APP STORAGE
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn = false
    
    var body: some View {
        ZStack {
            //content
            ZStack {
                switch onboardingState {
                    case 0:
                        welcomeSection
                            .transition(myTransition)
                    case 1:
                        addNameSection
                            .transition(myTransition)
                    case 2:
                        addAgeSection
                            .transition(myTransition)
                    case 3:
                        addGenderSection
                            .transition(myTransition)
                    default:
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.green)
                }
            }
            
            //buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding()
        }
//        .alert("HI", isPresented: $showAlert, actions: {
//            Text(alertTitle)
//        })
        .alert(alertTitle, isPresented: $showAlert, actions: {}, message: {
            Text("Fuk")
        })
    }
}

// MARK: COMPONENTS

extension OnboardingView {
    
    private var addGenderSection: some View {
        VStack(spacing: 25, content: {
            Spacer()
            Text("What's your Gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            VStack(spacing: 40) {
//                Text(gender.count > 1 ? "So you're a " + gender : "Select gender")
                
                Picker(selection: $gender, label: Text(""), content: {
                    Text("Your Gender...   ").tag("")
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Non-Binary").tag("Non-Binary")
                }) .tint(.gray)
                .background(
                    Color.white
                    .frame(width: 200, height: 50)
                    .cornerRadius(25)
                )
            }
            Spacer()
            Spacer()
        })
        .padding(30)
        .multilineTextAlignment(.leading)
    }
    
    
    private var addAgeSection: some View {
        VStack(spacing: 25, content: {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)
                .shadow(radius: 20)
            Spacer()
            Spacer()
        })
        .padding(30)
        .multilineTextAlignment(.leading)
    }
    
    
    private var addNameSection: some View {
        VStack(spacing: 25, content: {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(20)
            Spacer()
            Spacer()
        })
        .padding(30)
        .multilineTextAlignment(.leading)
    }

    
    private var welcomeSection: some View {
        VStack(spacing: 40, content: {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(alignment: .bottom, content: {
                    Capsule(style: .continuous)
                        .frame(height: 4)
                        .offset(y: 5)
                        .foregroundColor(.white)
                })
            Text("This is the number one app for finding your match online! It is better - because unlike the other apps, it actually fills OUR pockets and not some other weird person's マッチングアプリ。ド変態さんきもー")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        })
        .padding(30)
        .multilineTextAlignment(.leading)
    }
    
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" :
                onboardingState == 3 ? "FINISH" :
                "NEXT"
        )
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            .animation(nil, value: onboardingState)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
}



// MARK: FUNCTIONS

extension OnboardingView {
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
    
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
    
    func handleNextButtonPressed() {
        
        //CHECK INPUTS
        switch onboardingState {
            case 1:
                guard name.count > 2 else {
                    showAlert(title: "Your name must be at least 3 characters long")
                    return
                }
            case 3:
                guard gender.count > 1 else {
                    showAlert(title: "Please select a gender 👉👈")
                    return
                }
            default:
                break
        }
        
        // GO TO NEXT SECTION
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
}
