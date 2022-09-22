
import SwiftUI


struct DataFlowThing: View {
    
//    var myName = FromHereAccessData.name you cannot go back to data, you can only create new data from a skeleton / blue print
    
    private  let testJohn = FromHereAccessData(temporal: "now is", name: "Bimba", age: 17)
    
    var body: some View {
        VStack {
            Text("Question of the day: how do i get data from one view into another ")
                .padding()
            
            FromHereAccessData(temporal: "was", name: "John", age: 16)
            
            testJohn
            
            FromHereAccessData(temporal: "now is", name: "Susanne", age: 18)
        }
    }
}


struct FromHereAccessData: View {
    
    let temporal : String
    let name : String
    let  age : Int
    
    
    var body: some View {
        Text("My name \(temporal) \(name) and my age is \(age)")
    }
}



struct DataFlowThing_Previews: PreviewProvider {
    static var previews: some View {
        DataFlowThing()
    }
}
