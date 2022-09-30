import SwiftUI
struct Validating_and_disabling_forms_Previews: PreviewProvider {
    static var previews: some View {
        Validating_and_disabling_forms()
    }
}


struct Validating_and_disabling_forms: View {
    @State private var username = ""
    @State private var email = ""
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
//            .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
}

