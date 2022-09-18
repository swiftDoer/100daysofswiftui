
import SwiftUI


//struct Book {
//    var title : String
//    var author : String
//}

class Book: ObservableObject {
    @Published var title : String
    @Published var author : String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}


struct DataFlow3: View {
    
   @EnvironmentObject var smith: Book
    
    var body: some View {
        VStack {
            Text(smith.title)
            Text(smith.author)
        }
    }
}


struct DataFlow2: View {

//    @ObservedObject var smith2: Book

    var body: some View {
        DataFlow3()
    }
}


struct DataFlow1: View {
    
//    @StateObject var book: Book
    
    var body: some View {
        DataFlow2()
    }
}


struct DataFlow1_Previews: PreviewProvider {
    static var previews: some View {
        let book = Book(title: "Harry Potter", author: "Hairy Porter")
//        DataFlow1(book: book)
        DataFlow1()
            .environmentObject(book)
    }
}
