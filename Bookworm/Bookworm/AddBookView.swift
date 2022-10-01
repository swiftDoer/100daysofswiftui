import SwiftUI
struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}


struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var rating = 3
    @State private var author = ""
    @State private var genre = "fantasy"
    @State private var review = ""
    @State private var title = ""
    let date = Date.now
    
    
    let genres = ["fantasy", "horror", "kids", "mystery", "poetry", "romance", "thriller"]
    
    var whiteSpace: Bool {
        if author.hasPrefix(" ") || author.hasSuffix(" ") || genre.hasPrefix(" ") || genre.hasSuffix(" ") || review.hasPrefix(" ") || review.hasSuffix(" ") || title.hasPrefix(" ") || title.hasSuffix(" ") {
            return true
        }
        return false
    }
    
    var noText: Bool {
        if author.isEmpty || genre.isEmpty || review.isEmpty || title.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(whiteSpace ? "Please remove whitespace" : "") {
                    Text("\(date.formatted(date: .abbreviated, time: .omitted))")
                    TextField("name of book", text: $title)
                    TextField("authors name", text: $author)

                    Picker("pick genre", selection: $genre) {
                        ForEach(genres, id: \.self) { item in
                            Text(item)
                        }
                    }
                } // SECTION 1 END
                
                Section("write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                } // SECTION 2 END
                
                Section {
                    Button("add review") {
                        // action: add the book
                        let newBook = Book(context: moc)
                        newBook.author = author
                        newBook.genre = genre
                        newBook.id = UUID()
                        newBook.rating = Int16(rating)
                        newBook.review = review
                        newBook.title = title
                        newBook.date = date
                        
                        try? moc.save()
                        dismiss.callAsFunction()
                    }
                    .disabled(whiteSpace || noText)
                } // SECTION 3 END
            }
        }
    }
}

