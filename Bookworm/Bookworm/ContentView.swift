import SwiftUI

struct ContentView: View {
    
    /*
     managed object context to delete books
     a fetch request reading all the books (to test whether everything worked)
     */
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var books: FetchedResults<Book>
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { item in
                    NavigationLink {
                        DetailView(book: item)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: item.rating)
                                .font(.largeTitle)
                                .background(item.rating == 1 ? .red : .clear)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text(item.title ?? "unknown title")
                                    .font(.headline)
                                Text(item.author ?? "unknown author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                } // ForEach end
                .onDelete(perform: deleteBooks)
            } // main parts end
            .padding()
            .navigationTitle("bookworm")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("add review") {
                        showSheet = true
                    }
                } // navbarTrailing toolbar end
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                } //navBarLeading toolbar end
            } // toolbar end
            .sheet(isPresented: $showSheet) {
                AddBookView()
            }
        }
    }
    
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]

            // delete it from the context
            moc.delete(book)
        }

        // save the context
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
