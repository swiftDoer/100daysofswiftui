import SwiftUI
struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person.samplePerson)
    }
}


struct PersonDetailView: View {
    var person : Person
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(person.firstName) \(person.surname)")
            Text("\(person.phoneNumbers[0].number)")
            Text("\(person.address.streetAddress)")
            Text("\(person.address.city)")
        }
    }
}

