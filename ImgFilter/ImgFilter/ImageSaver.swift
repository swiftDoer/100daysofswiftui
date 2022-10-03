//import UIKit
//
//class ImageSaver: NSObject {
//    func writeToPhotoAlbum(image: UIImage) {
//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
//    }
//
//    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        print("Save finished!")
//    }
//}
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?

    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveComplete), nil)
    }

    @objc func saveComplete(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
        let imageSaver = ImageSaver()

        imageSaver.successHandler = {
            print("Success!")
        }

        imageSaver.errorHandler = {
            print("Oops: \($0.localizedDescription)")
        }

//        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    
}
