//
//  Order.swift
//  CupcakeCorner
//
//  Created by John Anthony Heaney on 15/11/2024.
//

import Foundation

@Observable
class Order: ObservableObject, Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
    private static let userDefaultKey = "SavedOrder"
    
    func saveToUserDefault() {
        do {
            let data = try JSONEncoder().encode(self)
            UserDefaults.standard.set(data, forKey: Self.userDefaultKey)
        } catch {
            print("Failed to save order to UserDefaults: \(error.localizedDescription)")
        }
    }
    
    static func loadFromUserDefault() -> Order {
        guard let data = UserDefaults.standard.data(forKey: userDefaultKey) else {
            return Order() // return an new instancce if no saved data exists
        }
        
        do {
            return try JSONDecoder().decode(Order.self, from: data)
        } catch {
            print("Failed to load order from UserDefaults: \(error.localizedDescription)")
            return Order()
        }
    }
}
