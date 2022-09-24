import Foundation

extension Bundle {
//    func decode(_ file: String) -> [String: Astronaut] {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle  ")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // CHANGES THE WAY DATES ARE REPRESENTED
//        DateFormatter().dateFormat = "y-MM-dd"
//        JSONDecoder().dateDecodingStrategy = .formatted(DateFormatter())
       
        // COULDVE ALSO WRITTEN IT LIKE THIS
        /*
         let decoder = JSONDecoder()
         let formatter = DateFormatter()
         formatter.dateFormat = "y-MM-dd"
         decoder.dateDecodingStrategy = .formatted(formatter)
         
         */
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        
        
//        guard let loaded = try? JSONDecoder().decode([String: Astronaut].self, from: data) else {
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
