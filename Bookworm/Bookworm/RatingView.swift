import SwiftUI
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(0))
    }
}


struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    let maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maxRating + 1, id: \.self) { number in
                image(number: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(number: Int) -> Image {
        /*
         If the number that was passed in is greater than the current rating, return the off image if it was set, otherwise return the on image.
         If the number that was passed in is equal to or less than the current rating, return the on image.
         */
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

