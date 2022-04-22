import Foundation

struct TunaModel: Hashable, Codable, Identifiable {
    var id : Int
    var name: String
    var description: String
    var price: Double
    var image: String
    var quantity: Int 
    var backgroundColorProduct: [String]
    var headline: String
    var genre: [Genre]

    var dictionary: [String: Any] {
            return ["name": name,
                    "price": price,
                    "quantity": quantity]
        }
}








