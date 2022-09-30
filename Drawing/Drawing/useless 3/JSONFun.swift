// since i never used a class there is no need for stateobject

import SwiftUI
struct JSONFun_Previews: PreviewProvider {
    static var previews: some View {
        JSONFun()
    }
}


struct JSONFun: View {
    private var person = Person.allPeopleArray
    
    var body: some View {
        NavigationView {
            List {
                ForEach(person, id: \.firstName) { item in
                    NavigationLink(destination: {
                        PersonDetailView(person: item)
                    }, label: {
                        VStack(alignment: .leading) {
                            Text("\(item.firstName) \(item.surname)")
                            Text("\(item.phoneNumbers[0].number)")
                                .foregroundColor(.secondary)
                        }
                    })
                }
            } .navigationTitle("Phonebook")
        }
    }
}

